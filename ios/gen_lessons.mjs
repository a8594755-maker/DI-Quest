import fs from 'fs';
import path from 'path';

const lessonsDir = '../src/data/lessons';
const worldIds = [4, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 39, 40, 41, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61];

function extractContent(jsFilePath) {
    const raw = fs.readFileSync(jsFilePath, 'utf-8');
    // Extract content between first backtick and last backtick
    const startIdx = raw.indexOf('`');
    const endIdx = raw.lastIndexOf('`');
    if (startIdx === -1 || endIdx === -1 || startIdx === endIdx) {
        throw new Error(`Cannot find template literal in ${jsFilePath}`);
    }
    return raw.substring(startIdx + 1, endIdx);
}

function escapeForSwift(content) {
    // In Swift multi-line string literals ("""):
    // - Backslashes must be escaped: \ → \\
    // - \( triggers interpolation, must be escaped
    // - Triple quotes """ in content need escaping (unlikely in markdown)
    let result = content;
    // Escape backslashes first (but not ones that are already escape sequences in the JS template literal)
    // Since this is extracted from JS template literal, \n etc. are already resolved
    result = result.replace(/\\/g, '\\\\');
    // Escape Swift string interpolation
    result = result.replace(/\\\\(\()/g, '\\\\\\($1'); // \\( → \\\(
    // Actually, let's be more careful. After escaping backslashes:
    // Any literal \( in the content is now \\(, but Swift would see \( as interpolation
    // We need to find actual ( that follow a single backslash in the ORIGINAL
    // Let me redo this more carefully
    return result;
}

function escapeForSwiftMultiline(content) {
    // Step 1: Replace all backslashes with double backslashes
    let result = content.replaceAll('\\', '\\\\');
    // Step 2: Escape any """ sequences
    result = result.replaceAll('"""', '\\"""');
    return result;
}

let output = `import Foundation

extension LessonData {
`;

for (const wid of worldIds) {
    // Chinese version
    const zhFile = path.join(lessonsDir, `world${wid}.js`);
    if (fs.existsSync(zhFile)) {
        const zhContent = extractContent(zhFile);
        const zhEscaped = escapeForSwiftMultiline(zhContent);
        output += `    static let zhWorld${wid}: String = """\n${zhEscaped}\n"""\n\n`;
    }

    // English version
    const enFile = path.join(lessonsDir, `world${wid}_en.js`);
    if (fs.existsSync(enFile)) {
        const enContent = extractContent(enFile);
        const enEscaped = escapeForSwiftMultiline(enContent);
        output += `    static let enWorld${wid}: String = """\n${enEscaped}\n"""\n\n`;
    }
}

// Add the additionalLesson function
output += `    static func additionalLesson(for worldId: Int, language: LanguageManager.Language) -> String? {
        switch (worldId, language) {
`;

for (const wid of worldIds) {
    output += `        case (${wid}, .zhTW): return zhWorld${wid}\n`;
    output += `        case (${wid}, .en): return enWorld${wid}\n`;
}

output += `        default: return nil
        }
    }
}
`;

fs.writeFileSync('DIQuest/Data/LessonDataExtra.swift', output);
console.log('Generated LessonDataExtra.swift with ' + worldIds.length + ' worlds');
console.log('File size: ' + (output.length / 1024).toFixed(1) + ' KB');
