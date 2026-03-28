#!/usr/bin/env node
// port_code_fields.mjs
// Ports sampleSchema, starterCode, expectedQuery from web JS data into iOS Swift files.

import { readFileSync, writeFileSync } from 'fs';
import { pathToFileURL } from 'url';

const WEB_DIR = '/Users/xuweijin/DI Quest/src/data/worlds';
const IOS_DIR = '/Users/xuweijin/DI Quest/ios/DIQuest/Data/Worlds';

// ─── Load web data ──────────────────────────────────────────────────

async function loadWebData(jsFile, exportName) {
  const url = pathToFileURL(`${WEB_DIR}/${jsFile}`).href;
  const mod = await import(url);
  return mod[exportName];
}

// Build a map: questId -> [{ sampleSchema, starterCode, expectedQuery }, ...]
// Only code challenges, in order.
function buildCodeMap(worlds) {
  const map = {};
  for (const world of worlds) {
    for (const quest of world.quests) {
      const codeChallenges = quest.challenges.filter(c => c.type === 'code');
      if (codeChallenges.length > 0) {
        map[quest.id] = codeChallenges.map(c => ({
          id: c.id,
          name: c.name,
          sampleSchema: c.sampleSchema || '',
          starterCode: c.starterCode || '',
          expectedQuery: c.expectedQuery || '',
        }));
      }
    }
  }
  return map;
}

// ─── Swift string formatting ────────────────────────────────────────

// Convert a JS string to a Swift string literal.
// If it contains newlines (actual or escaped \n), use triple-quoted multi-line.
// Otherwise use a regular "..." string.
function toSwiftString(value, indent) {
  if (!value || value.trim() === '') {
    return '""';
  }

  // Expand literal \n (two-char sequences) into real newlines
  // The JS string from web code may have actual newlines (template literals)
  // or escaped \n (regular string literals).
  // After dynamic import, template literals become actual newlines,
  // and \n in regular strings also become actual newlines.
  // So `value` should already have real newlines where appropriate.

  const hasNewlines = value.includes('\n');

  if (!hasNewlines) {
    // Single-line: use regular Swift string
    return '"' + escapeSwiftString(value) + '"';
  }

  // Multi-line: use triple-quoted Swift string
  // Swift multi-line string rules:
  // - Opening """ must be followed by a newline
  // - Closing """ must be on its own line
  // - The closing """ indentation determines the baseline indentation
  return formatMultiLineSwiftString(value, indent);
}

function escapeSwiftString(s) {
  // Escape backslashes first, then double quotes
  return s
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"');
}

function formatMultiLineSwiftString(value, indent) {
  // Trim leading/trailing whitespace from the whole value
  // Template literals often start with \n and end with \n + indent whitespace
  let trimmed = value.replace(/^\n/, '').replace(/\s+$/, '');

  const lines = trimmed.split('\n');

  // Find the minimum leading whitespace across all non-empty lines (for dedent)
  const nonEmptyLines = lines.filter(l => l.trim().length > 0);
  let minIndent = Infinity;
  for (const line of nonEmptyLines) {
    const leadingSpaces = line.match(/^(\s*)/)[1].length;
    if (leadingSpaces < minIndent) minIndent = leadingSpaces;
  }
  if (minIndent === Infinity) minIndent = 0;

  // Dedent lines
  const dedented = lines.map(l => {
    if (l.trim().length === 0) return '';
    return l.substring(minIndent);
  });

  // Build the Swift multi-line string
  // Each content line gets the indent + extra spaces for the content
  const contentIndent = indent + '    '; // 4 more spaces than the field indent
  const escapedLines = dedented.map(l => {
    // Empty lines should be truly empty (no whitespace) in Swift multi-line strings
    if (l.length === 0) return '';
    // In Swift multi-line strings, we don't need to escape newlines or most quotes
    // But we do need to escape backslashes and lone triple-quotes
    let escaped = l.replace(/\\/g, '\\\\');
    // Escape any triple quotes within content
    escaped = escaped.replace(/"""/g, '\\"""');
    return contentIndent + escaped;
  });

  return '"""\n' + escapedLines.join('\n') + '\n' + indent + '"""';
}

// ─── Process a Swift file ───────────────────────────────────────────

function processSwiftFile(swiftPath, codeMap) {
  const content = readFileSync(swiftPath, 'utf-8');
  const lines = content.split('\n');
  const result = [];

  let currentQuestId = null;
  let inCodeChallenge = false;
  let codeIndexInQuest = 0; // 0-based index of code challenges within current quest

  // Track how many code challenges we've processed
  let totalProcessed = 0;
  let totalInserted = 0;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    result.push(line);

    // Detect quest ID: id: "23-1",
    const questIdMatch = line.match(/^\s*id:\s*"(\d+-\d+)"\s*,?\s*$/);
    if (questIdMatch) {
      // Check if this is a quest ID (not an option ID or challenge ID)
      // Quest IDs appear at a certain indentation level and are followed by name:
      // We look ahead to see if the next non-empty line has "name:" to confirm it's a Quest
      const nextLine = findNextNonEmptyLine(lines, i + 1);
      if (nextLine && nextLine.match(/^\s*name:/)) {
        const potentialId = questIdMatch[1];
        // Only reset if this looks like a quest-level id (not a Challenge id, which is an Int)
        // Quest IDs are strings like "23-1", challenge IDs are ints like id: 1
        currentQuestId = potentialId;
        codeIndexInQuest = 0;
      }
    }

    // Detect code challenge: type: .code
    if (line.match(/^\s*type:\s*\.code\s*,?\s*$/)) {
      inCodeChallenge = true;
    }

    // Detect end of challenge (closing parenthesis at appropriate indentation)
    // When we see frameworkTip inside a code challenge, we insert the fields
    if (inCodeChallenge && line.match(/^\s*frameworkTip:\s*/)) {
      // This is the frameworkTip line of a code challenge
      // Look up the web data for this quest and code challenge index
      const questData = codeMap[currentQuestId];
      if (questData && codeIndexInQuest < questData.length) {
        const webChallenge = questData[codeIndexInQuest];

        // Determine the indentation (same as frameworkTip line)
        const indentMatch = line.match(/^(\s*)/);
        const indent = indentMatch ? indentMatch[1] : '                            ';

        // Check if the frameworkTip line ends with a closing quote (not continued on next line)
        // frameworkTip could be: frameworkTip: "text"  OR  frameworkTip: nil
        // We need to make sure the full frameworkTip value is captured (it might span lines)
        // Actually from our analysis, all frameworkTip values are single-line in the iOS files.
        // But let's be safe: we need to add a comma after the frameworkTip value if there isn't one.

        // Modify the frameworkTip line to add a trailing comma if needed
        const lastLine = result[result.length - 1];
        if (!lastLine.trimEnd().endsWith(',')) {
          result[result.length - 1] = lastLine.trimEnd() + ',';
        }

        // Insert the three new fields
        if (webChallenge.sampleSchema) {
          const schemaStr = toSwiftString(webChallenge.sampleSchema, indent);
          result.push(`${indent}sampleSchema: ${schemaStr},`);
          totalInserted++;
        }
        if (webChallenge.starterCode) {
          const starterStr = toSwiftString(webChallenge.starterCode, indent);
          result.push(`${indent}starterCode: ${starterStr},`);
          totalInserted++;
        }
        if (webChallenge.expectedQuery) {
          const expectedStr = toSwiftString(webChallenge.expectedQuery, indent);
          result.push(`${indent}expectedQuery: ${expectedStr}`);
          totalInserted++;
        }

        totalProcessed++;
      } else {
        if (!questData) {
          console.warn(`  WARNING: No web data for quest ${currentQuestId}`);
        } else {
          console.warn(`  WARNING: Code challenge index ${codeIndexInQuest} out of range for quest ${currentQuestId} (has ${questData.length})`);
        }
      }

      // Move to next code challenge in this quest
      codeIndexInQuest++;
      inCodeChallenge = false;
    }

    // Also reset inCodeChallenge if we hit a multipleChoice or openEnded type
    if (line.match(/^\s*type:\s*\.(multipleChoice|openEnded)\s*,?\s*$/)) {
      inCodeChallenge = false;
    }
  }

  console.log(`  Processed ${totalProcessed} code challenges, inserted ${totalInserted} fields`);
  return result.join('\n');
}

function findNextNonEmptyLine(lines, startIdx) {
  for (let i = startIdx; i < lines.length && i < startIdx + 3; i++) {
    if (lines[i].trim().length > 0) return lines[i];
  }
  return null;
}

// ─── Main ───────────────────────────────────────────────────────────

async function main() {
  console.log('Loading web data...');

  // SQL Chinese
  const sqlWorlds = await loadWebData('sql.js', 'sqlWorlds');
  const sqlCodeMap = buildCodeMap(sqlWorlds);
  console.log(`SQL Chinese: ${Object.keys(sqlCodeMap).length} quests with code challenges`);

  // SQL English
  const sqlWorldsEn = await loadWebData('sql_en.js', 'sqlWorldsEn');
  const sqlCodeMapEn = buildCodeMap(sqlWorldsEn);
  console.log(`SQL English: ${Object.keys(sqlCodeMapEn).length} quests with code challenges`);

  // Python Chinese
  const pythonWorlds = await loadWebData('python.js', 'pythonWorlds');
  const pythonCodeMap = buildCodeMap(pythonWorlds);
  console.log(`Python Chinese: ${Object.keys(pythonCodeMap).length} quests with code challenges`);

  // Python English
  const pythonWorldsEn = await loadWebData('python_en.js', 'pythonWorldsEn');
  const pythonCodeMapEn = buildCodeMap(pythonWorldsEn);
  console.log(`Python English: ${Object.keys(pythonCodeMapEn).length} quests with code challenges`);

  // Process Swift files
  console.log('\n--- Processing SqlWorlds.swift ---');
  const sqlResult = processSwiftFile(`${IOS_DIR}/SqlWorlds.swift`, sqlCodeMap);
  writeFileSync(`${IOS_DIR}/SqlWorlds.swift`, sqlResult);
  console.log('  Written SqlWorlds.swift');

  console.log('\n--- Processing SqlWorldsEn.swift ---');
  const sqlEnResult = processSwiftFile(`${IOS_DIR}/SqlWorldsEn.swift`, sqlCodeMapEn);
  writeFileSync(`${IOS_DIR}/SqlWorldsEn.swift`, sqlEnResult);
  console.log('  Written SqlWorldsEn.swift');

  console.log('\n--- Processing PythonWorlds.swift ---');
  const pythonResult = processSwiftFile(`${IOS_DIR}/PythonWorlds.swift`, pythonCodeMap);
  writeFileSync(`${IOS_DIR}/PythonWorlds.swift`, pythonResult);
  console.log('  Written PythonWorlds.swift');

  console.log('\n--- Processing PythonWorldsEn.swift ---');
  const pythonEnResult = processSwiftFile(`${IOS_DIR}/PythonWorldsEn.swift`, pythonCodeMapEn);
  writeFileSync(`${IOS_DIR}/PythonWorldsEn.swift`, pythonEnResult);
  console.log('  Written PythonWorldsEn.swift');

  console.log('\nDone!');
}

main().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
