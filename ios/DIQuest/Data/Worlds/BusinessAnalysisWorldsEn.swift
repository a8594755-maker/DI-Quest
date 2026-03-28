import Foundation

enum BusinessAnalysisWorldsEn {
    static let worlds: [World] = [
        // MARK: - World 1: Problem Decomposition Fundamentals
        World(
            id: 1,
            name: "Problem Decomposition Fundamentals",
            emoji: "🧩",
            description: "Learn to break down vague business problems into analyzable structures",
            quests: [
                Quest(
                    id: "1-1",
                    name: "Problem Classification: Business / Product / System",
                    description: "When facing a problem, the first step is to determine its category so you can apply the right analytical framework.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identify the Problem Type",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What category does this problem most likely belong to?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Customer Service Team's Dilemma",
                                narrative: "You are a Business Analyst at a SaaS company. The customer service manager comes to you and says:\n\n\"Customer complaints have been increasing lately. Support ticket resolution time went from an average of 2 hours to 8 hours, and customer satisfaction dropped from 4.5 to 3.2.\"\n\nYou need to first determine what type of problem this is before deciding your analysis direction.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Business Problem — Business model or strategy issue", explanation: "This is not a business model issue. The company's product and market positioning haven't changed. The problem lies in internal operational processes."),
                                Challenge.Option(id: "B", text: "Product Problem — Product functionality or user experience issue", explanation: "Although customer satisfaction is declining, the root cause isn't in the product's features itself, but in customer service response speed."),
                                Challenge.Option(id: "C", text: "System / Process Problem — Process or system efficiency issue", explanation: "Correct! Resolution time going from 2hr to 8hr is a classic process bottleneck. You need to analyze which step in the customer service workflow is causing the delay."),
                                Challenge.Option(id: "D", text: "All of the above — Cannot distinguish", explanation: "While problems can influence each other, the first step is always to focus. The key clue here is \"resolution time surged,\" pointing to a process problem."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Notice the key numbers: resolution time went from 2hr to 8hr. What does this indicate?",
                                "Think about it: Has the business model changed? Are product features broken? Or is the way work gets done the issue?",
                            ],
                            explanation: "Problem classification is the first step in analysis. Business Problems affect revenue and strategy, Product Problems affect user experience and adoption, and System/Process Problems affect efficiency and cost. A surge in resolution time is a classic process problem — you need to examine every step of the workflow.",
                            frameworkTip: "Problem decomposition first step: Classify → Business / Product / System, then decide the analysis direction"
                        ),
                        Challenge(
                            id: 2,
                            name: "Impact Scope Analysis",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Based on the data, which assessment is most reasonable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Platform Conversion Rate Decline",
                                narrative: "You are a Product Analyst at an e-commerce platform. The PM tells you:\n\n\"Our cart-to-checkout conversion rate dropped 20% this month.\"\n\nBefore starting the analysis, you need to first understand the scope of impact.",
                                data: [
                                    ["metric": "Cart-to-Checkout Rate", "last_month": "68%", "this_month": "54%", "change": "-20%"],
                                    ["metric": "Overall Conversion", "last_month": "3.2%", "this_month": "2.8%", "change": "-12.5%"],
                                    ["metric": "Average Order Value", "last_month": "$85", "this_month": "$82", "change": "-3.5%"],
                                    ["metric": "Daily Active Users", "last_month": "125K", "this_month": "128K", "change": "+2.4%"],
                                ],
                                dataCaption: "Key Metrics Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Traffic decline caused the conversion drop", explanation: "DAU actually increased slightly (+2.4%), so traffic is not the issue."),
                                Challenge.Option(id: "B", text: "The problem is concentrated in the checkout flow, not overall traffic", explanation: "Correct! DAU is up but cart-to-checkout dropped significantly. The problem is clearly in the checkout flow segment. AOV barely changed, indicating purchase intent hasn't shifted much."),
                                Challenge.Option(id: "C", text: "Customer spending power has declined, leading to purchase abandonment", explanation: "AOV only dropped 3.5%, which is insufficient to explain a 20% conversion decline."),
                                Challenge.Option(id: "D", text: "All metrics are declining — this is a systemic issue", explanation: "DAU is actually increasing. When analyzing data, you must carefully examine each metric's direction."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Compare the direction and magnitude of change across all metrics. Which change is the largest?",
                                "DAU is increasing — what does that imply?",
                            ],
                            explanation: "Impact scope analysis helps you narrow the investigation. Here, rising DAU rules out traffic issues, and minimal AOV change rules out spending power issues, so the problem is concentrated in the checkout flow itself. The next step should be examining each step of the checkout funnel.",
                            frameworkTip: "Look at the big picture first → Which metric changed the most → Eliminate unrelated factors → Focus on the problem area"
                        ),
                        Challenge(
                            id: 3,
                            name: "Defining Success Criteria",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most appropriate first step to define whether this internal tool is successful?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Internal Tool Dilemma",
                                narrative: "You joined the Business Systems team at a tech company. Your manager says:\n\n\"We spent half a year last year developing an internal CRM tool, but now the sales team is complaining a lot, saying it's hard to use. The boss is asking whether it was successful, and I don't know how to answer.\"\n\nYou need to help the team define \"success.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Check how many people are using it (DAU)", explanation: "User count is a metric, but not the first step. If the company only has 50 salespeople, high DAU doesn't mean satisfaction, and low DAU might mean they're forced to use it. You first need to clarify what \"success\" means and for whom."),
                                Challenge.Option(id: "B", text: "Conduct a satisfaction survey", explanation: "Surveys are useful, but before running one, you need to know what to ask. First define the dimensions of success, then design the survey."),
                                Challenge.Option(id: "C", text: "Go back to the original problem this tool was built to solve, and define dimensions of success", explanation: "Correct! First ask: What problem was this tool meant to solve? For whom? Then you can define measurable metrics. It might be \"reduce the time sales reps spend updating customer data\" or \"improve pipeline forecast accuracy.\""),
                                Challenge.Option(id: "D", text: "Compare feature gaps with market tools like Salesforce", explanation: "Feature comparison can be done, but it's not how you define success. Internal tools and purchased tools have different value measurement approaches."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "\"Success\" isn't a fixed thing — it depends on why it was built.",
                                "Think about it: If you don't know what problem the tool was supposed to solve, how can you tell if it solved it?",
                            ],
                            explanation: "Defining success always goes back to \"why was this done.\" Success metrics must align with the original objective. If the goal was \"save sales reps 3 hours per week updating customer data,\" then measure that. Usage and satisfaction are proxy metrics, not success metrics.",
                            frameworkTip: "Defining success: What's the goal → Dimensions of success → Measurable metrics → Current state vs target gap"
                        ),
                    ]
                ),
                Quest(
                    id: "1-2",
                    name: "Steps for Breaking Down Problems",
                    description: "Learn to use structured approaches to break a big problem into smaller, analyzable pieces.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Breaking Down Activation Decline",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Based on the funnel data, where does the largest drop-off occur?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Product Activation Decline",
                                narrative: "You are a Product Analyst at a B2B SaaS company. The Growth PM tells you:\n\n\"New user 7-day activation rate dropped from 45% last month to 32%.\"\n\nActivation is defined as: the user completing at least one core action (creating their first project) within 7 days of signing up.",
                                data: [
                                    ["step": "Signup completed", "last_month": "100%", "this_month": "100%", "drop": "—"],
                                    ["step": "Onboarding completed", "last_month": "78%", "this_month": "61%", "drop": "-17pp"],
                                    ["step": "First project created", "last_month": "45%", "this_month": "32%", "drop": "-13pp"],
                                ],
                                dataCaption: "Activation Funnel (7 days post-signup)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Signup → Onboarding completed (-17pp)", explanation: "Correct! It dropped from 78% to 61%, a difference of 17 percentage points — the largest drop-off. The problem is most likely in the onboarding flow."),
                                Challenge.Option(id: "B", text: "Onboarding completed → Project created (-13pp)", explanation: "This step did decline, but -13pp is less than -17pp. You should address the largest drop-off first."),
                                Challenge.Option(id: "C", text: "Both steps declined similarly — address them together", explanation: "While both steps declined, the principle of prioritization is to solve the highest-impact issue first. -17pp > -13pp."),
                                Challenge.Option(id: "D", text: "Insufficient data to determine", explanation: "This funnel clearly shows the drop-off at each step, which is sufficient to identify where the biggest problem lies."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "Look at the magnitude of decline at each step (pp = percentage points)",
                                "The step with the largest decline is usually the most worth investigating first",
                            ],
                            explanation: "The core of funnel analysis: find the largest drop-off → that's the most worthwhile place to investigate and improve. Here, the onboarding step has the largest drop-off (-17pp), so you should prioritize analyzing what changed in the onboarding flow.",
                            frameworkTip: "Problem decomposition: Overall metric → Funnel steps → Find largest drop-off → Deep dive investigation"
                        ),
                        Challenge(
                            id: 2,
                            name: "Forming Hypotheses",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which hypothesis should be prioritized for validation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Further Analyzing the Onboarding Drop-off",
                                narrative: "You discovered that onboarding completion rate dropped from 78% to 61%.\n\nYou checked the recent product change log:\n• 3 weeks ago: Onboarding flow changed from 3 steps to 5 steps (added \"invite team members\" and \"connect third-party tools\")\n• 2 weeks ago: Marketing launched new Google Ads campaigns\n• 1 week ago: Server had a 2-hour outage\n\nYou need to form the most reasonable hypothesis.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Server outage caused user loss", explanation: "The outage lasted only 2 hours and happened just 1 week ago, but the problem has been persisting for weeks. Limited impact."),
                                Challenge.Option(id: "B", text: "Onboarding changed from 3 to 5 steps — the new steps created friction", explanation: "Correct! The timing matches (changed 3 weeks ago, and the decline started around then), and the logic is sound: more steps → more friction → lower completion rate. This is the hypothesis that should be validated first."),
                                Challenge.Option(id: "C", text: "New Google Ads brought lower-quality traffic", explanation: "This is also a reasonable hypothesis, but the onboarding redesign timing aligns better. Plus, validating this hypothesis requires segmenting by traffic source, which is more complex."),
                                Challenge.Option(id: "D", text: "A competitor launched a better product", explanation: "There's no data supporting this hypothesis. Hypotheses should be based on known facts."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at the timing of each change — which one aligns most closely with when the problem appeared?",
                                "Hypotheses should be based on known facts and must be verifiable.",
                            ],
                            explanation: "Good hypotheses have three characteristics: (1) Timing alignment, (2) Sound logic (causal relationship makes sense), (3) Verifiable. The onboarding redesign fits all three. Verification method: compare step-by-step completion rates before and after the redesign, and check how high the drop-off is on the two new steps.",
                            frameworkTip: "Forming hypotheses: List recent changes → Match timing → Check causal logic → Validate the most testable one first"
                        ),
                    ]
                ),
                Quest(
                    id: "1-3",
                    name: "What to Do with Insufficient Information",
                    description: "Interviews often present scenarios with incomplete information. Learn to ask the right questions.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Asking the Right Questions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which set of questions best helps you clarify the problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "A Vague Requirement",
                                narrative: "The interviewer asks you:\n\n\"Our app's user engagement isn't good enough. How would you analyze this?\"\n\nYour first reaction shouldn't be to answer directly, but to clarify first.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "\"What's the definition of engagement?\" \"Compared to what time period?\" \"Is it all users declining or a specific segment?\"", explanation: "Correct! These three questions clarify: metric definition, comparison baseline, and scope of impact. This is the standard approach for breaking down vague problems."),
                                Challenge.Option(id: "B", text: "\"Do you run A/B tests?\" \"What's your tech stack?\"", explanation: "These questions are too specific and skip the most basic problem definition. You don't even know what \"engagement\" refers to yet."),
                                Challenge.Option(id: "C", text: "\"What's your DAU?\" \"What's your MAU?\"", explanation: "Before asking for specific numbers, you should first confirm what \"engagement isn't good enough\" means. Maybe the interviewer isn't referring to DAU."),
                                Challenge.Option(id: "D", text: "\"What features do you have?\" \"Who are your competitors?\"", explanation: "These are useful background questions, but not what you should ask first. Clarify the problem itself first."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "When facing vague problems, ask three things first: definition, comparison baseline, scope.",
                            ],
                            explanation: "In interviews, proactively clarifying vague problems is a plus. Interviewers want to see if you'll blindly answer. Standard clarification framework: (1) How is the metric defined? (2) Compared to what? (3) How wide is the impact? These three questions can clarify 90% of vague problems.",
                            frameworkTip: "Handling vague problems: Definition → Comparison baseline → Impact scope → Timeline → Then start analyzing"
                        ),
                        Challenge(
                            id: 2,
                            name: "Reasoning Without Data",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Without data tools available, which approach is most practical?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The No-Data Scenario",
                                narrative: "The interviewer follows up:\n\n\"Assume you have no data tools and no analytics dashboard, but the boss needs a preliminary judgment by tomorrow — are our users churning because of onboarding issues or because the product doesn't deliver value? What would you do?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Wait until you have data before analyzing — you shouldn't make judgments without data", explanation: "In reality, bosses frequently need quick judgments. Being able to make reasonable inferences with limited resources is an important skill."),
                                Challenge.Option(id: "B", text: "Review support tickets and user feedback to find qualitative signals", explanation: "Correct! Support tickets, app store reviews, and sales team feedback are all qualitative data. If complaints cluster around \"don't know how to get started,\" that's onboarding. If it's \"used it for a few weeks and found it useless,\" that's value."),
                                Challenge.Option(id: "C", text: "Use the product yourself — personally experience the onboarding", explanation: "This is a useful method (dogfooding), but it only represents one person's experience and can't represent users overall. It should be combined with other methods."),
                                Challenge.Option(id: "D", text: "Create a survey and send it to all users", explanation: "Surveys take time to design and collect. With a deadline of tomorrow, there's not enough time. Also, survey response rates are usually low."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "When you don't have quantitative data, what other information sources exist?",
                                "Think about who in the company interacts directly with users most often.",
                            ],
                            explanation: "Making judgments without perfect data is one of the core skills of a BA/PA. Qualitative data (support records, user feedback, sales feedback) is an important signal source. Showing in an interview that you value both quantitative and qualitative data will impress the interviewer.",
                            frameworkTip: "Without data: Qualitative signals (support, feedback, reviews) → Categorize problem patterns → Form hypotheses"
                        ),
                    ]
                ),
                Quest(
                    id: "1-4",
                    name: "Problem Impact Analysis",
                    description: "Learn to assess the severity and priority of a problem.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Assessing Problem Severity",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which problem should you prioritize?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Three Simultaneous Problems",
                                narrative: "You are a BA at a fintech company. Monday morning, three teams come to you at the same time:\n\n1. Marketing: \"Our landing page conversion rate dropped from 5% to 4.2%\"\n2. Operations: \"Yesterday 12 transactions were double-charged, and customers are complaining on Twitter\"\n3. Product: \"New feature launched a week ago, adoption rate is only 8%, below the expected 20%\"",
                                data: [
                                    ["issue": "Landing page conversion", "impact": "Potential revenue decline", "urgency": "Medium", "reversibility": "High"],
                                    ["issue": "Double-charge bug", "impact": "Customer trust + compliance risk", "urgency": "Critical", "reversibility": "Low"],
                                    ["issue": "Low new feature adoption", "impact": "Development resource waste", "urgency": "Low", "reversibility": "High"],
                                ],
                                dataCaption: "Problem Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Landing page conversion — Directly impacts revenue", explanation: "Revenue matters, but a 0.8% decline isn't an urgent crisis. It can be second in line."),
                                Challenge.Option(id: "B", text: "Double-charge bug — Involves customer money and trust", explanation: "Correct! Double charges in a financial product are highest priority: (1) Directly harms customers (2) Compliance risk (3) Already spreading on social media (4) Irreversible (charges already made). Every hour of delay increases the damage."),
                                Challenge.Option(id: "C", text: "New feature adoption — Most resources invested but poor results", explanation: "This is important but not urgent. The feature is already live, and observing a few more days won't make it worse."),
                                Challenge.Option(id: "D", text: "Handle all three simultaneously, allocating 1/3 of time to each", explanation: "When resources are limited, you shouldn't distribute them equally. Prioritize by severity and urgency."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think about which problem has the worst consequences if not addressed immediately.",
                                "Consider: Impact (magnitude) x Urgency (time sensitivity) x Irreversibility",
                            ],
                            explanation: "Prioritization framework: Impact x Urgency x Irreversibility. The double-charge bug scores highest on all three dimensions. In interviews, demonstrating that you can make trade-offs and prioritize across multiple problems is a key skill.",
                            frameworkTip: "Priority = Impact x Urgency x Irreversibility. Address irreversible, high-impact issues first."
                        ),
                        Challenge(
                            id: 2,
                            name: "Stakeholder Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Before reporting to management, what elements should your analysis include?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Who Is Affected?",
                                narrative: "Continuing with the double-charge case. You've confirmed it's the highest priority. Now you need to understand the scope of impact and stakeholders.\n\nInitial investigation found:\n• 12 double charges, amounts ranging from $50 to $2,000\n• 3 of those customers have publicly complained on Twitter\n• The bug came from yesterday's payment service update\n• The bug has been fixed by engineers, but double charges haven't been refunded yet",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Only report that the bug is fixed — problem solved", explanation: "Bug fixed ≠ problem solved. There's still refunds, customer communication, and prevention work. Reporting only good news will erode trust."),
                                Challenge.Option(id: "B", text: "Impact scope (how many people, how much money), root cause, actions taken, and what's still needed", explanation: "Correct! A complete incident report should include: What happened → How many affected → Root cause → Actions taken → What's still needed → Prevention plan. This gives management the information they need to make decisions."),
                                Challenge.Option(id: "C", text: "Detailed technical root cause analysis report", explanation: "Management doesn't need technical details. They need to know: How big is the impact, what's the current status, and what else needs to be done."),
                                Challenge.Option(id: "D", text: "Screenshots of customer Twitter complaints", explanation: "This is only a small part of the problem. The report should be a comprehensive impact analysis, not just social media reactions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "What information does management need to make decisions?",
                                "Think about what questions a complete problem report should answer.",
                            ],
                            explanation: "When reporting issues to management, use this structure: (1) What — What happened (2) Scale — How big is the impact (3) Why — Root cause (4) Done — What's been done (5) Need — What's still needed (6) Prevent — How to prevent recurrence. This framework is also great for interviews.",
                            frameworkTip: "Incident report structure: What → Scale → Why → Done → Need → Prevent"
                        ),
                    ]
                ),
                Quest(
                    id: "1-5",
                    name: "Structured Thinking Exercise",
                    description: "Combine everything you've learned to answer a complete case using a structured approach.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Case: Low Internal Tool Adoption",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Using the problem decomposition approach, what's the most reasonable way to break down this case?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Unused New Tool",
                                narrative: "You are a Business Systems Analyst. The company spent 3 months developing a new expense report system to replace the old Excel + email process.\n\nData one month after launch:\n• 500 employees need to file expense reports\n• Only 120 have used the new system (24%)\n• Of those, 45 used it once and never again\n• The remaining 380 are still using the old Excel process\n• Finance received numerous complaints that \"the new system is too complex\"",
                                data: [
                                    ["segment": "Using new system consistently", "count": "75", "pct": "15%"],
                                    ["segment": "Used once then abandoned", "count": "45", "pct": "9%"],
                                    ["segment": "Never used new system", "count": "380", "pct": "76%"],
                                ],
                                dataCaption: "User Distribution"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This is a Product Problem: the system is too hard to use → redesign the UI", explanation: "\"Too complex\" is surface-level feedback. You don't know if it's truly too complex, or if there's no training, or if the old process is just too convenient. Jumping to a UI redesign is risky."),
                                Challenge.Option(id: "B", text: "Break it into three layers: (1) Do they know about the new system (2) How was the trial experience (3) Is there long-term value", explanation: "Correct! The classic adoption problem breakdown: Awareness → Trial Experience → Ongoing Value. The 76% who never used it might not know, not want to, or not know how. The 9% who tried and quit had a trial experience problem. Only by separating these can you prescribe the right solution."),
                                Challenge.Option(id: "C", text: "This is a Change Management problem: just mandate company-wide usage", explanation: "Mandating usage can increase adoption numbers, but if the system genuinely has problems, it will just create more complaints. Diagnose the issue before deciding on strategy."),
                                Challenge.Option(id: "D", text: "Compare feature gaps between the old and new systems", explanation: "Feature comparison is part of the analysis, but not a way to decompose the problem. You need to first understand why different users aren't using it, then look at features."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "76% never used vs 9% tried and quit — are these two groups facing the same problem?",
                                "Think about the three stages of user adoption: Awareness → Trial → Continued Use",
                            ],
                            explanation: "The classic adoption problem breakdown: Awareness (do they know?) → Trial (did they try? How was it?) → Value (is continued use valuable?). Different stages require different solutions: low Awareness needs promotion, poor Trial needs better onboarding, low Value needs feature improvements.",
                            frameworkTip: "Adoption three-layer breakdown: Awareness → Trial → Value. Different stages, different solutions."
                        ),
                        Challenge(
                            id: 2,
                            name: "Case: Next Steps",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Based on the investigation results, what's the most reasonable recommendation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Improvement Recommendations for the Expense Report System",
                                narrative: "You investigated further and found:\n\n• Awareness: 85% of people know about the new system (it was announced), so awareness isn't the main issue\n• Trial: Of the 120 who tried, the 45 who quit mainly cited \"too many steps to upload receipts\"\n• Value: The 75 consistent users generally said \"reimbursement time went from 2 weeks to 3 days — great!\"\n\nYou need to decide the next step.",
                                data: [
                                    ["finding": "Awareness", "status": "Not the main issue", "detail": "85% know about the new system"],
                                    ["finding": "Trial Experience", "status": "Primary problem", "detail": "Receipt upload process is too complex"],
                                    ["finding": "Value", "status": "Positive", "detail": "Consistent users have high satisfaction"],
                                ],
                                dataCaption: "Investigation Results Summary"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Completely redesign the system", explanation: "Consistent users are already very satisfied, so a full redesign is overkill. Just improve the receipt upload step."),
                                Challenge.Option(id: "B", text: "Simplify the receipt upload process, then invite the 45 who abandoned to try again", explanation: "Correct! The root cause is that receipt upload is too complex. Solution: (1) Simplify that process (2) Invite abandoners to retry (3) Use positive feedback from consistent users as social proof. Targeted fix, not a complete redo."),
                                Challenge.Option(id: "C", text: "Mandate everyone to use it and eliminate the Excel reimbursement process", explanation: "Mandating before fixing the receipt upload issue will give even more people a bad experience. Fix first, then promote."),
                                Challenge.Option(id: "D", text: "Run an A/B test with different onboarding flows", explanation: "A/B testing is appropriate when the cause is unknown. Here the cause is already clear (receipt upload is too complex) — just fix it."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The root cause has been found — the recommendation should address it directly.",
                                "Value has already been validated (consistent users are satisfied), so the problem isn't product value — it's the trial experience.",
                            ],
                            explanation: "Good recommendations should: (1) Directly address the root cause (2) Minimize scope of change (3) Have a clear verification method. Here you only need to fix the receipt upload flow, then track the return rate of abandoners. In interviews, showing you can narrow from analysis to specific, actionable recommendations is the most impressive skill.",
                            frameworkTip: "Recommendation formula: Address root cause → Minimum viable change → Clear verification method → Risks and limitations"
                        ),
                    ]
                ),
                Quest(
                    id: "1-6",
                    name: "Boss: Complete Case Decomposition",
                    description: "Use a complete case answer framework to address an end-to-end business problem.",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Case: Subscription Product Renewal Rate Decline",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Step 1: Based on the data, how would you define the scope of the problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Renewal Rate Crisis",
                                narrative: "You are a Product Analyst at a B2B SaaS company that offers a project management tool (similar to Asana/Monday.com).\n\nThe CEO says at an All Hands: \"Our annual renewal rate dropped from 85% to 72%. If we don't improve, next year's revenue will be $2M less.\"\n\nYou've been assigned to analyze this problem.\n\nThe company has three plans:\n• Starter ($99/yr, 1-5 people)\n• Professional ($499/yr, 6-50 people)\n• Enterprise ($2,999/yr, 50+ people)",
                                data: [
                                    ["plan": "Starter", "customers": "2000", "renewal_rate_before": "78%", "renewal_rate_now": "61%", "change": "-17pp"],
                                    ["plan": "Professional", "customers": "800", "renewal_rate_before": "88%", "renewal_rate_now": "82%", "change": "-6pp"],
                                    ["plan": "Enterprise", "customers": "150", "renewal_rate_before": "95%", "renewal_rate_now": "93%", "change": "-2pp"],
                                ],
                                dataCaption: "Renewal Rate Changes by Plan"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All plans are declining — this is a systemic issue", explanation: "While all plans declined, the magnitude differs greatly. Starter -17pp vs Enterprise -2pp. Focusing on Starter can solve most of the problem."),
                                Challenge.Option(id: "B", text: "The problem is mainly concentrated in the Starter plan (-17pp) — this segment should be analyzed first", explanation: "Correct! Starter has the largest decline (-17pp) and the most customers (2,000). This means improving Starter's renewal rate alone can address most of the revenue gap."),
                                Challenge.Option(id: "C", text: "Enterprise renewal rate matters most because the unit price is highest", explanation: "Enterprise has the highest price, but only declined -2pp (about 3 customers), impacting roughly $9K. Starter declined -17pp (340 customers), impacting roughly $34K. Look at absolute impact."),
                                Challenge.Option(id: "D", text: "Need more data to determine", explanation: "The current data is sufficient for initial segmentation. Focus on the biggest problem first, then deep-dive."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at the product of drop magnitude and customer count — which segment has the largest impact?",
                            ],
                            explanation: "First step in interview case decomposition: segmentation. Identify the most affected segment and focus your analysis. Here, the Starter plan has the largest drop and the most customers — it's the primary analysis target.",
                            frameworkTip: "Case Step 1: Goal → Metrics → Segmentation → Focus on the biggest problem"
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Case: Finding the Root Cause",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Based on the information above, what is the most likely root cause?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Deep Dive into the Starter Plan",
                                narrative: "After focusing on the Starter plan, you investigated further and found:\n\n• Starter users use an average of only 3 features (out of 15 available)\n• Renewed Starter users were still actively using the product 30 days before expiry\n• Non-renewed Starter users stopped using the product 60 days before expiry\n• 6 months ago, the company moved the \"Gantt Chart\" feature from Starter to the Professional plan\n• Support records show the most common question from Starter users is: \"Where did Gantt Chart go?\"",
                                data: [
                                    ["metric": "Avg features used", "renewed": "5 features", "not_renewed": "2 features"],
                                    ["metric": "Days from last active to expiry", "renewed": "Continued using until expiry", "not_renewed": "Stopped 60 days before expiry"],
                                    ["metric": "Top 1 support inquiry", "renewed": "Billing questions", "not_renewed": "Gantt Chart feature disappeared"],
                                ],
                                dataCaption: "Renewed vs Non-Renewed User Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Starter users were never engaged enough and would have churned eventually", explanation: "Renewed Starter users used 5 features and remained active, showing that Starter users can be retained. The problem isn't inherent."),
                                Challenge.Option(id: "B", text: "Moving Gantt Chart from Starter caused users who relied on it to lose key value", explanation: "Correct! All clues point in the same direction: (1) Timing matches (moved 6 months ago, now up for renewal) (2) Support data supports it (top inquiry) (3) Behavioral data supports it (non-renewers stopped using earlier). This is a classic \"removing a feature caused value loss.\""),
                                Challenge.Option(id: "C", text: "Competitor free tools poached small teams", explanation: "No data supports the competitor hypothesis. Plus, the top support question is about Gantt Chart, not \"I found a better tool.\""),
                                Challenge.Option(id: "D", text: "Price is too high for small teams", explanation: "$99/yr isn't high. Plus, the previous renewal rate was 78% — price hasn't changed but renewal rate dropped, indicating the problem isn't price."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Note the timeline: When was Gantt Chart moved? When did renewal rate start dropping?",
                                "What is the #1 support question?",
                            ],
                            explanation: "Root cause analysis should find the intersection of multiple clues. Here, the timeline, support data, and usage behavior all point to the Gantt Chart removal. In interviews, being able to connect multiple data sources to reach a conclusion is the highest-scoring answer approach.",
                            frameworkTip: "Root cause validation: Cross-confirm with multiple clues (timing + behavioral data + qualitative feedback)"
                        ),
                        Challenge(
                            id: 3,
                            name: "Boss Case: Making Recommendations",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What recommendation would you make to management?",
                            scenario: 
                            Challenge.Scenario(
                                title: "How to Solve the Renewal Rate Problem",
                                narrative: "You've confirmed the root cause: Gantt Chart was moved to the Professional plan, causing Starter users to lose value.\n\nBut this isn't your decision alone. Business considerations:\n\n• The revenue team moved Gantt Chart to drive Starter → Professional upsell\n• But actual upsell conversion is only 3% (expected was 15%)\n• 97% of Starter users didn't upgrade, and many simply didn't renew\n• The Starter plan accounts for 68% of total customers",
                                data: [
                                    ["scenario": "Maintain status quo", "starter_renewal": "61%", "upsell_rate": "3%", "revenue_impact": "-$340K/yr"],
                                    ["scenario": "Move Gantt Chart back to Starter", "starter_renewal": "~75%", "upsell_rate": "~1%", "revenue_impact": "+$140K/yr"],
                                    ["scenario": "Move Gantt Chart back + new upsell strategy", "starter_renewal": "~75%", "upsell_rate": "~5%", "revenue_impact": "+$200K/yr"],
                                ],
                                dataCaption: "Estimated Impact of Three Scenarios"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Maintain status quo and push harder on upsell", explanation: "Upsell is only at 3% (vs 15% expected), showing Starter users have no interest in upgrading. Pushing harder will just cause more non-renewals."),
                                Challenge.Option(id: "B", text: "Move Gantt Chart back to Starter and give up on upsell", explanation: "This solves the renewal problem, but upsell drops to 1%, essentially giving up all upgrade revenue. There's a better option."),
                                Challenge.Option(id: "C", text: "Move Gantt Chart back to Starter while designing new upsell value propositions", explanation: "Correct! The best option balances both goals: (1) Restore Gantt Chart to stop the bleeding and recover Starter renewal rates (2) Use other features (like advanced reports, API integrations) as new upsell drivers. Data shows this option has the best revenue impact."),
                                Challenge.Option(id: "D", text: "Eliminate the Starter plan and merge everyone into Professional", explanation: "This would immediately drive away 68% of customers. Starter is the acquisition funnel's entry point — eliminating it would hurt long-term growth."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Look at the revenue impact of the three scenarios — which is best?",
                                "Good recommendations balance short-term damage control and long-term growth.",
                            ],
                            explanation: "The golden rule for recommendations in interviews: It's not black and white — find a solution that balances multiple interests. Here, \"restore + new upsell\" both solves the renewal problem and preserves upgrade growth potential. Finally, mention how you'd validate: track post-restoration renewal rate and new upsell conversion.",
                            frameworkTip: "Case final step: Recommend → Why this one → Trade-offs → How to validate"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 2: KPIs and Business Metrics
        World(
            id: 2,
            name: "KPIs and Business Metrics",
            emoji: "📊",
            description: "Learn to choose the right metrics, read data, and make judgments",
            quests: [
                Quest(
                    id: "2-1",
                    name: "KPI Fundamentals",
                    description: "Understand what KPIs are and why different roles value different metrics.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Leading vs Lagging Metrics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is a leading metric that could have provided early warning of the revenue problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Quarterly Business Review",
                                narrative: "You're attending a quarterly business review at a SaaS company. Here are the metrics from the report:\n\n• Q3 Revenue: $1.2M (target $1.5M, 20% short)\n• Customer Churn Rate: 8% (last quarter 5%)\n• Sales pipeline qualified leads: down 30%\n• Product NPS: dropped from 45 to 38\n\nThe CEO wants to know why revenue missed the target.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Q3 Revenue $1.2M", explanation: "Revenue is a lagging metric — it's a result, not an early warning signal. By the time you see revenue miss, the problem has already occurred."),
                                Challenge.Option(id: "B", text: "Sales pipeline qualified leads", explanation: "Correct! Pipeline is a classic leading metric. Leads decline → Closed deals decline 3-6 months later → Revenue declines. If the pipeline decline had been detected in Q2, the Q3 revenue problem could have been prevented."),
                                Challenge.Option(id: "C", text: "Customer churn rate 8%", explanation: "Churn rate is a lagging metric — customers have already left before it's calculated. But churn \"precursors\" (like declining usage frequency) are leading metrics."),
                                Challenge.Option(id: "D", text: "NPS score 38", explanation: "NPS is somewhat leading (low NPS predicts future churn), but it's not a direct driver of revenue, and NPS has lower actionability. Pipeline is more direct."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A leading metric can detect problems before the outcome occurs.",
                                "Think about which metric, if detected early, would allow you to take action to prevent the problem.",
                            ],
                            explanation: "Leading metrics predict the future (pipeline, activation rate, feature adoption). Lagging metrics reflect the past (revenue, churn, NPS). A good dashboard needs both: lagging confirms results, leading provides early warnings. In interviews, proactively distinguishing between these two types of metrics will earn bonus points.",
                            frameworkTip: "Leading = Predictive, actionable / Lagging = Reflects results, confirms trends"
                        ),
                        Challenge(
                            id: 2,
                            name: "Guardrail Metrics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "This strategy hit the primary metric target. What do the guardrail metrics tell you?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Growth Hack Side Effects",
                                narrative: "You're at an e-commerce company. The Growth team launched a strategy: \"Free shipping on first purchase,\" targeting new customer conversion rate.\n\nResults:\n• New customer conversion rate: increased from 2.5% to 4.8% (success ✓)\n• Average order value: dropped from $85 to $32\n• Return rate: increased from 5% to 22%\n• Customer 30-day repurchase rate: 3% (previously 15% for new customers)",
                                data: [
                                    ["metric": "New customer conversion", "before": "2.5%", "after": "4.8%", "verdict": "Increased"],
                                    ["metric": "Average order value", "before": "$85", "after": "$32", "verdict": "Sharply declined"],
                                    ["metric": "Return rate", "before": "5%", "after": "22%", "verdict": "Sharply increased"],
                                    ["metric": "30-day repurchase rate", "before": "15%", "after": "3%", "verdict": "Sharply declined"],
                                ],
                                dataCaption: "Before and After Free Shipping Strategy"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The strategy was very successful — conversion rate nearly doubled", explanation: "Only looking at the primary metric is misleading. The deterioration in AOV and return rate indicates the strategy attracted low-quality customers who will lose money long-term."),
                                Challenge.Option(id: "B", text: "Guardrail metrics all deteriorated — the strategy hit its target but brought unhealthy growth", explanation: "Correct! Guardrail metrics exist to prevent you from \"hitting the target but hurting the whole.\" Plummeting AOV, skyrocketing return rate, and collapsing repurchase rate mean the free shipping attracted bargain hunters, not the target customer base. This is unhealthy growth."),
                                Challenge.Option(id: "C", text: "Rising return rates are normal for e-commerce", explanation: "Going from 5% to 22% is a 4x+ increase — that's not normal. Especially when it perfectly aligns with the timing of the free shipping strategy."),
                                Challenge.Option(id: "D", text: "Need more time to observe — one month of data isn't enough", explanation: "Guardrail metric changes are already very clear. With data this obvious, waiting is just wasting money."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Guardrail metrics are bottom-line metrics that \"must not deteriorate.\" If guardrails are breached, the strategy must be paused no matter how successful it appears.",
                            ],
                            explanation: "The core concept of guardrail metrics: Your primary metric can improve, but not at the expense of these metrics. Common guardrails: AOV, return rate, customer quality, unit economics. In interviews, proactively mentioning \"what guardrails I would set\" shows mature analytical thinking.",
                            frameworkTip: "Every improvement plan needs: Primary Metric (to improve) + Guardrail Metrics (must not deteriorate)"
                        ),
                    ]
                ),
                Quest(
                    id: "2-2",
                    name: "Product & User Metrics",
                    description: "Master the most commonly used user metrics for Product Analysts.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DAU/MAU Ratio Interpretation",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "The Finance App's DAU/MAU is only 8%. What does this mean?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Comparing Activity Across Three Products",
                                narrative: "You are a PA at a tech conglomerate and need to compare user stickiness across three products.\n\nThe DAU/MAU ratio (also called stickiness ratio) reflects: on average, what percentage of monthly active users use the product each day.",
                                data: [
                                    ["product": "Chat App", "DAU": "5.2M", "MAU": "8M", "DAU/MAU": "65%", "category": "Social Messaging"],
                                    ["product": "Project Tool", "DAU": "800K", "MAU": "3.2M", "DAU/MAU": "25%", "category": "Work Management"],
                                    ["product": "Finance App", "DAU": "200K", "MAU": "2.5M", "DAU/MAU": "8%", "category": "Personal Finance"],
                                ],
                                dataCaption: "Activity Across Three Products"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The product has a serious problem — users don't like using it", explanation: "Not necessarily. Personal finance apps inherently have low usage frequency — you don't check your account balance every day. Low DAU/MAU doesn't mean a bad product; you need to compare against category benchmarks."),
                                Challenge.Option(id: "B", text: "Users don't need to use it daily — low stickiness is normal for this category", explanation: "Correct! Different product categories have different usage frequencies. A social app with DAU/MAU > 50% is normal, but a finance app at 10% could be doing well. The key is comparing within the same category, not across categories."),
                                Challenge.Option(id: "C", text: "Should add more daily notifications to increase DAU", explanation: "Pushing notifications aggressively will cause users to disable notifications or delete the app. Usage frequency should be driven by product value, not interruptions."),
                                Challenge.Option(id: "D", text: "High MAU but low DAU means users only use it once then never again", explanation: "Not just once — MAU means they used it within the month. They just don't use it every day. They might use it 2-3 times per month."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Do you open your banking app every day? Or just when you get paid?",
                                "Different types of products have different \"normal\" usage frequencies.",
                            ],
                            explanation: "The key to interpreting metrics: context matters. The same number means completely different things in different contexts. In interviews, interviewers often give you a metric to see if you'll jump to conclusions. The right approach: first ask what the benchmark is, then make judgments.",
                            frameworkTip: "Interpreting metrics: Check category benchmark first → Compare against similar products → Don't compare across categories"
                        ),
                        Challenge(
                            id: 2,
                            name: "Retention and Cohort",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Based on the data, can you directly conclude that \"the AI Summary feature improved retention\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Feature Retention Analysis",
                                narrative: "You work at a productivity app company. The PM launched an \"AI Summary\" feature and wants to know its impact on retention.\n\nYou ran a cohort analysis comparing 30-day retention between \"used AI Summary\" vs \"didn't use\" groups.",
                                data: [
                                    ["day": "Day 1", "with_AI": "82%", "without_AI": "75%"],
                                    ["day": "Day 7", "with_AI": "64%", "without_AI": "48%"],
                                    ["day": "Day 14", "with_AI": "55%", "without_AI": "35%"],
                                    ["day": "Day 30", "with_AI": "48%", "without_AI": "22%"],
                                ],
                                dataCaption: "30-Day Retention Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Yes — users of AI Summary clearly have higher retention", explanation: "Correlation ≠ Causation. Perhaps users who are already more engaged are the ones who try AI Summary, so their high retention isn't \"caused\" by AI Summary — these people were already less likely to churn."),
                                Challenge.Option(id: "B", text: "Cannot draw a causal conclusion directly — there may be selection bias", explanation: "Correct! This is a classic correlation vs causation trap. AI Summary users might be power users whose retention was already high. To verify causation, you need an A/B test (random assignment) or control for other variables."),
                                Challenge.Option(id: "C", text: "Cannot — sample size isn't large enough", explanation: "The question doesn't provide sample size information, but the problem isn't sample size — it's research design (observational vs experimental)."),
                                Challenge.Option(id: "D", text: "Need longer-term data to judge", explanation: "Longer data helps, but the fundamental issue is selection bias, not observation duration."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think: Did AI Summary make them stay, or were people who were going to stay anyway the ones who used AI Summary?",
                                "Correlation ≠ Causation. How can you verify causation?",
                            ],
                            explanation: "This is a classic PA interview question: correlation vs causation. Every time you see data showing \"users of feature X perform better,\" your first reaction should be: Is there selection bias? Solutions: A/B test with random assignment, PSM (propensity score matching), or finding a natural experiment.",
                            frameworkTip: "When you see a correlation, first ask: Did X cause Y, or did some Z cause both X and Y?"
                        ),
                        Challenge(
                            id: 3,
                            name: "Feature Adoption Assessment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "If you could only improve one step to maximize adoption, which would you choose?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Feature Two Weeks Post-Launch",
                                narrative: "Your company launched a \"smart scheduling\" feature. Here's the data two weeks in:\n\n• Total MAU: 50,000\n• Users who saw the feature entry point: 38,000 (76%)\n• Users who clicked to enter: 8,000 (21% of exposed)\n• Users who completed first use: 3,200 (40% of clicked)\n• Users who came back to use it the next week: 1,800 (56% of first-time users)",
                                data: [
                                    ["stage": "Exposed (saw entry point)", "users": "38,000", "rate": "76% of MAU"],
                                    ["stage": "Clicked (entered feature)", "users": "8,000", "rate": "21% of exposed"],
                                    ["stage": "Completed (finished first use)", "users": "3,200", "rate": "40% of clicked"],
                                    ["stage": "Retained (returned next week)", "users": "1,800", "rate": "56% of completed"],
                                ],
                                dataCaption: "Smart Scheduling Adoption Funnel"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Exposed → Clicked (21%) — improve feature discoverability", explanation: "21% click rate is actually not bad. Plus, improving discoverability usually involves UI tweaks with limited upside."),
                                Challenge.Option(id: "B", text: "Clicked → Completed (40%) — improve the first-time use experience", explanation: "Correct! 60% of people who clicked in didn't complete their first use, indicating serious friction in the first-time experience. Improving this step could raise completions from 3,200 to potentially 5,000-6,000, and the subsequent retention (56%) is already decent, meaning people who complete it find it valuable."),
                                Challenge.Option(id: "C", text: "Completed → Retained (56%) — improve return rate", explanation: "56% return rate is actually quite good. And the biggest loss is at the previous step (60% didn't complete first use) — solve the bigger problem first."),
                                Challenge.Option(id: "D", text: "Increase Exposed percentage — show it to more people", explanation: "76% is already very high. The remaining 24% are probably infrequent users. Limited upside."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at each step's drop-off rate — which step has the most severe loss?",
                                "Improving the biggest drop-off usually generates the greatest impact.",
                            ],
                            explanation: "Feature adoption funnel analysis follows the same logic as all funnels: find the biggest drop-off → prioritize improvement. The 60% drop-off from Clicked → Completed is the biggest bottleneck. Improving the first-time experience (e.g., simplifying the flow, adding guided steps) will have the greatest effect.",
                            frameworkTip: "Feature Adoption Funnel: Exposed → Clicked → Completed → Retained → Find the biggest drop-off"
                        ),
                    ]
                ),
                Quest(
                    id: "2-3",
                    name: "Business & Operations Metrics",
                    description: "Understand operational and business metrics: cycle time, SLA, throughput, etc.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Cycle Time Analysis",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Overall cycle time is 13 hours (target 7 hours). Which step should be improved first?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Order Processing Efficiency",
                                narrative: "You are responsible for operations analytics at a B2B e-commerce platform. Your boss wants you to analyze order processing efficiency.\n\nThe order flow from placement to shipment:\nOrder placed → Payment confirmed → Warehouse picking → Quality check → Packaging → Shipped",
                                data: [
                                    ["step": "Order→Payment confirmed", "avg_time": "0.5 hr", "target": "1 hr", "status": "On target"],
                                    ["step": "Payment→Picking", "avg_time": "4 hr", "target": "2 hr", "status": "Over target"],
                                    ["step": "Picking→Quality check", "avg_time": "1 hr", "target": "1 hr", "status": "On target"],
                                    ["step": "Quality check→Packaging", "avg_time": "6 hr", "target": "1 hr", "status": "Severely over target"],
                                    ["step": "Packaging→Shipped", "avg_time": "1.5 hr", "target": "2 hr", "status": "On target"],
                                ],
                                dataCaption: "Cycle Time per Step (Average)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Payment→Picking (2 hours over target)", explanation: "It's 2 hours over — the second biggest bottleneck, but not the most severe."),
                                Challenge.Option(id: "B", text: "Quality check→Packaging (5 hours over target)", explanation: "Correct! This step is the most severely over target (6hr vs target 1hr), making it the process bottleneck. Improving this step alone could bring total cycle time from 13hr down to 8hr, close to target."),
                                Challenge.Option(id: "C", text: "Improve all steps simultaneously", explanation: "With limited resources, attack the biggest bottleneck first. Quality check→Packaging accounts for 83% of excess time (5/6 hours)."),
                                Challenge.Option(id: "D", text: "Packaging→Shipped, because it's the last step with the most customer impact", explanation: "This step is actually on target (1.5hr vs 2hr target) — no improvement needed."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Which step has the largest gap between actual time and target?",
                            ],
                            explanation: "The core of cycle time analysis: find the bottleneck. Quality check→Packaging is 5 hours over target, suggesting possible queuing for packaging (capacity shortage), high defect rates requiring rework, or process design issues. After finding the bottleneck, the next step is root cause analysis.",
                            frameworkTip: "Process optimization: Map each step → Measure time → Find bottleneck → Analyze root cause → Improve"
                        ),
                        Challenge(
                            id: 2,
                            name: "SLA Achievement Rate",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Looking at the SLA data, what is most concerning?",
                            scenario: 
                            Challenge.Scenario(
                                title: "IT Support SLA Analysis",
                                narrative: "You are a BA in the IT department, responsible for analyzing support ticket SLA achievement rates.\n\nCompany SLA commitments:\n• P1 (system outage): Respond within 1 hour, resolve within 4 hours\n• P2 (functional issues): Respond within 4 hours, resolve within 24 hours\n• P3 (general questions): Respond within 24 hours, resolve within 72 hours",
                                data: [
                                    ["priority": "P1", "tickets": "15", "response_sla": "93%", "resolve_sla": "73%"],
                                    ["priority": "P2", "tickets": "120", "response_sla": "88%", "resolve_sla": "82%"],
                                    ["priority": "P3", "tickets": "450", "response_sla": "95%", "resolve_sla": "91%"],
                                ],
                                dataCaption: "Last Month's SLA Achievement Rate"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "P3 has the most tickets (450)", explanation: "High volume doesn't mean there's a problem. P3's SLA achievement is strong (95% / 91%), meaning it's under control."),
                                Challenge.Option(id: "B", text: "P1 resolution SLA is only 73% — meaning 27% of system outages weren't resolved within 4 hours", explanation: "Correct! P1 is the highest priority for system outages. A 73% resolution rate means roughly 1 in 4 system outages takes more than 4 hours to resolve. The business impact is greatest, and while there are only 15 tickets, each one potentially affects the entire company."),
                                Challenge.Option(id: "C", text: "P2 response SLA is below 90%", explanation: "P2 response rate at 88% does need attention, but P1 resolution at 73% is more critical. The impact of unresolved system outages far exceeds slow response to functional issues."),
                                Challenge.Option(id: "D", text: "Overall performance is fine — nothing to worry about", explanation: "P1 resolution SLA at 73% is a serious problem. Every hour a system outage persists, the entire company is waiting."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Which priority has the most severe consequences? What's that priority's achievement rate?",
                            ],
                            explanation: "SLA analysis must consider priority x achievement rate. P1 has only 15 tickets, but each one is a system outage potentially affecting hundreds of people unable to work. A 73% resolution rate means roughly 4 P1 tickets per month exceed the time limit — likely indicating insufficient on-call engineers, broken escalation processes, or too much technical debt.",
                            frameworkTip: "SLA Analysis: Priority x Volume x Achievement Rate → High Priority with Low Achievement is the biggest risk"
                        ),
                    ]
                ),
                Quest(
                    id: "2-4",
                    name: "How to Define Success Metrics",
                    description: "Learn to define success metrics for a project or feature.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Defining Success Metrics for a New Feature",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which is most suitable as the primary success metric?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Designing Success Metrics for a Dashboard",
                                narrative: "Your company is building an internal sales dashboard so the sales team can track their pipeline and deal progress.\n\nGoal: Let the sales team check the dashboard daily instead of asking the data team to pull reports every week.\n\nThe PM asks you: \"What should the success metric be for this dashboard?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Dashboard DAU (daily active users)", explanation: "DAU is a reasonable metric, but it measures \"someone is using it,\" not \"the problem is solved.\" Users might open it daily but not find useful information."),
                                Challenge.Option(id: "B", text: "Number of ad-hoc report requests to the data team decreases", explanation: "Correct! Go back to the original goal: \"no longer need to ask the data team for reports weekly.\" The most direct success metric is whether ad-hoc request volume decreases. If the dashboard is truly useful, sales can find answers themselves and won't ask the data team."),
                                Challenge.Option(id: "C", text: "Sales team close rate improves", explanation: "Close rate is influenced by too many factors (market, product, pricing, individual skill) — it's hard to attribute to the dashboard. Also a lagging metric that takes a long time to observe."),
                                Challenge.Option(id: "D", text: "User satisfaction survey score", explanation: "Satisfaction is a proxy metric, not a success metric. Users might think the dashboard looks great but isn't practical."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Go back to the original goal: What problem is this dashboard supposed to solve?",
                                "The best success metric directly measures \"whether the problem has been solved.\"",
                            ],
                            explanation: "Principle for defining success metrics: directly measure whether the goal is achieved. The goal is \"reduce ad-hoc report requests,\" so the success metric is \"ad-hoc report request volume.\" Not DAU (proxy), not close rate (too indirect), not satisfaction (subjective).",
                            frameworkTip: "Success Metric = Directly measures goal achievement / Proxy Metric = Indirectly related metric"
                        ),
                        Challenge(
                            id: 2,
                            name: "Conflicting Metrics",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "When facing two conflicting metrics, what's the best approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Speed vs Quality",
                                narrative: "You are a BA at a food delivery platform. The company has two core metrics:\n\n1. Order completion time: target under 30 minutes\n2. Order accuracy rate: target 98% error-free orders\n\nLast month, to hit the \"completion time\" target, many delivery drivers rushed, resulting in:\n• Average delivery time decreased from 35 minutes to 28 minutes (on target ✓)\n• Order error rate rose from 2% to 7% (off target ✗)\n• Customer complaints tripled",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Speed is more important than quality — maintain 28 minutes", explanation: "7% error rate and tripled complaints will damage customer loyalty and the brand. Short-term speed gains aren't worth the long-term quality losses."),
                                Challenge.Option(id: "B", text: "Quality is more important than speed — revert to the original process", explanation: "A complete revert isn't optimal either. Finding a way that doesn't sacrifice speed while maintaining quality would be best."),
                                Challenge.Option(id: "C", text: "Set order accuracy as a guardrail (cannot drop below 98%), then optimize speed within that constraint", explanation: "Correct! This is the proper use of guardrails. The primary metric (speed) can be optimized, but the guardrail (accuracy ≥ 98%) cannot be sacrificed. This prevents \"improving one metric at the expense of another.\""),
                                Challenge.Option(id: "D", text: "Combine both metrics into a single composite score", explanation: "Combining into one score loses actionability. You need to know whether it's a speed issue or quality issue to know what to fix."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Is there a way to focus on both metrics but with a priority hierarchy?",
                            ],
                            explanation: "When two metrics conflict, the correct approach is to distinguish which is primary (the direction to optimize) and which is the guardrail (the floor that cannot deteriorate). This is a very important interview concept. When an interviewer asks \"What would you do if these two metrics conflict?\" — the answer is the guardrail framework.",
                            frameworkTip: "When metrics conflict: Choose one as primary (optimization direction), the other as guardrail (floor that cannot be broken)"
                        ),
                    ]
                ),
                Quest(
                    id: "2-5",
                    name: "Different Roles Look at Different Metrics",
                    description: "Understand which KPIs matter most to PM, Engineering, Finance, and Ops.",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What to Show Each Role on a Dashboard",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which three metrics does the Customer Success Manager need most?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Designing Dashboards for Different Roles",
                                narrative: "You need to design three dashboards for a SaaS company, each for a different role:\n\n• CEO / CFO (manages revenue and strategy)\n• Product Manager (manages product and users)\n• Customer Success Manager (manages renewals and satisfaction)\n\nHere are all available metrics.",
                                data: [
                                    ["metric": "MRR / ARR", "category": "Revenue"],
                                    ["metric": "Feature Adoption Rate", "category": "Product"],
                                    ["metric": "NPS / CSAT", "category": "Satisfaction"],
                                    ["metric": "Customer Health Score", "category": "Customer"],
                                    ["metric": "DAU / WAU / MAU", "category": "Activity"],
                                    ["metric": "Churn Rate", "category": "Churn"],
                                    ["metric": "CAC / LTV", "category": "Unit Economics"],
                                    ["metric": "Onboarding Completion Rate", "category": "Activation"],
                                ],
                                dataCaption: "Available Metrics List"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "MRR, CAC, Churn Rate", explanation: "MRR and CAC are finance/exec metrics. CSMs don't directly control these. CSMs need metrics that help them determine \"which customer might churn.\""),
                                Challenge.Option(id: "B", text: "Customer Health Score, NPS/CSAT, Churn Rate", explanation: "Correct! The CSM's job is \"ensuring customer success and renewal.\" Health Score tells them which customer is at risk, NPS tells them customer sentiment, Churn Rate tells them the overall trend. These three metrics directly correspond to their KPIs."),
                                Challenge.Option(id: "C", text: "DAU, Feature Adoption, Onboarding Completion", explanation: "These are more suited for PMs. CSMs care about \"is the customer getting value,\" not \"are features being used.\""),
                                Challenge.Option(id: "D", text: "NPS, MRR, Feature Adoption", explanation: "NPS is right, but MRR is an exec metric and Feature Adoption is a PM metric. CSMs need more actionable customer health metrics."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think about what a CSM does daily. What information do they need to make decisions?",
                                "A dashboard isn't about showing more metrics — it's about showing the right metrics to the right people.",
                            ],
                            explanation: "Core principle of dashboard design: \"What decisions does this person need to make? What information do they need to make those decisions?\" CEO needs revenue and unit economics, PM needs user behavior and feature adoption, CSM needs customer health and satisfaction. In interviews, when asked \"What dashboard would you design?\" — first ask \"who is it for?\"",
                            frameworkTip: "Dashboard design: Audience (who's viewing) → Decision (what decisions to make) → Metrics (what data is needed)"
                        ),
                    ]
                ),
                Quest(
                    id: "2-6",
                    name: "Boss: Comprehensive Metrics Analysis",
                    description: "Face a complete business scenario: choose the right metrics, make judgments, and propose recommendations.",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Case: Marketplace Health",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Is the CEO's intuition right? GMV is growing but the platform is \"unhealthy\" — what signals in the data support this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketplace Platform Health Diagnosis",
                                narrative: "You are a Product Analyst at a B2B marketplace platform. The platform connects suppliers and buyers.\n\nThe CEO says: \"Our GMV (Gross Merchandise Value) grew 15% last quarter, but I feel the platform isn't healthy. Help me do a complete diagnosis.\"\n\nYou pulled the following data:",
                                data: [
                                    ["metric": "GMV", "Q2": "$8.5M", "Q3": "$9.8M", "change": "+15%"],
                                    ["metric": "Active suppliers", "Q2": "320", "Q3": "280", "change": "-12.5%"],
                                    ["metric": "Active buyers", "Q2": "1,200", "Q3": "1,350", "change": "+12.5%"],
                                    ["metric": "Average order value", "Q2": "$2,800", "Q3": "$4,200", "change": "+50%"],
                                    ["metric": "New supplier signups", "Q2": "45", "Q3": "18", "change": "-60%"],
                                    ["metric": "Supplier NPS", "Q2": "42", "Q3": "28", "change": "-14 pts"],
                                    ["metric": "Order completion rate", "Q2": "94%", "Q3": "88%", "change": "-6pp"],
                                    ["metric": "Take Rate", "Q2": "8%", "Q3": "12%", "change": "+4pp"],
                                ],
                                dataCaption: "Q2 vs Q3 Core Metrics"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GMV grew 15% — the platform is healthy, the CEO is overthinking it", explanation: "GMV is a lagging metric. Look deeper at other metrics to find the problems."),
                                Challenge.Option(id: "B", text: "Supplier count declining, NPS plummeting, new supplier signups collapsing — the supply side is deteriorating", explanation: "Correct! GMV growth is driven by surging AOV (concentrated in a few large orders), but the supply side is deteriorating: suppliers leaving (-12.5%), NPS plummeting (-14pts), new supplier signups collapsing (-60%). The take rate increase from 8% to 12% is likely the cause of supplier dissatisfaction. This is a classic \"short-term revenue looks good but long-term unsustainable\" pattern."),
                                Challenge.Option(id: "C", text: "Buyer count is growing (+12.5%), meaning the demand side is healthy", explanation: "Demand-side growth doesn't mean the platform is healthy. If the supply side continues to deteriorate, eventually there won't be enough suppliers to serve these buyers. A marketplace needs both sides healthy."),
                                Challenge.Option(id: "D", text: "Declining order completion rate is the biggest issue", explanation: "Completion rate decline is indeed a problem, but it's a symptom (possibly from insufficient suppliers to fulfill orders), not the root cause. The root cause is supply-side deterioration."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Marketplace health requires both supply and demand sides. Good GMV doesn't mean both sides are healthy.",
                                "Look at supplier-related metrics (count, NPS, new signups) — what do you see?",
                            ],
                            explanation: "Marketplace analysis must examine both sides' health. Here, GMV growth is an \"illusion\" — growth driven by a few large orders isn't sustainable. Three supply-side metrics (count -12.5%, NPS -14pts, new signups -60%) are all deteriorating, combined with a surging take rate. It's nearly certain: the platform is charging suppliers too much → suppliers are unhappy → they leave and don't recommend new suppliers to join.",
                            frameworkTip: "Marketplace health: Supply Side + Demand Side + Platform metrics (take rate, completion rate) — all must be examined"
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Case: Improvement Recommendations",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which option would you recommend?",
                            scenario: 
                            Challenge.Scenario(
                                title: "How to Restore Marketplace Health",
                                narrative: "You confirmed the problem: take rate increased from 8% to 12%, causing supplier dissatisfaction and attrition.\n\nBut the revenue team's position is: \"Raising the take rate brought in $400K in extra revenue. We can't just lower it back.\"\n\nYou need to propose a recommendation that balances revenue and platform health.",
                                data: [
                                    ["option": "Lower back to 8% take rate", "revenue_impact": "-$400K/Q", "supplier_impact": "Estimated +20% supplier return", "risk": "Short-term revenue decline"],
                                    ["option": "Maintain 12%", "revenue_impact": "+$0", "supplier_impact": "Continued attrition, estimated -15% more", "risk": "Supply-side collapse"],
                                    ["option": "Tiered take rate: 8% for small orders, 12% for large", "revenue_impact": "-$150K/Q", "supplier_impact": "Stabilize small-to-mid suppliers", "risk": "Large suppliers may be dissatisfied"],
                                ],
                                dataCaption: "Three Scenario Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Lower back to 8%: Save the suppliers first, figure out revenue later", explanation: "Giving up $400K outright is too aggressive. Plus, management won't easily accept giving up revenue they've already realized."),
                                Challenge.Option(id: "B", text: "Maintain 12%: Revenue cannot drop", explanation: "Continued supplier attrition of -15% will lead to supply-side collapse, at which point GMV will drop significantly — losses far exceeding $400K."),
                                Challenge.Option(id: "C", text: "Tiered take rate: Balance revenue and supplier retention", explanation: "Correct! Tiered pricing is a classic marketplace strategy: (1) Protect small-to-mid suppliers (they're most price-sensitive — retain them with lower take rate) (2) Large suppliers have more bargaining power but also depend more on the platform — 12% is acceptable (3) Revenue loss of only $150K, far better than supply-side collapse. This is an \"imperfect but most pragmatic\" solution."),
                                Challenge.Option(id: "D", text: "Run an A/B test first, then decide", explanation: "Suppliers are actively leaving. An A/B test takes time. Plus, changing take rates affects supplier trust — not suitable for A/B testing."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Is there a \"have both\" option? It's not all-or-nothing.",
                                "Tiered pricing is a common marketplace strategy.",
                            ],
                            explanation: "Good recommendations aren't binary choices — they find a balance. Tiered take rate addresses: (1) Revenue (only $150K loss vs $400K) (2) Supplier retention (protects the most price-sensitive small-to-mid suppliers) (3) Verifiable (can observe supplier behavior after implementation). In interviews, proposing a \"pragmatic compromise\" is more favored than extreme options.",
                            frameworkTip: "Recommendation: Don't go all-or-nothing → Find a pragmatic middle ground → Explain the trade-offs"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 3: Analytical Thinking
        World(
            id: 3,
            name: "Analytical Thinking",
            emoji: "🔍",
            description: "Funnel, Segmentation, Cohort, and Root Cause Analysis",
            quests: [
                Quest(
                    id: "3-1",
                    name: "Trend Analysis",
                    description: "How to determine if a trend is a real problem or just noise",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Distinguishing Real vs False Trends",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Based on the data, is the VP's concern justified?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Streaming Platform Viewing Alert",
                                narrative: "You are a Product Analyst at a streaming platform. The VP of Content sent an urgent email:\n\n\"Our daily watch time has declined three days in a row, from 45 minutes on Wednesday to 38 minutes on Friday! We need to investigate immediately!\"\n\nYou pulled the daily watch time data for the past four weeks.",
                                data: [
                                    ["day": "Monday", "week1": "36", "week2": "37", "week3": "38", "week4": "37"],
                                    ["day": "Tuesday", "week1": "39", "week2": "40", "week3": "41", "week4": "40"],
                                    ["day": "Wednesday", "week1": "44", "week2": "43", "week3": "45", "week4": "44"],
                                    ["day": "Thursday", "week1": "42", "week2": "41", "week3": "43", "week4": "41"],
                                    ["day": "Friday", "week1": "37", "week2": "38", "week3": "38", "week4": "37"],
                                    ["day": "Saturday", "week1": "52", "week2": "53", "week3": "54", "week4": "53"],
                                    ["day": "Sunday", "week1": "55", "week2": "54", "week3": "56", "week4": "55"],
                                ],
                                dataCaption: "Daily Average Watch Time (minutes), Past 4 Weeks"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Justified — three consecutive days of decline is a clear warning sign requiring immediate investigation", explanation: "A three-day decline doesn't necessarily indicate a problem. You need to look at longer-term patterns to judge."),
                                Challenge.Option(id: "B", text: "Not justified — this is a normal weekday seasonality pattern; Wednesday to Friday naturally declines", explanation: "Correct! Looking at four weeks of data, every week shows the same pattern: Wednesday peaks, Friday dips, then weekends rebound to 52-56 minutes. The VP is seeing normal weekly seasonality, not a real decline."),
                                Challenge.Option(id: "C", text: "Uncertain — need to observe for another month before judging", explanation: "Four weeks of data is actually sufficient to identify the weekly pattern. No need to wait another month."),
                                Challenge.Option(id: "D", text: "Not justified — because all numbers are in the 35-55 range with little variation", explanation: "The absolute range isn't the point. The key is whether the variation follows a predictable seasonal pattern."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Compare the same day of the week across all four weeks — is there a consistent pattern?",
                                "Is the Wednesday-to-Friday trend consistent every week?",
                            ],
                            explanation: "The first step in evaluating a trend is ruling out seasonality. Many metrics have natural cyclical fluctuations: weekly, monthly, and quarterly patterns. When you see a short-term decline, first compare against the same historical period to confirm whether it's normal variation or a genuine anomaly.",
                            frameworkTip: "Three steps for trend assessment: (1) Is there seasonality? (2) How does it compare to the same historical period? (3) After removing cycles, what's the trend direction?"
                        ),
                        Challenge(
                            id: 2,
                            name: "Baselines and Anomaly Detection",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Based on the data, did the \"one-tap split payment\" feature bring a significant transaction volume increase?",
                            scenario: 
                            Challenge.Scenario(
                                title: "FinTech Transaction Volume Analysis",
                                narrative: "You are a Data Analyst at a FinTech company. The Product Manager asks:\n\n\"Last Tuesday's transaction volume was suddenly 40% higher than the previous day — is this the effect of our new feature?\"\n\nThe new feature is \"one-tap split payment,\" launched last Monday afternoon. You pulled more complete data.",
                                data: [
                                    ["date": "3/3 (Mon)", "transactions": "12,400", "note": "New feature launched (afternoon)"],
                                    ["date": "3/4 (Tue)", "transactions": "17,200", "note": "+39% vs previous day"],
                                    ["date": "3/5 (Wed)", "transactions": "16,800", "note": ""],
                                    ["date": "3/6 (Thu)", "transactions": "17,100", "note": ""],
                                    ["date": "3/7 (Fri)", "transactions": "18,500", "note": "Payday"],
                                    ["date": "Historical Mon avg", "transactions": "12,200", "note": ""],
                                    ["date": "Historical Tue avg", "transactions": "16,900", "note": ""],
                                    ["date": "Historical Wed avg", "transactions": "16,500", "note": ""],
                                    ["date": "Historical Thu avg", "transactions": "16,800", "note": ""],
                                    ["date": "Historical Fri avg", "transactions": "17,800", "note": ""],
                                ],
                                dataCaption: "Daily Transaction Count vs Historical Average"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Yes — Tuesday had 40% more than Monday, clearly effective", explanation: "Tuesday naturally has higher transaction volume than Monday. You need to compare against the historical same-day average, not the previous day."),
                                Challenge.Option(id: "B", text: "Possibly a minimal effect, but the growth mainly comes from the normal weekday pattern", explanation: "Correct! Tuesday's 17,200 is only 1.8% more than the historical Tuesday average of 16,900 — within normal fluctuation. The PM's +40% is actually the natural Monday-to-Tuesday difference (Monday is naturally the lowest day). To assess the new feature's effect, you need more rigorous methods, such as comparing against the historical baseline."),
                                Challenge.Option(id: "C", text: "Cannot determine — there's no A/B test data", explanation: "A/B testing is indeed a better method, but from existing data you can already make a preliminary judgment — comparing against the historical baseline yields a conclusion."),
                                Challenge.Option(id: "D", text: "Friday has the highest volume, so wait until Friday to judge", explanation: "Friday volume is high due to the payday effect. The correct way to assess the new feature is comparing the same day against its historical baseline, not waiting for the highest-volume day."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Don't just compare \"vs the previous day\" — compare \"vs the historical same day.\"",
                                "Calculate: last Tuesday vs historical Tuesday average — what's the percentage difference?",
                            ],
                            explanation: "When analyzing trends, choosing the right baseline is crucial. Comparing against the previous day vs comparing against the historical same day can yield completely different conclusions. The correct approach: (1) Establish a baseline (historical same-period average), (2) Calculate the variance between actual and baseline, (3) Determine whether the variance is significant (outside normal fluctuation range).",
                            frameworkTip: "Baseline for evaluating effects: (1) Historical same-period average (2) Normal fluctuation range (3) Rule out confounders (e.g., payday, holidays)"
                        ),
                        Challenge(
                            id: 3,
                            name: "Long-term Trends vs Short-term Fluctuations",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "As the BA, how would you explain this situation to the CEO?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Subscription Product Growth Anxiety",
                                narrative: "You are a Business Analyst at a B2B SaaS company. The CEO says at an all-hands:\n\n\"Our MRR (Monthly Recurring Revenue) only grew 2% this month. Last month was 5%, and the month before was 8%. Growth is decelerating, and I'm worried.\"\n\nYou checked the full data.",
                                data: [
                                    ["month": "Jun", "mrr": "$820K", "growth": "9%", "new_customers": "45", "churned": "8"],
                                    ["month": "Jul", "mrr": "$885K", "growth": "8%", "new_customers": "48", "churned": "10"],
                                    ["month": "Aug", "mrr": "$938K", "growth": "6%", "new_customers": "42", "churned": "12"],
                                    ["month": "Sep", "mrr": "$985K", "growth": "5%", "new_customers": "40", "churned": "14"],
                                    ["month": "Oct", "mrr": "$1.01M", "growth": "3%", "new_customers": "38", "churned": "16"],
                                    ["month": "Nov", "mrr": "$1.03M", "growth": "2%", "new_customers": "36", "churned": "18"],
                                ],
                                dataCaption: "MRR Trend (Past 6 Months)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Growth rate decline is normal because the base is larger — don't worry", explanation: "A larger base does naturally slow growth rate, but that's not the only factor. You're ignoring the continuously rising churn."),
                                Challenge.Option(id: "B", text: "The problem isn't new customer acquisition — it's the continuously rising churn rate. You need to look at both additions and losses together", explanation: "Correct! New customers declined from 45 to 36 (-20%), but churn grew from 8 to 18 (+125%). The primary driver of declining growth rate is accelerating churn, not just base effects. Net growth = new - churn, and both are worsening, but churn is worsening faster."),
                                Challenge.Option(id: "C", text: "MRR is still growing (positive) — no problem", explanation: "Although MRR is still growing, if the growth rate continues declining, it will soon turn negative. More importantly, the churn trend is deteriorating."),
                                Challenge.Option(id: "D", text: "Need competitor data to judge — maybe the whole market is slowing", explanation: "Market factors should certainly be examined, but the internal data already shows a clear churn deterioration trend — something you can act on first."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Beyond growth rate, look at the \"composition\" of growth: how many were added vs how many were lost.",
                                "Net growth = New - Churn. What are the trends for each?",
                            ],
                            explanation: "When looking at growth metrics, always decompose into \"additions\" and \"losses.\" The overall growth rate is a lagging indicator that masks underlying problems. In this case, churn growing from 8 to 18 is the biggest red flag — indicating the product may have a retention problem requiring immediate investigation.",
                            frameworkTip: "Growth decomposition: Growth = New + Expansion - Contraction - Churn. Decompose before looking at the total."
                        ),
                    ]
                ),
                Quest(
                    id: "3-2",
                    name: "Funnel Analysis",
                    description: "Break the user journey into a funnel and find the biggest drop-off",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Finding the Biggest Drop-off",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "If you could improve only one step to increase overall conversion, which should you prioritize?",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Checkout Flow Optimization",
                                narrative: "You are a Product Analyst at an e-commerce platform. The PM wants to improve checkout conversion rate and asks you to analyze the checkout funnel.\n\nShe gave you last month's data.",
                                data: [
                                    ["step": "1. Add to cart", "users": "285,000", "rate": "100%", "step_conversion": "—"],
                                    ["step": "2. View cart", "users": "198,000", "rate": "69.5%", "step_conversion": "69.5%"],
                                    ["step": "3. Click checkout", "users": "142,000", "rate": "49.8%", "step_conversion": "71.7%"],
                                    ["step": "4. Enter address", "users": "128,000", "rate": "44.9%", "step_conversion": "90.1%"],
                                    ["step": "5. Select payment method", "users": "118,000", "rate": "41.4%", "step_conversion": "92.2%"],
                                    ["step": "6. Confirm order", "users": "72,000", "rate": "25.3%", "step_conversion": "61.0%"],
                                    ["step": "7. Payment successful", "users": "68,000", "rate": "23.9%", "step_conversion": "94.4%"],
                                ],
                                dataCaption: "Checkout Funnel (Last Month)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Step 1→2: Add to cart to view cart (69.5%)", explanation: "While the absolute drop-off is large, this isn't the lowest conversion rate step. Also, \"added to cart but didn't view\" could be normal browsing behavior."),
                                Challenge.Option(id: "B", text: "Step 5→6: Select payment to confirm order (61.0%)", explanation: "Correct! This step's conversion is only 61% — the biggest drop-off in the latter half of the funnel. Users who've reached payment selection have strong purchase intent, yet 39% are lost at the final step — highest ROI for improvement. Possible causes: unexpected shipping costs or taxes, or an overly complex checkout page."),
                                Challenge.Option(id: "C", text: "Step 2→3: View cart to click checkout (71.7%)", explanation: "There's a notable drop-off here, but many people \"view cart\" just to compare prices or save items — it doesn't necessarily mean intent to buy. By contrast, users already at the payment stage are high-intent."),
                                Challenge.Option(id: "D", text: "Step 6→7: Confirm order to payment successful (94.4%)", explanation: "This step already has a very high conversion (94.4%) — limited room for improvement. The 5.6% failure might be payment failures or other technical issues."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at each step's conversion rate — which is the lowest?",
                                "Consider funnel position: the further along, the stronger the user intent, and the higher the ROI of improvement.",
                            ],
                            explanation: "Funnel analysis prioritization must consider: (1) Which step has the biggest drop-off, (2) User intent strength (stronger further down the funnel), (3) Feasibility of improvement. The 61% conversion at step 5→6 is the clearest bottleneck, and these users have already entered their address and selected a payment method — losing them has the highest cost.",
                            frameworkTip: "Funnel priority: Find biggest drop-off → Consider user intent → Estimate improvement potential → Fix highest ROI first"
                        ),
                        Challenge(
                            id: 2,
                            name: "Funnel Segmentation and Comparison",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What's the most important insight from the data?",
                            scenario: 
                            Challenge.Scenario(
                                title: "App vs Web Checkout Differences",
                                narrative: "You analyzed further by splitting the checkout funnel by platform.",
                                data: [
                                    ["step": "Add to cart→View", "app": "75.2%", "web": "62.1%"],
                                    ["step": "View→Click checkout", "app": "74.8%", "web": "67.3%"],
                                    ["step": "Click checkout→Enter address", "app": "92.5%", "web": "86.3%"],
                                    ["step": "Enter address→Select payment", "app": "94.1%", "web": "89.7%"],
                                    ["step": "Select payment→Confirm order", "app": "78.3%", "web": "45.2%"],
                                    ["step": "Confirm→Payment successful", "app": "96.1%", "web": "92.0%"],
                                ],
                                dataCaption: "Step Conversion Rate by Platform"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "App outperforms Web at every step — invest all resources in the App", explanation: "While App does perform better at every step, \"invest everything in App\" is too extreme. Web users might be a different segment (e.g., enterprise buyers) and shouldn't be abandoned."),
                                Challenge.Option(id: "B", text: "Web's \"Select payment→Confirm order\" is only 45.2% — the biggest problem. Need to investigate what's wrong with the Web confirmation page", explanation: "Correct! Web's conversion at this step is only 45.2%, a full 33 percentage points lower than App's 78.3%. This huge gap indicates a serious problem with the Web order confirmation page (possibly layout design, how additional fees are displayed, or loading speed). This is the step with the most room for improvement."),
                                Challenge.Option(id: "C", text: "The difference between platforms is within normal range — no special treatment needed", explanation: "45.2% vs 78.3% is a 33 percentage point gap — that's not normal range."),
                                Challenge.Option(id: "D", text: "Add an App download popup on the Web version to redirect users to buy on App", explanation: "Interrupting the checkout flow with a popup will only worsen conversion. Fix the Web issues first."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Compare the gap between App and Web at the same step — where is the gap largest?",
                                "Large gaps indicate platform-specific issues that can be fixed.",
                            ],
                            explanation: "Splitting a funnel by dimension (platform, region, user type) lets you find platform-specific problems. Here, Web's order confirmation step at only 45.2% — 33pp lower than App — indicates a structural issue with the Web confirmation page. Next step: examine the Web confirmation page's UX, load time, and fee presentation.",
                            frameworkTip: "Funnel segmentation: Overall → Split by dimension (platform/region/user type) → Find the largest gap → Investigate"
                        ),
                    ]
                ),
                Quest(
                    id: "3-3",
                    name: "Segmentation",
                    description: "Segment users to find the true source of the problem",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying the Problem Segment",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Based on the data, what would you advise the Customer Success lead?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Product NPS Decline",
                                narrative: "You are an Analyst at a B2B SaaS company. The Customer Success lead says:\n\n\"Our overall NPS dropped from 42 last quarter to 35 this quarter. The boss is unhappy.\"\n\nYou split the NPS by user segment.",
                                data: [
                                    ["segment": "Enterprise (>500 people)", "last_q": "52", "this_q": "50", "change": "-2", "pct_users": "15%"],
                                    ["segment": "Mid-Market (50-500 people)", "last_q": "45", "this_q": "44", "change": "-1", "pct_users": "25%"],
                                    ["segment": "SMB (<50 people)", "last_q": "38", "this_q": "22", "change": "-16", "pct_users": "40%"],
                                    ["segment": "Free Tier", "last_q": "35", "this_q": "33", "change": "-2", "pct_users": "20%"],
                                ],
                                dataCaption: "NPS by Customer Segment"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "NPS is declining across all segments — needs a comprehensive improvement", explanation: "While every segment declined, the magnitude differs drastically. SMB dropped 16 points, while others only dropped 1-2. Resources should be concentrated on SMB."),
                                Challenge.Option(id: "B", text: "The overall NPS decline is mainly driven by the SMB segment (-16 points), which also represents 40% of users. Priority: investigate what problems SMB users have been facing recently", explanation: "Correct! SMB's NPS plummeted from 38 to 22 (-16), and they represent the largest user proportion (40%). Other segments barely changed. So the overall NPS decline is almost entirely caused by SMB. You need to understand what changed in the SMB user experience."),
                                Challenge.Option(id: "C", text: "Enterprise NPS is highest — focus should be on Enterprise customers", explanation: "Enterprise NPS is stable at 50-52 and doesn't need urgent attention. The most pressing issue is SMB's sharp decline."),
                                Challenge.Option(id: "D", text: "Free Tier has the lowest NPS — should improve the free user experience", explanation: "Free Tier's NPS decline is minimal (-2), and these users don't pay. SMB are paying customers with a much larger decline."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at the magnitude of NPS change for each segment — which has the biggest difference?",
                                "Also consider the segment's user share — larger segments have more impact on the overall number.",
                            ],
                            explanation: "The value of segmentation is revealing problems masked by overall averages. The overall NPS decline of -7 looks like a universal problem, but segmentation reveals that 90% of the decline comes from SMB. This is the concept of Simpson's Paradox — overall trends can differ from segment trends. Always segment your data.",
                            frameworkTip: "When you see an overall metric change, always segment first: user type / plan / region / platform / new vs existing users"
                        ),
                        Challenge(
                            id: 2,
                            name: "Multi-dimensional Segmentation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Where is the problem most likely?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Further Analyzing SMB NPS Decline",
                                narrative: "After confirming the problem is in the SMB segment, you continue drilling down. You split SMB users by signup date and plan.",
                                data: [
                                    ["segment": "SMB - Basic Plan - Existing (>6 months)", "last_q": "40", "this_q": "38", "change": "-2"],
                                    ["segment": "SMB - Basic Plan - New (<6 months)", "last_q": "36", "this_q": "34", "change": "-2"],
                                    ["segment": "SMB - Pro Plan - Existing (>6 months)", "last_q": "42", "this_q": "18", "change": "-24"],
                                    ["segment": "SMB - Pro Plan - New (<6 months)", "last_q": "35", "this_q": "14", "change": "-21"],
                                ],
                                dataCaption: "SMB NPS by Plan & Tenure"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SMB new user onboarding experience is poor", explanation: "Both new and existing users on the Pro Plan dropped dramatically, so it's not a new-user-specific problem."),
                                Challenge.Option(id: "B", text: "SMB Pro Plan user experience has severely deteriorated — both new and existing users are affected. Most likely a recent Pro Plan redesign or price increase", explanation: "Correct! Pro Plan NPS plummeted for both new and existing users (-24 and -21), while Basic Plan barely changed. This means the problem is with the Pro Plan itself, not user tenure. Common causes: plan feature changes, price increases, or new feature bugs."),
                                Challenge.Option(id: "C", text: "All SMB users are dissatisfied — it's a brand image issue", explanation: "Basic Plan NPS barely changed (-2), so it's not a company-wide brand issue."),
                                Challenge.Option(id: "D", text: "Existing users dropped more (-24 vs -21) — it's a loyalty issue", explanation: "The difference between -24 and -21 is too small to draw that conclusion. Both dropping dramatically is the real point."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Compare the change in Basic Plan vs Pro Plan — where's the difference?",
                                "If both new and existing users are affected, what's the most likely cause?",
                            ],
                            explanation: "Multi-dimensional segmentation lets you continuously drill down to find the problem's root. From overall → SMB → Pro Plan, each layer of segmentation narrows the scope. Ultimately locating \"SMB Pro Plan\" as the specific segment, the next step is to check what recent changes were made to the Pro Plan.",
                            frameworkTip: "Multi-dimensional segmentation: Cut one dimension at a time → Find the largest difference → Cut a second dimension → Until you find the root cause"
                        ),
                        Challenge(
                            id: 3,
                            name: "Avoiding Segmentation Pitfalls",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What's wrong with the marketing manager's conclusion?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketing Campaign Performance Analysis",
                                narrative: "You do Marketing Analytics at an e-commerce company. The marketing manager proudly tells you:\n\n\"Our email campaign last week was a huge success! Users who received the email spent an average of $85, while those who didn't only spent $52.\"\n\nYou checked the campaign's sending logic and found that the email was sent to users who had \"purchase history in the past 30 days.\"",
                                data: [
                                    ["group": "Received Email", "avg_spend": "$85", "pct_repeat_buyers": "78%", "avg_order_count": "3.2"],
                                    ["group": "Did Not Receive Email", "avg_spend": "$52", "pct_repeat_buyers": "23%", "avg_order_count": "1.1"],
                                ],
                                dataCaption: "Last Week's Spending Data"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "No problem — data clearly shows the email campaign was effective", explanation: "The email was sent only to active users! These people would naturally spend more regardless."),
                                Challenge.Option(id: "B", text: "Sample size might not be large enough", explanation: "This isn't a sample size issue — it's a more fundamental logical problem."),
                                Challenge.Option(id: "C", text: "Selection bias: the email was only sent to active users who already spend more. The spending difference can't be attributed to the email campaign", explanation: "Correct! The email was only sent to users with \"purchase history in the past 30 days\" — these are already active buyers (repeat buyer rate 78% vs 23%). Even without the email, their spending would be higher. This is classic selection bias — your \"treatment group\" and \"control group\" were already different before the treatment."),
                                Challenge.Option(id: "D", text: "Should look at conversion rate instead of average spend", explanation: "Regardless of which metric you look at, as long as the two groups are fundamentally different, the comparison isn't fair."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Think: Who was the email sent to? Were these people already different from others before receiving the email?",
                                "If the email hadn't been sent, would spending between the two groups be the same?",
                            ],
                            explanation: "Selection bias is one of the most common analytical traps. When your \"grouping criteria\" itself is correlated with \"the outcome you want to measure,\" any comparison is unfair. Correct approaches: (1) Random grouping (A/B test), (2) Matched cohort controlling for variables, or (3) Compare the same group's behavior change before and after the campaign.",
                            frameworkTip: "Segmentation analysis checklist: (1) Were the two groups already different before grouping? (2) Is the grouping criterion itself correlated with the outcome? (3) Can you use random grouping?"
                        ),
                    ]
                ),
                Quest(
                    id: "3-4",
                    name: "Cohort Analysis",
                    description: "Use cohorts to track behavioral differences among users from different time periods",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Reading Retention Curves",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What conclusion can you draw from the cohort data?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Mobile Game Retention Analysis",
                                narrative: "You are a Product Analyst at a mobile gaming company. The Growth PM asks:\n\n\"How has the quality of our recent new users been? Is retention getting better or worse?\"\n\nYou pulled cohort retention data for three months.",
                                data: [
                                    ["cohort": "January cohort", "d1": "45%", "d7": "22%", "d14": "15%", "d30": "10%"],
                                    ["cohort": "February cohort", "d1": "42%", "d7": "18%", "d14": "10%", "d30": "6%"],
                                    ["cohort": "March cohort", "d1": "38%", "d7": "14%", "d14": "7%", "d30": "—"],
                                ],
                                dataCaption: "Retention Rate by Cohort"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All cohorts have similar retention — normal decay", explanation: "Look carefully: D7 went from 22% → 18% → 14%, D14 from 15% → 10% → 7%. Each month is worsening — this isn't \"similar.\""),
                                Challenge.Option(id: "B", text: "Each subsequent cohort has worsening retention — later users retain worse. This could be declining user quality or product experience regression", explanation: "Correct! Every metric shows a declining trend across the three cohorts. D1: 45→42→38, D7: 22→18→14, D14: 15→10→7. This means new user quality is deteriorating, or the product's value to new users is decreasing. Need to investigate: Has the acquisition channel changed? Or has the product changed?"),
                                Challenge.Option(id: "C", text: "March cohort's D30 hasn't arrived yet, so comparison isn't possible", explanation: "D30 hasn't arrived, but D1, D7, and D14 already clearly show the trend. You don't need to wait for all data before drawing conclusions."),
                                Challenge.Option(id: "D", text: "January cohort's D30 is only 10% — retention is too low, the product has fundamental issues", explanation: "D30 of 10% for a mobile game actually isn't bad. The point of this question is cross-cohort comparison, not absolute values."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "At the same time point (e.g., D7), compare different cohorts' performance.",
                                "Is the trend going up or down?",
                            ],
                            explanation: "The core value of cohort analysis is comparing the behavior of users from different periods. Looking at overall retention might be masked by mixing effects, but cohorts let you see each batch of new users' true performance. When the retention curve worsens month over month, it usually means user quality is declining (acquisition channel changed) or the first-time product experience has deteriorated.",
                            frameworkTip: "Cohort analysis in 3 steps: (1) Compare the same metric across cohorts (2) Identify trend direction (3) Find the inflection point"
                        ),
                        Challenge(
                            id: 2,
                            name: "Cohort Comparison and Hypotheses",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What story does the data tell?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Finding the Cause of Retention Deterioration",
                                narrative: "You analyzed further by splitting cohorts by acquisition channel.",
                                data: [
                                    ["cohort": "Jan - Organic", "d1": "48%", "d7": "25%", "d14": "18%", "users": "30K"],
                                    ["cohort": "Jan - Paid Ads", "d1": "40%", "d7": "17%", "d14": "10%", "users": "20K"],
                                    ["cohort": "Feb - Organic", "d1": "47%", "d7": "24%", "d14": "17%", "users": "25K"],
                                    ["cohort": "Feb - Paid Ads", "d1": "35%", "d7": "11%", "d14": "5%", "users": "35K"],
                                    ["cohort": "Mar - Organic", "d1": "46%", "d7": "23%", "d14": "16%", "users": "22K"],
                                    ["cohort": "Mar - Paid Ads", "d1": "30%", "d7": "8%", "d14": "3%", "users": "40K"],
                                ],
                                dataCaption: "Retention by Cohort & Channel"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Both Organic and Paid are deteriorating — the problem is with the product itself", explanation: "Organic user retention is actually very stable (D7: 25→24→23). The deterioration is mainly in Paid Ads."),
                                Challenge.Option(id: "B", text: "Organic retention is stable, but Paid Ads retention is sharply worsening. Meanwhile, Paid Ads user volume is increasing (20K→35K→40K), diluting overall retention", explanation: "Correct! Organic retention barely changed, but Paid Ads D7 dropped from 17% to 8%, D14 from 10% to 3%. And Paid Ads' share of users grew from 40% to 65%. This suggests the marketing team likely broadened ad audience targeting to hit volume targets, bringing in more low-quality users."),
                                Challenge.Option(id: "C", text: "Paid Ads users have always been worse — this is normal", explanation: "Paid being worse than Organic is normal, but Paid Ads retention rapidly deteriorating within three months (D14: 10%→5%→3%) is not normal."),
                                Challenge.Option(id: "D", text: "Should completely stop Paid Ads and only do Organic", explanation: "No need to stop completely. The right approach is to optimize Paid Ads targeting and creatives to improve user quality. Stopping entirely would hurt growth."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at Organic and Paid retention trends separately. Are both deteriorating, or only one?",
                                "Note the users column — Paid Ads volume is increasing. What's the relationship to overall retention?",
                            ],
                            explanation: "This is a classic Simpson's Paradox case. Overall retention is declining, but not because the product is worse — rather, the user composition changed. The proportion of low-retention Paid users increased, dragging down the overall average. The solution isn't to stop advertising, but to improve ad audience targeting or strengthen onboarding for Paid users.",
                            frameworkTip: "Cohort + Segmentation: When overall performance worsens, split by channel/segment → Determine if \"every segment is worsening\" or \"composition shifted\""
                        ),
                    ]
                ),
                Quest(
                    id: "3-5",
                    name: "Root Cause Thinking",
                    description: "Structured methods to dig from symptoms to root causes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Structured Root Cause Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which analytical framework is best suited for breaking down the root cause of a GMV decline?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketplace GMV Decline",
                                narrative: "You are a Business Analyst at a two-sided marketplace. The CFO states at a quarterly meeting:\n\n\"Our GMV (Gross Merchandise Value) dropped 15% this month. What happened?\"\n\nYou need to build a structured analytical framework to investigate the root cause.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Directly check if the top 10 sellers' revenue changed", explanation: "This might find part of the answer, but it's not structured enough. You might miss many other causes."),
                                Challenge.Option(id: "B", text: "Decompose using the formula: GMV = Buyers x Orders per Buyer x AOV, and see which factor declined the most", explanation: "Correct! Breaking a metric into a multiplicative formula helps you quickly locate which factor is the problem. If Buyers stayed the same but AOV dropped, the direction is completely different. After finding the main factor, you can continue doing 5 Whys analysis on that factor."),
                                Challenge.Option(id: "C", text: "Run a user survey asking why they're buying less", explanation: "User surveys take time, and users' stated reasons aren't always the real reasons. You should use data to narrow down the scope first."),
                                Challenge.Option(id: "D", text: "Check if competitors recently ran promotions", explanation: "External factors should certainly be considered, but this isn't an \"analytical framework\" — it's just one hypothesis. Use structured methods to confirm where the problem is first, then verify hypotheses."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Break a metric into its \"formula\" — each factor becomes an investigable direction.",
                                "GMV = ? x ? x ?",
                            ],
                            explanation: "The first step in structured root cause analysis is \"formula decomposition.\" Any business metric can be broken into a multiplicative or additive formula. GMV = Buyers x Orders/Buyer x AOV. Then see which factor changed the most, and continue decomposing that factor until you find the root cause.",
                            frameworkTip: "Root cause analysis step 1: Metric formula decomposition. Revenue = Users x Conversion x ARPU. After finding the main factor, do 5 Whys."
                        ),
                        Challenge(
                            id: 2,
                            name: "5 Whys in Practice",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Based on the information you have so far, what's the most likely answer to Why 3? Which direction would you investigate first?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Continuing to Investigate GMV Decline",
                                narrative: "After formula decomposition, you found:\n\n• Buyer count barely changed (-2%)\n• Orders per Buyer about the same (-1%)\n• AOV (Average Order Value) dropped from $78 to $65 (-17%)\n\nSo the GMV decline is mainly driven by AOV. You continue with 5 Whys.\n\nWhy 1: Why did AOV decline?\n→ Because the sales share of high-price items ($100+) dropped from 35% to 20%.\n\nWhy 2: Why did high-price items' sales share decline?\n→ Because exposure for high-price items dropped 40%.\n\nWhy 3: Why did high-price item exposure decline?",
                                data: [
                                    ["category": "High-price items ($100+)", "before": "35% of GMV", "after": "20% of GMV", "exposure_change": "-40%"],
                                    ["category": "Mid-price items ($30-99)", "before": "45% of GMV", "after": "50% of GMV", "exposure_change": "+10%"],
                                    ["category": "Low-price items (<$30)", "before": "20% of GMV", "after": "30% of GMV", "exposure_change": "+25%"],
                                ],
                                dataCaption: "Price Tier Analysis"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Consumer preferences changed — they prefer cheaper items", explanation: "This hypothesis is too vague, and \"consumer preference change\" is hard to directly verify. Look at controllable internal factors first."),
                                Challenge.Option(id: "B", text: "High-price item sellers may have churned, reducing supply", explanation: "Reasonable hypothesis, but decreased exposure doesn't necessarily mean decreased supply. If item count hasn't changed but exposure dropped, it's more likely a recommendation system or ranking issue."),
                                Challenge.Option(id: "C", text: "The recommendation algorithm or search ranking was recently adjusted, reducing weight on high-price items", explanation: "Correct! Exposure dropped 40% but the items themselves didn't decrease — the most likely cause is a change in the platform's recommendation/ranking algorithm. This is immediately verifiable: ask the Search/Recommendation team if they recently adjusted the algorithm. If they did, this could be the root cause."),
                                Challenge.Option(id: "D", text: "Seasonal factors — certain seasons naturally sell cheaper items", explanation: "Possible, but you should first rule out internal controllable factors (like algorithm adjustments) before looking at external factors."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "\"Exposure\" is platform-controlled — what factors affect how often an item is displayed?",
                                "If item count didn't decrease but exposure did, the problem is in the \"display mechanism,\" not \"supply.\"",
                            ],
                            explanation: "The essence of 5 Whys: Each layer of \"Why\" should be based on data and logic, not gut feeling. The clue here is \"decreased exposure\" — exposure is platform-controlled, and the most likely cause is a change in the recommendation/ranking mechanism. Root cause analysis should prioritize internal controllable factors before looking at external factors.",
                            frameworkTip: "5 Whys practical tips: (1) Each Why must be data-supported (2) Prioritize internal controllable factors (3) Pursue until you reach an actionable level"
                        ),
                        Challenge(
                            id: 3,
                            name: "Hypothesis Tree Exercise",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How would you quickly validate or eliminate the most hypotheses?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Food Delivery Platform Complaint Surge",
                                narrative: "You work at a food delivery platform. The customer service manager tells you:\n\n\"This week's complaint volume is 60% higher than last week.\"\n\nYou need to build a hypothesis tree to systematically investigate the cause. Here's your initial hypothesis tree:\n\nComplaints up 60%\n├── Supply side (restaurants/drivers)\n│   ├── Restaurants preparing food more slowly\n│   ├── Not enough drivers, delivery delays\n│   └── Food quality issues increasing\n├── Demand side (orders/users)\n│   ├── Order volume surged beyond capacity\n│   ├── Higher proportion of new users (unfamiliar with platform)\n│   └── Promotions attracted price-sensitive customers\n└── Platform side (system/process)\n    ├── App bug (order errors, payment issues)\n    ├── Delivery routing algorithm anomaly\n    └── Complaint classification changed (previously uncounted items now counted)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Validate hypotheses one by one, top to bottom", explanation: "This is too slow. A good analyst finds data that can eliminate multiple hypotheses simultaneously."),
                                Challenge.Option(id: "B", text: "First look at complaint category distribution (delivery delays / food issues / system errors, etc.) to quickly determine which major category the problem falls in", explanation: "Correct! Complaint category distribution is the most efficient first step. If 80% of new complaints are \"delivery delays,\" you can immediately rule out food quality and system issues, and focus on the supply side and delivery efficiency. One data point can dramatically narrow the investigation scope."),
                                Challenge.Option(id: "C", text: "First confirm whether the complaint increase is due to a definition change (the last hypothesis)", explanation: "Ruling out definition changes is important, but shouldn't be the first step. Looking at complaint category distribution gives you more information simultaneously."),
                                Challenge.Option(id: "D", text: "First check if order volume increased, since more orders naturally means more complaints", explanation: "Reasonable direction, but it can only validate one hypothesis. Looking at complaint category distribution simultaneously tells you much more."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think: What data can tell you the most information at once?",
                                "If you know the types of new complaints, how many hypotheses can you eliminate?",
                            ],
                            explanation: "Efficient root cause analysis uses \"the fewest steps to eliminate the most hypotheses.\" Complaint category distribution acts as a filter — it tells you in one pass whether the problem is on the supply side, demand side, or platform side. This is called issue tree prioritization: first perform the analysis that can narrow down the most directions.",
                            frameworkTip: "Hypothesis tree method: (1) List all possible causes (2) Find data that eliminates the most branches (3) Progressively converge to root cause"
                        ),
                    ]
                ),
                Quest(
                    id: "3-6",
                    name: "Boss: Complete Data Investigation",
                    description: "End-to-end data analysis case study",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Challenge: Metric Decline Investigation (Part 1)",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is your first finding from this data?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Music Streaming Platform: The MAU Decline Mystery",
                                narrative: "You are a Senior Analyst at a music streaming platform. The CEO announces at the monthly meeting:\n\n\"Our MAU (Monthly Active Users) dropped from 8.5M last month to 7.8M (-8.2%). This is the first time our MAU has declined since we went public. I need to know what happened.\"\n\nYou pulled the following data to begin the investigation.",
                                data: [
                                    ["metric": "MAU", "last_month": "8.5M", "this_month": "7.8M", "change": "-8.2%"],
                                    ["metric": "DAU", "last_month": "3.2M", "this_month": "3.0M", "change": "-6.3%"],
                                    ["metric": "New Signups", "last_month": "620K", "this_month": "580K", "change": "-6.5%"],
                                    ["metric": "Reactivated Users", "last_month": "180K", "this_month": "170K", "change": "-5.6%"],
                                    ["metric": "Churned Users", "last_month": "350K", "this_month": "890K", "change": "+154%"],
                                    ["metric": "Avg Sessions/User", "last_month": "12.5", "this_month": "12.8", "change": "+2.4%"],
                                    ["metric": "Avg Listen Time/Session", "last_month": "28min", "this_month": "29min", "change": "+3.6%"],
                                ],
                                dataCaption: "Core Metrics Monthly Comparison"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All metrics are declining — this is a systemic issue", explanation: "Sessions/User and Listen Time are both increasing, so it's not systemic. Carefully distinguish what's going up vs down."),
                                Challenge.Option(id: "B", text: "The MAU decline is mainly driven by a churn surge (+154%), not an acquisition problem. Users who stayed are actually more active (sessions and listen time both increased)", explanation: "Correct! New signups and reactivation only declined slightly (-5~7%), but churn surged 154% (350K→890K). Meanwhile, active users' engagement metrics are rising. This means the problem isn't in product experience or acquisition, but rather a specific batch of users churning en masse."),
                                Challenge.Option(id: "C", text: "New Signups declining 6.5% is the key issue — need to increase marketing spend", explanation: "-6.5% decline is within normal fluctuation. Churn +154% is the real anomaly."),
                                Challenge.Option(id: "D", text: "Increasing listen time means the recommendation algorithm is working well — MAU decline isn't a big deal", explanation: "An 8.2% MAU decline is very serious and cannot be dismissed because listen time increased."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "MAU change = New + Reactivated - Churned. Which factor changed most dramatically?",
                                "Are active user behavioral metrics (sessions, listen time) going up or down? What does that tell you?",
                            ],
                            explanation: "When analyzing a metric decline, first decompose the formula: MAU = Previous MAU + New + Reactivated - Churned. New and Reactivated barely changed, but Churn surged from 350K to 890K. Meanwhile, remaining users' engagement actually improved, meaning the core product experience hasn't deteriorated. Next step: deep dive into who is churning and why.",
                            frameworkTip: "MAU decomposition: MAU = Previous MAU + New + Reactivated - Churned. Find the biggest delta first."
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Challenge: Metric Decline Investigation (Part 2)",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Based on the segmentation, how would you continue investigating?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Continuing the Investigation: Who Is Churning?",
                                narrative: "After confirming the problem is a churn surge, you split churned users by segment.",
                                data: [
                                    ["segment": "Premium (paid)", "last_churn": "45K", "this_churn": "52K", "change": "+16%", "pct_of_total": "5.8%"],
                                    ["segment": "Free - Active >6 months", "last_churn": "85K", "this_churn": "95K", "change": "+12%", "pct_of_total": "10.7%"],
                                    ["segment": "Free - Active 1-6 months", "last_churn": "120K", "this_churn": "143K", "change": "+19%", "pct_of_total": "16.1%"],
                                    ["segment": "Free - Active <1 month", "last_churn": "100K", "this_churn": "600K", "change": "+500%", "pct_of_total": "67.4%"],
                                ],
                                dataCaption: "Churned Users by Segment"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Churn increased across all segments — needs a comprehensive product experience review", explanation: "While all increased, the magnitude varies enormously. Free <1 month surged 500% and accounts for the vast majority of new churn."),
                                Challenge.Option(id: "B", text: "Premium user churn increased the least (+16%), meaning paid users are safe — no need to worry", explanation: "Premium churn +16% isn't trivial, but it's not the most urgent problem. The focus should be on Free <1 month."),
                                Challenge.Option(id: "C", text: "The churn surge is concentrated in \"Free - Active <1 month\" (+500%, 67% of total). Need to investigate where these new users came from and why they left so quickly", explanation: "Correct! This batch of users who joined less than a month ago and already churned accounts for 67% of total churn, surging 500%. This is a very abnormal pattern. Most likely causes: (1) A specific acquisition channel brought large volumes of low-quality users (2) Bot/fake signups (3) A referral program was abused. Next step: check these users' acquisition source."),
                                Challenge.Option(id: "D", text: "Focus should be on Free Active 1-6 month users since they're most likely to convert to paid", explanation: "This segment's churn only increased 19% — not the most urgent issue right now."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Which segment had the most dramatic churn increase? What percentage of total churn does it represent?",
                                "A massive increase in users who joined less than a month ago and already left — what could that mean?",
                            ],
                            explanation: "This is a typical drill-down analysis flow: overall churn ↑ → segment by user type → discover the problem is concentrated in \"Free <1 month\" → next, segment by acquisition source. Each layer narrows the scope. This pattern (large numbers of new users churning rapidly) usually points to acquisition channel quality issues or fraud.",
                            frameworkTip: "Drill-down flow: Overall anomaly → Segment by dimension → Find the anomalous segment → Segment that segment further → Until actionable"
                        ),
                        Challenge(
                            id: 3,
                            name: "Boss Challenge: Metric Decline Investigation (Part 3)",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which report is most complete and actionable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Truth Revealed",
                                narrative: "You continued investigating the \"Free - Active <1 month\" churned users and found the following clues:\n\n1. Of the 600K churned users, 450K came from a single referral campaign (\"Invite a friend, get 3 months free Premium\")\n2. This campaign launched last month; referred users' average usage time was only 2 minutes\n3. Some referring accounts invited 200+ friends\n4. Many of the referred accounts share the same IP or device\n\nYou need to report your complete investigation findings to the CEO.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "MAU declined because the referral campaign brought too many users — recommend pausing the campaign", explanation: "This conclusion is too shallow. You didn't explain why referral users churned, nor did you suggest how to improve."),
                                Challenge.Option(id: "B", text: "MAU decline root cause is referral campaign abuse: people used fake accounts to mass-register for free Premium. Recommendations: (1) Pause campaign immediately (2) Clean up fraudulent accounts (3) Redesign referral mechanism (add verification, set limits) (4) Recalculate true MAU excluding fraud", explanation: "Correct! This is a complete root cause analysis report: (1) Clearly identifies root cause (referral abuse/fraud), (2) Backed by data (450K from one campaign, 2-minute usage, same IP), (3) Has both short-term and long-term recommendations, (4) Suggests recalculating \"true\" MAU excluding fraud impact."),
                                Challenge.Option(id: "C", text: "Our MAU definition is wrong — these fraud accounts shouldn't count in MAU. After adjusting the definition, MAU actually didn't decline", explanation: "While excluding fraud is important, you can't just redefine a metric to \"solve\" the problem. The fraud itself needs to be addressed, and the campaign needs to be fixed."),
                                Challenge.Option(id: "D", text: "Need more data to confirm it's fraud — can't jump to conclusions", explanation: "2-minute usage time, 200+ invites, same IP/device — this is already a very clear fraud pattern. In interviews, you need to show decisiveness. You can't keep saying \"need more data.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A good analysis report should include: root cause, evidence, short-term and long-term recommendations.",
                                "Beyond \"pause the campaign,\" what other actions are needed?",
                            ],
                            explanation: "This Boss Challenge demonstrates the complete data investigation flow: (1) Spot overall metric anomaly → (2) Decompose formula to find main driver → (3) Segment to find the anomalous group → (4) Deep-dive into that group's characteristics → (5) Find root cause → (6) Propose action recommendations. Completing this flow in an interview demonstrates structured analytical capability.",
                            frameworkTip: "Complete investigation report: Metric anomaly → Formula decomposition → Segment analysis → Root Cause → Data evidence → Action recommendations (short-term + long-term)"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 5: Product Thinking
        World(
            id: 5,
            name: "Product Thinking",
            emoji: "💡",
            description: "User journey, pain points, and feature success assessment",
            quests: [
                Quest(
                    id: "5-1",
                    name: "User Journey Mapping",
                    description: "Map the user journey and find pain points",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Journey Stages",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which User Journey is the most complete and appropriate for analyzing the trial-to-paid conversion issue?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Product User Journey",
                                narrative: "You are a Product Analyst at a project management tool. The PM says: \"Our free trial to paid conversion rate is only 2%, well below the industry average of 5%.\"\n\nYou need to map the User Journey first before you can find the problem.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Sign up → Pay", explanation: "Too coarse. There are many steps in between, and you won't know where users get stuck."),
                                Challenge.Option(id: "B", text: "Search/Ad → Landing Page → Sign Up → Onboarding → Create First Project → Invite Team → Continued Use → Pay", explanation: "Correct! A complete journey includes every key step. This way you can see if there's significant churn between \"create project\" and \"invite team.\""),
                                Challenge.Option(id: "C", text: "Sign up → Use for a few days → Like it or not → Pay or not", explanation: "Too vague. \"Use for a few days\" isn't a specific behavioral step. You need more precise actions."),
                                Challenge.Option(id: "D", text: "Sign up → Feature A → Feature B → Feature C → Pay", explanation: "A feature-oriented journey doesn't necessarily match the user's actual path. Start from what the user is \"trying to accomplish.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A good User Journey has specific actions, not vague feelings",
                                "Think about what \"things\" the user does from first contact to payment",
                            ],
                            explanation: "The purpose of a User Journey is to make the user's path concrete so you can quantify conversion at each step and find the biggest drop-off. The more specific the journey, the more analytical value it has.",
                            frameworkTip: "User Journey elements: Stages → Actions → Touchpoints → Pain Points"
                        ),
                        Challenge(
                            id: 2,
                            name: "Finding Pain Points in the Journey",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Looking at the data, where is the biggest pain point?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Onboarding Funnel Data",
                                narrative: "You obtained the onboarding funnel data:",
                                data: [
                                    ["step": "1. Complete signup", "users": "10000", "conversion": "100%"],
                                    ["step": "2. Email verification", "users": "7200", "conversion": "72%"],
                                    ["step": "3. Fill in profile", "users": "6800", "conversion": "94%"],
                                    ["step": "4. Create first project", "users": "2100", "conversion": "31%"],
                                    ["step": "5. Invite first teammate", "users": "1800", "conversion": "86%"],
                                    ["step": "6. Complete first task", "users": "1500", "conversion": "83%"],
                                ],
                                dataCaption: "Onboarding Funnel (Past 30 Days)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Email verification (28% drop-off)", explanation: "Email verification losing 28% is significant but not the biggest. Keep looking at other steps."),
                                Challenge.Option(id: "B", text: "Fill in profile → Create first project (69% drop-off)", explanation: "Correct! From 6,800 to 2,100 — 69% loss. This is the largest drop-off in the entire funnel. Users completed their profile but don't know how to create a project, or find it too complex."),
                                Challenge.Option(id: "C", text: "Invite teammate (14% drop-off)", explanation: "14% drop-off rate is normal for onboarding — not the main issue."),
                                Challenge.Option(id: "D", text: "The whole flow has problems — needs a comprehensive overhaul", explanation: "The key to analysis is finding the biggest leverage point. With limited resources, prioritize the step with the largest drop-off."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at each step's conversion rate — which is the lowest?",
                                "31% means what? Why does less than 1/3 pass this step?",
                            ],
                            explanation: "The core of funnel analysis is finding the \"biggest drop-off.\" Here, the conversion from step 3 to step 4 is only 31%, far below other steps. Improving this step has the highest ROI — if it could go from 31% to 50%, the entire funnel's final conversion would improve significantly.",
                            frameworkTip: "After finding the biggest drop-off, the next question is: \"Why?\" Possible causes: UX issues, insufficient guidance, or overly complex functionality."
                        ),
                    ]
                ),
                Quest(
                    id: "5-2",
                    name: "Feature Success Assessment",
                    description: "How to judge if a new feature succeeded after launch",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Defining Success Metrics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which set of metrics is most appropriate for evaluating this search feature?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Search Feature Launch",
                                narrative: "Your e-commerce platform just launched an improved search feature. The PM asks: \"How do we judge if the new search is successful?\"\n\nThe new search's goal is: Help users find the product they want faster.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "DAU and MAU", explanation: "DAU/MAU are overall product metrics, not search feature success metrics. Search improvements don't necessarily directly impact DAU."),
                                Challenge.Option(id: "B", text: "Search usage count", explanation: "High search count might mean users can't find what they're looking for and keep searching. High usage doesn't equal success."),
                                Challenge.Option(id: "C", text: "Primary: Post-search click rate and purchase conversion / Guardrail: Page load time, overall conversion", explanation: "Correct! Post-search clicks (task completion) and purchase conversion (downstream impact) directly measure \"finding products faster.\" Guardrails ensure the new feature doesn't slow down load times or hurt overall conversion."),
                                Challenge.Option(id: "D", text: "User satisfaction survey score", explanation: "Surveys are a supplementary metric but can't be the sole judgment. They need to be paired with behavioral data to be complete."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Go back to the feature's goal: \"Help users find products faster.\" What data reflects this goal?",
                                "Guardrail metrics are metrics that \"must not get worse\"",
                            ],
                            explanation: "The core of feature evaluation: first define success (primary metric), then set safety lines (guardrails). The primary metric must directly reflect the feature's goal; guardrails ensure no side effects.",
                            frameworkTip: "Interview golden phrase: \"Before evaluating, I would define the primary metric and guardrails to ensure we know what success looks like.\""
                        ),
                        Challenge(
                            id: 2,
                            name: "Before / During / After",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Is this feature successful? What's the best way to judge?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Notification Feature Effectiveness Evaluation",
                                narrative: "Your SaaS product added a \"smart notifications\" feature that sends push notifications when a user's task is approaching its deadline. It's been live for one month, and you need to write the effectiveness report.\n\nData:\n• Notification open rate: 65%\n• Opened app within 1 hour of notification: 40%\n• D7 retention of smart notification users: +8pp (vs non-users)\n• But overall notification opt-out rate rose from 12% to 18%",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Successful — retention improved by 8pp", explanation: "The retention improvement is good news, but rising opt-out rate is a warning sign. You can't only look at the positives."),
                                Challenge.Option(id: "B", text: "Failed — rising opt-out rate shows users feel disturbed", explanation: "Rising opt-out is indeed a problem, but the feature has positive impact too. Can't declare failure outright."),
                                Challenge.Option(id: "C", text: "Needs more analysis: Is the retention improvement causal? Which users are opting out?", explanation: "Correct! (1) The retention difference might be selection bias (users who proactively enable notifications were already more active). (2) If opt-outs are concentrated among low-activity users, the impact may be acceptable. Deeper analysis is needed."),
                                Challenge.Option(id: "D", text: "Successful — 65% open rate is very high", explanation: "A high open rate only means good discoverability, not that the feature is valuable."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Correlation ≠ causation: users of the feature having higher retention doesn't mean the feature caused it",
                                "When a guardrail metric worsens (opt-out rate), you can't ignore it",
                            ],
                            explanation: "Real feature evaluation is rarely black and white. Good analysts: (1) Question causality (selection bias) (2) Check guardrail metrics (3) Do segment analysis. Demonstrating this critical thinking in interviews earns bonus points.",
                            frameworkTip: "Feature evaluation three phases: Before (define success) → During (monitor health) → After (comprehensive review)"
                        ),
                    ]
                ),
                Quest(
                    id: "5-3",
                    name: "Adoption Problem Diagnosis",
                    description: "Why is nobody using your feature?",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Three-Layer Model Diagnosis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "According to the Discoverability → Usability → Value model, which layer has the biggest problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Report Feature Nobody Uses",
                                narrative: "Your B2B SaaS product spent three months developing a \"custom reports\" feature, but only 8% of customers have used it one month after launch. The PM is frustrated.\n\nYou obtained the following data:",
                                data: [
                                    ["metric": "Report feature entry point impressions", "value": "45,000 times/month"],
                                    ["metric": "Clicks into report feature", "value": "1,200 times/month", "conversion": "2.7%"],
                                    ["metric": "Started creating a report", "value": "900 times", "conversion": "75%"],
                                    ["metric": "Successfully completed a report", "value": "320 times", "conversion": "36%"],
                                    ["metric": "Used again within 7 days", "value": "180 times", "conversion": "56%"],
                                ],
                                dataCaption: "Report Feature Funnel"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Discoverability — Users don't know the feature exists", explanation: "There were 45,000 impressions — users did see it. But the click rate is only 2.7%, which is indeed a Discoverability/entry design issue. But you need to compare with other layers."),
                                Challenge.Option(id: "B", text: "Usability — Users tried but couldn't complete it", explanation: "36% completion rate is indeed low, but the biggest drop-off is at the first step."),
                                Challenge.Option(id: "C", text: "Value — They completed it but don't find it valuable", explanation: "56% return within 7 days is actually not bad. Value isn't the biggest issue."),
                                Challenge.Option(id: "D", text: "Both Discoverability and Usability have issues, but Discoverability is more severe", explanation: "Correct! The biggest drop-off is \"saw → clicked\" (2.7%), indicating entry design or messaging problems. Second is \"started → completed\" (36%), indicating usability issues. Fix Discoverability first — get more people to try it."),
                            ],
                            correctAnswer: "D",
                            hints: [
                                "Look at each funnel step's conversion rate — which has the biggest drop-off?",
                                "What does a 2.7% click rate mean?",
                            ],
                            explanation: "Three-layer model diagnostic logic: Discoverability (saw but didn't click → entry or messaging problem) → Usability (clicked but couldn't complete → flow or design problem) → Value (completed but won't use again → feature doesn't solve the problem). Fix from the top of the funnel down, because improvements further down don't matter without traffic.",
                            frameworkTip: "Three-layer diagnostic mantra: Can they see it? Can they finish it? Will they use it again?"
                        ),
                        Challenge(
                            id: 2,
                            name: "Proposing Improvement Plans",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which improvement strategy is most efficient?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Continuing: Improving Report Feature Adoption",
                                narrative: "You've diagnosed that the main problems are Discoverability (entry click rate 2.7%) and Usability (completion rate 36%). Now you need to propose an improvement plan.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Redesign the entire report feature to make it more powerful", explanation: "The Value layer is actually fine (56% return rate). A full redesign is expensive and doesn't address the real problems."),
                                Challenge.Option(id: "B", text: "First improve the entry point (more visible placement + clearer CTA), then simplify the creation flow (templates, guided steps)", explanation: "Correct! First solve Discoverability (get more people to try), then solve Usability (help those who try to complete it). This is the highest ROI sequence."),
                                Challenge.Option(id: "C", text: "Send an email blast to all users about the new feature", explanation: "May be effective short-term but isn't a long-term fix. If users click through and usability isn't improved either, they'll form a negative impression."),
                                Challenge.Option(id: "D", text: "Create a tutorial video at the feature entry point", explanation: "A tutorial video can help usability, but if the entry click rate is only 2.7%, very few people will see the video. Fix the entry point issue first."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The improvement sequence should match the funnel — first get more people in, then help those who enter complete the task",
                            ],
                            explanation: "Priority for improving adoption: Discoverability first → then Usability → then Value. Like fixing a pipe, start from the biggest leak upstream.",
                            frameworkTip: "When proposing improvements, interviewers look at your \"prioritization\" ability, not listing as many ideas as possible."
                        ),
                    ]
                ),
                Quest(
                    id: "5-4",
                    name: "Usage vs Value",
                    description: "High usage doesn't mean high value",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Distinguishing Usage from Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What do these data tell you?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Search Function Illusion",
                                narrative: "Your e-commerce app's search feature has very high usage — 4.2 searches per session on average. The PM is happy, thinking the search feature is excellent.\n\nBut you dug deeper and found:",
                                data: [
                                    ["metric": "Avg searches per session", "value": "4.2 times"],
                                    ["metric": "Search-to-click rate", "value": "35%"],
                                    ["metric": "Search-to-purchase rate", "value": "8%"],
                                    ["metric": "Search users vs browse users purchase rate", "value": "8% vs 15%"],
                                ],
                                dataCaption: "Search Feature Data"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The search feature is very successful — usage is high", explanation: "High usage might mean users can't find what they want and keep searching. Look at outcomes, not just usage."),
                                Challenge.Option(id: "B", text: "Search has high usage but low value — users search many times but can't find what they want", explanation: "Correct! Averaging 4.2 searches but only 35% clicking results means most searches don't return useful results. Purchase rate is lower than category browsing, meaning search actually hinders purchasing. High usage here is a negative signal."),
                                Challenge.Option(id: "C", text: "8% purchase rate from search is already good", explanation: "You need to compare with other paths. Category browsing's 15% purchase rate is nearly double search's, indicating the search feature has problems."),
                                Challenge.Option(id: "D", text: "Need more data to judge", explanation: "The existing data is already quite convincing. Multiple searches with few clicks, low purchases, and worse than alternative paths — the problem is clear."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Searching many times isn't necessarily good — if you found it the first time, why search 4 times?",
                                "Compare search vs category browsing purchase rates — which is more effective?",
                            ],
                            explanation: "Usage ≠ Value is one of the most important concepts in product analysis. High usage can mean: (1) Feature works well so it's used often (good) (2) Feature doesn't work well so users keep retrying (bad) (3) Forced usage (neutral). You must look at outcomes to judge.",
                            frameworkTip: "Interview golden phrase: \"Usage is the starting point, but I focus more on outcomes — did the user accomplish their goal?\""
                        ),
                        Challenge(
                            id: 2,
                            name: "Measuring True Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you evaluate the auto-backup feature's value?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Auto-Backup Feature's Value",
                                narrative: "Your cloud file product has an \"auto-backup\" feature. Its usage data:\n• Manual backup triggered: Only 5% of users do it monthly\n• Feature settings page visits: 2% of MAU\n\nBut churn analysis shows: Users who disabled auto-backup have a 60-day churn rate of 25%; those with it enabled have 8%.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Usage is too low (5%) — feature isn't successful, should be removed", explanation: "Low usage doesn't mean no value. Auto-backup's value is \"peace of mind\" — it provides value without active use."),
                                Challenge.Option(id: "B", text: "Use a comparative method — compare retention between users with and without the feature, proving high retention value", explanation: "Correct! This is a classic case of low usage but high value. Auto-backup is like insurance — you rarely use it, but you'd leave without it. Measuring such features requires counterfactual or comparative methods, not usage rates."),
                                Challenge.Option(id: "C", text: "Run a satisfaction survey asking users how important backup is", explanation: "Surveys can be done, but behavioral data (retention differences) is more persuasive than subjective responses."),
                                Challenge.Option(id: "D", text: "Make the backup feature more visible to increase usage", explanation: "Auto-backup doesn't need active usage by design. Increasing usage isn't the right goal."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Some features' value isn't in \"being used\" but in \"existing\"",
                                "Compare behavioral differences between users with and without the feature",
                            ],
                            explanation: "Four methods for measuring Value: (1) Outcome-based — Did the target behavior improve after use? (2) Comparative — Differences between users with vs without (3) Counterfactual — What would happen if removed? (4) Survey — Ask users directly. Low usage high value features are bonus topics in interviews.",
                            frameworkTip: "Interview tip: Proactively mentioning \"usage and value are different concepts\" shows depth of thinking."
                        ),
                    ]
                ),
                Quest(
                    id: "5-5",
                    name: "Discoverability vs Usability vs Value",
                    description: "Three-layer decomposition of product problems",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Complete Three-Layer Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Based on the three-layer model analysis, what's the correct priority order?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Report Feature vs Excel",
                                narrative: "Your B2B product has a built-in report feature, but most customers still use Excel. The PM asks: \"Why?\"\n\nYou conducted the following research:",
                                data: [
                                    ["finding": "Feature entry point is in the third level of the settings menu", "source": "Product analysis"],
                                    ["finding": "65% of users don't know this feature exists", "source": "User interviews"],
                                    ["finding": "Of those who know, 40% tried but found too many steps", "source": "Funnel data"],
                                    ["finding": "Of those who successfully completed it, 70% use it again", "source": "Behavioral data"],
                                    ["finding": "Users of the report feature save an average of 2 hours/week", "source": "Efficiency analysis"],
                                ],
                                dataCaption: "Research Results"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "First improve Value (make reports more useful)", explanation: "70% return rate and saving 2 hours/week — the Value layer actually has no problems."),
                                Challenge.Option(id: "B", text: "First improve Discoverability (let more people know about it), then Usability (simplify the process)", explanation: "Correct! 65% don't know the feature exists → Discoverability is the biggest problem. Then 40% of those who tried found it too complex → Usability is second. Value is actually great (70% return, saves 2 hours) — no changes needed."),
                                Challenge.Option(id: "C", text: "Improve all three layers simultaneously — comprehensive upgrade", explanation: "With limited resources, you need priorities. The Value layer doesn't need fixing — concentrate on Discoverability and Usability."),
                                Challenge.Option(id: "D", text: "First improve Usability (simplify the process), because 40% drop-off is serious", explanation: "40% usability drop-off needs fixing, but 65% not knowing the feature exists is a bigger problem. If no one comes in, improving the experience is pointless."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Imagine a funnel: first people need to \"see it,\" then \"use it,\" and only then \"feel the value\"",
                                "Which layer's problem affects the most people?",
                            ],
                            explanation: "Three-layer model logic: Diagnose top-down (D → U → V), fix top-down. First ensure users know the feature exists, then ensure they can use it smoothly, and finally address value issues. Many product features fail not because they lack value, but because no one knows they exist.",
                            frameworkTip: "Complete answer structure: \"I would use the Discoverability → Usability → Value framework to analyze where the problem lies, then fix in order.\""
                        ),
                    ]
                ),
                Quest(
                    id: "5-6",
                    name: "Boss: Product Analysis Case",
                    description: "Complete product analysis interview question",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Complete Product Analysis Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Social Commerce App Referral Feature Analysis",
                                narrative: "You are a Product Analyst at a social commerce app. The app lets users share shopping lists with friends, who can purchase directly.\n\nThree months ago, a Referral feature launched: users invite friends to sign up, and both get a $10 discount.\n\nCurrent data:\n• 10% of MAU used the share feature\n• Referral link clicked 50,000 times/month\n• Click-to-signup rate: 15%\n• New user D7 retention: 22% (vs organic users' 35%)\n• CAC per referral user: $18 (vs paid ads' $12)\n• Inviter's 30-day repurchase rate: +12%",
                                data: [
                                    ["metric": "MAU using share feature", "value": "10%"],
                                    ["metric": "Referral link clicks", "value": "50,000/month"],
                                    ["metric": "Click→Signup conversion", "value": "15%"],
                                    ["metric": "Referred user D7 Retention", "value": "22%"],
                                    ["metric": "Organic user D7 Retention", "value": "35%"],
                                    ["metric": "Referral CAC", "value": "$18"],
                                    ["metric": "Paid Ads CAC", "value": "$12"],
                                    ["metric": "Inviter 30-day repurchase rate increase", "value": "+12%"],
                                ],
                                dataCaption: "Referral Feature Data"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Don't rush to judge success or failure — analyze with a framework first",
                                "Think about why referral users have low retention — what's their motivation?",
                            ],
                            explanation: "The core of a product analysis case is demonstrating depth of thinking. Don't just look at numbers on the surface — dig into underlying causes and propose logically sound improvement plans. Interviewers evaluate your analytical framework and thought process, not the answer itself.",
                            frameworkTip: "Complete product analysis framework: Define success → Layered evaluation → Diagnose problems → Propose solutions → Prioritize"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 6: Business Process
        World(
            id: 6,
            name: "Business Process",
            emoji: "⚙️",
            description: "Process mapping, bottleneck analysis, and workflow optimization",
            quests: [
                Quest(
                    id: "6-1",
                    name: "Process Mapping",
                    description: "Map out business processes for analysis",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Process Elements",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "In this process, what type of element is \"Agent determines issue type\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Complaint Handling Process",
                                narrative: "You joined the Operations team at an e-commerce company. Your manager wants you to map the complaint handling process. The current process is:\n\nCustomer calls to complain → Agent records the issue → Agent determines issue type → If logistics issue, transfer to logistics department; if product quality issue, transfer to quality team → Respective department investigates → Reply to customer → Confirm customer satisfaction → Close case",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Action Step", explanation: "Determining the issue type isn't simply \"doing something\" — it's a point where a choice must be made."),
                                Challenge.Option(id: "B", text: "Decision Point", explanation: "Correct! \"If logistics issue → take path A; if quality issue → take path B\" is a branching decision, represented by a diamond shape in process diagrams."),
                                Challenge.Option(id: "C", text: "Wait State", explanation: "The determination may take some time, but its core nature is \"making a decision,\" not passive waiting."),
                                Challenge.Option(id: "D", text: "Trigger Event", explanation: "The trigger event is the process starting point (customer calls to complain). Determining issue type is a step within the process."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Places in a process with \"if...then...\" are all decision points",
                                "Think about basic process diagram shapes: rectangle=step, diamond=decision, circle=start/end",
                            ],
                            explanation: "Core elements of a Process Map: Trigger event (start) → Steps (actions) → Decision points (branches) → Waits (passive holds) → End. Identifying decision points is especially important because each one is a place where the process can go wrong or get delayed.",
                            frameworkTip: "When describing a process in interviews, specifically call out decision points and owners: \"At this step, a judgment is needed, handled by role X.\""
                        ),
                        Challenge(
                            id: 2,
                            name: "Mapping a Complete Process",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "You need to analyze this process. Which approach is most correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Procurement Approval Process",
                                narrative: "The current procurement process:\n\n1. Employee submits purchase request\n2. Department manager reviews\n3. If amount > $5,000, VP additional approval required\n4. Procurement department places order\n5. Supplier delivers\n6. Receiving inspection\n7. Finance processes payment\n\nAverage processing time: 12 business days. Management thinks it's too slow.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Directly recommend skipping VP review to speed things up", explanation: "Recommending removal of steps before understanding the full process and bottlenecks is dangerous. VP review may exist for compliance reasons."),
                                Challenge.Option(id: "B", text: "Quantify each step's processing time and wait time to find the slowest link", explanation: "Correct! The key to Process Mapping is quantification. Knowing how long each step takes (doing work vs waiting), you can find the bottleneck. VP review might only take 5 minutes, but \"waiting for the VP to see it\" could take 3 days."),
                                Challenge.Option(id: "C", text: "Automate the entire process", explanation: "Not all steps are suitable for automation. You need to first analyze which steps are bottlenecks and which are suitable for automation."),
                                Challenge.Option(id: "D", text: "Ask employees which step feels slowest", explanation: "Employee perception is a reference, but needs data validation. Feelings don't always reflect real bottlenecks."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Processing time is \"actual work\" time; Wait time is \"waiting\" time",
                                "Most process slowness comes from \"waiting,\" not \"doing\"",
                            ],
                            explanation: "Drawing the process map is just the first step. The real value is quantifying each step's time, especially distinguishing processing time (active work) from wait time (idle waiting). This is how you find the bottleneck and propose data-backed improvement recommendations.",
                            frameworkTip: "Process Mapping in 3 steps: (1) Draw the steps (2) Label owners and times (3) Distinguish work time vs wait time"
                        ),
                    ]
                ),
                Quest(
                    id: "6-2",
                    name: "Finding Bottlenecks",
                    description: "Where in the process does work get stuck",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Bottlenecks",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Where is this process's bottleneck?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Order Processing Flow Analysis",
                                narrative: "You quantified each step's time in the order processing flow:",
                                data: [
                                    ["step": "1. Receive order", "processing": "Instant (automated)", "wait": "0", "total": "0 min"],
                                    ["step": "2. Inventory check", "processing": "2 min", "wait": "0", "total": "2 min"],
                                    ["step": "3. Credit review", "processing": "5 min", "wait": "4 hours", "total": "4h 5min"],
                                    ["step": "4. Pick and pack", "processing": "15 min", "wait": "30 min", "total": "45 min"],
                                    ["step": "5. Logistics arrangement", "processing": "3 min", "wait": "10 min", "total": "13 min"],
                                    ["step": "6. Shipment notification", "processing": "Instant (automated)", "wait": "0", "total": "0 min"],
                                ],
                                dataCaption: "Order Processing Flow Time Analysis"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Pick and pack (longest processing time: 15 min)", explanation: "15 minutes of processing time is indeed the longest, but the total is only 45 minutes. Bottleneck should be judged by total lead time, not just processing time."),
                                Challenge.Option(id: "B", text: "Credit review (longest wait time: 4 hours)", explanation: "Correct! Credit review processing only takes 5 minutes, but waiting is 4 hours. These 4 hours account for over 80% of the entire process time. Classic bottleneck — the problem isn't in \"doing work\" but in \"waiting.\""),
                                Challenge.Option(id: "C", text: "Logistics arrangement (least efficient)", explanation: "Total is only 13 minutes — not the bottleneck."),
                                Challenge.Option(id: "D", text: "No obvious bottleneck — the process is balanced", explanation: "Credit review's 4-hour wait far exceeds all other steps — it's a very obvious bottleneck."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Look at total lead time, not just processing time",
                                "Which step has the longest wait time? Why?",
                            ],
                            explanation: "Most bottleneck problems are in \"waiting,\" not \"doing.\" Credit review itself takes only 5 minutes, but queuing takes 4 hours — possibly because there's only one reviewer, or the review system isn't real-time. Solutions: add reviewers, increase auto-approval rates, or set low-risk orders to skip review.",
                            frameworkTip: "Bottleneck analysis mantra: Find the step with the longest wait time — that's your bottleneck."
                        ),
                        Challenge(
                            id: 2,
                            name: "Types of Bottlenecks",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What type of bottleneck is this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Service Ticket Backlog",
                                narrative: "Customer service ticket average resolution time went from 2 hours to 8 hours. Your investigation found:\n\n• Ticket volume is about the same as last month\n• Agent headcount unchanged\n• But the \"assignment\" step's wait time went from 15 minutes to 5 hours\n• Reason: A new rule was added recently — all tickets must go through \"L2 technical assessment\" before assignment, and there are only 2 L2 staff",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Staffing bottleneck — not enough L2 technical staff", explanation: "Partially correct, but more precisely it's a policy-induced staffing bottleneck."),
                                Challenge.Option(id: "B", text: "System bottleneck — system processing speed is slow", explanation: "It's not a system issue — it's a process rule issue. The system itself hasn't changed."),
                                Challenge.Option(id: "C", text: "Policy bottleneck — the new rule created an unnecessary dependency", explanation: "Correct! The new \"must go through L2 assessment\" rule forces all tickets to queue behind 2 L2 staff. Solutions might include: only technical tickets require L2 assessment, train more L2 staff, or give L1 some autonomous judgment authority."),
                                Challenge.Option(id: "D", text: "Information bottleneck — insufficient information to make judgments", explanation: "The problem isn't insufficient information but the process rule forcing all tickets through L2."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Ticket volume unchanged, headcount unchanged — so what changed?",
                                "Is the new rule necessary for ALL tickets?",
                            ],
                            explanation: "Policy bottlenecks are often overlooked. Many process efficiency problems aren't about insufficient staffing or poor systems, but \"rule design\" creating unnecessary bottlenecks. The solution is usually to examine whether the rule is necessary for all scenarios, and differentiate high-risk vs low-risk handling paths.",
                            frameworkTip: "In interviews, when you see a process slow down but volume unchanged, first ask: \"Were there any recent process or rule changes?\""
                        ),
                    ]
                ),
                Quest(
                    id: "6-3",
                    name: "Automation Decisions",
                    description: "Which steps should be automated and which shouldn't",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Assessing Automation Suitability",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which steps are most suitable for priority automation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Procurement Process Automation Assessment",
                                narrative: "Your manager wants to automate the procurement approval process. The current process has 8 steps, and you need to assess which are suitable for automation:",
                                data: [
                                    ["step": "1. Submit request", "frequency": "200/month", "rule_clarity": "Clear", "error_cost": "Low"],
                                    ["step": "2. Format check", "frequency": "200/month", "rule_clarity": "Very clear", "error_cost": "Low"],
                                    ["step": "3. Budget balance check", "frequency": "200/month", "rule_clarity": "Clear", "error_cost": "Medium"],
                                    ["step": "4. Supplier selection", "frequency": "150/month", "rule_clarity": "Fuzzy (needs experience)", "error_cost": "High"],
                                    ["step": "5. Manager approval", "frequency": "150/month", "rule_clarity": "Context-dependent", "error_cost": "High"],
                                    ["step": "6. Place order with supplier", "frequency": "130/month", "rule_clarity": "Clear", "error_cost": "Medium"],
                                    ["step": "7. Receiving inspection", "frequency": "120/month", "rule_clarity": "Partially clear", "error_cost": "High"],
                                    ["step": "8. Payment notification", "frequency": "120/month", "rule_clarity": "Very clear", "error_cost": "Low"],
                                ],
                                dataCaption: "Automation Assessment per Step"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Automate everything — eliminate all manual work", explanation: "Supplier selection and manager approval require judgment; error cost is high — not suitable for full automation."),
                                Challenge.Option(id: "B", text: "Format check + Budget check + Payment notification", explanation: "Correct! These three steps meet the three automation criteria: (1) High frequency (2) Clear rules (3) Low-to-medium error cost. Format check and payment notification are nearly zero-risk; budget check is simple numerical comparison."),
                                Challenge.Option(id: "C", text: "Manager approval — because it takes the most time", explanation: "Manager approval requires human judgment and has high error cost. Not suitable for full automation. What you can do is \"auto-approve low amounts + manual for high amounts.\""),
                                Challenge.Option(id: "D", text: "Only automate payment notification — lowest risk", explanation: "Too conservative. Format check and budget check are also fully suitable for automation and would significantly improve efficiency."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Three automation factors: high frequency + clear rules + manageable error cost",
                                "Steps requiring \"experience/judgment\" are usually not suitable for full automation",
                            ],
                            explanation: "The core of automation decisions is the risk-reward trade-off. Best candidates for automation are \"high frequency + clear rules + low risk\" steps. Steps requiring judgment can be partially automated (e.g., auto-approve low amounts, manual for high amounts).",
                            frameworkTip: "Interview answer structure: \"I would evaluate using three dimensions: frequency, rule clarity, and error cost. Prioritize automating high-frequency + clear-rule + low-risk steps.\""
                        ),
                    ]
                ),
                Quest(
                    id: "6-4",
                    name: "Permissions & Audit",
                    description: "Permission control and traceability design",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Permission Design Principles",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which permission design best follows best practices?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Expense Reimbursement System",
                                narrative: "You need to design an expense reimbursement system. Current problems:\n\n• Some employees submit their own requests and approve them themselves (separation of duties violation)\n• Some people can see the entire company's reimbursement records (least privilege violation)\n• A $50,000 reimbursement was approved, but nobody can find who approved it (audit trail missing)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Everyone can only see their own reimbursements, cannot approve their own requests, and all actions are logged", explanation: "Correct! These three principles are: (1) Least Privilege — can only see their own (2) Separation of Duties — can't both request and approve (3) Audit Trail — log everything. These are fundamental internal control designs."),
                                Challenge.Option(id: "B", text: "Just let managers see their department's reimbursements", explanation: "Managers seeing department records is reasonable, but doesn't address separation of duties and audit trail issues."),
                                Challenge.Option(id: "C", text: "Add a \"super admin\" who can approve any amount", explanation: "Super admin concentrates too much power — even higher risk. Use amount-based tiers instead."),
                                Challenge.Option(id: "D", text: "All reimbursements require VP approval — safest", explanation: "Excessive approval requirements make the process extremely slow. Use a tiered mechanism (small amounts auto-approve, medium manager, large VP)."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "Three security principles: least privilege, separation of duties, traceability",
                                "Balance security and efficiency",
                            ],
                            explanation: "Three principles of permission design: (1) Least Privilege — grant only the minimum necessary permissions (2) Separation of Duties — the same person cannot both execute and approve (3) Audit Trail — who did what and when must be recorded. This is critical for SOX compliance and internal audits.",
                            frameworkTip: "Mentioning separation of duties and audit trail in interviews is a major plus — it shows you understand corporate governance."
                        ),
                    ]
                ),
                Quest(
                    id: "6-5",
                    name: "Exception Handling",
                    description: "Process design for exceptional situations",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Designing Exception Handling",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which exception handling design approach is most reasonable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Return Process Exceptions",
                                narrative: "You designed a return process: Customer requests return → Review eligibility → Arrange pickup → Receive item → Inspect item → Process refund → Close case.\n\nBut in practice, many exceptional situations arise.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Reject all returns past the return period with no exceptions", explanation: "Too rigid. Will lose loyal customers. There should be a manager discretion mechanism."),
                                Challenge.Option(id: "B", text: "Route all exceptions to the customer service manager for case-by-case judgment", explanation: "This would make the customer service manager the new bottleneck. Differentiate between high/low frequency and high/low impact exceptions."),
                                Challenge.Option(id: "C", text: "High-frequency + low-impact exceptions use automated rules (e.g., auto-approve if within 7 days past deadline); Low-frequency + high-impact exceptions go through manual escalation (e.g., bulk returns trigger investigation)", explanation: "Correct! Exception handling should be tiered: common small exceptions use automated rules (fast and consistent); rare large exceptions go through human judgment and escalation paths (safe and flexible)."),
                                Challenge.Option(id: "D", text: "Write rules for all exception scenarios and fully automate", explanation: "The nature of exceptions is \"unexpected\" — you can't anticipate every scenario. You must always preserve a manual judgment path."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Exception handling design, like feature prioritization, needs to consider frequency and impact",
                                "Not all exceptions need human handling, and not all can be automated",
                            ],
                            explanation: "Exception handling matrix: High-frequency+Low-impact → Automated rules; Low-frequency+Low-impact → Simple process; High-frequency+High-impact → May need to modify the core process; Low-frequency+High-impact → Human+escalation. Process design isn't just about the happy path — considering exceptions is the mark of mature design.",
                            frameworkTip: "Interview bonus phrase: \"Beyond the normal flow, I would also consider exception handling paths and escalation mechanisms.\""
                        ),
                    ]
                ),
                Quest(
                    id: "6-6",
                    name: "Boss: Process Improvement Case",
                    description: "Complete process optimization interview question",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Complete Process Optimization Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Onboarding Process Improvement",
                                narrative: "You are a Business Systems Analyst at a 300-person tech company. The HR VP comes to you:\n\n\"From receiving an offer to the first day an employee can actually work, it takes an average of 15 business days. Employees complain they can't do anything the first week. Competitors' onboarding takes only 3 days.\"\n\nCurrent process:\n1. HR sends offer letter (1 day)\n2. Wait for employee to sign back (3 days waiting)\n3. HR notifies IT to create accounts (1 day)\n4. IT creates email + system permissions (2 days)\n5. HR notifies Finance to set up payroll (1 day)\n6. Finance sets up payroll and bank account (2 days)\n7. HR notifies Manager to prepare workspace and equipment (1 day)\n8. Manager arranges buddy and first week schedule (2 days)\n9. Employee's first day (Day 1)\n10. IT on-site laptop setup (2 days waiting for IT scheduling)",
                                data: [
                                    ["step": "HR sends offer", "processing": "30min", "wait": "0", "responsible": "HR"],
                                    ["step": "Wait for employee signing", "processing": "0", "wait": "3 days", "responsible": "Employee"],
                                    ["step": "Notify IT", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "IT creates accounts", "processing": "1hr", "wait": "1 day", "responsible": "IT"],
                                    ["step": "Notify Finance", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "Finance setup", "processing": "30min", "wait": "1.5 days", "responsible": "Finance"],
                                    ["step": "Notify Manager", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "Manager preparation", "processing": "2hr", "wait": "1.5 days", "responsible": "Manager"],
                                    ["step": "Employee first day", "processing": "-", "wait": "-", "responsible": "-"],
                                    ["step": "IT laptop setup", "processing": "1hr", "wait": "1 day", "responsible": "IT"],
                                ],
                                dataCaption: "Time Analysis per Step"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Notice the gap between processing time and wait time",
                                "Think about which steps can run simultaneously without waiting for the previous step",
                            ],
                            explanation: "Core process improvement thinking: Serialized → Parallelized, Manual → Automated, On-site-only → Pre-staged. In interviews, being able to walk through the complete Process Mapping → Bottleneck → Automation → Permissions → Exception Handling framework is an A+ answer.",
                            frameworkTip: "Process improvement in 5 steps: Map the process → Find bottlenecks → Parallelize + Automate → Add permission controls → Design exception handling"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 7: Experiment & Validation
        World(
            id: 7,
            name: "Experiment & Validation",
            emoji: "🧪",
            description: "A/B Testing, Hypotheses, and Validating Your Recommendations",
            quests: [
                Quest(
                    id: "7-1",
                    name: "Hypothesis Design",
                    description: "How to turn intuition into testable hypotheses",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Good Hypotheses vs Bad Hypotheses",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which hypothesis is the best? (Testable, has metrics, has logic)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Search Results Page Improvement",
                                narrative: "The PM thinks the search results page conversion is too low. You need to form a hypothesis first, then design an experiment to validate it.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "\"Search results are bad\"", explanation: "Too vague. What does \"bad\" mean? How do you measure it? This isn't a testable hypothesis."),
                                Challenge.Option(id: "B", text: "\"If we add product ratings and review counts to search results, users will make purchase decisions faster, and post-search add-to-cart rate will increase by 10%\"", explanation: "Correct! This hypothesis has: (1) A specific change (add ratings and review counts) (2) Underlying logic (helps purchase decisions) (3) A measurable expected outcome (add-to-cart rate +10%)."),
                                Challenge.Option(id: "C", text: "\"Users don't like our search\"", explanation: "Subjective judgment, can't be validated with data. Good hypotheses need specific behaviors and metrics."),
                                Challenge.Option(id: "D", text: "\"Improving the search algorithm will increase conversion\"", explanation: "Right direction but too vague. What does \"improve\" mean? Which \"conversion\"? Be more specific."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Good hypothesis structure: If we [make what change], then [what happens], because [why]",
                                "A hypothesis must be data-verifiable",
                            ],
                            explanation: "Good hypotheses have three elements: (1) A specific intervention (what change to make) (2) Expected outcome (what will happen, measurement metric) (3) Underlying rationale (why you think so). Being able to formulate good hypotheses in interviews shows structured thinking.",
                            frameworkTip: "Hypothesis formula: If [intervention], then [outcome], because [rationale]"
                        ),
                        Challenge(
                            id: 2,
                            name: "Prioritizing Hypotheses",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How would you prioritize validating these hypotheses?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Subscription Renewal Rate Decline",
                                narrative: "Your SaaS product's monthly renewal rate dropped from 92% to 87%. The team listed 4 hypotheses:\n\nH1: Recent 10% price increase caused price-sensitive customers to not renew\nH2: A competitor launched new features, attracting customers away\nH3: Customer usage declined (possibly due to a core feature bug)\nH4: Customer service response time increased, causing dissatisfaction",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Start with whatever seems most likely based on gut feeling", explanation: "Gut feeling is unreliable. Use data availability and impact to prioritize."),
                                Challenge.Option(id: "B", text: "First validate those easiest to confirm/rule out with existing data (H1 price and H3 usage), then investigate those requiring external data (H2 competitors)", explanation: "Correct! H1 can be checked with pre/post pricing churn comparison and price tier analysis; H3 can be checked with usage data and bug reports. These can be quickly validated with internal data. H2 and H4 require external research or deeper analysis — queue them later."),
                                Challenge.Option(id: "C", text: "Validate all four simultaneously — most efficient", explanation: "With limited resources, doing four analyses simultaneously will scatter focus. Prioritize ruling out the most likely and easiest to verify."),
                                Challenge.Option(id: "D", text: "Do customer interviews first — ask them directly why they didn't renew", explanation: "Interviews are great but take time to arrange. First use internal data to quickly eliminate some hypotheses, then use interviews for deeper understanding."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Validating hypotheses requires considering two factors: data availability and elimination efficiency",
                                "Hypotheses that can be quickly validated with existing data should come first",
                            ],
                            explanation: "Hypothesis validation priority: (1) Can be quickly validated with internal data first (low cost, high efficiency) (2) High impact gets priority (3) Those requiring external investigation come later. First eliminate the easy-to-eliminate hypotheses to narrow scope.",
                            frameworkTip: "In interviews, after listing hypotheses, proactively prioritize: \"I would validate H1 and H3 first since these can be quickly confirmed with internal data.\""
                        ),
                    ]
                ),
                Quest(
                    id: "7-2",
                    name: "A/B Test Fundamentals",
                    description: "Basic concepts of experiment design",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "A/B Test Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which A/B test design is most correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Checkout Page Redesign Test",
                                narrative: "The PM wants you to design an A/B test: change the checkout page from \"3 steps\" to \"1 page\" and see if conversion rate improves.\n\nCurrent checkout conversion rate is 65%. The PM hopes to reach 70%. DAU is about 50,000.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Route all traffic to the new version and see if conversion changes", explanation: "Without a control group, you can't confirm whether changes are due to the new design or other factors (season, campaigns, etc.)."),
                                Challenge.Option(id: "B", text: "50/50 random split, Control sees the original, Treatment sees the new version, run for 2 weeks, measure checkout conversion rate difference", explanation: "Correct! Random splitting ensures both groups are comparable. 50/50 provides sufficient sample size. 2 weeks covers complete weekday/weekend cycles. Primary metric is checkout conversion rate."),
                                Challenge.Option(id: "C", text: "Let users choose which version they want to use", explanation: "Self-selection creates selection bias — people who like trying new things may already be more active, making results unreliable."),
                                Challenge.Option(id: "D", text: "Show new users the new version and existing users the old version", explanation: "New and existing users behave differently by nature — you can't determine whether results are from the version difference or user difference."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A/B test keys: random splitting + control variables + sufficient sample size",
                                "Experiment duration should cover a complete business cycle",
                            ],
                            explanation: "Three A/B test essentials: (1) Random splitting (eliminates selection bias) (2) Control vs treatment groups (the only difference is what you're testing) (3) Sufficient sample size and duration (statistical significance). Demonstrating understanding of these three points in interviews is sufficient.",
                            frameworkTip: "A/B test design checklist: Define hypothesis → Choose metrics → Decide split ratio → Calculate sample size → Set experiment duration"
                        ),
                        Challenge(
                            id: 2,
                            name: "Interpreting Experiment Results",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How would you report these results?",
                            scenario: 
                            Challenge.Scenario(
                                title: "A/B Test Results Are In",
                                narrative: "The checkout page A/B test ran for 2 weeks. Results:",
                                data: [
                                    ["group": "Control (3 steps)", "users": "25000", "conversions": "16250", "rate": "65.0%"],
                                    ["group": "Treatment (1 page)", "users": "25000", "conversions": "16750", "rate": "67.0%"],
                                    ["group": "Difference", "users": "-", "conversions": "+500", "rate": "+2.0pp"],
                                ],
                                dataCaption: "A/B Test Results"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The new version won by 2% — recommend full rollout", explanation: "p-value = 0.08 > 0.05, so the result is not statistically significant. The 2% difference could be random fluctuation."),
                                Challenge.Option(id: "B", text: "Results are not significant (p=0.08) — recommend extending the experiment or increasing sample size", explanation: "Correct! The 2% lift looks promising, but the p-value didn't reach the threshold — it might just be random noise. Recommend extending the experiment (increasing sample size to improve power). You can also look at secondary metrics for additional judgment."),
                                Challenge.Option(id: "C", text: "The new version has no effect — abandon it", explanation: "Not significant doesn't mean \"no effect\" — just that current data isn't sufficient to prove it. Extending the experiment might yield a conclusion."),
                                Challenge.Option(id: "D", text: "p-value 0.08 is close to 0.05 — can be treated as significant", explanation: "Loosening the threshold ad hoc is not rigorous. If you think 0.05 is too strict, the threshold should have been set before the experiment, not adjusted afterward."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "p-value > 0.05 means the result is not statistically significant",
                                "Not significant ≠ no effect; it could be insufficient sample size",
                            ],
                            explanation: "Key to interpreting A/B test results: (1) Check statistical significance (p-value) (2) Check effect size (3) Check if guardrail metrics were affected. When results are not significant, the correct approach is to extend the experiment or increase sample size, not to immediately abandon or force a rollout.",
                            frameworkTip: "Interview golden phrase: \"The result is directionally positive, but the p-value hasn't reached significance. I recommend extending the experiment.\""
                        ),
                    ]
                ),
                Quest(
                    id: "7-3",
                    name: "Metric Selection & Guardrails",
                    description: "What metrics should experiments measure",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Choosing Experiment Metrics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What's the best metric design?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Recommendation Algorithm A/B Test",
                                narrative: "You're testing a new product recommendation algorithm. The new algorithm recommends more high-priced items.\n\nThe PM asks: \"What metrics should this experiment track?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Primary: Click-through rate (CTR)", explanation: "CTR only measures \"whether they clicked,\" not ultimate value. The new algorithm pushing high-priced items might actually lower click rates."),
                                Challenge.Option(id: "B", text: "Primary: Revenue per user / Guardrail: CTR, add-to-cart rate, return rate", explanation: "Correct! Primary metric directly measures business value (revenue). Guardrails ensure: (1) CTR doesn't drop significantly (users still click) (2) Add-to-cart rate doesn't decline (3) Return rate doesn't rise (don't push unwanted high-priced items that get returned)."),
                                Challenge.Option(id: "C", text: "Primary: Impression count", explanation: "Impression count measures whether recommendations are being displayed, not whether they're effective."),
                                Challenge.Option(id: "D", text: "Primary: Return rate", explanation: "Return rate is a guardrail (shouldn't worsen), not the primary (what you want to improve)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Primary metric should directly relate to the experiment's objective",
                                "Guardrails are \"must not worsen\" metrics — preventing side effects",
                            ],
                            explanation: "Three tiers of metric selection: (1) Primary — directly measures the experiment's objective (2) Secondary — supplementary understanding metrics (3) Guardrail — must not worsen. For recommendation algorithms, the guardrail should especially watch return rate — if pushing high-priced items increases returns, you actually lose money.",
                            frameworkTip: "Always set both primary and guardrail: \"I would use X to measure improvement, and Y to ensure no side effects.\""
                        ),
                    ]
                ),
                Quest(
                    id: "7-4",
                    name: "Sample Bias",
                    description: "Why your experiment results might be wrong",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Bias",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the biggest problem with this conclusion?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Feature Effect Assessment",
                                narrative: "The product team announces: \"Users of our new search feature have a 40% higher purchase rate than non-users! The new feature is a huge success!\"\n\nAs the analyst, you need to evaluate this conclusion.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A 40% lift is too large — data might be wrong", explanation: "A large lift doesn't necessarily mean wrong data. The problem is in the comparison method, not the number."),
                                Challenge.Option(id: "B", text: "Selection bias — Users who proactively use the new feature are already more active and have higher purchase intent", explanation: "Correct! This is classic selection bias. Users who proactively try new features are typically power users who were already more likely to purchase. Much of the 40% difference is probably not the feature's effect, but inherent user differences. An A/B test is needed to confirm causation."),
                                Challenge.Option(id: "C", text: "Sample size might not be large enough", explanation: "Even with sufficient sample size, the conclusion is still problematic — because the two groups weren't randomly assigned."),
                                Challenge.Option(id: "D", text: "Should look at retention instead of purchase rate", explanation: "Metric choice is debatable, but the core problem is comparison bias, not wrong metric selection."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Are users of the new feature and non-users inherently the same?",
                                "Comparisons without random splitting always risk selection bias",
                            ],
                            explanation: "Selection bias is the most common analytical trap. Comparisons between non-random self-selected groups cannot prove causation. Users chose to use the new feature → they may already be more active. Only A/B testing (random splitting) can eliminate this bias.",
                            frameworkTip: "In interviews, when you hear \"users of X perform better than non-users\" → immediately think selection bias."
                        ),
                    ]
                ),
                Quest(
                    id: "7-5",
                    name: "Correlation vs Causation",
                    description: "Correlation does not equal causation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Correlation vs Causation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What's wrong with this suggestion?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Service and Retention",
                                narrative: "Data analysis shows: Users who contacted customer service have a 90-day retention rate of 75%; those who didn't have 60%.\n\nThe product lead proposes: \"We should proactively encourage users to contact customer service — that will improve retention!\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Nothing wrong — the data clearly supports this suggestion", explanation: "The data shows correlation, not causation. Proactively contacting support won't necessarily improve retention."),
                                Challenge.Option(id: "B", text: "Contacting support may be a behavior of engaged users, not the cause of high retention. The causal direction might be reversed", explanation: "Correct! It's possible that because users are already very engaged (heavy product users), they contact support when they have issues instead of just leaving. The relationship is: engagement → contacting support + high retention, not: contacting support → high retention. Forcing users to contact support won't suddenly make inactive users become active."),
                                Challenge.Option(id: "C", text: "The 75% vs 60% difference might not be significant", explanation: "Statistical significance is a consideration, but the more fundamental issue is causation."),
                                Challenge.Option(id: "D", text: "Customer service cost is too high — not worth it", explanation: "Cost is one consideration, but the core question is whether \"encouraging support contact\" actually improves retention."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think: Does \"contacting support\" make people stay, or do \"people who stay\" happen to contact support more?",
                                "Correlation ≠ Causation. A and B appearing together doesn't mean A causes B",
                            ],
                            explanation: "Three possibilities for Correlation ≠ Causation: (1) A causes B (2) B causes A (reverse causation) (3) C causes both A and B (confounding variable). Here, \"user engagement\" may be a confounding variable — simultaneously causing both \"contacting support\" and \"high retention.\"",
                            frameworkTip: "In interviews, when you hear \"people with X perform better than those without\" → ask: \"Is this causal or correlational? Is there a confounding variable?\""
                        ),
                    ]
                ),
                Quest(
                    id: "7-6",
                    name: "Boss: Experiment Design Case",
                    description: "Design a complete validation plan",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Complete Experiment Design Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Pricing Strategy A/B Test",
                                narrative: "You are a Product Analyst at a SaaS company. The company currently has three plans:\n• Basic: $29/month (60% of users)\n• Pro: $79/month (30% of users)\n• Enterprise: $199/month (10% of users)\n\nThe CEO wants to test changing the Pro plan from $79 to $99 to see if it increases ARPU (Average Revenue Per User).\n\nHe asks you: \"Help me design an A/B test.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Pricing A/B tests have a special risk: if discovered by users, it severely damages trust",
                                "Short-term and long-term impacts can be completely opposite",
                            ],
                            explanation: "Pricing A/B tests are an advanced interview topic. The key is showing you know pricing tests are more sensitive than regular feature tests — there are PR risks, trust issues, and short-term vs long-term trade-offs. Being able to discuss these is senior-level thinking.",
                            frameworkTip: "Complete experiment design framework: Hypothesis → Metrics → Splitting → Risks → Result interpretation"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 8: Mock Interview
        World(
            id: 8,
            name: "Mock Interview",
            emoji: "🎯",
            description: "Comprehensive practice: Simulated interview case studies",
            quests: [
                Quest(
                    id: "8-1",
                    name: "Investigating a KPI Drop",
                    description: "Classic interview question: How to investigate a metric decline",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interview Practice: Metric Decline",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce GMV Down 20%",
                                narrative: "You are interviewing for a Business Analyst position at an e-commerce company. The interviewer asks:\n\n\"Our GMV (Gross Merchandise Value) dropped 20% last month compared to the previous month. How would you analyze this?\"\n\nThe interviewer gives you the following data:",
                                data: [
                                    ["metric": "GMV", "last_month": "$5.2M", "this_month": "$4.16M", "change": "-20%"],
                                    ["metric": "Orders", "last_month": "52,000", "this_month": "48,000", "change": "-7.7%"],
                                    ["metric": "AOV", "last_month": "$100", "this_month": "$86.7", "change": "-13.3%"],
                                    ["metric": "DAU", "last_month": "180K", "this_month": "175K", "change": "-2.8%"],
                                    ["metric": "Conversion Rate", "last_month": "2.9%", "this_month": "2.7%", "change": "-6.9%"],
                                ],
                                dataCaption: "Key Metrics"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "First decompose GMV into Orders x AOV — see which factor has more impact",
                                "Don't guess causes right away — first use data to narrow the scope",
                            ],
                            explanation: "\"KPI dropped\" is the most frequently asked interview question type. The perfect answer structure: Confirm the problem → Decompose metrics → Trend analysis → Segmentation → Form hypotheses → Validation plan → Recommend actions.",
                            frameworkTip: "Case Answer Framework: Goal → Metrics → Flow → Segment → Recommend → Validate"
                        ),
                    ]
                ),
                Quest(
                    id: "8-2",
                    name: "Was the Feature Successful?",
                    description: "Classic interview question: Feature evaluation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interview Practice: Feature Evaluation",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Evaluating Instagram Reels' Success",
                                narrative: "The interviewer asks:\n\n\"Assume you are a Product Analyst at Instagram. Reels has been live for 6 months. How would you evaluate whether it's successful?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "First think about why Reels exists — what's Instagram's strategic objective?",
                                "Consider the feature's impact on the overall app, not just the feature itself",
                            ],
                            explanation: "For big company feature evaluation interview questions, the key is thinking from a strategic perspective — don't just look at the feature's usage, but also its impact on the overall product and business. The cannibalization and trade-off discussion is especially important.",
                            frameworkTip: "Major feature evaluation: Objective → Metrics → Adoption x Engagement x Retention → Cannibalization → Trade-offs"
                        ),
                    ]
                ),
                Quest(
                    id: "8-3",
                    name: "How to Improve a Process",
                    description: "Classic interview question: Process improvement",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interview Practice: Process Improvement",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Service Process Improvement",
                                narrative: "The interviewer asks:\n\n\"Our customer service first response time is 24 hours, and the target is 4 hours. But we don't want to add more agents. What would you do?\"\n\nCurrent situation:\n• About 500 tickets per day\n• 15 agents, each handling 25-30 tickets per day\n• 60% are common questions (returns, password resets, shipping inquiries)\n• 40% require investigation before responding\n• No auto-classification mechanism — all manually assigned by supervisor",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Can't add headcount — so find ways to reduce the number of tickets that need manual handling",
                                "60% are common questions — that's the biggest automation opportunity",
                            ],
                            explanation: "The core of process improvement interview questions: improve efficiency without adding resources. Usually the answer is (1) Eliminate unnecessary steps (2) Automate repetitive work (3) Redistribute resources to high-value activities.",
                            frameworkTip: "Process improvement answer structure: Current state analysis → Bottleneck → Improvement plan → Quantify expected results → Risk management"
                        ),
                    ]
                ),
                Quest(
                    id: "8-4",
                    name: "Dashboard Design",
                    description: "Classic interview question: Design a dashboard",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interview Practice: Dashboard Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Product Executive Dashboard",
                                narrative: "The interviewer asks:\n\n\"Assume you are an analyst at a B2B SaaS company. The CEO wants you to design an executive dashboard that he can spend 5 minutes on each morning and understand the company's status. What would you include?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "The CEO only has 5 minutes — don't include too many numbers",
                                "A dashboard isn't just about displaying data — it should tell people whether action is needed",
                            ],
                            explanation: "The key to dashboard design interview questions: (1) Think from the audience's perspective (what does the CEO need?) (2) Have layers (summary → detail) (3) Be actionable (what numbers signal the need for action). More metrics isn't better.",
                            frameworkTip: "Dashboard design framework: Audience → Key Questions → Metrics → Layout → Action Triggers"
                        ),
                    ]
                ),
                Quest(
                    id: "8-5",
                    name: "User Segmentation",
                    description: "Classic interview question: User segmentation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interview Practice: User Segmentation",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Music Streaming App User Segmentation",
                                narrative: "The interviewer asks:\n\n\"You are a Product Analyst at a music streaming service (similar to Spotify). You need to help the marketing team with user segmentation so they can run different strategies for different groups. How would you do it?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "The purpose of segmentation is to deliver more relevant content to each group",
                                "Behavioral segmentation usually outperforms demographic segmentation",
                            ],
                            explanation: "Core of user segmentation interview questions: (1) Segmentation needs a purpose (what are you doing it for?) (2) Behavior > Demographics (3) Each group needs an actionable strategy (4) Segmentation effectiveness must be verifiable.",
                            frameworkTip: "Segmentation in 4 steps: Choose dimensions → Describe groups → Design strategies → Validate effectiveness"
                        ),
                    ]
                ),
                Quest(
                    id: "8-6",
                    name: "Boss: Complete Mock Interview",
                    description: "Full interview simulation (open-ended + AI scoring)",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Mock Interview — Comprehensive Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Food Delivery Platform Complete Case Study",
                                narrative: "You are interviewing for a Business Analyst position at a food delivery platform (similar to Uber Eats / DoorDash).\n\nThe interviewer gives you a scenario:\n\n\"We found that over the past three months, the Order Completion Rate in our city dropped from 95% to 88%. 'Incomplete' means the order was canceled (user canceled, restaurant canceled, or driver canceled).\n\nThis has already impacted user experience and merchant relationships. The CEO wants you to deliver analysis and improvement recommendations within two weeks.\"",
                                data: [
                                    ["month": "October", "total_orders": "850000", "completed": "807500", "completion_rate": "95.0%"],
                                    ["month": "November", "total_orders": "880000", "completed": "809600", "completion_rate": "92.0%"],
                                    ["month": "December", "total_orders": "920000", "completed": "809600", "completion_rate": "88.0%"],
                                ],
                                dataCaption: "Order Completion Rate Trend"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "First decompose: Who canceled? When? Where?",
                                "Notice order volume is increasing but completion rate is declining — this hints at supply-demand imbalance",
                            ],
                            explanation: "This is a complete interview Case Study. A good answer needs: (1) Structured decomposition (2) Multi-dimensional analysis (3) Logically-supported hypotheses (4) Actionable recommendations (5) A validation plan. It demonstrates that you can connect all the skills learned across the previous 7 worlds.",
                            frameworkTip: "Case Answer Framework: Goal → Metrics → Flow → Segment → Recommend → Validate — this is your interview weapon."
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 27: Requirements Analysis
        World(
            id: 27,
            name: "Requirements Analysis",
            emoji: "📋",
            description: "Learn to translate business needs into clear functional and non-functional requirements",
            quests: [
                Quest(
                    id: "27-1",
                    name: "Business Requirements vs User Requirements",
                    description: "Distinguish between BR and UR and their hierarchical relationship",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identify Requirement Level",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What type of requirement is \"allowing sales reps to view customer interaction history on their phones\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New CRM System Launch",
                                narrative: "You are a BA at a B2B SaaS company. The VP of Sales says:\n\n\"We need a new CRM so that our sales reps can view customer interaction history on their phones in real time.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Business Requirement", explanation: "A BR is a higher-level goal such as \"increase close rate.\" This statement is already specific to user behavior."),
                                Challenge.Option(id: "B", text: "User Requirement", explanation: "Correct! It describes what the user (sales rep) wants to do from their perspective = UR."),
                                Challenge.Option(id: "C", text: "Functional Requirement", explanation: "An FR is more technical, such as \"the API must return interaction records within 500ms.\""),
                                Challenge.Option(id: "D", text: "Non-Functional Requirement", explanation: "An NFR is a quality attribute, such as \"99.9% uptime.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BR is at the \"increase revenue\" level; UR is at the \"user wants to do X\" level",
                            ],
                            explanation: "Requirement hierarchy: BR (business goal) -> UR (user need) -> FR/NFR (how the system implements it).",
                            frameworkTip: "Requirement hierarchy: Business -> User -> Functional / Non-Functional"
                        ),
                        Challenge(
                            id: 2,
                            name: "Derive UR from BR",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which set of URs best supports \"reducing the return rate\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "High E-commerce Return Rate",
                                narrative: "CEO: \"The return rate has risen from 8% to 15%. We need to bring it back below 10% by next quarter.\" This is a clear BR.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1. More detailed product photos 2. Buyer reviews 3. AR preview", explanation: "Correct! Helping customers make better purchase decisions reduces returns at the source."),
                                Challenge.Option(id: "B", text: "1. Page load < 2s 2. Query < 200ms 3. CDN 99%", explanation: "These are NFRs, not URs."),
                                Challenge.Option(id: "C", text: "1. Limit returns to 2 per month 2. Charge handling fees 3. Shorten return window", explanation: "Restrictive policies hurt the user experience; the root cause should be addressed instead."),
                                Challenge.Option(id: "D", text: "1. Reduce return rate by 10% 2. Cut processing time in half 3. Reduce support volume by 30%", explanation: "These are KPI targets, not URs."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "URs are written from the user perspective",
                                "Root cause: wrong purchase -> insufficient information",
                            ],
                            explanation: "Deriving URs from a BR: Analyze root cause (returns -> wrong purchase -> insufficient info), then design solutions from the user perspective.",
                            frameworkTip: "BR -> Analyze root cause -> Design URs -> Each UR traces back to the BR"
                        ),
                    ]
                ),
                Quest(
                    id: "27-2",
                    name: "Functional vs Non-Functional Requirements",
                    description: "Distinguish between what the system does and how well it does it",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identify FR vs NFR",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which are Non-Functional Requirements?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Online Banking Transfer",
                                narrative: "Requirements list:\nA. Set daily transfer limits\nB. Page load <= 1.5s\nC. Support 10,000 concurrent transactions\nD. View 90-day transfer history",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A and D", explanation: "A and D describe what the system should \"do\" = FR."),
                                Challenge.Option(id: "B", text: "B and C", explanation: "Correct! B is a performance requirement and C is a scalability requirement = NFR."),
                                Challenge.Option(id: "C", text: "A and C", explanation: "A is an FR (functionality), C is an NFR."),
                                Challenge.Option(id: "D", text: "B and D", explanation: "D is an FR (viewing history is a function)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "FR = what it does, NFR = how well it does it",
                            ],
                            explanation: "FRs define behavior; NFRs define quality. Common NFRs: Performance, Scalability, Security, Availability.",
                            frameworkTip: "FR = What / NFR = How well (PASSME: Performance, Availability, Scalability, Security, Maintainability, Extensibility)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Quantifying NFRs",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which NFR best follows the SMART principle?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Search Feature NFR",
                                narrative: "The tech lead asks you to quantify \"search should be fast enough.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Search results should respond as quickly as possible", explanation: "Too vague to measure."),
                                Challenge.Option(id: "B", text: "API P95 <= 300ms, page load <= 1.5s, 1,000 concurrent users", explanation: "Correct! It includes metrics, percentiles, and load conditions, making it testable."),
                                Challenge.Option(id: "C", text: "Search response < 1 second", explanation: "Does not specify P50/P99, API vs. page, or load conditions."),
                                Challenge.Option(id: "D", text: "Use Elasticsearch with indexing latency < 5min", explanation: "Specifying a technology solution should not appear in an NFR."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A good NFR must be measurable and testable",
                            ],
                            explanation: "NFRs must be precise: what metric + under what conditions + what threshold.",
                            frameworkTip: "NFR formula: [Metric] under [Condition] <= [Value]"
                        ),
                    ]
                ),
                Quest(
                    id: "27-3",
                    name: "Requirements Elicitation Techniques",
                    description: "Use the right methods to gather requirements from different stakeholders",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Choose Elicitation Method",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most effective first elicitation method?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Onboarding System",
                                narrative: "8 HR staff each follow different processes, IT needs to coordinate, new hires report confusion, and managers find it slow.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Send out a survey", explanation: "With only 8 HR staff, a survey cannot provide sufficient depth."),
                                Challenge.Option(id: "B", text: "Job Shadowing", explanation: "Good but better as a second step."),
                                Challenge.Option(id: "C", text: "Cross-departmental Workshop", explanation: "Correct! Multiple departments can discuss simultaneously, uncover conflicts, and build consensus."),
                                Challenge.Option(id: "D", text: "Analyze SOP documents", explanation: "Each person may follow a different process, so there may be no unified SOP."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Multiple departments with different practices -- what method handles them all at once?",
                            ],
                            explanation: "Small group, cross-departmental -> Workshop; large scale -> Survey; unclear processes -> Observation; existing data -> Document analysis.",
                            frameworkTip: "Small cross-department group -> Workshop / Large group -> Survey / Unclear process -> Observation"
                        ),
                        Challenge(
                            id: 2,
                            name: "Handle Conflicting Requirements",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA handle the conflict?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Requirement Conflict",
                                narrative: "HR: \"We need standardization\"\nManager A: \"Engineers and sales are different\"\nIT: \"Account provisioning takes 3 days\"\nHR: \"They need to log in on day one\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Let senior leadership decide", explanation: "This skips analysis. The BA's value lies in analyzing first and then proposing solutions."),
                                Challenge.Option(id: "B", text: "Analyze root causes, find common goals, and propose a balanced solution", explanation: "Correct! Standardization + modularity; start IT provisioning early."),
                                Challenge.Option(id: "C", text: "Do everything", explanation: "Conflicting requirements cannot all be fulfilled simultaneously."),
                                Challenge.Option(id: "D", text: "Prioritize HR", explanation: "Other stakeholders should not be ignored."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "There are common goals behind every conflict",
                            ],
                            explanation: "BA conflict resolution: find root cause -> distinguish constraints vs. preferences -> identify common goals -> design a balanced solution.",
                            frameworkTip: "Identify conflict -> Analyze root cause -> Find common goals -> Balanced solution"
                        ),
                    ]
                ),
                Quest(
                    id: "27-4",
                    name: "Writing User Stories",
                    description: "Write high-quality User Stories using the INVEST principle",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INVEST Validation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which INVEST principles does this violate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Story Quality",
                                narrative: "Story: \"As a user, I want the system to be improved, so that it works better.\"\nINVEST = Independent, Negotiable, Valuable, Estimable, Small, Testable",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Independent", explanation: "Too vague to determine dependencies."),
                                Challenge.Option(id: "B", text: "Valuable + Estimable + Testable", explanation: "Correct! \"Improved\" and \"better\" cannot define value, be estimated, or be tested."),
                                Challenge.Option(id: "C", text: "Small", explanation: "Too vague to even judge size."),
                                Challenge.Option(id: "D", text: "Negotiable", explanation: "Being too vague actually makes anything negotiable."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "\"Improved\" is a warning sign -- it cannot be measured",
                            ],
                            explanation: "Improved version: \"As a sales rep, I want to see the last 30 days of customer interaction history, so that I can prepare before meetings.\"",
                            frameworkTip: "INVEST: I Independent / N Negotiable / V Valuable / E Estimable / S Small / T Testable"
                        ),
                        Challenge(
                            id: 2,
                            name: "Splitting Epics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which splitting approach best follows INVEST?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Epic Decomposition",
                                narrative: "Epic: \"Build a customer self-service portal\" includes: view orders, returns, update profile, invoice management",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "By technical layer: Frontend / Backend / DB / Testing", explanation: "Violates Valuable -- a frontend-only story delivers no user value."),
                                Challenge.Option(id: "B", text: "By feature: View orders / Returns / Update profile / Invoices", explanation: "Correct! Each is independent, valuable, estimable, and testable."),
                                Challenge.Option(id: "C", text: "By Sprint percentage", explanation: "Meaningless. 50% front-end and back-end is unusable."),
                                Challenge.Option(id: "D", text: "Don't split; put it all in one Sprint", explanation: "Four major features cannot be completed in one Sprint."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "After each Story is completed, the user should have a usable feature",
                            ],
                            explanation: "Splitting by feature (vertical slice) ensures each Story is end-to-end usable.",
                            frameworkTip: "Split by user feature (vertical slice), not by technical layer (horizontal slice)"
                        ),
                    ]
                ),
                Quest(
                    id: "27-5",
                    name: "Writing Acceptance Criteria",
                    description: "Write verifiable acceptance criteria using Given-When-Then",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Given-When-Then",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which AC is best?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Return Feature AC",
                                narrative: "Story: \"As a customer, I want to submit a return request online.\"\nThe PM requires Given-When-Then format.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Given logged in, When click return, Then process return", explanation: "Too vague."),
                                Challenge.Option(id: "B", text: "Given a completed order within 14 days, When selecting the order and submitting a reason, Then a request is created + status changes to \"Processing\" + confirmation email sent", explanation: "Correct! Has preconditions, trigger, and verifiable results."),
                                Challenge.Option(id: "C", text: "Returns should be easy, fast, and bug-free", explanation: "This is not an AC."),
                                Challenge.Option(id: "D", text: "Given any customer, When returning, Then success", explanation: "Missing constraint conditions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Given defines preconditions",
                                "Then must be directly testable by QA",
                            ],
                            explanation: "Given sets the scenario constraints, When defines the action, Then describes verifiable results.",
                            frameworkTip: "AC: Is the Given precondition clear? -> Is the When action specific? -> Is the Then verifiable?"
                        ),
                        Challenge(
                            id: 2,
                            name: "Edge Case AC",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which set of Edge Case ACs is most complete?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Edge Cases",
                                narrative: "QA Lead asks: \"When should a return be rejected?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Cannot return after 14 days + already returned items cannot be returned again", explanation: "Two edge cases are not comprehensive enough."),
                                Challenge.Option(id: "B", text: "1. Past deadline -> show deadline message 2. Already returned -> show \"already submitted\" 3. Non-returnable item -> only show returnable items 4. System error -> preserve entered data", explanation: "Correct! Covers time limits, duplicates, partial eligibility, and system errors."),
                                Challenge.Option(id: "C", text: "Show \"failed, please contact support\" for everything", explanation: "Poor UX."),
                                Challenge.Option(id: "D", text: "Past deadline + Amount > $1000 requires review + Reason must be 50 characters", explanation: "Includes unreasonable restrictions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Edge cases: exceeding limits, duplicates, partial applicability, system errors",
                            ],
                            explanation: "Complete ACs cover: business rules, data states, system exceptions, and user errors.",
                            frameworkTip: "Edge Case quadrants: Business rules / Data states / System exceptions / User errors"
                        ),
                    ]
                ),
                Quest(
                    id: "27-6",
                    name: "Complete Requirements Document",
                    description: "Integrate all skills to write a complete requirements document",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Complete Requirements Document",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Online Appointment System",
                                narrative: "You are a BA at a chain of clinics. Phone appointments receive 200 calls daily with 30% going unanswered. You need to build an online appointment system.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Start from the BR",
                                "Write Stories for different roles",
                            ],
                            explanation: "A complete requirements document chains BR -> Stories -> AC -> NFR -> Edge Cases together.",
                            frameworkTip: "BR -> Stories (INVEST) -> AC (GWT) -> NFR (SMART) -> Edge Cases"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 28: Stakeholder Management
        World(
            id: 28,
            name: "Stakeholder Management",
            emoji: "🤝",
            description: "Learn to identify, analyze, and manage different stakeholder expectations and influence",
            quests: [
                Quest(
                    id: "28-1",
                    name: "Stakeholder Identification",
                    description: "Identify all stakeholders that need to be managed in a project",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identify the Sponsor",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Who is most likely the Project Sponsor?",
                            scenario: 
                            Challenge.Scenario(
                                title: "ERP Upgrade",
                                narrative: "You are responsible for an ERP upgrade. Relevant people:\n- CFO (funder)\n- IT Director (technical implementation)\n- Warehouse Manager (daily ERP user)\n- External ERP Consultant",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "IT Director", explanation: "IT is the execution side; the Sponsor is the one who funds and authorizes."),
                                Challenge.Option(id: "B", text: "CFO", explanation: "Correct! The Sponsor has the authority and budget to drive the project."),
                                Challenge.Option(id: "C", text: "Warehouse Manager", explanation: "An important end user but lacks final decision-making authority."),
                                Challenge.Option(id: "D", text: "External Consultant", explanation: "A consultant is an external resource without decision-making authority."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sponsor = funds + has authority to drive/terminate the project",
                            ],
                            explanation: "Stakeholder roles: Sponsor (funds and authorizes), SME (domain expertise), End User (uses the system), Decision Maker.",
                            frameworkTip: "Stakeholder roles: Sponsor / Decision Maker / SME / End User / Influencer"
                        ),
                        Challenge(
                            id: 2,
                            name: "Missing Stakeholders",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What common mistake does this illustrate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Unexpected Issues",
                                narrative: "Two months into the ERP project:\n1. Finance complains report formats don't match bank requirements\n2. Legal says tax regulations aren't met\n3. External audit needs an audit trail feature",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Didn't create a Power/Interest Grid", explanation: "If stakeholders are missed entirely, the Grid is useless."),
                                Challenge.Option(id: "B", text: "Focused only on direct users, overlooking indirect stakeholders and external constraints", explanation: "Correct! Finance/Legal/Audit don't use the system daily but have compliance requirements."),
                                Challenge.Option(id: "C", text: "Not enough interviews", explanation: "The root cause is failing to identify these people in the first place."),
                                Challenge.Option(id: "D", text: "Unclear scope", explanation: "The fundamental issue is incomplete stakeholder analysis."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Who doesn't use the system directly but is still affected?",
                            ],
                            explanation: "Three-circle model: (1) Direct users (2) Indirect stakeholders (3) External constraint parties.",
                            frameworkTip: "Stakeholder three circles: Direct users -> Indirect influencers -> External constraints"
                        ),
                    ]
                ),
                Quest(
                    id: "28-2",
                    name: "Power/Interest Grid Analysis",
                    description: "Use a two-dimensional matrix to determine management strategies",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Position Stakeholders",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the management strategy for the CFO?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Grid Classification",
                                narrative: "| Stakeholder | Power | Interest |\n|---|---|---|\n| CFO | High | Low |\n| Warehouse Mgr | Low | High |\n| IT Director | High | High |\n| Customer Service | Low | Low |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Manage Closely", explanation: "CFO has low Interest; close management is not needed."),
                                Challenge.Option(id: "B", text: "Keep Satisfied", explanation: "Correct! High power, low interest -- periodic executive summaries are sufficient."),
                                Challenge.Option(id: "C", text: "Keep Informed", explanation: "This is the strategy for the Warehouse Manager."),
                                Challenge.Option(id: "D", text: "Monitor", explanation: "This is the strategy for Customer Service."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Power = can make decisions? Interest = cares about details?",
                            ],
                            explanation: "Grid quadrants: H/H -> Manage Closely, H/L -> Keep Satisfied, L/H -> Keep Informed, L/L -> Monitor.",
                            frameworkTip: "High Power/High Interest -> Manage Closely / High Power/Low Interest -> Keep Satisfied / Low Power/High Interest -> Keep Informed / Low Power/Low Interest -> Monitor"
                        ),
                        Challenge(
                            id: 2,
                            name: "Dynamic Grid Adjustment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should you adjust your communication strategy?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Quadrant Shift",
                                narrative: "The CFO suddenly shows High Interest: the budget is 20% over and the board is questioning ROI. They request weekly 1-on-1 meetings.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Maintain monthly reports", explanation: "The situation has changed; monthly frequency is insufficient."),
                                Challenge.Option(id: "B", text: "Send daily emails", explanation: "Over-communication wastes executive time."),
                                Challenge.Option(id: "C", text: "Weekly executive briefing + proactively present cost control measures", explanation: "Correct! Increase frequency, provide information they care about, and demonstrate control."),
                                Challenge.Option(id: "D", text: "Ask the PM to handle it", explanation: "Passing the buck during a crisis erodes trust."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "The Grid is dynamic and changes with events",
                            ],
                            explanation: "Events can change a stakeholder's interest level. BAs must continuously monitor and adjust.",
                            frameworkTip: "Dynamic Grid: Reassess regularly -> Adjust based on events"
                        ),
                    ]
                ),
                Quest(
                    id: "28-3",
                    name: "Communication Plan Design",
                    description: "Design an effective communication plan",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Communication Plan Issues",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the biggest problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Communication Matrix",
                                narrative: "| Audience | Frequency | Method |\n|---|---|---|\n| CFO | Monthly | Email |\n| IT | Daily | Standup |\n| Warehouse Mgr | As needed | Phone |\n| Procurement | Before go-live | Training |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CFO frequency is too low", explanation: "Keep Satisfied monthly is acceptable."),
                                Challenge.Option(id: "B", text: "The Warehouse Manager is a High Interest daily user; \"as needed\" will make them feel ignored", explanation: "Correct! High-interest stakeholders should not receive only reactive communication."),
                                Challenge.Option(id: "C", text: "Procurement should be involved earlier", explanation: "A good suggestion but not the biggest problem."),
                                Challenge.Option(id: "D", text: "IT doesn't need daily meetings", explanation: "Daily standups are common in Agile projects."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "High Interest stakeholders fear being \"forgotten\" most",
                            ],
                            explanation: "The communication plan must align with the Grid. High Interest stakeholders need regular proactive communication.",
                            frameworkTip: "Communication 5W: Who / When / What / How / Why"
                        ),
                        Challenge(
                            id: 2,
                            name: "Delivering Bad News",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the most professional way to report?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Managing Up",
                                narrative: "The project is delayed by 3 weeks. You need to report to the CFO and VP next week.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Lead with good news and downplay the bad at the end", explanation: "Hiding bad news erodes trust."),
                                Challenge.Option(id: "B", text: "State the issue upfront -> explain causes -> present remediation plan -> request decisions", explanation: "Correct! Be direct about facts, explain reasons, propose solutions, and request support."),
                                Challenge.Option(id: "C", text: "Apologize first, then list details", explanation: "Executives want \"problem, impact, solution\" -- not detailed minutiae."),
                                Challenge.Option(id: "D", text: "Wait until you have a complete solution before reporting", explanation: "Delaying bad news is the most dangerous approach."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Bad news + solution is far better than hiding bad news",
                            ],
                            explanation: "Managing up: Don't hide issues, bring solutions with problems, and clarify what decisions are needed.",
                            frameworkTip: "Bad news structure: Facts -> Impact -> Causes -> Proposed solution -> Request"
                        ),
                    ]
                ),
                Quest(
                    id: "28-4",
                    name: "Expectation Management",
                    description: "Manage expectations to avoid \"surprises\"",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Scope Change",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best response?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Scope Creep",
                                narrative: "CFO: \"Since we're upgrading anyway, can we add BI reports?\" BI was not in the original scope.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "\"No problem, we'll add it\"", explanation: "Scope creep. Without adjusting time and resources, this will cause delays."),
                                Challenge.Option(id: "B", text: "\"Let me assess the impact and provide an impact analysis for decision-making next week\"", explanation: "Correct! Acknowledge the need -> commit to analysis -> let the Sponsor make an informed decision."),
                                Challenge.Option(id: "C", text: "\"It's out of scope, we can't add it\"", explanation: "Directly refusing the Sponsor is unwise."),
                                Challenge.Option(id: "D", text: "\"Ask the IT Director\"", explanation: "Deflecting is unprofessional."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA = helps make decisions, not makes decisions for others",
                            ],
                            explanation: "Use impact analysis to enable stakeholders to make informed decisions based on complete information.",
                            frameworkTip: "Scope change: Acknowledge the need -> Analyze impact -> Present options -> Decision maker chooses"
                        ),
                        Challenge(
                            id: 2,
                            name: "Setting Realistic Expectations",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How do you manage expectations?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Time Pressure",
                                narrative: "CEO wants a 3-month launch. Your assessment is a minimum of 6 months.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Agree to 3 months and work overtime", explanation: "Promising the unachievable is the most dangerous move."),
                                Challenge.Option(id: "B", text: "Phased approach: Core modules in Q3 (80% of value), advanced features in Q4", explanation: "Correct! Reframe: deliver 80% of the value in 3 months. MVP mindset."),
                                Challenge.Option(id: "C", text: "Simply say it can't be done and ask for 6 months", explanation: "Not providing alternatives is unprofessional."),
                                Challenge.Option(id: "D", text: "Let the PM handle it", explanation: "Avoidance won't make the problem disappear."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Reframe: turn \"no\" into \"a better approach\"",
                            ],
                            explanation: "Don't say No -- reframe: propose alternatives that show the decision maker a better path.",
                            frameworkTip: "Expectation reframing: Not \"can't be done\" but \"a better approach is...\" + data"
                        ),
                    ]
                ),
                Quest(
                    id: "28-5",
                    name: "Conflict Resolution",
                    description: "Handle conflicts between stakeholders",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Interest Conflict",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Department Conflict",
                                narrative: "CRM requirements:\n- Sales Dept: \"Track individual performance rankings\"\n- Sales Reps: \"Don't want colleagues seeing my clients\"\n- Management: \"Need full pipeline visibility\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Follow management's requirements", explanation: "Ignoring rep privacy will lead to system resistance."),
                                Challenge.Option(id: "B", text: "Tiered permissions: Reps see their own, Managers see team, VP sees all", explanation: "Correct! RBAC resolves the conflict -- each party sees only the information they need."),
                                Challenge.Option(id: "C", text: "Vote on it", explanation: "Voting doesn't solve the fundamental problem."),
                                Challenge.Option(id: "D", text: "Don't build rankings", explanation: "Avoidance is not a solution."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Technical solutions can often resolve people conflicts",
                            ],
                            explanation: "BA conflict resolution means not taking sides, but finding technical/process solutions that accommodate all parties.",
                            frameworkTip: "Conflict resolution: Understand each party -> Find common goals -> Technical/process accommodation"
                        ),
                        Challenge(
                            id: 2,
                            name: "Budget Competition",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the BA's role?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Resource Competition",
                                narrative: "Marketing wants $200K for Marketing Automation, Customer Service wants $150K for Help Desk upgrade. Budget is only $200K. CEO asks you to analyze.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Pick one to recommend", explanation: "The BA does not make the decision directly."),
                                Challenge.Option(id: "B", text: "ROI analysis + strategic alignment analysis, present trade-offs for the CEO to make an informed decision", explanation: "Correct! Neutral analyst -- use data to turn subjective arguments into objective comparisons."),
                                Challenge.Option(id: "C", text: "Suggest doing both but at reduced scope", explanation: "This might be one option but shouldn't be the only suggestion."),
                                Challenge.Option(id: "D", text: "Let the two departments sort it out", explanation: "Abdicating the analysis responsibility."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The BA's value is in \"analyzing and presenting,\" not \"deciding\"",
                            ],
                            explanation: "In conflicts, the BA serves as a neutral analyst, using data to help decision-makers choose based on facts.",
                            frameworkTip: "BA in conflict: Gather requirements -> Quantitative analysis -> Present trade-offs -> Decision maker chooses"
                        ),
                    ]
                ),
                Quest(
                    id: "28-6",
                    name: "Stakeholder Management Strategy Case",
                    description: "Apply management techniques comprehensively",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Strategy Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Digital Transformation",
                                narrative: "You are the BA at a traditional manufacturing company responsible for ERP+CRM transformation.\nStakeholders: CEO (driving it), CFO (questioning ROI), Plant Manager (fears being replaced), IT (understaffed), Frontline Workers (resistant), External Consultant.\nBudget $500K, 12 months.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Different people \"fear\" different things",
                                "Resistance usually stems from fear of losing control or inadequate skills",
                            ],
                            explanation: "Complete management: Analysis (Grid) -> Communication Plan -> Conflict Prevention -> Change Management.",
                            frameworkTip: "Stakeholder Management = Grid + Communication + Conflict Handling + Change Management (ADKAR)"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 29: Business Document Writing
        World(
            id: 29,
            name: "Business Document Writing",
            emoji: "📝",
            description: "Master writing skills for BRDs, FRDs, meeting minutes, and other business documents",
            quests: [
                Quest(
                    id: "29-1",
                    name: "BRD Structure and Writing",
                    description: "Learn to write a Business Requirements Document",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Core BRD Sections",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What are the most critical sections of a BRD?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BRD Structure",
                                narrative: "You are writing a BRD for an e-commerce loyalty program. Your manager says the BRD should be understandable by non-technical decision-makers.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Technical Architecture", explanation: "Technical architecture belongs in a Technical Design Document, not a BRD."),
                                Challenge.Option(id: "B", text: "Business Objectives + Scope + Stakeholders + Success Metrics", explanation: "Correct! Why are we doing this -> What is in/out of scope -> Who is involved -> How do we measure success."),
                                Challenge.Option(id: "C", text: "Database Schema and API Endpoints", explanation: "Technical details belong in the FRD or Tech Spec."),
                                Challenge.Option(id: "D", text: "Test Cases and UAT Plan", explanation: "Testing documentation is outside the BRD scope."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BRD = Business, targeted at non-technical decision-makers",
                            ],
                            explanation: "A BRD covers \"why we're doing it\" and \"what we're doing,\" not \"how.\" The audience is business decision-makers.",
                            frameworkTip: "BRD: Background -> Objectives -> Scope (In/Out) -> Stakeholders -> Requirements -> Metrics -> Timeline"
                        ),
                        Challenge(
                            id: 2,
                            name: "Scope In/Out",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should you define the Scope?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Scope Definition",
                                narrative: "Loyalty program BRD. PM wants V1 to include: points, tiers, referral rewards, personalized recommendations, and social features. You assess that only a portion can be done within the 6-month timeline.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Put everything in In-Scope and see how much gets done", explanation: "Without clear boundaries, this leads to scope creep."),
                                Challenge.Option(id: "B", text: "In-Scope: Points + Tiers (core value); Out-of-Scope: Referral rewards + Personalization + Social (Phase 2)", explanation: "Correct! Deliver core value first (points + tiers), defer the rest to Phase 2. Explicitly state Out-of-Scope to prevent scope creep."),
                                Challenge.Option(id: "C", text: "Only write In-Scope, skip Out-of-Scope", explanation: "Not writing Out-of-Scope makes people assume \"anything not mentioned is included.\""),
                                Challenge.Option(id: "D", text: "Let the PM decide the scope alone", explanation: "The BA should assist with analysis and make recommendations."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Out-of-Scope is as important as In-Scope",
                                "Deliver core value first = MVP mindset",
                            ],
                            explanation: "Scope definition must explicitly state both In and Out. Out-of-Scope doesn't mean \"won't do\" but \"won't do in this version.\"",
                            frameworkTip: "Scope = In-Scope (what we do) + Out-of-Scope (what we don't) + Assumptions"
                        ),
                    ]
                ),
                Quest(
                    id: "29-2",
                    name: "FRD Writing",
                    description: "Translate requirements into a technically implementable FRD",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "FRD vs BRD",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which description is most accurate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Document Differences",
                                narrative: "A newcomer asks: \"What's the difference between a BRD and an FRD? When do you write which?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "BRD and FRD are different names for the same document", explanation: "Completely different. BRD is business-facing; FRD is technical-facing."),
                                Challenge.Option(id: "B", text: "BRD defines \"why + what\" (for decision-makers); FRD defines \"how the system does it\" (for the dev team)", explanation: "Correct! Write the BRD first to confirm business direction, then the FRD to translate requirements into technical specifications."),
                                Challenge.Option(id: "C", text: "FRD is written first, BRD later", explanation: "Reversed order. Confirm business requirements (BRD) before writing technical specs (FRD)."),
                                Challenge.Option(id: "D", text: "Small projects don't need a BRD; just write an FRD", explanation: "Even small projects need to clarify \"why.\" You can simplify but shouldn't skip it."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Who reads the BRD? Who reads the FRD?",
                            ],
                            explanation: "BRD -> FRD flow: Business objectives -> User requirements -> Functional specifications -> Technical implementation.",
                            frameworkTip: "BRD (Why+What, for decision-makers) -> FRD (How, for developers)"
                        ),
                        Challenge(
                            id: 2,
                            name: "FRD Level of Detail",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which version belongs in the FRD?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Points System FRD",
                                narrative: "You are writing the FRD for a points system. The BRD says \"customers earn points on purchases.\" You need to define specific rules in the FRD.\n\nTwo versions:\nV1: \"Customers earn points when they make purchases\"\nV2: \"Customers earn 1 point per $1 NTD spent. Points are credited instantly upon transaction completion. Purchases under $100 do not earn points. Points expire 12 months from the date earned.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "V1 -- concise and clear", explanation: "V1 is too vague. Developers won't know: how many points per dollar? When are they credited? Is there a minimum? Expiration?"),
                                Challenge.Option(id: "B", text: "V2 -- has specific rules and boundary conditions", explanation: "Correct! The FRD must be specific enough for developers to implement directly. V2 defines calculation rules, trigger timing, minimum threshold, and expiration."),
                                Challenge.Option(id: "C", text: "Both are too simple; the FRD should contain code", explanation: "The FRD specifies logic rules, not code. Code is the developer's responsibility."),
                                Challenge.Option(id: "D", text: "V1 goes in the FRD, V2 in the Tech Spec", explanation: "V2's content is exactly what the FRD should contain. A Tech Spec would be more technical (API design, DB schema)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The FRD must answer developer questions: how much? when? under what conditions?",
                            ],
                            explanation: "The gold standard for an FRD: After reading it, developers should not need to ask the BA any questions before writing code.",
                            frameworkTip: "FRD check: Can the developer implement directly after reading? If they still have questions, it's not specific enough."
                        ),
                    ]
                ),
                Quest(
                    id: "29-3",
                    name: "Meeting Minutes Writing",
                    description: "Write effective meeting minutes and Action Items",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Meeting Minutes Essentials",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most important element of meeting minutes?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Requirements Meeting Minutes",
                                narrative: "You just finished a requirements discussion meeting. The PM wants you to send out meeting minutes within 30 minutes. There was a lot of discussion and some off-topic tangents.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Verbatim transcript -- record every word everyone said", explanation: "A transcript is too lengthy and nobody reads it. The focus should be on decisions and actions."),
                                Challenge.Option(id: "B", text: "Decisions + Action Items (with owners and deadlines) + Open Issues (unresolved)", explanation: "Correct! Three core elements: what decisions were made, who needs to do what, and what remains unresolved."),
                                Challenge.Option(id: "C", text: "Attendance list and meeting time", explanation: "These are basic information but not the most important. Minutes without action items are useless."),
                                Challenge.Option(id: "D", text: "Complete discussion process", explanation: "The discussion can be summarized but isn't the focus. The focus is conclusions and actions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Meeting minutes readers want to know: What was decided? What do I need to do?",
                            ],
                            explanation: "Three core elements of meeting minutes: Decisions (avoid re-discussion), Action Items (ensure follow-up), Open Issues (clarify unresolved items).",
                            frameworkTip: "Meeting minutes = Decisions + Action Items (Who/What/When) + Open Issues"
                        ),
                        Challenge(
                            id: 2,
                            name: "Action Item Quality",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which are good Action Items?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Action Item Quality",
                                narrative: "Your action items:\n\n1. \"Look into competitors\" -- PM\n2. \"John to provide API docs (including endpoint list and rate limit specs) by 3/15\"\n3. \"Everyone think about next steps\"\n4. \"Sarah to complete user interviews (5 customers) by 3/12, deliver interview summary\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1 and 3", explanation: "1 has no deadline or deliverable; 3 has no owner. Both are inadequate."),
                                Challenge.Option(id: "B", text: "2 and 4", explanation: "Correct! Both have: Owner (Who) + Specific deliverable (What) + Deadline (When)."),
                                Challenge.Option(id: "C", text: "Only 2", explanation: "4 is also excellent: has owner, deadline, and specific deliverable."),
                                Challenge.Option(id: "D", text: "All of them", explanation: "1 and 3 are too vague to track."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Good AI = Who + What (specific deliverable) + When (deadline)",
                            ],
                            explanation: "Vague action items won't get executed. They must be specific enough to track: who, what, and by when.",
                            frameworkTip: "Action Item formula: [Who] completes [What (specific deliverable)] by [When]"
                        ),
                    ]
                ),
                Quest(
                    id: "29-4",
                    name: "Status Update Writing",
                    description: "Write clear progress reports",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "RAG Status",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most accurate RAG status for each?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Weekly RAG Report",
                                narrative: "Your project weekly report uses RAG (Red/Amber/Green) status:\n\n- Schedule: 2 days late (planned 3/15, expected 3/17)\n- Budget: Spent 45% of budget, at 40% progress\n- Scope: No scope changes\n- Quality: UAT found 3 critical bugs",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Schedule Green, Budget Green, Scope Green, Quality Green", explanation: "Ignores the delay, budget variance, and critical bugs. Too optimistic."),
                                Challenge.Option(id: "B", text: "Schedule Amber, Budget Amber, Scope Green, Quality Red", explanation: "Correct! Schedule minor delay = Amber, Budget spending ahead of progress = Amber, Scope no changes = Green, 3 critical bugs = Red."),
                                Challenge.Option(id: "C", text: "All Red", explanation: "Overly pessimistic. Scope is fine and Schedule is only 2 days late."),
                                Challenge.Option(id: "D", text: "Schedule Red, Budget Green, Scope Green, Quality Amber", explanation: "2-day delay is not Red (typically >1 week for Red). 3 critical bugs are worse than Amber."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "RAG must be objective: Green = on track, Amber = at risk, Red = needs intervention",
                            ],
                            explanation: "RAG status must objectively reflect reality. Being too optimistic erodes trust; being too pessimistic causes panic.",
                            frameworkTip: "RAG: Green = on track / Amber = at risk, needs attention / Red = issue, needs intervention"
                        ),
                        Challenge(
                            id: 2,
                            name: "Status Report Structure",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which format is more suitable for the Steering Committee?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Weekly Report Structure",
                                narrative: "You submit a weekly Status Update to the Steering Committee every Friday. Here are two formats:\n\nA: \"Did a lot this week -- had 5 meetings, wrote 3 documents, confirmed architecture with IT...\"\n\nB: \"Summary: UAT Phase 1 is 80% complete.\nAchievements: 1. Completed 15/20 test cases 2. Fixed 2 critical bugs.\nRisks: 3 critical bugs pending; if not fixed by 3/17, launch timeline is at risk.\nNext Week: 1. Fix remaining bugs 2. Begin Phase 2 testing.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A -- shows detailed work effort", explanation: "Executives don't care how busy you were; they care about progress, risks, and what decisions are needed."),
                                Challenge.Option(id: "B", text: "B -- summary + achievements + risks + next week's plan", explanation: "Correct! A structured report lets readers grasp the situation in 30 seconds. Executives value results and risks, not process."),
                                Challenge.Option(id: "C", text: "Combine both for completeness", explanation: "A's details are too much for the Steering Committee."),
                                Challenge.Option(id: "D", text: "Verbal report is sufficient; no need for written form", explanation: "Written records are important: traceable and shareable with absentees."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The audience is executives: they need to grasp the situation in 30 seconds",
                            ],
                            explanation: "Status reports should be structured: Summary -> Achievements -> Risks -> Next Steps. Let readers quickly grasp the key points.",
                            frameworkTip: "Weekly report structure: Summary -> Achievements -> Risks/Issues -> Next Week Plan"
                        ),
                    ]
                ),
                Quest(
                    id: "29-5",
                    name: "Executive Summary Writing",
                    description: "Write persuasive summaries using the SCQA framework",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SCQA Framework",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which SCQA is most persuasive?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Executive Summary",
                                narrative: "You need to write an Executive Summary for a \"Customer Self-Service Portal\" project for C-Level review.\n\nYou use the SCQA framework:\nS (Situation): Current state\nC (Complication): Problem\nQ (Question): Key question\nA (Answer): Proposed solution",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "S: We want to build a portal C: Need budget Q: Can we? A: Please approve", explanation: "No business justification. \"We want to\" is not persuasive."),
                                Challenge.Option(id: "B", text: "S: 8,000 monthly support calls; 70% are self-serviceable (order inquiries/returns) C: Each call costs $15; $1.44M/year spent on automatable services Q: How to reduce costs while improving CX A: Build self-service portal; estimated $1M/year savings + improved CSAT", explanation: "Correct! Has data (8,000 calls, $15/call, $1.44M), pain point (high cost), solution (self-service portal), and expected outcome (save $1M)."),
                                Challenge.Option(id: "C", text: "S: Competitors all have self-service portals C: We don't Q: Should we build one? A: Recommend yes", explanation: "Too weak. \"Others have it so we should too\" is not a compelling business case."),
                                Challenge.Option(id: "D", text: "S: Technically feasible C: Requires 6 months of development Q: What technology? A: React + Node.js", explanation: "Presenting a technical solution to C-Level is the wrong audience approach."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "C-Level cares about: business impact, ROI, risk",
                            ],
                            explanation: "SCQA gives an Executive Summary logic and persuasion. The key is quantifying the problem and benefits with data.",
                            frameworkTip: "SCQA: Situation (current state) -> Complication (pain point) -> Question (key question) -> Answer (recommendation + expected outcome)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Summary Length",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the problem with a 3-page Executive Summary?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Summary Length",
                                narrative: "Your BRD is 20 pages. Your manager asks you to add a one-page Executive Summary. You wrote 3 pages.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "No problem; completeness is most important", explanation: "Executives don't have time to read a 3-page summary. If the summary isn't much shorter than the body, it defeats its purpose."),
                                Challenge.Option(id: "B", text: "Too long. An Executive Summary should be 1 page or less, letting readers grasp key points in 2 minutes", explanation: "Correct! The purpose of a Summary is to let busy executives quickly determine: (1) What do I need to know (2) What decisions are needed. Beyond 1 page, it's no longer a Summary."),
                                Challenge.Option(id: "C", text: "Should be longer with more details", explanation: "Opposite direction. Summaries should be concise."),
                                Challenge.Option(id: "D", text: "Length doesn't matter; format is what counts", explanation: "Length is a core constraint of an Executive Summary."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "\"Executive\" implies the reader is very busy",
                                "The value of a Summary = convey maximum information in minimum words",
                            ],
                            explanation: "Golden rule for Executive Summaries: 1 page. If more detail is needed, place it in the corresponding section of the main document.",
                            frameworkTip: "Executive Summary = 1 page (the biggest challenge is \"what to cut\" not \"what to add\")"
                        ),
                    ]
                ),
                Quest(
                    id: "29-6",
                    name: "Complete BRD Case Study",
                    description: "Write a complete Business Requirements Document",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Complete BRD",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Loyalty Program",
                                narrative: "You are a BA at an e-commerce platform. The repurchase rate is 15% (industry average 30%). The CEO wants to launch a loyalty program within 6 months. You need to write the BRD.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Quantify the problem before proposing solutions",
                                "Clearly define In/Out Scope",
                            ],
                            explanation: "A complete BRD aligns everyone: why we're doing it, what we're doing, how to measure success, and what risks exist.",
                            frameworkTip: "BRD = SCQA + Objectives + Scope + Requirements + Metrics + Risks"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 30: Excel Data Analysis
        World(
            id: 30,
            name: "Excel Data Analysis",
            emoji: "📊",
            description: "Use Excel for business data analysis: formulas, Pivot Tables, and scenario analysis",
            quests: [
                Quest(
                    id: "30-1",
                    name: "VLOOKUP / INDEX-MATCH",
                    description: "Core cross-table data lookup techniques",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "VLOOKUP Limitations",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is VLOOKUP's biggest limitation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Cross-Table Lookup",
                                narrative: "You have two Excel sheets:\n- Orders table (Order ID, Customer ID, Amount)\n- Customers table (Customer ID, Name, Region)\n\nYou need to pull the customer name into the Orders table. A colleague suggests VLOOKUP.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Cannot handle numbers", explanation: "VLOOKUP can handle numbers."),
                                Challenge.Option(id: "B", text: "The lookup column must be the leftmost column in the lookup range", explanation: "Correct! VLOOKUP can only \"look right.\" If Customer ID isn't in the leftmost column, it won't work. INDEX-MATCH has no such limitation."),
                                Challenge.Option(id: "C", text: "Cannot work across sheets", explanation: "VLOOKUP can work across sheets."),
                                Challenge.Option(id: "D", text: "Can only do exact matches", explanation: "VLOOKUP can do approximate matches (TRUE/FALSE as the fourth parameter)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "VLOOKUP's V = Vertical; it can only look to the right",
                            ],
                            explanation: "VLOOKUP limitation: lookup value must be in the leftmost column. INDEX-MATCH is more flexible: INDEX(return range, MATCH(lookup value, lookup range, 0)) can look in any direction.",
                            frameworkTip: "VLOOKUP looks right / INDEX-MATCH looks any direction / XLOOKUP (newer Excel) is most flexible"
                        ),
                        Challenge(
                            id: 2,
                            name: "INDEX-MATCH in Practice",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct INDEX-MATCH formula?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Reverse Lookup",
                                narrative: "You have a product table:\n| Product ID | Name | Category | Price |\n|---|---|---|---|\n| P001 | Widget A | Electronics | $50 |\n| P002 | Gadget B | Home | $30 |\n\nYou need to look up Product ID by Product Name (Name is to the right of ID). VLOOKUP cannot do this.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=INDEX(ID column, MATCH(\"Widget A\", Name column, 0))", explanation: "Correct! MATCH finds the row number of \"Widget A\" in the Name column; INDEX uses that row number to return the value from the ID column."),
                                Challenge.Option(id: "B", text: "=VLOOKUP(\"Widget A\", full table, 1, FALSE)", explanation: "VLOOKUP requires the lookup value in the leftmost column, but Name is not the leftmost column."),
                                Challenge.Option(id: "C", text: "=INDEX(Name column, MATCH(\"Widget A\", ID column, 0))", explanation: "The lookup and return ranges are swapped. MATCH should search the Name column; INDEX should return from the ID column."),
                                Challenge.Option(id: "D", text: "=MATCH(\"Widget A\", Name column, 0)", explanation: "MATCH only returns a row number (a number), not the Product ID value. It needs to be paired with INDEX."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "INDEX(what to return, which row)",
                                "MATCH(what to find, where to look, 0=exact)",
                            ],
                            explanation: "INDEX-MATCH in two steps: MATCH finds the position, INDEX retrieves the value. More flexible than VLOOKUP because the lookup and return ranges can be specified independently.",
                            frameworkTip: "INDEX-MATCH formula: =INDEX(return column, MATCH(lookup value, lookup column, 0))"
                        ),
                    ]
                ),
                Quest(
                    id: "30-2",
                    name: "Pivot Table Analysis",
                    description: "Quickly summarize and analyze large datasets",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Pivot Design",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "How should you set up the Pivot Table?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Analysis",
                                narrative: "You have a year of sales data (10,000 rows): Date, Region, Product, Sales Rep, Amount.\n\nManager asks: \"What is the sales amount for each region by quarter?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Rows: Date, Columns: Region, Values: Sum of Amount", explanation: "Using raw Date as Row creates 365 rows -- too granular. You need to group by quarter first."),
                                Challenge.Option(id: "B", text: "Rows: Region, Columns: Quarter (grouped from Date), Values: Sum of Amount", explanation: "Correct! Region in Rows, Date grouped by Quarter in Columns, Amount with Sum. Clear at a glance."),
                                Challenge.Option(id: "C", text: "Rows: Product, Columns: Sales Rep, Values: Sum of Amount", explanation: "This answers \"sales by product by rep,\" not what the manager asked."),
                                Challenge.Option(id: "D", text: "Rows: Region, Values: Count of Amount", explanation: "Count shows \"how many\" not \"how much.\" Also missing the quarter dimension."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think \"what does the manager want to see\" before designing the Pivot",
                                "Date can be grouped by month/quarter/year",
                            ],
                            explanation: "Pivot Table design starts with the question: \"each region\" = Row, \"each quarter\" = Column (grouped), \"sales amount\" = Sum of Values.",
                            frameworkTip: "Pivot design: \"each X\" from the question = Rows, \"each Y\" = Columns, \"what number\" = Values + aggregation"
                        ),
                        Challenge(
                            id: 2,
                            name: "Advanced Pivot Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best analysis approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Performance Analysis",
                                narrative: "Pivot results show:\n\n| Region | Q1 | Q2 | Q3 | Q4 |\n|---|---|---|---|---|\n| North | $500K | $520K | $480K | $600K |\n| Central | $300K | $310K | $290K | $280K |\n| South | $200K | $180K | $350K | $400K |\n\nManager asks: \"Which region is growing fastest?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Look at which region has the highest Q4 amount", explanation: "The highest Q4 is North ($600K), but that may just be due to a larger base. Growth measures the rate of change."),
                                Challenge.Option(id: "B", text: "Calculate the growth rate from Q1 to Q4 for each region", explanation: "Correct! North: (600-500)/500=20%, Central: (280-300)/300=-7%, South: (400-200)/200=100%. South is growing fastest (+100%)."),
                                Challenge.Option(id: "C", text: "Look at which region has the highest total", explanation: "Highest total only means \"largest,\" not \"fastest growing.\""),
                                Challenge.Option(id: "D", text: "Look at the quarterly average", explanation: "Averages mask trends."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "\"Fastest growing\" = rate of change, not absolute value",
                                "Growth rate = (end - start) / start",
                            ],
                            explanation: "\"Largest\" and \"fastest growing\" are different questions. When analyzing, distinguish between absolute values vs. rate of change. South grew from $200K to $400K -- 100% growth.",
                            frameworkTip: "Data analysis: First confirm whether the question asks for \"highest value\" or \"highest rate of change\""
                        ),
                    ]
                ),
                Quest(
                    id: "30-3",
                    name: "Common Formulas and Functions",
                    description: "Conditional statistics, logical functions, text processing",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Conditional Statistics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which formula should you use?",
                            scenario: 
                            Challenge.Scenario(
                                title: "COUNTIFS/SUMIFS",
                                narrative: "You have support ticket data:\n| Ticket ID | Category | Priority | Resolution Time (hr) |\n\nManager asks: \"What is the average resolution time for high-priority Bug tickets?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=AVERAGE(Resolution Time)", explanation: "This calculates the average for all tickets without any filter conditions."),
                                Challenge.Option(id: "B", text: "=AVERAGEIFS(Resolution Time, Priority, \"High\", Category, \"Bug\")", explanation: "Correct! AVERAGEIFS supports multiple conditions simultaneously. It only calculates the average for Priority=High AND Category=Bug."),
                                Challenge.Option(id: "C", text: "=SUMIF(Priority, \"High\", Resolution Time)", explanation: "SUMIF only supports one condition and calculates \"sum,\" not \"average.\""),
                                Challenge.Option(id: "D", text: "Filter first, then use AVERAGE", explanation: "Possible but inefficient. If data changes, you need to re-filter. AVERAGEIFS is dynamic."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Multiple conditions = use IFS family of functions",
                                "AVERAGEIFS, COUNTIFS, SUMIFS all support multiple conditions",
                            ],
                            explanation: "The IFS family (SUMIFS, COUNTIFS, AVERAGEIFS) supports multi-criteria statistics and is the most commonly used Excel function group for BAs.",
                            frameworkTip: "Statistical functions: SUMIFS (conditional sum) / COUNTIFS (conditional count) / AVERAGEIFS (conditional average)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Logical Functions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best formula?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Nested IF",
                                narrative: "You need to classify customers by annual spending:\n- >= $100K -> VIP\n- >= $50K -> Gold\n- >= $10K -> Silver\n- < $10K -> Basic",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=IF(A1>=100000,\"VIP\",IF(A1>=50000,\"Gold\",IF(A1>=10000,\"Silver\",\"Basic\")))", explanation: "Correct! Nested IF from the highest value down. Order matters: check VIP first, then Gold, then Silver, and finally Basic."),
                                Challenge.Option(id: "B", text: "=IF(A1>=10000,\"Silver\",IF(A1>=50000,\"Gold\",IF(A1>=100000,\"VIP\",\"Basic\")))", explanation: "Wrong order! A $100K customer would be classified as Silver first (since it's also >= $10K). IF must start from the highest value."),
                                Challenge.Option(id: "C", text: "Four separate IF formulas", explanation: "Four independent IFs would conflict: a $100K customer satisfies all conditions."),
                                Challenge.Option(id: "D", text: "=VLOOKUP(A1, tier table, 2, TRUE)", explanation: "Approximate match VLOOKUP can also work, but the tier table must be sorted ascending. Not as intuitive as IF."),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "Nested IF order matters: start from the strictest condition",
                            ],
                            explanation: "Nested IF should start from the highest/strictest condition. Newer Excel can use the IFS function for clarity.",
                            frameworkTip: "Nested IF order: strictest -> most lenient (or use IFS / SWITCH for clarity)"
                        ),
                    ]
                ),
                Quest(
                    id: "30-4",
                    name: "Data Cleaning Techniques",
                    description: "Handle dirty data: duplicates, nulls, inconsistent formats",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identify Dirty Data",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What should you address first?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data Quality",
                                narrative: "You receive a customer dataset and a quick scan reveals:\n\n- Name field: \"John Smith\" \"john smith\" \" John Smith \" (leading/trailing spaces)\n- Date field: \"2024/3/15\" \"Mar 15, 2024\" \"15-03-2024\"\n- Amount field: \"$1,000\" \"1000\" \"1,000.00\"\n- Email field: 15% null values",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Null values -- fill in all missing emails", explanation: "Nulls need handling but may not be the most urgent. Inconsistent date and amount formats will cause calculation errors."),
                                Challenge.Option(id: "B", text: "Standardize date and amount formats -- inconsistent formats will cause sorting, calculations, and filtering to all fail", explanation: "Correct! Inconsistent numeric/date formats will make all subsequent analysis produce wrong results. Excel may treat text-format dates as strings, causing incorrect calculations."),
                                Challenge.Option(id: "C", text: "Name capitalization -- easiest to fix", explanation: "Easy to fix doesn't mean most important. Name capitalization usually doesn't affect analysis."),
                                Challenge.Option(id: "D", text: "Handle everything simultaneously", explanation: "Having priorities is better. Address issues that affect calculation accuracy first."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "What issue will make subsequent analysis \"produce wrong results\"?",
                            ],
                            explanation: "Data cleaning priority: (1) Issues that cause calculation errors (inconsistent formats) (2) Issues that affect analysis results (duplicate values) (3) Cosmetic issues (capitalization, spaces).",
                            frameworkTip: "Cleaning priority: Affects calculation accuracy > Affects analysis results > Consistency/aesthetics"
                        ),
                        Challenge(
                            id: 2,
                            name: "Cleaning Tools",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "One formula to solve all issues?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Cleaning Steps",
                                narrative: "The customer name field has multiple issues:\n- Leading/trailing spaces: \" Apple Inc \"\n- Inconsistent case: \"apple inc\" \"APPLE INC\"\n- Extra spaces: \"Apple  Inc\" (two spaces)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=TRIM(A1)", explanation: "TRIM removes leading/trailing and extra spaces but doesn't handle capitalization."),
                                Challenge.Option(id: "B", text: "=UPPER(A1)", explanation: "UPPER standardizes to uppercase but doesn't handle spaces."),
                                Challenge.Option(id: "C", text: "=PROPER(TRIM(A1))", explanation: "Correct! TRIM first removes spaces, then PROPER capitalizes the first letter of each word. \" apple  inc \" becomes \"Apple Inc.\""),
                                Challenge.Option(id: "D", text: "=SUBSTITUTE(A1,\" \",\"\")", explanation: "This removes all spaces: \"AppleInc\" -- not what we want."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Functions can be nested: executed from inside out",
                                "TRIM handles spaces; PROPER handles capitalization",
                            ],
                            explanation: "Nested formulas are powerful for data cleaning. TRIM -> PROPER is a classic combination. More complex cases can add SUBSTITUTE.",
                            frameworkTip: "Clean names: =PROPER(TRIM(cell)) / Clean numbers: remove $ and , -> VALUE()"
                        ),
                    ]
                ),
                Quest(
                    id: "30-5",
                    name: "Scenario Analysis",
                    description: "Use Excel for What-If analysis",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What-If Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the monthly revenue after a 20% price cut?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Pricing Analysis",
                                narrative: "You are an e-commerce BA analyzing how different pricing affects revenue:\n\nCurrent: Unit price $100, monthly sales 1,000 units, revenue $100K\n\nMarket research shows: for every 10% price decrease, volume increases by 15%.\n\nManager asks: \"What is the impact of 10% and 20% price cuts on revenue?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "$80K ($80 x 1,000)", explanation: "Forgot to account for the volume increase. Price cuts drive more sales."),
                                Challenge.Option(id: "B", text: "$104K ($80 x 1,300)", explanation: "Correct! Price $100 -> $80 (down 20%), Volume 1,000 -> 1,300 (up 30%, since every 10% cut adds 15%, 20% cut adds 30%). $80 x 1,300 = $104K. Revenue actually increases!"),
                                Challenge.Option(id: "C", text: "$115K ($100 x 1,150)", explanation: "No price reduction applied."),
                                Challenge.Option(id: "D", text: "$92K ($80 x 1,150)", explanation: "Volume increase calculated incorrectly. A 20% cut should increase volume by 30%."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "20% cut = 10% x 2, volume increase 15% x 2 = 30%",
                                "Revenue = unit price x volume",
                            ],
                            explanation: "The value of Scenario Analysis: intuition might suggest price cuts mean less revenue, but quantitative analysis reveals the opposite. This is data-driven decision making.",
                            frameworkTip: "What-If analysis: Change one variable -> See the impact on outcomes -> Compare multiple scenarios"
                        ),
                        Challenge(
                            id: 2,
                            name: "Sensitivity Analysis",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the core purpose of Sensitivity Analysis?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sensitivity Analysis",
                                narrative: "Continuing the pricing analysis. You built an Excel model but the manager questions: \"How do you know a 10% price cut increases volume by 15%? Is this assumption reliable?\"\n\nYou decide to do a Sensitivity Analysis: testing different price elasticity assumptions.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Find the most precise forecast number", explanation: "Sensitivity Analysis isn't about finding precise numbers; it's about understanding how results change when assumptions change."),
                                Challenge.Option(id: "B", text: "Test whether the conclusion still holds if the assumption is wrong", explanation: "Correct! If \"10% cut = 15% volume increase\" changes to \"10% cut = 10% volume increase,\" does the conclusion change? If the conclusion holds under most assumptions, the decision has higher confidence."),
                                Challenge.Option(id: "C", text: "Make the Excel model more complex", explanation: "Complexity doesn't mean better. Sensitivity Analysis tests robustness."),
                                Challenge.Option(id: "D", text: "Show the manager we did extensive analysis", explanation: "The purpose is to provide decision confidence, not showcase effort."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sensitivity = \"What if my assumption is wrong?\"",
                                "Good analysis should withstand changes in assumptions",
                            ],
                            explanation: "Sensitivity Analysis asks \"If the assumption is wrong, does the conclusion still hold?\" If the conclusion is valid under most scenarios, the recommendation is robust.",
                            frameworkTip: "Sensitivity Analysis: Best Case / Base Case / Worst Case -- Under which scenarios does the conclusion hold?"
                        ),
                    ]
                ),
                Quest(
                    id: "30-6",
                    name: "Complete Analysis Case Study",
                    description: "Complete a full business analysis using Excel",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Excel Analysis",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Monthly Performance",
                                narrative: "You are an e-commerce BA who received last month's sales data (5,000 orders). The CFO wants you to present at tomorrow's monthly meeting:\n\n\"How did we perform last month? What trends exist? What are your recommendations?\"\n\nAvailable fields: Order Date, Customer ID, Product Category, Region, Amount, Discount, Shipping Cost.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Design analysis starting from \"what does the CFO want to know\"",
                                "Comparisons are key: vs. last month, vs. same period last year",
                            ],
                            explanation: "Complete Excel analysis: Start from business questions -> Design Pivots -> Calculate metrics -> Visualize -> Insights and recommendations.",
                            frameworkTip: "Analysis flow: Business question -> Data preparation -> Pivot/metrics -> Charts -> Insights -> Recommendations"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 31: BI Tools & Dashboards
        World(
            id: 31,
            name: "BI Tools & Dashboards",
            emoji: "📈",
            description: "Design effective dashboards and data visualizations that make data speak",
            quests: [
                Quest(
                    id: "31-1",
                    name: "Dashboard Design Principles",
                    description: "Design dashboards that are understandable and actionable",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Design Objectives",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is wrong with the PM's answer?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Dashboard Purpose",
                                narrative: "PM asks you to design a product Dashboard. You ask: \"Who will view this Dashboard? What actions should they take after viewing it?\"\n\nPM says: \"For everyone. The more information, the better.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "No problem; more information is better", explanation: "More information actually means fewer people will use it. A dashboard without focus is ineffective."),
                                Challenge.Option(id: "B", text: "\"For everyone\" = no clear audience; \"the more the better\" = no focus. A good Dashboard needs a clear audience and purpose.", explanation: "Correct! Dashboard design step 1: Who (audience) -> Why (what decisions do they make) -> What (what information is needed). Different audiences need different Dashboards."),
                                Challenge.Option(id: "C", text: "Should only be for executives", explanation: "Not necessarily only for executives. The point is having a clear audience."),
                                Challenge.Option(id: "D", text: "Should choose the BI tool first, then design", explanation: "The tool is chosen last. Determine requirements and design first."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Dashboard design starts with \"who is viewing\"",
                                "Different roles need different levels of information",
                            ],
                            explanation: "Three dashboard design questions: (1) Who is the audience? (2) What decisions do they need to make? (3) What information do they need to make those decisions?",
                            frameworkTip: "Dashboard design: Audience -> Decision -> Metrics -> Layout -> Action Triggers"
                        ),
                        Challenge(
                            id: 2,
                            name: "Information Hierarchy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should you improve it?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Layered Design",
                                narrative: "You designed an Executive Dashboard with 25 metrics. The CEO says: \"Too much. I don't know where to look.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Enlarge fonts to make each metric more prominent", explanation: "This is not a visual issue; it's an information architecture issue. 25 metrics is too many."),
                                Challenge.Option(id: "B", text: "Layered design: first layer with 4-6 key metrics + anomaly alerts; second layer allows drill-down for details", explanation: "Correct! Cognitive load principle: humans can process 5-7 pieces of information at once. First layer provides conclusions; drill down when deeper insight is needed."),
                                Challenge.Option(id: "C", text: "Split 25 metrics across 5 pages", explanation: "Pagination just spreads the problem; the CEO still has to review 25 metrics."),
                                Challenge.Option(id: "D", text: "Let the CEO choose which ones to see", explanation: "The CEO shouldn't spend time configuring a Dashboard. The BA should know what matters most."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Humans can process 5-7 pieces of information at once",
                                "Layered: summary -> details -> raw data",
                            ],
                            explanation: "A good Dashboard has a pyramid structure: Top-level KPIs (quickly assess good/bad) -> Mid-level trends (what changed) -> Bottom-level details (why).",
                            frameworkTip: "Dashboard pyramid: L1 KPI Cards -> L2 Trend charts -> L3 Drill-down details"
                        ),
                    ]
                ),
                Quest(
                    id: "31-2",
                    name: "KPI Visualization",
                    description: "Choose the right way to present KPIs",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "KPI Card Design",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which design is best?",
                            scenario: 
                            Challenge.Scenario(
                                title: "KPI Presentation",
                                narrative: "You need to display \"This Month's Revenue: $2.5M\" on a Dashboard. Here are four designs:\n\nA: Only show $2.5M\nB: $2.5M + Last month $2.3M\nC: $2.5M, up 8.7% vs last month + green arrow\nD: $2.5M, up 8.7% vs last month + 96% target achievement + mini trend chart",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A -- simple", explanation: "Too little information. Is $2.5M good or bad? Without a comparison baseline, there's no way to judge."),
                                Challenge.Option(id: "B", text: "B -- has comparison", explanation: "Has comparison but requires the reader to calculate the rate of change themselves."),
                                Challenge.Option(id: "C", text: "C -- has comparison and rate of change", explanation: "Good but missing target comparison. We know it grew, but did it hit the target?"),
                                Challenge.Option(id: "D", text: "D -- has comparison, rate of change, target, and trend", explanation: "Correct! A complete KPI Card: value + change + target + trend. Readers know instantly: the current value, whether it's good, whether it hit target, and the direction of the trend."),
                            ],
                            correctAnswer: "D",
                            hints: [
                                "A good KPI should answer: How much? Good or bad? On target? Trending which way?",
                            ],
                            explanation: "Four elements of a KPI Card: Current Value + Change vs Previous + Target Achievement + Trend. Lets readers judge without thinking.",
                            frameworkTip: "KPI Card = Value + Rate of change + Target achievement + Mini trend chart"
                        ),
                        Challenge(
                            id: 2,
                            name: "Colors and Alerts",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best improvement?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Anomaly Alerts",
                                narrative: "Your Dashboard has 6 KPIs. Currently all use blue. The manager says: \"I can't tell which ones need attention.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use a different color for each KPI", explanation: "Too colorful. Colors should convey information, not decoration."),
                                Challenge.Option(id: "B", text: "Use semantic colors based on target status: On target -> green, Near target -> yellow, Below target -> red", explanation: "Correct! Red-yellow-green are universal semantic colors. Readers instantly know where attention is needed. Set thresholds: >100% -> green, 80-100% -> yellow, <80% -> red."),
                                Challenge.Option(id: "C", text: "Make everything red for emphasis", explanation: "All red creates \"crying wolf\" effect. If everything is red, nothing stands out."),
                                Challenge.Option(id: "D", text: "Add emojis to indicate good/bad", explanation: "Emojis aren't professional on formal Dashboards. Semantic colors are more universal."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Colors should convey information, not decoration",
                                "Red-yellow-green is a universal \"attention needed\" signal",
                            ],
                            explanation: "Semantic colors let the Dashboard speak for itself. The key is defining clear thresholds rather than subjective judgment.",
                            frameworkTip: "Color rules: Green = on target, Yellow = near (needs attention), Red = below (needs action) -- thresholds must be predefined"
                        ),
                    ]
                ),
                Quest(
                    id: "31-3",
                    name: "Chart Selection Guide",
                    description: "Choose the right chart based on data and purpose",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Choose Chart Type",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which pairing is most correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Chart Selection",
                                narrative: "You have the following data to visualize:\n\n1. Monthly revenue trend over the past 12 months\n2. Revenue share by product category\n3. Performance ranking by region\n4. Correlation between revenue and customer count",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1. Pie chart 2. Line chart 3. Scatter plot 4. Bar chart", explanation: "Almost all reversed. Pie charts show share, not trends."),
                                Challenge.Option(id: "B", text: "1. Line chart 2. Pie/donut chart 3. Horizontal bar chart 4. Scatter plot", explanation: "Correct! Trend -> line, Share -> pie/donut, Ranking -> horizontal bar, Correlation -> scatter."),
                                Challenge.Option(id: "C", text: "All bar charts", explanation: "Bar charts are versatile but not always the best choice. Different purposes require different charts."),
                                Challenge.Option(id: "D", text: "1. Area chart 2. Bar chart 3. Line chart 4. Pie chart", explanation: "3. Line chart is unintuitive for rankings, 4. Pie chart doesn't show correlation at all."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "What you want to express determines which chart to use",
                            ],
                            explanation: "Chart selection guide: Trend -> Line, Share -> Pie/Treemap, Comparison -> Bar, Ranking -> Horizontal bar, Correlation -> Scatter, Distribution -> Histogram.",
                            frameworkTip: "Trend -> Line / Share -> Pie / Comparison -> Bar / Ranking -> Horizontal bar / Correlation -> Scatter"
                        ),
                        Challenge(
                            id: 2,
                            name: "Chart Pitfalls",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best improvement?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Pie Chart Pitfalls",
                                narrative: "A colleague made a pie chart showing revenue share across 8 product categories. The chart looks crowded, labels overlap, and 3 categories with ~5% share each are hard to distinguish.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Make the pie chart bigger", explanation: "Enlarging doesn't solve the fundamental problem: 8 slices is too many and small proportions are hard to distinguish."),
                                Challenge.Option(id: "B", text: "Switch to a sorted horizontal bar chart, or merge categories <10% into \"Other\"", explanation: "Correct! Pie charts work best for 3-5 slices. Beyond that, use horizontal bar charts (easier comparison) or merge small categories into \"Other.\""),
                                Challenge.Option(id: "C", text: "Add 3D effects to make it look better", explanation: "3D pie charts are one of the most common visualization mistakes. 3D distorts proportions, making front slices appear larger."),
                                Challenge.Option(id: "D", text: "Use different colors to distinguish them", explanation: "8 different colors make it even more confusing. The problem is structural, not about color."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Pie charts with >5 slices become hard to read",
                                "Sorted horizontal bars are easier to compare than pie slices",
                            ],
                            explanation: "Pie chart rules: no more than 5 slices, avoid 3D, differences between slices should be large. Otherwise, switch to horizontal bar or Treemap.",
                            frameworkTip: "Pie chart: <=5 slices / Large differences / No 3D. Otherwise -> Horizontal bar"
                        ),
                    ]
                ),
                Quest(
                    id: "31-4",
                    name: "Data Storytelling",
                    description: "Make data tell a meaningful story",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Data Storytelling",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which is Data Storytelling?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Reporting Technique",
                                narrative: "After analysis, you found \"South region Q3 revenue surged 80%.\" You can present in two ways:\n\nA: \"South Q3 revenue $350K, QoQ +80%.\"\n\nB: \"South Q3 revenue surged 80% ($195K -> $350K), primarily driven by 3 newly opened branches. If Q4 maintains this growth trajectory, South's annual revenue will surpass Central for the first time ($1.13M vs $1.18M). Recommend increasing South's marketing budget.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A -- let data speak for itself", explanation: "A only has facts, no story. Readers have to figure out \"so what?\" on their own."),
                                Challenge.Option(id: "B", text: "B -- has facts, causes, future projection, and recommendation", explanation: "Correct! Data Storytelling = What happened (facts) + Why (causes) + So what (impact) + Now what (recommendation). B turns data into actionable insight."),
                                Challenge.Option(id: "C", text: "Both are", explanation: "A is Data Reporting (stating numbers); B is Data Storytelling (telling a story)."),
                                Challenge.Option(id: "D", text: "Neither; you need charts for it to count", explanation: "Charts are tools, not requirements. Logical narrative is more important than beautiful charts."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Data Reporting = tells you what happened",
                                "Data Storytelling = tells you why it matters and what to do",
                            ],
                            explanation: "Data Storytelling transforms data from \"knowing\" to \"acting.\" Core structure: What -> Why -> So What -> Now What.",
                            frameworkTip: "Data Storytelling: What happened -> Why -> So what (impact) -> Now what (action)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Avoiding Misleading Charts",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What should you do?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Chart Manipulation",
                                narrative: "The marketing director shows you a chart with Y-axis starting at $98K (not $0), displaying revenue from $100K to $105K. Visually it looks like a 50% surge, but the actual increase is only 5%.\n\nThey want you to put it in the monthly report.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Include it directly in the report", explanation: "This is visually misleading. A Y-axis not starting at 0 exaggerates changes. BAs must ensure honest presentation of information."),
                                Challenge.Option(id: "B", text: "Fix the Y-axis to start at 0, or clearly label the 5% growth rate in the chart title/annotation", explanation: "Correct! Two reasonable approaches: (1) Start Y-axis at 0 to show true proportions (2) If you need to zoom in on the trend, explicitly state \"5% growth\" in the title so readers know the real magnitude."),
                                Challenge.Option(id: "C", text: "Refuse to include the chart", explanation: "No need to refuse; just correct it to be honest."),
                                Challenge.Option(id: "D", text: "Tell the marketing director it's their problem", explanation: "The BA's responsibility includes ensuring data presentation accuracy."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A Y-axis not starting at 0 exaggerates changes",
                                "BA's responsibility: ensure honest presentation of information",
                            ],
                            explanation: "Visualization integrity matters. Common misleading tactics: truncated Y-axis, dual-axis with different scales, cherry-picking time ranges. BAs must ensure charts don't mislead decisions.",
                            frameworkTip: "Visualization integrity: Y-axis from 0 / Label rate of change / Don't cherry-pick / Cite data sources"
                        ),
                    ]
                ),
                Quest(
                    id: "31-5",
                    name: "Dashboards for Different Audiences",
                    description: "Design different Dashboards for different roles",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Audience Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the biggest problem with this \"one-size-fits-all\" Dashboard?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Three Audiences",
                                narrative: "You are asked to design Dashboards for three roles:\n\n- CEO: 5 minutes daily to check overall company status\n- Marketing Director: Track marketing campaign effectiveness\n- Customer Service Manager: Monitor team efficiency\n\nYou designed one big Dashboard containing all metrics.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Too many metrics", explanation: "This is the result, not the root cause."),
                                Challenge.Option(id: "B", text: "Different roles need different levels of information and different action triggers", explanation: "Correct! CEO needs high-level KPIs (revenue, growth rate). Marketing director needs campaign details (CTR, CAC, ROI). CS manager needs operational metrics (response time, CSAT). One Dashboard cannot serve everyone well."),
                                Challenge.Option(id: "C", text: "Need a better BI tool", explanation: "The tool isn't the problem; design thinking is."),
                                Challenge.Option(id: "D", text: "No problem; one is enough", explanation: "One Dashboard trying to serve everyone = serving no one well."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "What the CEO sees vs. what managers see vs. what operators see is completely different",
                            ],
                            explanation: "Dashboard layers: Strategic (CEO, monthly/quarterly) -> Tactical (managers, weekly) -> Operational (operators, daily/real-time).",
                            frameworkTip: "Dashboard three layers: Strategic (executives/KPIs) -> Tactical (managers/trends) -> Operational (operators/real-time)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Self-Service Analytics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best solution?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Interactive Dashboard",
                                narrative: "The marketing director used your Dashboard for a week then says: \"I often want to see different time ranges and campaigns, but have to ask you for changes each time.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Create separate pages for every possible combination", explanation: "Too many combinations to build. Maintenance cost would be very high."),
                                Challenge.Option(id: "B", text: "Add Filters: time range, Campaign, Channel, etc., enabling self-service exploration", explanation: "Correct! Interactive Dashboards let users filter independently, reducing dependency on the BA. The key is choosing the right filter dimensions (the most frequently asked perspectives)."),
                                Challenge.Option(id: "C", text: "Teach them SQL to query themselves", explanation: "The marketing director may not know SQL. The Dashboard's purpose is to enable non-technical self-service."),
                                Challenge.Option(id: "D", text: "Provide different-angle reports weekly", explanation: "Periodic reports cannot meet ad-hoc analysis needs. Self-service is the better approach."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A good Dashboard = answers known questions + supports exploring new ones",
                            ],
                            explanation: "Two Dashboard values: (1) Monitoring (fixed KPIs) (2) Exploration (interactive filtering). Filter design should be based on users' most frequently asked questions.",
                            frameworkTip: "Dashboard = Fixed KPIs (monitoring) + Interactive Filters (exploration)"
                        ),
                    ]
                ),
                Quest(
                    id: "31-6",
                    name: "Executive Dashboard Complete Case",
                    description: "Design a complete Executive Dashboard",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Dashboard Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Executive Dashboard",
                                narrative: "You are a BA at a B2B SaaS company. The CEO wants you to design an Executive Dashboard so they can understand company status in 5 minutes daily.\n\nCompany metrics: $5M ARR, 200 enterprise customers, 2% monthly churn, NPS 45.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "CEO only has 5 minutes",
                                "Dashboard should not just display data but also trigger action",
                            ],
                            explanation: "Executive Dashboard: less is more. 5-6 KPIs + clear action triggers. After viewing, the CEO should know: how the company is doing and whether action is needed.",
                            frameworkTip: "Executive Dashboard = 5-6 KPIs + Trend + Action Triggers + Drill-down"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 32: Systems Analysis Fundamentals
        World(
            id: 32,
            name: "Systems Analysis Fundamentals",
            emoji: "🔧",
            description: "Essential systems thinking for BAs: Workflows, Databases, APIs, and integration points",
            quests: [
                Quest(
                    id: "32-1",
                    name: "System Workflow Analysis",
                    description: "Understand system operations and data flow",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Flowchart Reading",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is most important but often missed in flowcharts?",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Order Flow",
                                narrative: "You are analyzing an e-commerce order flow:\n\nCustomer places order -> Payment verification -> Inventory check -> Picking -> Shipping -> Complete\n\nEach step has different handling if it fails. You need to draw a system flowchart.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Processing time for each step", explanation: "Time is important but not the core of a flowchart."),
                                Challenge.Option(id: "B", text: "Exception Handling -- what happens when each step fails", explanation: "Correct! The happy path is easy to draw, but 80% of system complexity lies in exception handling: What if payment fails? What if stock is insufficient? What if delivery fails?"),
                                Challenge.Option(id: "C", text: "Responsible person", explanation: "Important but flowcharts primarily focus on system behavior."),
                                Challenge.Option(id: "D", text: "Colors and styling", explanation: "Visual design is important but not \"most commonly missed.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The happy path is just the tip of the iceberg",
                                "80% of system complexity lies in exception handling",
                            ],
                            explanation: "BAs must consider both Happy Path and Exception Path when creating flowcharts. For every step, ask: \"What if it fails?\"",
                            frameworkTip: "Flowchart = Happy Path + Exception Paths + Retry/Rollback strategies"
                        ),
                        Challenge(
                            id: 2,
                            name: "System Boundaries",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the core purpose of a Context Diagram?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Context Diagram",
                                narrative: "You need to create a Context Diagram for a new order management system. The system must interact with:\n\n- Payment gateway (payment processing)\n- Logistics API (shipping rates, delivery tracking)\n- ERP (inventory synchronization)\n- CRM (customer data)\n- Notification service (Email/SMS)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Show internal technical architecture", explanation: "Internal architecture is a system architecture diagram, not a Context Diagram."),
                                Challenge.Option(id: "B", text: "Clearly define \"system boundaries\" -- what is inside the system, what is outside, and what data is exchanged", explanation: "Correct! A Context Diagram answers: (1) What does our system do (2) Who does it interact with (3) What data is exchanged. This helps define scope and integration requirements."),
                                Challenge.Option(id: "C", text: "List all APIs", explanation: "An API list is integration design detail, not Context Diagram level."),
                                Challenge.Option(id: "D", text: "Show the user interface", explanation: "UI is frontend design, not system boundaries."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Context = surrounding environment",
                                "System boundary = Inside vs Outside",
                            ],
                            explanation: "A Context Diagram is one of the BA's most important system analysis tools. It clarifies: what the system does (and doesn't), who it interacts with, and the direction of data flow.",
                            frameworkTip: "Context Diagram: Center = our system / Surrounding = external systems and users / Arrows = data flow"
                        ),
                    ]
                ),
                Quest(
                    id: "32-2",
                    name: "Database Fundamentals (BA Edition)",
                    description: "Understand how data is stored and related",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Entity Relationships",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the relationship between Customer and Order?",
                            scenario: 
                            Challenge.Scenario(
                                title: "ER Diagram",
                                narrative: "You are analyzing an e-commerce system's data model. Entities:\n\n- Customer\n- Order\n- Product\n- Order_Item\n\nOne customer can have multiple orders; one order can contain multiple products.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "One-to-One", explanation: "A customer can only have one order? That's not realistic."),
                                Challenge.Option(id: "B", text: "One-to-Many", explanation: "Correct! One Customer can have many Orders (1:N). In the database, the Order table has a customer_id column pointing to Customer."),
                                Challenge.Option(id: "C", text: "Many-to-Many", explanation: "One order belongs to multiple customers? Not realistic. Order and Product are Many-to-Many (via Order_Item)."),
                                Challenge.Option(id: "D", text: "No relationship", explanation: "Customers and orders are clearly related."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "One customer can place many orders, but one order belongs to only one customer",
                            ],
                            explanation: "Three data relationships: 1:1, 1:N, M:N. BAs need to understand these to design requirements and validate data integrity. M:N usually requires a junction table (like Order_Item).",
                            frameworkTip: "Data relationships: 1:1 (passport) / 1:N (customer -> orders) / M:N (orders <-> products, via junction table)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Data Integrity",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What data integrity rules do these issues correspond to?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data Issues",
                                narrative: "After system launch, issues are discovered:\n\n- Some Orders have customer_id pointing to non-existent Customers\n- Deleting a Customer leaves their Orders as \"orphan data\"\n- Product price can be entered as a negative number\n\nThese issues cause report errors.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All bugs -- engineers need to fix them", explanation: "They are bugs, but more fundamentally, the data integrity rules are missing."),
                                Challenge.Option(id: "B", text: "1. Referential integrity (Foreign Key) 2. Deletion rules (CASCADE/RESTRICT) 3. Domain integrity (Check Constraint)", explanation: "Correct! 1. FK ensures customer_id must exist 2. Deletion rules determine what happens to dependent records when the primary record is deleted 3. Check constrains value range (price > 0). BAs should define these rules in requirements."),
                                Challenge.Option(id: "C", text: "All frontend validation issues", explanation: "Frontend validation is one defense line, but database-level constraints are the final safeguard."),
                                Challenge.Option(id: "D", text: "Design issues that are not the BA's responsibility", explanation: "Defining data rules is a core BA responsibility. What data can be null? What relationships must exist? How to handle deletions?"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BAs must define: what data must exist? what values are valid? how to handle deletions?",
                            ],
                            explanation: "BAs need to define data rules in requirements: referential integrity (FK), domain integrity (value constraints), deletion behavior (CASCADE vs RESTRICT). Don't leave all of this to engineers.",
                            frameworkTip: "Data rules BAs must define: Required/optional, value range, relationships, deletion behavior"
                        ),
                    ]
                ),
                Quest(
                    id: "32-3",
                    name: "API Fundamentals",
                    description: "Understand how systems communicate via APIs",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "API Concepts",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which analogy best explains an API?",
                            scenario: 
                            Challenge.Scenario(
                                title: "What is an API",
                                narrative: "You explain to the PM why the new system needs to integrate with the logistics provider. The PM asks: \"What is an API? Why can't we handle it manually?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "An API is like a translator between two systems, allowing different \"languages\" to communicate", explanation: "Acceptable but not precise enough. An API is more like an \"ordering window\" than a translator."),
                                Challenge.Option(id: "B", text: "An API is like a restaurant menu and ordering window -- you (System A) read the menu (API docs) to know what you can order, place your order through the window (API endpoint), and the kitchen (System B) prepares and delivers the food (response)", explanation: "Correct! This analogy covers API essentials: documentation (menu), request (ordering), processing (kitchen), response (food delivery). You don't need to know how the kitchen works; you just need to know what you can order."),
                                Challenge.Option(id: "C", text: "An API is a database", explanation: "Completely different. An API is a communication interface between systems; a database stores data."),
                                Challenge.Option(id: "D", text: "An API is a programming language", explanation: "An API is not a programming language; it's a communication protocol and interface between systems."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "API = Application Programming Interface = \"communication interface\" between systems",
                            ],
                            explanation: "Core API concept: defines what data systems can exchange and how. BAs need to understand APIs to define integration requirements.",
                            frameworkTip: "API = Menu (docs) + Ordering window (Endpoint) + Order format (Request) + Food delivery (Response)"
                        ),
                        Challenge(
                            id: 2,
                            name: "REST API Basics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most important thing the BA should confirm?",
                            scenario: 
                            Challenge.Scenario(
                                title: "HTTP Methods",
                                narrative: "A developer discusses API design with you:\n\n\"Our order API has four endpoints:\n- GET /orders -- retrieve orders\n- POST /orders -- create new order\n- PUT /orders/{id} -- update order\n- DELETE /orders/{id} -- delete order\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "What programming language to use", explanation: "Programming language is a development decision; the BA doesn't need to manage it."),
                                Challenge.Option(id: "B", text: "Business rules for DELETE -- under what conditions can an order be deleted? Can shipped orders be deleted? How are related data (payments, logistics) handled?", explanation: "Correct! Technically, DELETE is simple, but the business rules are complex. The BA must define: what status allows deletion? Soft or hard delete? What is the cascade impact?"),
                                Challenge.Option(id: "C", text: "Server capacity", explanation: "Infrastructure is DevOps' responsibility."),
                                Challenge.Option(id: "D", text: "API URL naming", explanation: "URL naming is a development convention; the BA doesn't need to be concerned about it."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Technically easy to implement but business rules are hard to define",
                                "BA's value: defining \"when it can/cannot be done\"",
                            ],
                            explanation: "The BA's role in API design: define business rules. The tech team knows how to implement DELETE, but the BA defines when DELETE is allowed, what it impacts, and how exceptions are handled.",
                            frameworkTip: "BA in API design: Define business rules / Data validation rules / Error handling / Permissions"
                        ),
                    ]
                ),
                Quest(
                    id: "32-4",
                    name: "Integration Point Analysis",
                    description: "Analyze integration requirements between systems",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Integration Patterns",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which option is more suitable? Why?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Real-time vs Batch",
                                narrative: "The new order management system needs to sync inventory data with ERP. Two options:\n\nA. Real-time sync: Call ERP API to check inventory on every order\nB. Batch sync: Import latest inventory from ERP to local every hour\n\nThe system processes about 5,000 orders daily.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Real-time -- data is always current", explanation: "Real-time is most accurate but costly: 5,000 API calls/day, ERP slowness delays ordering, and ERP downtime means no ordering."),
                                Challenge.Option(id: "B", text: "Batch -- good performance and decoupled", explanation: "Batch has good performance but has time lag: up to 1 hour of inventory delay, which may cause overselling."),
                                Challenge.Option(id: "C", text: "Hybrid: real-time check for high-demand items, batch sync for others + final confirmation at checkout", explanation: "Correct! Hybrid strategy: most items use batch (good performance, decoupled), hot items use real-time (prevent overselling), all require final inventory confirmation. Balances performance and accuracy."),
                                Challenge.Option(id: "D", text: "No sync needed; manage manually", explanation: "Manual management is unrealistic at 5,000 orders per day."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "It's not either/or; you can mix approaches",
                                "Consider: performance, accuracy, coupling, failure handling",
                            ],
                            explanation: "Integration design must balance multiple factors: data freshness, system coupling, performance, and failure handling. Hybrid strategies are often the most pragmatic answer.",
                            frameworkTip: "Integration pattern choice: Real-time (accurate but coupled) / Batch (decoupled but delayed) / Hybrid (balanced)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Failure Handling",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What should the BA define for this scenario?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Integration Failure",
                                narrative: "The order system calls the payment gateway API to charge, but the gateway responds with a Timeout. You don't know if the charge actually succeeded.\n\nIf you tell the customer \"payment failed\" but the money was actually charged, what happens?\nIf you tell the customer \"payment succeeded\" but nothing was actually charged, what happens?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Tell developers to fix the timeout issue", explanation: "Timeouts will inevitably occur. This isn't a bug but a scenario that needs handling."),
                                Challenge.Option(id: "B", text: "Define a Timeout handling process: hold the order in \"Payment Confirming\" status, query the payment gateway in the background to confirm the result, then update status and notify the customer", explanation: "Correct! BAs must define handling for uncertain states. The key is introducing an intermediate status (\"Confirming\") to give the system time to clarify, rather than making commitments under uncertainty."),
                                Challenge.Option(id: "C", text: "Increase the timeout duration", explanation: "Can reduce but not eliminate timeouts. And too-long timeouts make customers wait too long."),
                                Challenge.Option(id: "D", text: "This is a technical issue, not the BA's concern", explanation: "The handling process (what users see, what the system does) is entirely the BA's concern."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Uncertain situation -> use intermediate status",
                                "BA defines user experience and business process; developers implement",
                            ],
                            explanation: "Timeouts and failures are inevitable in integrations. BAs must define: intermediate status, retry logic, eventual consistency, and user notifications. The most dangerous thing is making definitive commitments in uncertain states.",
                            frameworkTip: "Integration failure handling: Intermediate status -> Background confirmation -> Eventual consistency -> Notify user"
                        ),
                    ]
                ),
                Quest(
                    id: "32-5",
                    name: "Authentication, Roles & Permissions",
                    description: "Define who can do what",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "AuthN vs AuthZ",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "\"Logging in\" and \"access permissions\" belong to what respectively?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Authentication vs Authorization",
                                narrative: "New system requirements:\n\n- Users must log in first (username/password or SSO)\n- Regular employees can only see their own data\n- Managers can see their entire team's data\n- Admins can modify system settings",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Both are Authentication", explanation: "Authentication only verifies identity (who you are), not what you can do."),
                                Challenge.Option(id: "B", text: "Login = Authentication (who you are), Permissions = Authorization (what you can do)", explanation: "Correct! AuthN verifies identity; AuthZ controls permissions. They are independent concepts: you can successfully log in (AuthN passes) but lack permission for a feature (AuthZ fails)."),
                                Challenge.Option(id: "C", text: "Both are Authorization", explanation: "Authorization is permission control; login identity verification is Authentication."),
                                Challenge.Option(id: "D", text: "Not relevant to the BA", explanation: "BAs need to define: who can access what, what roles exist, and each role's permissions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Authentication = who you are",
                                "Authorization = what you can do",
                            ],
                            explanation: "AuthN and AuthZ are two different layers. BAs typically need to define: role list, permission matrix for each role, and special rules (like data isolation).",
                            frameworkTip: "AuthN (who you are) -> AuthZ (what you can do) -> RBAC (role-permission matrix)"
                        ),
                        Challenge(
                            id: 2,
                            name: "RBAC Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which permission matrix is most reasonable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Permission Matrix",
                                narrative: "You are designing CRM system permissions. Roles:\n\n- Sales Rep\n- Sales Manager\n- Admin\n\nFeatures: View customers, Edit customers, View reports, Export data, Manage users",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All three roles have all permissions", explanation: "No permission control at all. Sales Reps shouldn't be able to manage users."),
                                Challenge.Option(id: "B", text: "Rep: View+Edit (own only), Manager: View+Edit (team)+Reports, Admin: All", explanation: "Correct! Least privilege principle: each role only has the minimum permissions needed to do their job. Reps see only their own, Managers see the team, Admins have management access."),
                                Challenge.Option(id: "C", text: "Rep has no permissions", explanation: "Sales reps are the primary users; having no permissions makes the system useless."),
                                Challenge.Option(id: "D", text: "Only Admin has permissions; others can't see anything", explanation: "This makes the system unusable. Permissions are tiered, not all-or-nothing."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Least privilege principle: only grant permissions needed for the job",
                                "Note data isolation: Rep sees only their own",
                            ],
                            explanation: "Core RBAC design: Least Privilege Principle. BAs must produce a permission matrix (Role x Feature x Operation) and define data scope (own/team/all).",
                            frameworkTip: "RBAC matrix: Role x Feature x CRUD + Data scope (own/team/all)"
                        ),
                    ]
                ),
                Quest(
                    id: "32-6",
                    name: "Systems Analysis Comprehensive Case",
                    description: "Complete systems analysis exercise",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Systems Analysis",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Online Appointment System",
                                narrative: "You need to design an online appointment system (applicable to restaurants/clinics/salons). The system must integrate with:\n- Calendar (Google Calendar/Outlook)\n- SMS service (reminders)\n- Payment gateway (deposit collection)\n- Existing POS system (customer data sync)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Start the Context Diagram by defining system boundaries",
                                "Think about what happens when each integration point fails",
                            ],
                            explanation: "Systems analysis = Boundaries (Context) + Data (Entity) + Integration (API) + Security (Permissions) + Exception Handling.",
                            frameworkTip: "Five aspects of systems analysis: Boundaries / Data Model / Integration / Security / Exception Handling"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 33: Agile BA in Practice
        World(
            id: 33,
            name: "Agile BA in Practice",
            emoji: "🏃",
            description: "Deliver BA value in an Agile environment: Scrum, User Stories, and Backlog management",
            quests: [
                Quest(
                    id: "33-1",
                    name: "Agile Core Concepts",
                    description: "Understand the Agile Manifesto and the BA role in Agile",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Agile vs Waterfall",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "How is the BA role different in Agile?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA Role Differences",
                                narrative: "You transitioned from a Waterfall project to a Scrum team. Previously you spent 3 months writing a complete BRD before handing it to development. Now the Scrum Master says: \"We don't need a full BRD; just use User Stories.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "BAs are no longer needed in Agile", explanation: "BAs are even more important in Agile; the work style is just different."),
                                Challenge.Option(id: "B", text: "Shifts from \"writing complete documents upfront\" to \"continuously clarifying requirements, splitting Stories, and collaborating with the team\"", explanation: "Correct! Agile BAs don't stop analyzing; they analyze continuously and iteratively. From large documents to small, precise User Stories; from one-time delivery to delivering value every Sprint."),
                                Challenge.Option(id: "C", text: "Only write User Stories, no analysis", explanation: "User Stories are one output of analysis. BAs still do stakeholder analysis, process analysis, data analysis, etc."),
                                Challenge.Option(id: "D", text: "No documentation needed at all", explanation: "Agile doesn't mean \"no documentation\" but \"just enough documentation.\" User Story + AC is lightweight requirements documentation."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Agile doesn't mean \"no analysis\" but \"continuous analysis\"",
                                "BA shifts from gatekeeper to facilitator",
                            ],
                            explanation: "Agile BA: continuous analysis (not all upfront), lightweight docs (Story + AC), collaboration with the team (not throwing docs over the wall).",
                            frameworkTip: "Waterfall BA: Upfront analysis -> Docs -> Handoff / Agile BA: Continuous analysis -> Stories -> Deliver every Sprint"
                        ),
                        Challenge(
                            id: 2,
                            name: "BA During a Sprint",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most effective time allocation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sprint Time Allocation",
                                narrative: "You are in a 2-week Sprint. The team is developing Sprint N Stories.\n\nWhere should you spend your time?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "100% supporting current Sprint N development", explanation: "Focusing only on the current Sprint leaves the next Sprint without prepared Stories."),
                                Challenge.Option(id: "B", text: "50% supporting Sprint N (answering questions, acceptance) + 50% preparing Sprint N+1 and N+2 Stories", explanation: "Correct! Agile BAs need to \"stay one to two Sprints ahead.\" Current Sprint: answer dev questions + UAT. Simultaneously prepare future Sprint Stories to ensure the Backlog is ready."),
                                Challenge.Option(id: "C", text: "100% preparing future Stories", explanation: "Ignoring the current Sprint leaves developers stuck (no one to clarify unclear requirements)."),
                                Challenge.Option(id: "D", text: "Wait until the Sprint ends to start preparing", explanation: "Too late. If Stories aren't ready at Sprint Planning, the team can't plan effectively."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA needs to \"stay 1-2 Sprints ahead\"",
                                "Simultaneously support \"now\" and \"prepare for the future\"",
                            ],
                            explanation: "Agile BA time management: support current Sprint (clarify issues, acceptance) + prepare future Sprints (analysis, write Stories, Refinement).",
                            frameworkTip: "BA Sprint time: 50% current (support + acceptance) + 50% future (analysis + prepare Stories)"
                        ),
                    ]
                ),
                Quest(
                    id: "33-2",
                    name: "Advanced User Stories",
                    description: "Write high-quality User Stories",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Story Splitting",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best splitting approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Splitting a Large Story",
                                narrative: "You have a large Story: \"As a customer, I want to complete the checkout process so that I can receive my items.\"\n\nDevelopers estimate 20 points (exceeds one Sprint). You need to split it.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "By technical layer: Frontend, Backend, Database", explanation: "Technical layer splitting is not recommended. Each Story should deliver user value; a frontend-only Story cannot be used independently."),
                                Challenge.Option(id: "B", text: "By user value: 1. Select shipping method 2. Enter payment info 3. Confirm order + pay 4. Receive confirmation notification", explanation: "Correct! Each split Story is a user-facing functional slice. Vertical Slice: each Story includes frontend + backend + database, independently testable and demonstrable."),
                                Challenge.Option(id: "C", text: "By page: Checkout page, Confirmation page, Thank-you page", explanation: "Better than technical layers but still not ideal. \"Checkout page\" may contain too many features."),
                                Challenge.Option(id: "D", text: "Don't split; continue in the next Sprint", explanation: "Cross-Sprint Stories cause planning difficulties and risk."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Good splitting = each Story independently delivers user value",
                                "Vertical Slice includes all technical layers",
                            ],
                            explanation: "Story splitting principles: split by user value (not technical layer); each Story is a Vertical Slice, independently testable and demo-ready.",
                            frameworkTip: "Story splitting: By user value > By workflow step > By business rule > By data operation (CRUD)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Acceptance Criteria",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What are these ACs missing?",
                            scenario: 
                            Challenge.Scenario(
                                title: "AC Quality",
                                narrative: "Story: \"As a customer, I want to pay with a credit card so that I can complete my order\"\n\nYou wrote these ACs:\nAC1: Can enter credit card number\nAC2: Display confirmation on successful payment\nAC3: Display error on failed payment",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Sufficient -- concise and clear", explanation: "Too vague. \"Can enter\" doesn't define format validation, security, etc. Developers will have many questions."),
                                Challenge.Option(id: "B", text: "Missing specific Given-When-Then, boundary conditions, and security requirements", explanation: "Correct! Good ACs should include:\n- Given customer on checkout page, When entering card number, Then validate format in real-time (16 digits)\n- Given valid card, When clicking pay, Then 3D Secure verification -> successful charge -> display order number\n- Given insufficient balance, When paying, Then display \"insufficient balance\" + suggest changing card\n- Card number not stored on our servers (PCI-DSS)"),
                                Challenge.Option(id: "C", text: "Need more Happy Path scenarios", explanation: "Happy Path is already covered. What's missing are Edge Cases and NFRs."),
                                Challenge.Option(id: "D", text: "No ACs needed; developers know what to do", explanation: "A Story without ACs is not ready. ACs define \"how do we know it's done.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "ACs should be specific enough to directly become test cases",
                                "Don't forget boundary conditions and security requirements",
                            ],
                            explanation: "The gold standard for ACs: developers can write code after reading them, and QA can write test cases after reading them. Lacking specific scenarios causes inconsistent understanding.",
                            frameworkTip: "AC quality check: Can it directly become a test case? Does it have Happy Path + Edge Case + NFR?"
                        ),
                    ]
                ),
                Quest(
                    id: "33-3",
                    name: "Backlog Refinement",
                    description: "Maintain a healthy Product Backlog",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Refinement Purpose",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the root problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Backlog Problems",
                                narrative: "Your Product Backlog has 200 Stories. During Sprint Planning, the team complains:\n- \"I can't understand these Stories\"\n- \"This Story is too large to estimate\"\n- \"ACs are unclear; we build it and you say it's wrong\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Too many Stories", explanation: "Quantity is not the issue; quality is."),
                                Challenge.Option(id: "B", text: "Lack of Backlog Refinement -- Stories have not been continuously clarified, split, and estimated", explanation: "Correct! Refinement ensures that by Sprint Planning, top Stories are Ready: small enough, clear enough, have ACs, and the team understands them."),
                                Challenge.Option(id: "C", text: "Developers aren't senior enough", explanation: "Not a capability issue; it's a requirements readiness issue."),
                                Challenge.Option(id: "D", text: "Need better tools", explanation: "Tools don't solve requirements quality problems."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sprint Planning is not the time to clarify requirements",
                                "Refinement makes Stories Ready",
                            ],
                            explanation: "Backlog Refinement is an ongoing process: clarify requirements, split large Stories, write ACs, estimate. The goal is that top Stories are Ready by Sprint Planning.",
                            frameworkTip: "Definition of Ready: Story small enough for one Sprint + ACs are clear + Team understands + No blockers"
                        ),
                        Challenge(
                            id: 2,
                            name: "Priority Ordering",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most practical ordering method?",
                            scenario: 
                            Challenge.Scenario(
                                title: "MoSCoW",
                                narrative: "You have 30 Stories to complete in 3 Sprints. The PO says all are P1. You need to help prioritize.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "By Story number order", explanation: "Numbers have nothing to do with priority."),
                                Challenge.Option(id: "B", text: "MoSCoW + Value/Effort matrix: First categorize as Must/Should/Could/Won't, then within Must use Value/Effort to order", explanation: "Correct! MoSCoW first does broad categorization (eliminate Won't and Could), then within Must and Should use Value/Effort to find \"high value, low cost\" items to do first."),
                                Challenge.Option(id: "C", text: "Let developers decide", explanation: "Developers decide technical order; PO/BA decides business priority."),
                                Challenge.Option(id: "D", text: "Develop everything in parallel", explanation: "Limited resources make full parallel development impossible."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Not all P1s are equally important",
                                "First filter (MoSCoW) then sort (Value/Effort)",
                            ],
                            explanation: "Two-step prioritization: (1) MoSCoW classification to eliminate \"won't do\" items (2) Within \"will do\" items, use Value/Effort matrix to find optimal order.",
                            frameworkTip: "MoSCoW -> Within Must, sort by Value / Effort -> High value, low cost first"
                        ),
                    ]
                ),
                Quest(
                    id: "33-4",
                    name: "BA in Sprint Ceremonies",
                    description: "Deliver BA value in each Scrum ceremony",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "BA in Sprint Planning",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What should the BA do?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Planning Meeting",
                                narrative: "During Sprint Planning, a developer has a question about a Story: \"If a customer cancels an order within 30 minutes of payment, should the refund be automatic or manual? Refunded to the original payment method or a wallet?\"\n\nThe PO isn't sure of the answer.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Say \"I'll confirm and we'll do this Story next Sprint\"", explanation: "Deferring to next Sprint is too slow. If it can be resolved quickly, it shouldn't be delayed."),
                                Challenge.Option(id: "B", text: "Provide analysis: list options (auto/manual refund, original method/wallet), their impacts, and a recommendation. Enable the PO to make an informed decision on the spot", explanation: "Correct! The BA's prep work should anticipate these questions during Refinement. If not, at minimum provide a quick options analysis for the PO to decide. BA = question anticipation + options analysis."),
                                Challenge.Option(id: "C", text: "Say \"auto-refund everything\" and make the decision yourself", explanation: "The BA doesn't make business decisions for the PO."),
                                Challenge.Option(id: "D", text: "Note it down for discussion after the meeting", explanation: "If not resolved in Planning, the Story isn't Ready and shouldn't be pulled into the Sprint."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA preparation = anticipate questions developers will ask",
                                "During Planning, the BA is an \"on-the-spot analyst\"",
                            ],
                            explanation: "BA value in Sprint Planning: (1) Prepare possible questions in advance (2) Quickly provide options analysis (3) Help the PO make real-time decisions.",
                            frameworkTip: "BA in Planning: Anticipate questions -> Prepare options -> Help PO make real-time decisions"
                        ),
                        Challenge(
                            id: 2,
                            name: "BA in Sprint Review",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most likely root cause?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Review Meeting",
                                narrative: "During Sprint Review, a stakeholder says after the demo:\n\n\"This is not what I wanted! I wanted Feature A but you built Feature B.\"\n\nThe developer says: \"We built it according to the Story.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Developers didn't read the requirements carefully", explanation: "If they built according to the Story, the developers aren't wrong. The issue is further upstream."),
                                Challenge.Option(id: "B", text: "The Story and ACs were not confirmed with the stakeholder, or the stakeholder wasn't involved in Refinement", explanation: "Correct! Most common cause: BA/PO understood requirements and wrote the Story without confirming with the stakeholder. The perception gap is only discovered at Review. Solution: invite stakeholders to Refinement or at minimum confirm ACs with them."),
                                Challenge.Option(id: "C", text: "Scrum process has issues", explanation: "The process is correct, but the requirements confirmation step was missing during execution."),
                                Challenge.Option(id: "D", text: "Stakeholder didn't explain clearly", explanation: "May be a factor, but the BA's job is ensuring requirements are correctly understood. Can't blame users for \"not explaining clearly.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Requirements \"telephone game\": distortion occurs with each handoff",
                                "BA's responsibility: ensure Stories reflect the real requirements",
                            ],
                            explanation: "Surprises in Review = gaps in Refinement. Solution: BA confirms ACs with stakeholders after writing Stories, or invites stakeholders to Refinement.",
                            frameworkTip: "Prevent Review surprises: Story -> Confirm ACs with stakeholder -> Develop -> Review"
                        ),
                    ]
                ),
                Quest(
                    id: "33-5",
                    name: "Cross-Team Collaboration",
                    description: "Collaborate in a multi-team Agile environment",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Dependency Management",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How should the BA handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Team Dependencies",
                                narrative: "Your feature requires Team A (frontend), Team B (backend API), and Team C (data team) to coordinate.\n\nTeam B says their API won't be ready for two Sprints. Your PO wants to go live within one Sprint.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Tell the PO it can't be done", explanation: "Too quick to give up. Look for alternatives first."),
                                Challenge.Option(id: "B", text: "Analyze dependencies, propose a decoupling solution (e.g., use mock API for frontend + integration tests first, connect real API when ready) + adjust launch scope", explanation: "Correct! BA's value: (1) Map dependencies clearly (2) Propose decoupling solutions (mock/stub) (3) Suggest MVP scope for partial early launch. Not \"can't be done\" but \"how to deliver the most value fastest.\""),
                                Challenge.Option(id: "C", text: "Push Team B to speed up", explanation: "Can communicate but can't force other teams to change priorities."),
                                Challenge.Option(id: "D", text: "Wait for the API before starting", explanation: "Wastes one to two Sprints of time."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Dependency does not equal blocker. Many decoupling techniques exist",
                                "Mock APIs enable parallel development",
                            ],
                            explanation: "Cross-team dependency handling: (1) Map dependencies (2) Identify critical path (3) Decouple with mock/contract (4) Adjust launch strategy.",
                            frameworkTip: "Dependency handling: Identify -> Decouple (mock/contract) -> Parallel development -> Integration testing"
                        ),
                        Challenge(
                            id: 2,
                            name: "Requirements Alignment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you prevent this problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Team Alignment",
                                narrative: "Three teams each develop different modules, but during integration they discover:\n- Team A's \"order status\" has 5 values\n- Team B's \"order status\" has 8 values\n- Team C uses completely different status names",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Let each team decide for themselves", explanation: "Each deciding on their own is the root cause of the problem."),
                                Challenge.Option(id: "B", text: "BA establishes a shared Domain Model (including unified status definitions, data formats, glossary) that all teams reference during development", explanation: "Correct! The BA's unique value in multi-team environments: establishing a \"common language.\" Unified Domain Model / Data Dictionary / API Contract ensures all teams are aligned."),
                                Challenge.Option(id: "C", text: "Unify after launch", explanation: "Post-launch unification costs far more than upfront definition."),
                                Challenge.Option(id: "D", text: "Hold more alignment meetings", explanation: "Meetings are means, not ends. A documented Domain Model is more effective."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The biggest risk in multi-team: different understanding of the same concept",
                                "BA = guardian of the common language",
                            ],
                            explanation: "BA in multi-team environments: build and maintain shared Domain Model, Data Dictionary, and API Contracts. Ensure \"order\" means the same thing in every team.",
                            frameworkTip: "Multi-team alignment: Domain Model + Data Dictionary + API Contract + Regular Sync"
                        ),
                    ]
                ),
                Quest(
                    id: "33-6",
                    name: "Agile BA Comprehensive Case",
                    description: "Deliver full BA value in an Agile environment",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Agile BA Planning",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Product Development",
                                narrative: "You are the BA for a new SaaS project management tool. Scrum team of 7 (PO, SM, 3 Devs, 1 QA, 1 BA -- you).\n\nThe first MVP must launch within 6 Sprints (12 weeks). Key features: task management, kanban board, time tracking.\n\nThe PO has collected 50 Feature Requests.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Sprint 0 is the BA's busiest time",
                                "Story Mapping helps see the big picture",
                            ],
                            explanation: "Agile BA systematic preparation: Persona -> Story Map -> MoSCoW -> Backlog -> DoR -> Domain Model. Upfront investment makes subsequent Sprints smoother.",
                            frameworkTip: "Sprint 0 BA: Persona + Story Map + MoSCoW + DoR + Domain Model + First 2 Sprint Stories Ready"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 34: Process Improvement
        World(
            id: 34,
            name: "Process Improvement",
            emoji: "🔄",
            description: "Analyze and optimize business processes -- eliminate waste and improve efficiency",
            quests: [
                Quest(
                    id: "34-1",
                    name: "As-Is Process Analysis",
                    description: "Analyze existing processes to find problems",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Process Bottleneck",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Where is the biggest bottleneck?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Order Processing Flow",
                                narrative: "E-commerce order processing flow and average times:\n\nOrder placed (1 min) -> Manual review (4 hours) -> Picking (30 min) -> Packing (15 min) -> Shipping (handoff to logistics)\n\nAverage time from order to shipping is 6 hours. Main customer complaint: \"too slow.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Picking -- 30 minutes is too long", explanation: "30 minutes accounts for only 8% of the total 6 hours. Not the bottleneck."),
                                Challenge.Option(id: "B", text: "Manual review -- 4 hours accounts for 67% of total time", explanation: "Correct! 4 hours / 6 hours = 67%. This is the biggest bottleneck. If review time drops from 4 hours to 30 minutes, total time decreases from 6 hours to 2.25 hours -- a 62.5% improvement."),
                                Challenge.Option(id: "C", text: "Packing -- could be faster", explanation: "15 minutes accounts for only 4%. Minimal optimization potential."),
                                Challenge.Option(id: "D", text: "Shipping -- waiting time for logistics handoff", explanation: "Logistics time is outside our control."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Bottleneck = the step taking the largest proportion of total time",
                                "Improving the bottleneck has the highest ROI",
                            ],
                            explanation: "Bottleneck analysis: find the step consuming the largest proportion of time/cost. Improving the bottleneck has far higher ROI than optimizing non-bottleneck steps.",
                            frameworkTip: "Bottleneck analysis: Quantify time for each step -> Find highest proportion -> Prioritize improvement -> Re-measure"
                        ),
                        Challenge(
                            id: 2,
                            name: "Waste Identification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What types of Lean waste do these correspond to?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Eight Types of Waste",
                                narrative: "Observing a customer service team's daily work:\n\n- After receiving a call, agents open 3 systems to look up customer info (5 min/call)\n- After lookup, manually copy info from System A to System B (2 min/call)\n- 20% of daily calls are repeat inquiries about the same issue (order status)\n- The CS manager spends 2 hours daily manually compiling reports",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All are \"waiting\" waste", explanation: "Waiting is just one type. Multiple waste types are present here."),
                                Challenge.Option(id: "B", text: "Opening 3 systems = Motion waste, Copy-paste = Extra processing, Repeat calls = Defects/rework, Manual reports = Extra processing", explanation: "Correct! Lean's eight wastes (DOWNTIME): D-Defects, O-Overproduction, W-Waiting, N-Non-utilized talent, T-Transportation, I-Inventory, M-Motion, E-Extra processing."),
                                Challenge.Option(id: "C", text: "All technical issues, not process issues", explanation: "They appear technical but the root cause is process design. System integration, automation, and self-service are all process improvement solutions."),
                                Challenge.Option(id: "D", text: "These are all normal work", explanation: "\"Normal\" doesn't mean there's no waste. Much waste has become habitual."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Waste = activities that don't create value for the customer",
                                "DOWNTIME is a mnemonic for the eight wastes",
                            ],
                            explanation: "Lean's eight wastes (DOWNTIME): identifying waste is the first step in process improvement. Key question: \"Does this step create value for the customer?\"",
                            frameworkTip: "DOWNTIME: Defects / Overproduction / Waiting / Non-utilized talent / Transportation / Inventory / Motion / Extra processing"
                        ),
                    ]
                ),
                Quest(
                    id: "34-2",
                    name: "To-Be Process Design",
                    description: "Design the improved target process",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Automation Decision",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best To-Be design?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Review Automation",
                                narrative: "Returning to the order review bottleneck. You analyze 1,000 order review records:\n\n- 85% of orders pass directly (amount <$5,000, non-high-risk items, returning customers)\n- 10% need simple confirmation (amount $5,000-$20,000)\n- 5% need deep review (amount >$20,000, new customer + high risk)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Automate everything", explanation: "Fully automating high-risk orders carries fraud risk."),
                                Challenge.Option(id: "B", text: "85% auto-approve (rules engine) + 10% simplified review (quick confirmation checklist) + 5% manual deep review", explanation: "Correct! Tiered strategy: automate low-risk (saves the most time), simplify medium-risk (quick confirmation checklist), retain manual review for high-risk (risk control). 4 hours -> most orders processed instantly."),
                                Challenge.Option(id: "C", text: "Add more reviewers", explanation: "Adding people treats symptoms, not causes. 85% of orders don't need human review at all."),
                                Challenge.Option(id: "D", text: "Eliminate review entirely", explanation: "Removing all review creates fraud and compliance risks."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "80/20 rule: 80% of improvement comes from addressing the highest-volume group",
                                "Automation + manual is the most pragmatic combination",
                            ],
                            explanation: "Process automation best practice: not \"fully automate or don't\" but tiered -- automate the simple, simplify the complex, retain manual for critical items.",
                            frameworkTip: "Automation tiers: High volume/low risk -> Fully automated / Medium volume/risk -> Semi-automated / Low volume/high risk -> Manual"
                        ),
                        Challenge(
                            id: 2,
                            name: "Process Simplification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best simplification approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Approval Process Simplification",
                                narrative: "Current purchase request flow:\n\nRequest -> Supervisor approval -> Department manager approval -> Finance review -> Procurement execution\n\nSame flow regardless of amount. A $50 mouse follows the same 4-level approval as a $50,000 server. Average: 5 days.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Remove all approvals", explanation: "No internal controls at all."),
                                Challenge.Option(id: "B", text: "Tier by amount: <$500 supervisor approves directly, $500-$10K add department manager, >$10K full approval flow", explanation: "Correct! Amount-based tiering is the most common approval optimization. A $50 mouse gets 1-level approval in 1 day; a $50K server gets 4-level approval in 5 days -- reasonable."),
                                Challenge.Option(id: "C", text: "Add more approvers to speed things up", explanation: "Adding people doesn't speed things up; it increases waiting."),
                                Challenge.Option(id: "D", text: "Switch everything to email approval", explanation: "Changing the channel doesn't solve process bloat."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Not all requests need the same approval rigor",
                                "Risk is proportional to amount",
                            ],
                            explanation: "Core process simplification principle: approval rigor should be proportional to risk. Low-risk transactions don't need the same process as high-risk ones.",
                            frameworkTip: "Approval simplification: Tier by amount/risk -> Simplify low-risk -> Retain high-risk"
                        ),
                    ]
                ),
                Quest(
                    id: "34-3",
                    name: "Value Stream Mapping",
                    description: "Use value stream maps to analyze end-to-end processes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Value vs Non-Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which activities are Non-Value-Added?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Activity Classification",
                                narrative: "Insurance claims process:\n\n1. Customer fills out claim form (15 min)\n2. Receiving clerk logs into system (10 min)\n3. Wait for reviewer assignment (2 days)\n4. Reviewer investigates (1 day)\n5. Supervisor reviews (half day)\n6. Finance issues payment (1 day)\n7. Notify customer (10 min)\n\nTotal: about 5 days.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All add value", explanation: "Some steps are necessary but don't create value for the customer."),
                                Challenge.Option(id: "B", text: "2. Data entry (can be automated) and 3. Waiting for assignment (pure waiting with no value) are Non-Value-Added", explanation: "Correct! 2. Manual data entry can be automated (customer fills online form that goes directly to system). 3. Waiting for assignment is pure waste (2 days/5 days = 40%). 4. Investigation is necessary VA. 5. Supervisor review may be Necessary Non-VA (compliance required but customer doesn't care)."),
                                Challenge.Option(id: "C", text: "All are Non-Value", explanation: "Investigation and payment are value activities the customer needs."),
                                Challenge.Option(id: "D", text: "Only 3. waiting is waste", explanation: "2. Manual data entry is also waste if it can be automated."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "VA = activities the customer would pay for",
                                "NVA = waiting, transport, rework",
                                "Necessary NVA = compliance-required but customer doesn't care",
                            ],
                            explanation: "Value Stream Mapping three categories: VA (value-adding), NVA (waste -- eliminate), Necessary NVA (required but non-value -- minimize).",
                            frameworkTip: "VSM three categories: VA (keep + optimize) / Necessary NVA (minimize) / NVA (eliminate)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Lead Time vs Process Time",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What does this data tell us?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Efficiency Ratio",
                                narrative: "Continuing the claims process analysis:\n\n- Lead Time (from customer submission to receiving payment): 5 days = 120 hours\n- Process Time (actual processing time total): 15min + 10min + 8hr + 4hr + 10min = about 12.5 hours\n- Wait Time: 120 - 12.5 = 107.5 hours",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Efficiency is high", explanation: "Process Time is only 10% of Lead Time. 90% of the time is spent waiting."),
                                Challenge.Option(id: "B", text: "Process Cycle Efficiency is only 10% (12.5/120); 90% is waiting. The biggest improvement opportunity is eliminating wait time", explanation: "Correct! PCE = Process Time / Lead Time. 10% is very low efficiency. The improvement focus isn't speeding up each step (they're already fast enough) but eliminating wait time between steps."),
                                Challenge.Option(id: "C", text: "Each step needs to be faster", explanation: "The steps themselves aren't slow (12.5 hours for claims investigation is reasonable). The problem is waiting."),
                                Challenge.Option(id: "D", text: "Insufficient data to judge", explanation: "The Lead Time vs Process Time comparison is quite clear."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "PCE = actual processing time / end-to-end time",
                                "Most processes have very low PCE (10-30%)",
                            ],
                            explanation: "Process Cycle Efficiency reveals a striking fact: in most processes, actual processing time accounts for only 10-30%; the rest is waiting. Improvement direction: eliminate waiting.",
                            frameworkTip: "PCE = Process Time / Lead Time. Target: from 10% -> 30%+. Improvement focus: eliminate waiting and handoffs."
                        ),
                    ]
                ),
                Quest(
                    id: "34-4",
                    name: "Root Cause Analysis",
                    description: "Use structured methods to find the root cause of problems",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "5 Whys",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most likely root cause for Why 5?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Problem Root Cause",
                                narrative: "Problem: Customer complaints increased 30%\n\nWhy 1: Customer service response too slow -> Why 2: Not enough CS staff -> Why 3: High turnover rate -> Why 4: High work pressure -> Why 5: ?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Low salary", explanation: "May be one factor, but what's more directly related to \"high work pressure\"?"),
                                Challenge.Option(id: "B", text: "Inefficient systems make processing each ticket take too long, causing an ever-growing backlog", explanation: "Correct! Inefficient systems -> slow processing -> growing backlog -> more pressure -> turnover -> fewer people -> even slower. It's a vicious cycle. The root cause is system efficiency, not \"not enough people.\" Adding people is only a temporary fix."),
                                Challenge.Option(id: "C", text: "Too many customers", explanation: "More customers is a good thing. The issue is processing efficiency."),
                                Challenge.Option(id: "D", text: "Poor management", explanation: "Too vague to be a specific root cause."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "5 Whys aims to find \"an improvable systemic root cause\"",
                                "Adding people treats symptoms; fixing systems treats root causes",
                            ],
                            explanation: "5 Whys helps jump past surface symptoms to find root causes. Key: each Why must have a causal relationship, and the final root cause should be an improvable systemic issue.",
                            frameworkTip: "5 Whys rule: Each Why has a causal link -> Root cause is an improvable systemic issue"
                        ),
                        Challenge(
                            id: 2,
                            name: "Fishbone Diagram",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which categories do these causes belong to?\n1. Developers didn't write unit tests\n2. Test environment differs from production\n3. Requirements change too frequently",
                            scenario: 
                            Challenge.Scenario(
                                title: "Ishikawa Diagram",
                                narrative: "You are using a fishbone diagram to analyze \"too many bugs after system launch.\" The six categories (6M):\n\n- Man (people)\n- Machine (equipment/tools)\n- Method (methods/processes)\n- Material (materials/data)\n- Measurement\n- Mother Nature (environment)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1. Man 2. Machine 3. Method", explanation: "1. is not just a \"Man\" issue; it's also a \"Method\" issue (no process/standard requiring tests)."),
                                Challenge.Option(id: "B", text: "1. Method (no process enforcing testing) 2. Environment (inconsistent environments) 3. Material (unstable requirements quality)", explanation: "Correct! 1. appears to be a people issue, but the root cause is no process requiring it (Method). 2. Test environment issues fall under Mother Nature/Environment. 3. Requirements are the \"material\" for development; unstable quality falls under Material."),
                                Challenge.Option(id: "C", text: "All are people issues", explanation: "Attributing everything to people is too simplistic. Look for systemic causes."),
                                Challenge.Option(id: "D", text: "All are method issues", explanation: "2. is an environment issue; 3. is a material/input quality issue."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "6M categories force comprehensive thinking",
                                "Don't just blame \"people\" -- look for systemic causes",
                            ],
                            explanation: "The fishbone diagram's value: forces you to think about causes from 6 dimensions. Avoids only blaming \"people are bad\" while ignoring systemic issues.",
                            frameworkTip: "Fishbone 6M: Man / Machine / Method / Material / Measurement / Mother Nature"
                        ),
                    ]
                ),
                Quest(
                    id: "34-5",
                    name: "Improvement Solution Evaluation",
                    description: "Evaluate and select the best improvement solutions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Quick Win Identification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which should be done first?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Improvement Matrix",
                                narrative: "You found 8 improvement opportunities. Using Impact/Effort matrix:\n\n| Improvement | Impact | Effort |\n|---|---|---|\n| A. Automate review rules | High | Medium |\n| B. System integration (3 systems -> 1) | High | High |\n| C. Add CS FAQ page | Medium | Low |\n| D. Rewrite entire system | High | Very High |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "D -- highest Impact", explanation: "Very high Effort (possibly 6-12 months); not suitable to do first."),
                                Challenge.Option(id: "B", text: "C (Quick Win) -> A (High Value) -> B (Major Project) -> D (evaluate ROI)", explanation: "Correct! C is the Quick Win (low cost, medium impact, visible results in 1-2 weeks) -> build confidence, then do A (medium cost, high impact, core improvement) -> then B (needs more resources but high value) -> D needs a business case to prove ROI."),
                                Challenge.Option(id: "C", text: "A -- best Impact/Effort ratio", explanation: "A is a good choice but C shows results faster. Building confidence with Quick Wins first is important."),
                                Challenge.Option(id: "D", text: "Do everything simultaneously", explanation: "Limited resources make doing everything at once impossible. Sequencing is needed."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Quick Wins build confidence -> major improvements gain support",
                                "Highest Impact/Effort ratio goes first",
                            ],
                            explanation: "Improvement sequence: Quick Wins first (build confidence and momentum) -> High Value items (core improvements) -> Major Projects (need resources and support).",
                            frameworkTip: "Improvement sequence: Quick Win (low effort, medium impact) -> High Value (medium effort, high impact) -> Major (high effort, high impact)"
                        ),
                        Challenge(
                            id: 2,
                            name: "ROI Calculation",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the approximate Payback Period for this proposal?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Automation ROI",
                                narrative: "Automation proposal:\n- Development cost: $150K (one-time)\n- Maintenance cost: $30K/year\n- Expected savings: 2 FTEs per year ($120K/person/year = $240K/year)\n- Estimated 6-month development",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "6 months", explanation: "Doesn't account for zero savings during development."),
                                Challenge.Option(id: "B", text: "About 10-11 months: 6 months development ($0 savings) + after launch, monthly net savings $17.5K ($240K-$30K=$210K/year / 12), to recover $150K takes about 8.6 months -> 6 + 4.6 = about 10-11 months", explanation: "Correct! Payback = Development period (6 months) + Investment recovery ($150K / $17.5K/month = 8.6 months) = about 14.6 months. Starting year two, net gain is $210K/year."),
                                Challenge.Option(id: "C", text: "2 years", explanation: "Too long. With net savings of $210K/year, $150K is recovered in less than a year."),
                                Challenge.Option(id: "D", text: "Cannot be calculated", explanation: "Sufficient data is available for estimation."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Payback = investment / net savings per period",
                                "Don't forget there are zero savings during the development period",
                            ],
                            explanation: "ROI analysis must consider: one-time costs, ongoing costs, expected savings, and time. Payback Period lets decision-makers know how long until break-even.",
                            frameworkTip: "Payback Period = Development period + (One-time cost / Monthly net savings)"
                        ),
                    ]
                ),
                Quest(
                    id: "34-6",
                    name: "Process Improvement Case Study",
                    description: "A complete process improvement project",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: End-to-End Process Improvement",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Returns Process",
                                narrative: "E-commerce returns process: Customer applies -> CS reviews (1 day) -> Ships back (3 days) -> Warehouse inspects (2 days) -> Finance refunds (3 days) -> Notifies customer (1 day)\n\nTotal: 10 days. Industry average: 5 days. Customer satisfaction scores are lower than competitors due to return experience.\n\nAnnual return volume: 50,000 items, $15 processing cost per item.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Quantify time and cost for each step first",
                                "Identify which steps can be automated or parallelized",
                            ],
                            explanation: "End-to-end process improvement: As-Is (quantify) -> Root Cause -> To-Be (design) -> Quantify results -> Implementation priorities.",
                            frameworkTip: "Process improvement: As-Is -> Bottlenecks + Waste -> Root Cause -> To-Be -> Quantified results -> Quick Wins first"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 35: UAT & Quality Assurance
        World(
            id: 35,
            name: "UAT & Quality Assurance",
            emoji: "✅",
            description: "Plan and execute User Acceptance Testing to ensure delivery quality",
            quests: [
                Quest(
                    id: "35-1",
                    name: "UAT Planning",
                    description: "Design an effective UAT strategy and plan",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "UAT Purpose",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why is UAT needed?",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT vs QA",
                                narrative: "The dev team has completed unit testing and QA testing. The PM asks: \"QA already tested everything. Why do we still need UAT? It's a waste of time.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Redundant testing to ensure quality", explanation: "UAT doesn't repeat QA tests. It tests different things."),
                                Challenge.Option(id: "B", text: "QA tests \"does the system work per spec\"; UAT tests \"does the system solve the user's actual problem\"", explanation: "Correct! QA = Verification (did we build it right?), UAT = Validation (did we build the right thing?). QA may pass but UAT may fail, because \"built to spec\" doesn't mean \"user is satisfied.\""),
                                Challenge.Option(id: "C", text: "Let users find bugs", explanation: "UAT's purpose isn't finding bugs (that's QA's job) but confirming the system meets user expectations."),
                                Challenge.Option(id: "D", text: "Regulatory requirement", explanation: "Some industries require it but this isn't UAT's core purpose."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Verification = did we build it right (spec)",
                                "Validation = did we build the right thing (needs)",
                            ],
                            explanation: "QA (Verification) ensures the system works per spec. UAT (Validation) ensures the system solves real business problems. Both are needed.",
                            frameworkTip: "QA = Verification (Build the thing right) / UAT = Validation (Build the right thing)"
                        ),
                        Challenge(
                            id: 2,
                            name: "UAT Plan",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which UAT plan is most complete?",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT Preparation",
                                narrative: "You need to plan UAT. 3 weeks before launch. You need to decide: who tests, what to test, how to test, and how long.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Ask users to try it out casually and report issues", explanation: "Unstructured testing will miss critical scenarios. Users won't know what to test."),
                                Challenge.Option(id: "B", text: "Define UAT scope + test cases + testers (including role representatives) + environment + timeline + exit criteria + defect handling process", explanation: "Correct! Complete UAT plan: Scope (what to test) -> Test Cases (how to test) -> Testers (who tests, with role representatives) -> Environment (test environment) -> Timeline -> Exit Criteria (pass standards) -> Defect Process."),
                                Challenge.Option(id: "C", text: "Write a 100-page test plan", explanation: "Too heavy. UAT plans should be pragmatic. The key is covering core business flows."),
                                Challenge.Option(id: "D", text: "Have QA team substitute for users", explanation: "QA cannot substitute for users. UAT's value lies in real users testing with real-world thinking."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "UAT plan essentials: who tests, what to test, how to determine pass/fail",
                            ],
                            explanation: "UAT plan must answer: Scope + Test Cases + Testers + Environment + Timeline + Exit Criteria + Defect Process.",
                            frameworkTip: "UAT plan 7 elements: Scope / Test Cases / Testers / Environment / Timeline / Exit Criteria / Defect Process"
                        ),
                    ]
                ),
                Quest(
                    id: "35-2",
                    name: "Test Case Design",
                    description: "Design test cases covering core business flows",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Business Scenario Testing",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What are these test cases missing?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Test Case Coverage",
                                narrative: "You wrote 5 UAT test cases for the e-commerce checkout flow:\n\n1. Normal checkout successful\n2. Credit card payment successful\n3. Convenience store pickup payment successful\n4. Checkout with discount code\n5. Single product checkout",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Sufficient; 5 is enough to cover", explanation: "Only Happy Paths. Missing exception scenarios and boundary conditions."),
                                Challenge.Option(id: "B", text: "Missing exception scenarios: payment failure, out of stock, expired discount code, cart modified after checkout start, multi-item checkout, etc.", explanation: "Correct! UAT should cover: Happy Path + Exception scenarios + Boundary conditions + Common user behaviors. Users encounter various abnormal situations in real environments."),
                                Challenge.Option(id: "C", text: "Need more Happy Paths", explanation: "Not insufficient Happy Paths; missing non-normal scenarios."),
                                Challenge.Option(id: "D", text: "Need performance testing", explanation: "Performance testing is typically not within UAT scope (that's Performance Testing)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Users encounter \"non-normal\" situations in real environments",
                                "Happy Paths are only 20% of test cases",
                            ],
                            explanation: "UAT Test Case design: Happy Path (normal flow) + Alternative Path (other valid paths) + Exception Path (abnormal situations) + Edge Cases (boundary conditions).",
                            frameworkTip: "Test Case coverage: Happy Path + Alternative + Exception + Edge Case + Cross-functional"
                        ),
                        Challenge(
                            id: 2,
                            name: "Test Case Format",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which is more suitable for UAT?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Test Case Quality",
                                narrative: "Two test case versions:\n\nV1: \"Test checkout functionality\"\n\nV2: \"TC-001: Normal credit card checkout\nPrecondition: Logged in + 1 item in cart ($500)\nSteps: 1. Click checkout 2. Select credit card 3. Enter card number 4. Click pay\nExpected: Display order confirmation page + order number + $500 charged + receive email confirmation\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "V1 -- simple, gives users freedom", explanation: "Too vague. Users won't know what to test or how to judge pass/fail."),
                                Challenge.Option(id: "B", text: "V2 -- has preconditions, steps, and expected results so users can follow and judge pass/fail", explanation: "Correct! A good UAT Test Case: Test ID + Preconditions + Clear steps + Specific expected results. Users don't need to guess."),
                                Challenge.Option(id: "C", text: "Combine both", explanation: "V1 is too vague to use. V2 is already complete enough."),
                                Challenge.Option(id: "D", text: "No test cases needed; users explore on their own", explanation: "Exploratory testing can supplement but cannot replace structured test cases."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Users are not testing experts; they need clear guidance",
                                "Test Cases must enable Pass/Fail judgment",
                            ],
                            explanation: "UAT Test Case = Precondition + Steps + Expected results. Enables non-technical users to execute and judge.",
                            frameworkTip: "Test Case format: ID + Preconditions + Steps (1,2,3...) + Expected results + Actual results + Pass/Fail"
                        ),
                    ]
                ),
                Quest(
                    id: "35-3",
                    name: "Defect Management",
                    description: "Effectively track and manage UAT defects",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Bug Classification",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Severity ranking?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Defect Severity",
                                narrative: "UAT found these issues:\n\n1. Clicking \"Pay\" has no response (cannot complete order)\n2. Confirmation page logo is 2 pixels off to the right\n3. Discount code only works in lowercase (uppercase not accepted)\n4. All orders are overcharged by $10",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All Critical", explanation: "A logo offset is not Critical. Severity must be differentiated for effective prioritization."),
                                Challenge.Option(id: "B", text: "4. Critical (amount error affects all orders) > 1. Critical (core function failure) > 3. Major (affects usage but has workaround) > 2. Minor (purely cosmetic)", explanation: "Correct! 4. is most severe because it affects all orders and involves money. 1. core function failure. 3. has a workaround (use lowercase) but impacts experience. 2. purely visual."),
                                Challenge.Option(id: "C", text: "1 > 2 > 3 > 4", explanation: "4. amount errors affect everyone and involve money, more severe than 1."),
                                Challenge.Option(id: "D", text: "All not serious; fix after launch", explanation: "4. and 1. are showstoppers that cannot go to production."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Severity depends on: scope of impact x degree of impact",
                                "Amount errors involve legal and trust issues",
                            ],
                            explanation: "Defect severity: Critical (unusable/data errors) > Major (functionality limited but has workaround) > Minor (doesn't affect functionality) > Cosmetic (purely visual).",
                            frameworkTip: "Severity: Critical (blocks launch) > Major (serious but has workaround) > Minor (small issue) > Cosmetic (visual only)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Go/No-Go Decision",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is your recommendation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Launch Decision",
                                narrative: "UAT is complete. Results:\n\n- 50 test cases: 45 Pass, 5 Fail\n- Of the 5 Fails: 0 Critical, 2 Major (with workarounds), 3 Minor\n- Launch date is next Monday; a 1-week delay costs $50K in revenue\n- The 2 Major bugs need 3 days to fix",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Cannot launch; need 100% Pass", explanation: "Pursuing 100% is impractical. 0 Critical + workarounds available = conditional launch is possible."),
                                Challenge.Option(id: "B", text: "Recommend conditional launch: 0 Critical meets Exit Criteria, 2 Major have workarounds with 3-day hotfix plan, close monitoring post-launch", explanation: "Correct! Go/No-Go is not black and white. Conditional launch: (1) No Critical (2) Major has workaround + hotfix plan (3) Post-launch monitoring. Document risks for stakeholders to make an informed decision."),
                                Challenge.Option(id: "C", text: "Launch immediately ignoring all bugs", explanation: "Cannot ignore. A fix plan is needed."),
                                Challenge.Option(id: "D", text: "Delay two weeks to ensure perfection", explanation: "Losing $100K when no bugs are Critical is too costly."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Go/No-Go is a risk decision, not perfectionism",
                                "Conditional launch = launch + fix plan + monitoring",
                            ],
                            explanation: "Go/No-Go decision: The BA's role is presenting facts and risks for stakeholders to make an informed decision. \"Conditional launch\" is a common and reasonable choice.",
                            frameworkTip: "Go/No-Go: 0 Critical = launch viable / Major has workaround + hotfix plan / Document risks"
                        ),
                    ]
                ),
                Quest(
                    id: "35-4",
                    name: "Exit Criteria Design",
                    description: "Define clear UAT pass criteria",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Exit Criteria",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What are the most pragmatic Exit Criteria?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Pass Standards",
                                narrative: "You need to define Exit Criteria before UAT begins. The PO says: \"Everything must pass before we can launch.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "100% test cases pass", explanation: "Too strict. In practice, 100% pass is rare. What matters is handling Critical and Major issues."),
                                Challenge.Option(id: "B", text: "95%+ test cases pass + 0 open Critical + all Major have workaround or fix plan + all core business flows pass", explanation: "Correct! Pragmatic Exit Criteria: coverage threshold + severity threshold + core flow threshold. Allow Minor and Cosmetic fixes after launch."),
                                Challenge.Option(id: "C", text: "No standards; PO decides by feel", explanation: "Without objective standards, disputes and risks arise."),
                                Challenge.Option(id: "D", text: "Only core flows need to pass", explanation: "Too lenient. Quantified thresholds are needed."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Exit Criteria must be defined before UAT starts",
                                "Must be pragmatic but with clear standards",
                            ],
                            explanation: "Exit Criteria defined before UAT starts prevent subjective disputes at launch time. Good EC is quantified, tiered, and pragmatic.",
                            frameworkTip: "Exit Criteria = Pass rate threshold + Severity threshold + Core flow threshold + Fix plan requirement"
                        ),
                        Challenge(
                            id: 2,
                            name: "Sign-off Process",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT Sign-off",
                                narrative: "UAT is complete. You prepare the UAT Sign-off document. The business manager hesitates: \"If something goes wrong after launch, am I responsible?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Say \"there won't be any problems\"", explanation: "Cannot guarantee no problems. Must honestly present risks."),
                                Challenge.Option(id: "B", text: "Prepare clear Sign-off documentation: UAT results summary + known issues and handling plans + remaining risks + post-launch monitoring plan, enabling the manager to make an informed decision", explanation: "Correct! Sign-off is not \"guaranteeing no problems\" but \"confirming known status is acceptable.\" The BA must provide complete information for the signer to make an informed decision."),
                                Challenge.Option(id: "C", text: "Ask the PM to handle it", explanation: "Deflecting is unprofessional. Presenting UAT results is the BA's responsibility."),
                                Challenge.Option(id: "D", text: "No sign-off needed; just launch", explanation: "Formal Sign-off is an important step for risk management and accountability."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sign-off = confirming known status is acceptable, not guaranteeing no problems",
                                "BA's responsibility: provide complete information",
                            ],
                            explanation: "UAT Sign-off documentation: test results summary + known issues + handling plan + remaining risks + monitoring plan. Enable signers to make an informed decision.",
                            frameworkTip: "Sign-off document: Results summary + Known issues + Fix plan + Remaining risks + Monitoring plan"
                        ),
                    ]
                ),
                Quest(
                    id: "35-5",
                    name: "Regression Testing",
                    description: "Ensure changes don't affect existing functionality",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Regression Test Scope",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What should regression testing cover?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Change Impact",
                                narrative: "After launch, a bug is found: discount calculation error. After the fix, you need to determine regression test scope.\n\nThe change involves: discount calculation module. Related features: checkout, shopping cart, order summary, invoices, reports.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Only test discount calculation", explanation: "The change may affect other features that use the discount amount."),
                                Challenge.Option(id: "B", text: "Test discount calculation + all amount-related features (checkout, order summary, invoices, reports)", explanation: "Correct! Regression testing should cover: directly modified features + upstream/downstream related features. If the discount amount changed, all places that display or use amounts must be verified."),
                                Challenge.Option(id: "C", text: "Retest all features", explanation: "Too broad. Time doesn't allow and it's unnecessary. Only test the affected scope."),
                                Challenge.Option(id: "D", text: "No regression testing needed", explanation: "Skipping regression after a change is very risky. \"Fix one, break two\" happens too often."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Impact analysis: what upstream/downstream features does this change affect?",
                                "Regression testing = ensure the fix doesn't break other things",
                            ],
                            explanation: "Regression test scope = directly modified + upstream/downstream impact. BA's value: perform Impact Analysis to determine regression scope -- not too narrow, not too broad.",
                            frameworkTip: "Regression scope: Direct change + Upstream/downstream features + Shared modules. BA does Impact Analysis to determine scope."
                        ),
                        Challenge(
                            id: 2,
                            name: "Test Automation Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What should the BA recommend?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Testing Pyramid",
                                narrative: "Your system requires regression testing with every update. Manual testing takes 3 days (50 test cases). Updates happen every two weeks. The team feels manual regression is taking too much time.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Stop testing; just deploy", explanation: "Too risky."),
                                Challenge.Option(id: "B", text: "Recommend automating core business flow regression tests to reduce manual time. BA's role: define which scenarios are most important for automation", explanation: "Correct! The BA's role isn't writing automation scripts but defining \"which scenarios are most important.\" Core business flows (checkout, payment, refund) get automated first. Target: 3 days manual -> 1 day automated + 1 day manual (new features and complex scenarios)."),
                                Challenge.Option(id: "C", text: "Automate everything", explanation: "Full automation is costly and some scenarios aren't suitable (like UI experience)."),
                                Challenge.Option(id: "D", text: "Reduce test cases", explanation: "Reducing tests increases risk. Automation should improve efficiency, not reduce coverage."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA defines \"what to test\"; QA/Dev decides \"how to automate\"",
                                "Core flows get automated first",
                            ],
                            explanation: "BA's role in test automation: define business priority. Which scenarios run most often? Are most critical? Are most suitable for automation? The BA doesn't write scripts but provides test cases and priorities.",
                            frameworkTip: "Automation priority: Core business flows > High-frequency scenarios > Regression repeated cases > Edge Cases"
                        ),
                    ]
                ),
                Quest(
                    id: "35-6",
                    name: "UAT Complete Case Study",
                    description: "Plan a complete UAT",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: UAT Planning",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "New Loyalty System UAT",
                                narrative: "A new e-commerce loyalty program is about to launch. Features: points, tiers, redemption, member pricing.\n\nLaunch date is 4 weeks out. You need to plan UAT.\nStakeholders: Marketing (points rules), Customer Service (member inquiries), Finance (points cost).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Different departments test different features",
                                "Timeline must include time for fixes and regression",
                            ],
                            explanation: "Complete UAT planning: Scope -> Test Cases -> Exit Criteria -> Timeline -> Defect Process -> Sign-off.",
                            frameworkTip: "UAT planning = Scope + Test Cases + Exit Criteria + Timeline + Defect Process + Sign-off"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 36: Business Analysis Frameworks
        World(
            id: 36,
            name: "Business Analysis Frameworks",
            emoji: "🧠",
            description: "Master SWOT, Porter's Five Forces, PESTLE, and other strategic analysis frameworks",
            quests: [
                Quest(
                    id: "36-1",
                    name: "SWOT Analysis",
                    description: "Identify strengths, weaknesses, opportunities, and threats",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SWOT Classification",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which classification is most correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SWOT Analysis",
                                narrative: "You are a BA at an e-commerce company. Your manager asks for a SWOT analysis. Company status:\n\n- Own warehouse with fast shipping (average 24hr)\n- Tech team of only 5 people\n- Southeast Asian e-commerce market growing rapidly\n- Major platforms (Shopee, Momo) are cutting prices to grab market share",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All are Threats", explanation: "Fast shipping is a strength; SE Asia growth is an opportunity."),
                                Challenge.Option(id: "B", text: "S: Fast shipping / W: Small tech team / O: SE Asia market / T: Major platforms cutting prices", explanation: "Correct! S/W are internal factors (what we control); O/T are external factors (environmental trends). Shipping speed is an internal strength, tech team size is an internal weakness, SE Asia is an external opportunity, platform price wars are an external threat."),
                                Challenge.Option(id: "C", text: "S: SE Asia market / W: Platform price wars", explanation: "S/W are internal factors, not external."),
                                Challenge.Option(id: "D", text: "Cannot classify; need more information", explanation: "Information is sufficient for initial classification."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "S/W = internal (ours)",
                                "O/T = external (environment)",
                            ],
                            explanation: "SWOT core: Internal (Strengths/Weaknesses) vs External (Opportunities/Threats). Post-analysis focus is strategy: use S to capture O, use S to counter T, improve W, avoid W+T.",
                            frameworkTip: "SWOT: S/W look internal (talent/tech/resources) / O/T look external (market/competition/trends)"
                        ),
                        Challenge(
                            id: 2,
                            name: "SWOT to Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best SO strategy (use Strengths to capture Opportunities)?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SWOT Strategy",
                                narrative: "Continuing the SWOT:\nS: Fast shipping, high customer loyalty\nW: Small tech team, narrow product line\nO: SE Asia market, subscription trend\nT: Major platforms cutting prices, talent competition",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Cut prices to compete with major platforms", explanation: "Price cutting uses W against T. Not an SO strategy."),
                                Challenge.Option(id: "B", text: "Leverage fast shipping + loyal customer base to launch a subscription service in SE Asia", explanation: "Correct! SO strategy: use \"fast shipping\" + \"customer loyalty\" strengths to capture \"SE Asia market\" + \"subscription trend\" opportunities. Fast shipping makes subscription experience great; loyal customers become first subscribers."),
                                Challenge.Option(id: "C", text: "Hire more engineers", explanation: "This improves W, not an SO strategy."),
                                Challenge.Option(id: "D", text: "Do nothing", explanation: "Wastes a clear SO opportunity."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "SO = use our strengths to capture external opportunities",
                                "The intersection of S+O is the best strategy",
                            ],
                            explanation: "SWOT matrix four strategies: SO (use S to capture O), ST (use S to counter T), WO (improve W to capture O), WT (improve W to avoid T). SO is the most proactive strategy.",
                            frameworkTip: "SWOT strategy matrix: SO (attack) / WO (improve) / ST (defend) / WT (retreat/transform)"
                        ),
                    ]
                ),
                Quest(
                    id: "36-2",
                    name: "Porter's Five Forces",
                    description: "Analyze industry competitive forces",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Five Forces Analysis",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Where is the greatest competitive pressure currently?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Industry Analysis",
                                narrative: "Analyzing the food delivery platform market (Uber Eats, foodpanda):\n\n- New entrants: Line is considering entering the delivery market\n- Substitutes: Takeaway, supermarket ready-meals, home cooking\n- Suppliers (restaurants): Some top restaurants refuse to join platforms\n- Buyers (consumers): Price-sensitive, compare delivery fees\n- Existing competition: Two giants competing with subsidies",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "New entrants (Line)", explanation: "Line is still considering; the threat hasn't materialized."),
                                Challenge.Option(id: "B", text: "Intense competition between existing players (subsidy wars) + high buyer price sensitivity", explanation: "Correct! Two-giant subsidy wars (intense existing competition) + consumers focused only on price (high buyer bargaining power) = double pressure squeezing margins. This explains why delivery platforms struggle to be profitable."),
                                Challenge.Option(id: "C", text: "Substitutes", explanation: "Takeaway and home cooking have always existed; they're not new pressure."),
                                Challenge.Option(id: "D", text: "Suppliers", explanation: "Top restaurants refusing is a loss but not the greatest pressure. Most restaurants are willing to join."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Five Forces analysis: find the greatest pressure point",
                                "Margin squeeze usually comes from competition + buyer dual pressure",
                            ],
                            explanation: "Porter's Five Forces helps understand industry structure. The delivery market profitability challenge: high competition + high buyer bargaining power = low margins. Strategic direction: differentiation (not just price competition).",
                            frameworkTip: "Five Forces: New entrants / Substitutes / Supplier bargaining / Buyer bargaining / Existing competition. Greatest pressure = profitability barrier."
                        ),
                        Challenge(
                            id: 2,
                            name: "Strategic Recommendations",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the most strategic recommendation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Competitive Strategy",
                                narrative: "Based on Five Forces analysis, you need to recommend strategy for a delivery platform.\n\nProblems:\n- Subsidy wars are unsustainable\n- Consumers only look at price\n- Restaurant commission of 25-35% causes resentment\n- Line may enter (with 12 million user base)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Continue subsidies to grab market", explanation: "Unsustainable. What happens when the money runs out?"),
                                Challenge.Option(id: "B", text: "Build switching costs: membership program (monthly fee for free delivery) + exclusive restaurants + data-driven personalized recommendations. Reduce buyer bargaining power + raise entry barriers", explanation: "Correct! Strategy core: build a moat. Membership -> reduce price sensitivity. Exclusive restaurants -> supplier lock-in. Personalized recommendations -> experience differentiation. Even if Line enters, paying members won't switch."),
                                Challenge.Option(id: "C", text: "Lower restaurant commissions", explanation: "Short-term pleases restaurants but further reduces margins. Not a strategic solution."),
                                Challenge.Option(id: "D", text: "Exit the market", explanation: "Market is still growing; exiting is too early."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Porter's core: build sustainable competitive advantage",
                                "Switching costs = the cost for customers to leave",
                            ],
                            explanation: "Strategic response to Five Forces: build a moat to reduce pressure from all sides. Membership (reduce buyer bargaining power), exclusive content (raise entry barriers), differentiated experience (reduce substitute threat).",
                            frameworkTip: "Strategic response to Five Forces: Build switching costs + Differentiation + Exclusive supply + Economies of scale + Innovation"
                        ),
                    ]
                ),
                Quest(
                    id: "36-3",
                    name: "PESTLE Analysis",
                    description: "Analyze macro-environmental factors",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "PESTLE Classification",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Correct PESTLE classification?",
                            scenario: 
                            Challenge.Scenario(
                                title: "PESTLE Factors",
                                narrative: "You are evaluating a fintech company's external environment:\n\n- Government promotes digital payment policies\n- GDP growth slowing\n- Gen Z prefers mobile payments\n- AI technology developing rapidly\n- Personal data protection laws becoming stricter\n- Green finance trend",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All are T (Technology)", explanation: "Only AI is Technology. Policy is Political; GDP is Economic."),
                                Challenge.Option(id: "B", text: "P: Digital payment policy / E: GDP slowdown / S: Gen Z preferences / T: AI technology / L: Data protection law / E(Environment): Green finance", explanation: "Correct! PESTLE six dimensions: Political (policy), Economic (economy), Social (society/demographics), Technological (technology), Legal (law), Environmental (environment)."),
                                Challenge.Option(id: "C", text: "Too many factors to classify", explanation: "PESTLE exists precisely to systematically classify external factors."),
                                Challenge.Option(id: "D", text: "P and L are the same", explanation: "Political is the policy direction (may change); Legal is enacted legislation (must comply)."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "PESTLE = Political / Economic / Social / Technological / Legal / Environmental",
                            ],
                            explanation: "PESTLE ensures you don't miss any macro-environmental factors. Each dimension can bring opportunities or threats, connecting to SWOT's O/T.",
                            frameworkTip: "PESTLE -> SWOT O/T. Is a policy change an opportunity or threat? Is a technology trend an opportunity or threat?"
                        ),
                        Challenge(
                            id: 2,
                            name: "PESTLE Application",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What should the BA do?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Impact Assessment",
                                narrative: "Stricter personal data protection law (PESTLE's L).\n\nYour company collects extensive user behavior data for personalized recommendations. New regulations require: explicit consent, data minimization, right to deletion.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This is Legal's concern", explanation: "The BA needs to analyze the regulation's impact on products and processes."),
                                Challenge.Option(id: "B", text: "Impact Analysis: Analyze regulation's effect on existing features -> List features needing modification (consent mechanism, data collection scope, deletion capability) -> Assess cost and timeline -> Propose compliance plan", explanation: "Correct! BA's value: translate regulatory requirements into specific system and process changes. Legal says \"must comply\"; the BA defines \"how to implement compliance in the system.\""),
                                Challenge.Option(id: "C", text: "Stop collecting data", explanation: "Too extreme. Data collection can continue within compliance."),
                                Challenge.Option(id: "D", text: "Wait until the regulation takes effect", explanation: "Regulations typically have a transition period; prepare early to be ready in time."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA's value: translate external requirements into system and process changes",
                                "Action after PESTLE analysis matters more than the analysis itself",
                            ],
                            explanation: "The purpose of PESTLE analysis isn't the analysis itself but triggering action. The BA translates external changes into specific requirements and action plans.",
                            frameworkTip: "PESTLE -> Impact Analysis -> Features/processes needing change -> Action plan"
                        ),
                    ]
                ),
                Quest(
                    id: "36-4",
                    name: "Business Model Canvas",
                    description: "Describe a business model on one page",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "BMC Nine Blocks",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is Netflix's core Value Proposition?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BMC Analysis",
                                narrative: "You are analyzing Netflix's business model. The CEO wants you to present it on one page using the Business Model Canvas.\n\nBMC nine blocks:\n1. Customer Segments\n2. Value Propositions\n3. Channels\n4. Customer Relationships\n5. Revenue Streams\n6. Key Resources\n7. Key Activities\n8. Key Partnerships\n9. Cost Structure",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Cheap", explanation: "Cheaper than theaters, but not the core value. There are cheaper pirated options, yet people still choose Netflix."),
                                Challenge.Option(id: "B", text: "Watch unlimited content anytime, anywhere + personalized recommendations + original content", explanation: "Correct! Three value layers: Convenience (watch anytime) + Choice (unlimited content) + Discovery (recommendation algorithm helps find what you want) + Exclusivity (Netflix-only originals)."),
                                Challenge.Option(id: "C", text: "Has lots of content", explanation: "\"Lots\" is not differentiation. Other platforms also have lots. The key is recommendations and originals."),
                                Challenge.Option(id: "D", text: "Good video quality", explanation: "Video quality is a baseline expectation, not a core value."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Value Proposition = why customers choose you over competitors",
                                "It's not just features; it's value",
                            ],
                            explanation: "Value Proposition is the BMC's core. It answers: Why do customers pay you? What problem do you solve or what value do you provide?",
                            frameworkTip: "Value Proposition = What problem solved + What value provided + Why choose you over others"
                        ),
                        Challenge(
                            id: 2,
                            name: "BMC Consistency",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the biggest problem with this BMC?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BMC Issues",
                                narrative: "A startup's BMC:\n\nCustomer: Enterprise clients (B2B)\nValue Prop: Low-cost SaaS\nChannels: Social media advertising\nRevenue: Monthly subscription $99/month\nKey Resources: 3-person engineering team\nCost Structure: High Google Ads spending",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Price is too low", explanation: "May be an issue but not a BMC structural problem."),
                                Challenge.Option(id: "B", text: "Channel doesn't match Customer -- B2B enterprise clients rarely purchase SaaS through social media ads. Should use content marketing / Sales / Partners", explanation: "Correct! BMC's nine blocks must be internally consistent. B2B decision-makers won't buy SaaS because of a Facebook ad. Right Channel: LinkedIn + content marketing + sales team + industry events. Also, high Google Ads spending doesn't match B2B."),
                                Challenge.Option(id: "C", text: "Team is too small", explanation: "A 3-person team is fine at the MVP stage."),
                                Challenge.Option(id: "D", text: "No partnerships", explanation: "An issue but not \"the biggest\" structural problem."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BMC nine blocks must reinforce each other",
                                "Channels must match Customer Segments",
                            ],
                            explanation: "BMC's value lies in checking consistency. Each block isn't independent but interconnected. Channels match Customer, Revenue matches Value Prop, Cost matches Key Activities.",
                            frameworkTip: "BMC consistency check: Channel matches Customer / Revenue matches Value Prop / Cost matches Activities"
                        ),
                    ]
                ),
                Quest(
                    id: "36-5",
                    name: "Cost-Benefit Analysis",
                    description: "Quantify the costs and benefits of proposals",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CBA Fundamentals",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which proposal is better by 3-year NPV (ignoring discounting)?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Proposal Comparison",
                                narrative: "Two proposals to solve CS efficiency issues:\n\nProposal A: Chatbot\n- Development cost: $200K\n- Annual maintenance: $50K\n- Expected 40% reduction in CS calls (saves $300K/year)\n\nProposal B: CS system upgrade\n- Upgrade cost: $100K\n- Annual maintenance: $30K\n- Expected 25% efficiency improvement (saves $180K/year)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Proposal A: Total investment $350K, total savings $900K, net benefit $550K", explanation: "Calculation: $200K + $50K x 3 = $350K cost, $300K x 3 = $900K savings. Net benefit $550K."),
                                Challenge.Option(id: "B", text: "Proposal B: Total investment $190K, total savings $540K, net benefit $350K", explanation: "Calculation is correct but Proposal A has higher net benefit."),
                                Challenge.Option(id: "C", text: "Proposal A net benefit $550K > Proposal B $350K, but Proposal B has higher ROI (184% vs 157%). Recommendation depends on budget", explanation: "Correct! Proposal A earns more but requires more investment. Proposal B invests less with higher ROI. With sufficient budget, choose A; with limited budget, choose B. The BA should present both dimensions for decision-makers."),
                                Challenge.Option(id: "D", text: "Cannot compare", explanation: "Sufficient data is available for comparison."),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "CBA compares not just net benefit but also ROI",
                                "Invest the same money where ROI is higher",
                            ],
                            explanation: "CBA should examine multiple dimensions: net benefit (absolute value), ROI (relative value), Payback Period (recovery time). Different dimensions may point to different conclusions; the BA must present the complete picture.",
                            frameworkTip: "CBA three dimensions: Net benefit (how much earned) / ROI (return rate) / Payback (how quickly recovered)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Hidden Costs",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What does this illustrate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Complete Costs",
                                narrative: "The Chatbot proposal was approved. During detailed cost analysis, you discover:\n\nBeyond development and maintenance costs, there are:\n- Training the chatbot requires 3 months of CS manager time ($30K opportunity cost)\n- Risk of customer churn due to poor chatbot experience (estimated 2% churn = $100K/year)\n- Hidden IT team hours for maintenance and model updates\n- Organizational change costs (CS team restructuring)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Shouldn't do the Chatbot", explanation: "Not necessarily. But hidden costs must be factored in for re-evaluation."),
                                Challenge.Option(id: "B", text: "CBA must include both explicit and hidden costs. Initial analysis often underestimates costs by only looking at direct expenses", explanation: "Correct! Common CBA mistake: only seeing direct costs (development + maintenance), ignoring indirect costs (opportunity cost, risk cost, organizational change cost). BA's value: showing decision-makers the complete cost picture."),
                                Challenge.Option(id: "C", text: "All costs are unpredictable", explanation: "They can be estimated. What matters is acknowledging uncertainty and providing ranges (best/most likely/worst)."),
                                Challenge.Option(id: "D", text: "These don't matter", explanation: "Customer churn at $100K/year is very significant."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Visible costs are just the tip of the iceberg",
                                "BA must help reveal the complete cost picture",
                            ],
                            explanation: "Complete CBA includes: direct costs + indirect costs (opportunity cost, risk cost, organizational change) + non-quantifiable factors (employee morale, brand impact).",
                            frameworkTip: "Cost completeness: Direct costs + Opportunity costs + Risk costs + Organizational change costs + Maintenance costs"
                        ),
                    ]
                ),
                Quest(
                    id: "36-6",
                    name: "Strategic Analysis Comprehensive Case",
                    description: "Use multiple frameworks to analyze a business problem",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Strategic Analysis Report",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Market Entry Analysis",
                                narrative: "You are the BA at a mid-size e-commerce company. The CEO is considering entering the Southeast Asian market (Vietnam or Thailand).\n\nCompany status: 5% domestic market share, $50M annual revenue, 30-person tech team, own warehouse logistics.\n\nCompetitors Shopee and Lazada are already in SE Asia.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Multiple frameworks complement each other, not used independently",
                                "Recommendations must be specific and actionable",
                            ],
                            explanation: "Strategic analysis isn't \"using one framework\" but \"multiple frameworks that validate and complement each other.\" PESTLE -> O/T -> SWOT -> Strategy -> BMC -> Action plan.",
                            frameworkTip: "Strategic analysis flow: PESTLE (environment) -> Five Forces (industry) -> SWOT (us) -> Strategy choice -> BMC (business model)"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 37: BA Career Development
        World(
            id: 37,
            name: "BA Career Development",
            emoji: "🚀",
            description: "Plan your BA career path, prepare for interviews, and commit to continuous learning",
            quests: [
                Quest(
                    id: "37-1",
                    name: "BA Career Paths",
                    description: "Understand different BA career directions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Career Directions",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What are the BA career development paths?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA Career",
                                narrative: "You've been a BA for 3 years and are thinking about next steps. Your manager says BAs have many development options beyond just \"Senior BA.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Can only stay a BA forever", explanation: "BA skills open many development directions."),
                                Challenge.Option(id: "B", text: "Expert track (Senior/Lead BA), Management track (BA Manager), Pivot track (Product Manager/Consultant/Data Analyst)", explanation: "Correct! Three directions: (1) Deepen BA expertise as a domain expert (2) Lead a team as BA Manager (3) Leverage BA skills to pivot to PM, consulting, data analysis, etc. BA core skills (analysis, communication, documentation) are valuable in many roles."),
                                Challenge.Option(id: "C", text: "Can only move into technical roles", explanation: "BAs don't have to go technical. Business-side roles (PM, consulting) are also great options."),
                                Challenge.Option(id: "D", text: "Can only move into management", explanation: "Management is just one option. The expert track is also highly valuable."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA core skills are valuable in many roles",
                                "You don't have to go \"up\"; you can also go \"sideways\"",
                            ],
                            explanation: "Three BA career paths: Expert (deepen domain expertise), Management (lead teams), Pivot (PM/Consulting/Data). The key is understanding your interests and strengths.",
                            frameworkTip: "BA career: Expert track (Lead BA/Domain Expert) / Management track (BA Manager) / Pivot track (PM/Consultant/Data)"
                        ),
                        Challenge(
                            id: 2,
                            name: "BA vs PM",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the core difference between BA and PM?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Role Differences",
                                narrative: "You're considering pivoting from BA to PM. A friend says: \"Aren't BA and PM the same thing?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "They're the same; companies just use different names", explanation: "There's overlap but the core responsibilities differ."),
                                Challenge.Option(id: "B", text: "BA focuses on \"analyzing and defining requirements\" (What to build); PM focuses on \"product strategy and prioritization\" (What to build + Why + When)", explanation: "Correct! BA does deep analysis on requirements and feasibility. PM also handles product vision, roadmap, prioritization, and Go-to-Market. PM has a broader view (business + user + tech); BA has deeper analysis (requirements + process + data)."),
                                Challenge.Option(id: "C", text: "PM is more senior than BA", explanation: "Not a seniority issue. They are different professional directions."),
                                Challenge.Option(id: "D", text: "BA is more technical; PM is more business", explanation: "BA is also very business-oriented. The difference is in scope of responsibility, not technical vs business."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA does deep analysis; PM does broad strategy",
                                "The two complement rather than replace each other",
                            ],
                            explanation: "BA and PM complement each other: BA's deep analysis helps PM make better decisions. Pivoting from BA to PM requires strengthening: product strategy, data-driven decision making, Go-to-Market.",
                            frameworkTip: "BA -> PM needs to strengthen: Product vision / Roadmap planning / Data-driven decisions / Go-to-Market strategy"
                        ),
                    ]
                ),
                Quest(
                    id: "37-2",
                    name: "BA Interview Preparation",
                    description: "Prepare for common BA interview question types",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Situational Questions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which framework is best for answering?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Interview Scenario",
                                narrative: "Interviewer asks: \"Have you dealt with conflicting stakeholder requirements? How did you handle it?\"\n\nYou have an experience: Sales wanted \"quick launch\" but Legal wanted \"full compliance.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Just state the result", explanation: "Missing the process. Interviewers want to know how you think and act."),
                                Challenge.Option(id: "B", text: "STAR framework: Situation (context) -> Task (your responsibility) -> Action (what you did) -> Result (outcome and lessons)", explanation: "Correct! STAR gives structure. S: Sales and Legal had conflicting requirements. T: BA responsible for finding a balanced solution. A: Interviewed each side separately to understand core needs -> found a phased launch approach (core features first + compliance features developed in parallel). R: Launched on time + Legal satisfied + established cross-department communication mechanism."),
                                Challenge.Option(id: "C", text: "Say \"I let them work it out themselves\"", explanation: "Interviewers want to see proactivity and problem-solving ability."),
                                Challenge.Option(id: "D", text: "Explain in detail for 30 minutes", explanation: "Too long. STAR lets you cover key points in 2-3 minutes."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "STAR gives structure and focus to answers",
                                "2-3 minutes; results should be quantified",
                            ],
                            explanation: "STAR is the standard framework for behavioral interviews. Key: Action must be specific (what you did, not what the team did); Result should be quantified or have concrete impact.",
                            frameworkTip: "STAR: Situation (30 sec) -> Task (15 sec) -> Action (1-2 min, specifically what you did) -> Result (30 sec, quantified)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Case Analysis Questions",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the best analysis structure?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Interview Case",
                                narrative: "Interviewer gives you a case: \"The company wants to launch a food delivery service (like Uber Eats). You're the BA. How would you start the analysis?\"\n\nYou have 10 minutes to prepare.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "List features immediately", explanation: "Too hasty. Listing features without first understanding business goals and users is a major BA mistake."),
                                Challenge.Option(id: "B", text: "Outside-in: Business objectives (why) -> User analysis (who/pain points) -> Competitor analysis -> Core feature definition -> MVP scope -> Risks", explanation: "Correct! Demonstrates systematic thinking: (1) Why: Business goals and KPIs (2) Who: User personas and pain points (3) What: What competitors already have (4) How: Core features and MVP (5) Risk: Technical/business/regulatory risks. Interviewers evaluate your thinking process, not the answer."),
                                Challenge.Option(id: "C", text: "Ask the interviewer more questions first", explanation: "Asking a few key questions is good (e.g., budget, timeline), but can't only ask without analyzing."),
                                Challenge.Option(id: "D", text: "Draw UI mockups", explanation: "UI comes last. Understand requirements first, then design UI."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Interviews evaluate the thinking process, not the correct answer",
                                "Outside-in: Why -> Who -> What -> How -> Risk",
                            ],
                            explanation: "Case analysis demonstrates BA systematic thinking. The key isn't the \"correct answer\" but a \"structured analysis process.\" Interviewers evaluate how you decompose problems.",
                            frameworkTip: "Case analysis structure: Why (goals) -> Who (users) -> What (scope) -> How (solution) -> Risk (risks)"
                        ),
                    ]
                ),
                Quest(
                    id: "37-3",
                    name: "BA Portfolio",
                    description: "Showcase your BA capabilities",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Portfolio Content",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best preparation approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Portfolio",
                                narrative: "You are preparing a BA portfolio for interviews. You have these to showcase:\n\n- BRDs you've written (containing company confidential info)\n- Process diagrams and wireframes\n- Stakeholder analysis documents\n- Project outcome data\n- Side project analysis you did on your own",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use company documents directly", explanation: "Company documents contain confidential information and copyright issues. Cannot use directly."),
                                Challenge.Option(id: "B", text: "Anonymize company cases + include side projects showing complete analysis process + present using \"what I did, what was the impact\" structure", explanation: "Correct! Anonymization protects confidentiality; side projects demonstrate initiative and complete capability. Present each work using Context -> Your Contribution -> Impact/Result structure. Interviewers want to see what you can do, not what the company did."),
                                Challenge.Option(id: "C", text: "Only include side projects", explanation: "Side projects are good but lack real-world project experience. Anonymized real cases are more convincing."),
                                Challenge.Option(id: "D", text: "Don't need a portfolio; interview answers are enough", explanation: "Candidates with portfolios are more convincing than those who only speak. Show, don't tell."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Anonymize: change company name, numbers, product names",
                                "Show, don't tell -- demonstration is more convincing than verbal claims",
                            ],
                            explanation: "BA Portfolio structure: 3-5 cases, each using Context -> Contribution -> Impact. Mix real cases (anonymized) and side projects.",
                            frameworkTip: "Portfolio structure: Context (background) -> Your Contribution (what you did) -> Impact (results/data)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Side Project Demo",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What kind of side project best demonstrates BA capability?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Side Project",
                                narrative: "You want to create a BA side project for your portfolio. You have no real clients.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Analyze a well-known app's features", explanation: "Too shallow. Describing features isn't analysis."),
                                Challenge.Option(id: "B", text: "Choose a real problem and produce complete BA deliverables: Stakeholder analysis -> Requirements interviews (simulated) -> BRD -> User Stories + AC -> Process diagrams -> Wireframes -> UAT Plan", explanation: "Correct! Demonstrates end-to-end BA capability. Example: \"Analyze and optimize Uber Eats return process\" -> Create As-Is/To-Be process diagrams -> Write User Stories -> Design wireframes. Each step showcases a different BA skill."),
                                Challenge.Option(id: "C", text: "Write a very long document", explanation: "Length doesn't equal quality. Focus on structure and quality."),
                                Challenge.Option(id: "D", text: "Do a technical project", explanation: "A BA side project should showcase analytical ability, not technical ability."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Demonstrating end-to-end capability is more convincing than showing a single skill",
                                "Use real problems (public information) for analysis",
                            ],
                            explanation: "BA Side Project best practice: choose a publicly available real problem (like app user pain points), produce complete BA analysis and deliverables. Demonstrate your full problem-to-solution process.",
                            frameworkTip: "Side Project = Real problem + Complete BA deliverables (BRD/Stories/Process diagrams/Wireframes/UAT)"
                        ),
                    ]
                ),
                Quest(
                    id: "37-4",
                    name: "Continuous Learning Strategy",
                    description: "Keep your BA skills competitive",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Learning Areas",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most valuable learning direction for BAs?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Skill Development",
                                narrative: "You want to improve your BA competitiveness. More and more BA job postings require \"technical background\" or \"data analysis capability.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Learn programming to become a full-stack engineer", explanation: "Over-investment. BAs don't need to become engineers, but should understand technical concepts."),
                                Challenge.Option(id: "B", text: "SQL + Data analysis + API concepts + Industry knowledge. Be able to converse with tech teams and independently query data to verify hypotheses", explanation: "Correct! BA technical skill goals: (1) SQL lets you query data independently without waiting for engineers (2) Data analysis lets you support recommendations with data (3) API concepts enable effective communication with tech teams (4) Industry knowledge makes you a domain expert."),
                                Challenge.Option(id: "C", text: "Get as many certifications as possible", explanation: "Certifications have value but aren't the most important. Practical skills > certificates."),
                                Challenge.Option(id: "D", text: "BAs are already well-rounded; no need to learn anything new", explanation: "The market is changing. AI, data analysis, and the API economy are all affecting the BA role."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The goal isn't becoming a technical expert but \"being able to communicate\"",
                                "SQL is the most practical technical skill for BAs",
                            ],
                            explanation: "BA technical capability goals: effectively communicate with engineers (API/DB concepts) + independently do basic data analysis (SQL/Excel/BI) + deep industry knowledge.",
                            frameworkTip: "BA skill investment: SQL (must learn) + Data analysis (high value) + API concepts (effective communication) + Industry knowledge (domain expert)"
                        ),
                        Challenge(
                            id: 2,
                            name: "AI's Impact on BAs",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the BA's most irreplaceable capability in the AI era?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BAs in the AI Era",
                                narrative: "AI tools like ChatGPT are emerging. Some say \"AI will replace BAs.\" You start thinking about AI's impact on the BA role.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Document writing", explanation: "AI can assist with document writing. This isn't the most irreplaceable."),
                                Challenge.Option(id: "B", text: "Understanding business context, managing stakeholder relationships, making judgments amid ambiguity, and facilitating cross-team alignment", explanation: "Correct! AI excels at: data analysis, document generation, pattern recognition. AI struggles with: understanding organizational politics, making judgments with incomplete information, building interpersonal trust, facilitating alignment. BA's value increasingly lies in the \"people\" dimension."),
                                Challenge.Option(id: "C", text: "Excel formulas", explanation: "AI is better at formulas than humans."),
                                Challenge.Option(id: "D", text: "Drawing process diagrams", explanation: "AI can assist with process diagrams."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "AI excels at processing information; humans excel at processing relationships",
                                "BA's value increasingly lies in the \"people\" dimension",
                            ],
                            explanation: "BAs in the AI era: use AI to boost efficiency (documents, analysis, drafts), spend more time on what AI can't do (stakeholder management, judgment, alignment). BA + AI = super BA.",
                            frameworkTip: "AI era BA: AI handles data/docs/drafts -> BA handles judgment/relationships/alignment = efficiency x quality"
                        ),
                    ]
                ),
                Quest(
                    id: "37-5",
                    name: "BA Certification Guide",
                    description: "Understand the value of BA-related certifications",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Certification Selection",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most valuable certification combination for a 3-year BA?",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA Certifications",
                                narrative: "You're considering BA certifications. Common ones include:\n- CBAP (IIBA -- senior BA)\n- PMI-PBA (PMI -- PM organization's BA certification)\n- CSPO/CSM (Scrum Alliance -- Agile certifications)\n- AWS/Azure certifications (cloud technology)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Get all of them", explanation: "Certifications require time and money. Choose the most valuable ones for your career direction."),
                                Challenge.Option(id: "B", text: "CBAP or PMI-PBA (proves BA expertise) + CSPO (if heading toward Agile/PM)", explanation: "Correct! CBAP/PMI-PBA are the gold standard BA certifications. If aiming for Agile PM, add CSPO. Technical certifications have lower ROI for BAs (unless heading toward Technical BA)."),
                                Challenge.Option(id: "C", text: "Only get technical certifications", explanation: "BA core certifications (CBAP/PMI-PBA) are more relevant than technical ones."),
                                Challenge.Option(id: "D", text: "No certifications needed", explanation: "Certifications aren't required but help: (1) Systematic learning (2) Resume boost (3) Salary negotiation leverage."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Certifications should align with career direction",
                                "CBAP/PMI-PBA are standard BA certifications",
                            ],
                            explanation: "Certification selection should align with career direction. BA track: CBAP/PMI-PBA. Agile track: CSPO/SAFe. Data track: Google Data Analytics.",
                            frameworkTip: "Certification selection: BA expertise (CBAP/PBA) + Directional certification (Agile/Data/Domain)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Experience vs Certification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Who is more likely to be hired?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Interview Evaluation",
                                narrative: "You're the interviewer. Two candidates:\n\nA: 5 years experience, 3 certifications (CBAP+PMP+CSPO), can clearly describe project experience and methodologies\nB: 3 years experience, 0 certifications, but has a portfolio showing complete analysis processes, demonstrates excellent thinking in interviews",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A -- more certifications and experience", explanation: "More certifications is a plus but not decisive."),
                                Challenge.Option(id: "B", text: "Depends on role requirements, but typically B's demonstrated ability is more convincing than A's credentials on paper", explanation: "Correct! Demonstrated ability > certification count. B's portfolio and interview performance directly showcase capability. A's certifications prove they studied and passed tests but not necessarily that they can do the job well. Of course, if A also performs well in interviews, that's the strongest combination."),
                                Challenge.Option(id: "C", text: "Depends on salary expectations", explanation: "Salary is secondary. Capability match is most important."),
                                Challenge.Option(id: "D", text: "Neither hired", explanation: "Both are good candidates."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Show > Tell",
                                "Certifications are a threshold, not a deciding factor",
                            ],
                            explanation: "Interview evaluation priority: Demonstrated capability > Certification count > Years of experience. Certifications open doors, but once inside, what matters is what you can do.",
                            frameworkTip: "Interview evaluation: Demonstrated capability > Certifications > Years. Strongest combination = Certifications + Demonstrated capability + Experience"
                        ),
                    ]
                ),
                Quest(
                    id: "37-6",
                    name: "BA Career Planning Case",
                    description: "Create a personal career development plan",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Career Plan",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "3-Year Career Plan",
                                narrative: "You are a Junior BA with 2 years of experience, working at an e-commerce company. You want to become a Senior BA or pivot to PM within 3 years.\n\nCurrent skills: Requirements analysis, User Stories, Jira, basic Excel, communication skills.\nMissing: SQL, BI tools, deep industry knowledge, leadership experience.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Each year should have clear skill targets",
                                "Not just \"learn\" but also \"apply\" and \"showcase\"",
                            ],
                            explanation: "Career planning isn't daydreaming. Each year has clear skill targets + certifications + portfolio pieces + proactively created practice opportunities at work. Learn -> Apply -> Showcase.",
                            frameworkTip: "Career planning = Annual skill targets + Certification plan + Portfolio strategy + Opportunity creation"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 38: BA Comprehensive Practice
        World(
            id: 38,
            name: "BA Comprehensive Practice",
            emoji: "🏆",
            description: "Apply all BA skills comprehensively to complete end-to-end business analysis",
            quests: [
                Quest(
                    id: "38-1",
                    name: "Requirements Elicitation Workshop",
                    description: "Plan and facilitate a requirements elicitation workshop",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Workshop Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most effective workshop design?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Requirements Workshop",
                                narrative: "You are organizing a 3-hour requirements elicitation workshop. Participants: Marketing (3 people), Customer Service (2), IT (2), PM (1).\n\nObjective: Define requirements for a new customer feedback system.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Let everyone freely discuss for 3 hours", explanation: "Unstructured discussion will go off track. Louder voices dominate; introverts don't speak."),
                                Challenge.Option(id: "B", text: "Opening (align objectives, 15min) -> Individual brainstorm (silent sticky notes, 10min) -> Group discussion (40min) -> Full group report and ranking (30min) -> User journey mapping (60min) -> Priority voting (20min) -> Summary and action items (15min)", explanation: "Correct! Structured workshop: silent before active (avoid groupthink), diverge before converge, mix individual and group activities, clear outputs (user journey + priority list)."),
                                Challenge.Option(id: "C", text: "Present slides for 2 hours then Q&A for 1 hour", explanation: "That's a presentation, not a workshop. The point of a workshop is \"co-creation\" not \"reporting.\""),
                                Challenge.Option(id: "D", text: "One-on-one interviews with each person", explanation: "Interviews have value but the workshop's advantage is getting cross-departmental people to discuss, clash, and align together."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Silent before active: avoid groupthink",
                                "Diverge before converge: no limits first, then prioritize",
                            ],
                            explanation: "Effective workshop design: Opening alignment -> Individual thinking (avoid conformity) -> Small group discussion -> Full group report -> Converge and rank -> Action Items.",
                            frameworkTip: "Workshop structure: Align objectives -> Individual (silent) -> Small group (active) -> Full group (converge) -> Vote and rank -> Action Items"
                        ),
                        Challenge(
                            id: 2,
                            name: "Facilitation Techniques",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How should the BA (facilitator) handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Workshop Challenges",
                                narrative: "Workshop in progress. Issues:\n\n- IT Director keeps interrupting others saying \"technically impossible\"\n- Marketing's new hire is completely silent\n- Discussion has drifted from the feedback system to \"company culture issues\"\n- Only 1 hour left but only halfway done",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Let them discuss freely", explanation: "Letting it continue will derail the workshop with no output."),
                                Challenge.Option(id: "B", text: "1. Privately tell the IT Director \"let's note technical constraints and discuss during convergence\" 2. Directly ask the new hire \"your customer experience is valuable; what do you think?\" 3. Use a parking lot to note off-topic issues and return to the agenda 4. Adjust the second half's pace, streamline remaining content or schedule a follow-up", explanation: "Correct! Four facilitator techniques: (1) Manage dominant voices (constructively redirect) (2) Encourage quiet voices (directly invite + affirm value) (3) Parking Lot (note but don't discuss now) (4) Time management (flexible adjustment)."),
                                Challenge.Option(id: "C", text: "Extend the workshop", explanation: "Extending causes participant fatigue and lost attention. Better to streamline or follow up."),
                                Challenge.Option(id: "D", text: "Cancel the workshop and reschedule", explanation: "Too wasteful of everyone's time. Can adjust but shouldn't cancel."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Facilitator's responsibility: ensure everyone has a chance to speak, stay on topic, manage time",
                            ],
                            explanation: "BA core facilitation skills: manage dynamics (dominant/quiet), stay on topic (Parking Lot), time management (flexible adjustment), ensure outputs.",
                            frameworkTip: "Facilitation techniques: Manage dominant voices + Encourage quiet voices + Parking Lot + Time management + Ensure outputs"
                        ),
                    ]
                ),
                Quest(
                    id: "38-2",
                    name: "Cross-Department Requirements Integration",
                    description: "Integrate requirements from different departments",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Requirements Conflict",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Department Requirements Conflict",
                                narrative: "New CRM system requirements collection complete. Department requirements:\n\nMarketing: \"Need real-time campaign ROI visibility\"\nSales: \"Need mobile access to customer interaction history\"\nCustomer Service: \"Need one-stop view of all customer tickets\"\nFinance: \"Need automated monthly reports\"\nIT: \"Must integrate with existing systems with low maintenance cost\"\n\nBudget only covers 60%.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Have department heads vote", explanation: "Voting may become a department power struggle rather than value-based judgment."),
                                Challenge.Option(id: "B", text: "Value/Effort matrix analysis for each requirement -> MoSCoW classification -> Confirm Must Haves with each department -> Optimize within budget -> Present trade-offs for Steering Committee to decide", explanation: "Correct! BA's role: (1) Quantify each requirement's value and cost (2) MoSCoW classification (3) Clearly present trade-offs (choosing A means not choosing B) (4) Enable decision-makers to choose with complete information. Don't make decisions for others; make decisions better."),
                                Challenge.Option(id: "C", text: "Rank by department importance", explanation: "Subjective and will cause inter-department conflict."),
                                Challenge.Option(id: "D", text: "Do everything but at reduced scope", explanation: "Doing everything = doing nothing well. Trade-offs are needed."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA doesn't make decisions but helps make better decisions",
                                "Use data to turn subjective arguments into objective comparisons",
                            ],
                            explanation: "BA requirements integration: Quantify value -> Classify priority -> Clarify trade-offs -> Enable informed decision-making.",
                            frameworkTip: "Requirements integration: Quantify Value/Effort -> MoSCoW -> Present trade-offs -> Decision maker chooses"
                        ),
                        Challenge(
                            id: 2,
                            name: "Requirements Traceability",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you prevent this problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Traceability",
                                narrative: "Halfway through the project, the CEO asks: \"Why are we building this feature? How does it relate to business goals?\"\n\nYou discover many features have \"disconnected\" from original business objectives. Some features were casually mentioned by a stakeholder and added without anyone questioning them.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Don't let stakeholders suggest requirements", explanation: "Impractical and unreasonable."),
                                Challenge.Option(id: "B", text: "Establish a Requirements Traceability Matrix: every feature traces back to a business goal. If a feature can't trace to any business goal, question its necessity", explanation: "Correct! RTM: Business Goal -> Requirement -> Feature -> Test Case. Every feature must answer \"why does this exist?\" Features that can't trace to a business goal are scope creep."),
                                Challenge.Option(id: "C", text: "Cut everything and start over", explanation: "Too extreme. Use RTM to filter."),
                                Challenge.Option(id: "D", text: "This is the PM's problem", explanation: "BA's responsibility includes ensuring requirements align with business goals."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Every feature must answer \"why are we doing this?\"",
                                "Features that can't trace to goals = potential scope creep",
                            ],
                            explanation: "Requirements Traceability Matrix is an important BA tool. It ensures: every feature has a reason (traces to goals) and nothing is missed (goals all have corresponding features).",
                            frameworkTip: "RTM: Business Goal -> Requirement -> Feature -> Test Case. Every feature must trace to a goal."
                        ),
                    ]
                ),
                Quest(
                    id: "38-3",
                    name: "Data-Driven Decision Making",
                    description: "Use data to support business decisions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Hypothesis Validation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA present this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data vs Intuition",
                                narrative: "The marketing director says: \"Most of our customers are young people, so we should put all our marketing budget into social media.\"\n\nYou checked CRM data and found:\n- 25-34: 35% (largest group)\n- 35-44: 30%\n- 45-54: 20%\n- Other: 15%\n\nMoreover, 35-44 year olds have an AOV (average order value) 2x that of 25-34 year olds.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Agree with the director's judgment", explanation: "Data doesn't support the claim that \"most are young people.\" 35+ accounts for 65%."),
                                Challenge.Option(id: "B", text: "Present data: 25-34 is the largest single group but only 35%. 35+ accounts for 65% with higher AOV. Recommend allocating marketing budget by customer segment value, not just headcount", explanation: "Correct! BA uses data to challenge intuition. \"Largest group\" does not equal \"majority.\" Value isn't just about headcount; AOV matters too. 35-44 year olds have fewer people but higher AOV, potentially a higher-value marketing investment target."),
                                Challenge.Option(id: "C", text: "Don't invest in social media", explanation: "Not \"don't invest\" but \"don't invest everything.\" Allocate based on data."),
                                Challenge.Option(id: "D", text: "Data doesn't matter; the director knows the market best", explanation: "Intuition may be right but needs data validation. BA's value is using data to support decisions."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Data-driven does not mean rejecting intuition, but validating and supplementing intuition with data",
                                "Look at \"value\" not just \"count\"",
                            ],
                            explanation: "BA uses data to support decisions: present the complete picture (not just headcount but also AOV), challenge assumptions (\"majority\" -- really?), provide analytical recommendations.",
                            frameworkTip: "Data-driven: Hypothesis -> Validate with data -> Present complete picture -> Recommend (don't make decisions for others)"
                        ),
                        Challenge(
                            id: 2,
                            name: "A/B Test Design",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How does the BA convince the PM?",
                            scenario: 
                            Challenge.Scenario(
                                title: "A/B Testing",
                                narrative: "PM wants to redesign the checkout page. The designer created a new version. PM wants to launch directly.\n\nPM says: \"The new design obviously looks better; no testing needed.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Agree to launch directly", explanation: "\"Good looking\" does not equal \"higher conversion rate.\" Many cases show \"better looking\" designs actually reduce conversion."),
                                Challenge.Option(id: "B", text: "Use past cases to show \"good looking does not equal good usability,\" then recommend A/B testing: 50% traffic each, run 2 weeks, measure conversion rate not \"looks.\" If the new version truly performs better, data will prove it", explanation: "Correct! BA's value: (1) Use cases to explain why testing is needed (2) Design test plan (traffic split, duration, metrics) (3) Let data speak. If the new design truly works, A/B testing only confirms it."),
                                Challenge.Option(id: "C", text: "Refuse to change the design", explanation: "Not refusing change but using scientific methods to validate the change's impact."),
                                Challenge.Option(id: "D", text: "Let users vote", explanation: "User preference votes don't equal actual behavior. A/B tests measure actual conversion rates."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "\"Good looking\" is subjective; conversion rate is objective",
                                "A/B testing is the fairest judge",
                            ],
                            explanation: "A/B testing is the model for data-driven decision making. BA's role: design the test (traffic split + metrics + duration), analyze results, make recommendations. Let data speak.",
                            frameworkTip: "A/B testing: Hypothesis -> Design (split/metrics/duration) -> Execute -> Analyze -> Decide"
                        ),
                    ]
                ),
                Quest(
                    id: "38-4",
                    name: "Change Management",
                    description: "Manage project scope and requirements changes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Change Control",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How should the BA handle this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Change Request",
                                narrative: "Project is 60% complete. VP of Sales suddenly says: \"I want to add an AI recommendation engine; our competitor launched one last week.\"\n\nThis feature is not in the original scope. Developers estimate 3 additional months.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Add it directly", explanation: "Scope creep. Adding without impact assessment will cause delays and budget overruns."),
                                Challenge.Option(id: "B", text: "Follow the Change Request process: Document request -> Impact Analysis (time/cost/risk/impact on existing features) -> Present options (A. Add + delay B. Replace another feature C. Phase 2) -> Change Board decides", explanation: "Correct! The Change Request process ensures: (1) Every change is assessed (2) Impact is quantified (3) Decisions are evidence-based (4) Not rejecting but managing. The VP's request may be valid, but decisions should be made with the full picture."),
                                Challenge.Option(id: "C", text: "Say \"out of scope\" and refuse", explanation: "Directly refusing a senior executive is unwise. Use process to manage."),
                                Challenge.Option(id: "D", text: "Let the PM handle it", explanation: "The BA should do Impact Analysis; the PM makes the decision."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Change Request doesn't mean \"no\" but \"decide after assessment\"",
                                "BA's role: Impact Analysis",
                            ],
                            explanation: "Change Management: Document -> Analyze impact -> Present options -> Decision. The BA's core output is Impact Analysis, enabling decision-makers to choose with complete information.",
                            frameworkTip: "Change Request: Document -> Impact Analysis -> Present options -> Change Board decides -> Update documentation"
                        ),
                        Challenge(
                            id: 2,
                            name: "Scope Creep Prevention",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you prevent future scope creep?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Scope Creep Prevention",
                                narrative: "Your project has experienced scope creep for the third time. Each time it was a \"small feature\":\n\n1. \"Just add PDF export\"\n2. \"Add a notification feature; should be quick\"\n3. \"Just tweak the UI colors and fonts\"\n\nTogether, these have added 3 weeks of work.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Reject all new requirements", explanation: "Too extreme. Some changes are valid."),
                                Challenge.Option(id: "B", text: "Establish mechanisms: 1. Clear Scope document (In/Out) 2. Every change goes through CR process (even \"small\" ones) 3. Cumulative impact tracking (small items add up) 4. Regular scope reviews with stakeholders", explanation: "Correct! Scope creep's root cause is \"no threshold.\" Establishing CR processes makes every change visible and assessed. Cumulative tracking shows stakeholders the \"total impact of small things.\""),
                                Challenge.Option(id: "C", text: "Add more buffer", explanation: "Buffer gets consumed. The issue isn't insufficient time but lack of change management."),
                                Challenge.Option(id: "D", text: "Tell the client it can't be done", explanation: "Not that it can't be done but that it needs to be managed."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "\"Small\" scope creep is most dangerous because it goes unnoticed",
                                "Cumulative tracking makes small items visible",
                            ],
                            explanation: "Scope creep prevention: Clear In/Out -> CR process (even small items) -> Cumulative impact tracking -> Regular review. The key is making every change \"visible.\"",
                            frameworkTip: "Prevent Scope Creep: Clear In/Out + CR process + Cumulative tracking + Regular Review"
                        ),
                    ]
                ),
                Quest(
                    id: "38-5",
                    name: "Project Retrospective",
                    description: "Learn and improve from projects",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Retrospective",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why is a Retrospective needed?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Project Retrospective",
                                narrative: "The project launched. PM says: \"It launched, that's good enough. No need for a retrospective. Let's move on to the next one.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "To assign blame", explanation: "A Retrospective is not a blame session. It's about learning and improving."),
                                Challenge.Option(id: "B", text: "To learn from successes and failures, avoiding repeating the same mistakes in the next project. Without retrospectives, the organization will keep repeating the same errors", explanation: "Correct! Retrospective purpose: (1) Record What went well (replicate success) (2) What didn't go well (avoid repetition) (3) Action items (specific improvements). Organizations that don't retrospect repeat the same problems across different projects."),
                                Challenge.Option(id: "C", text: "Only Agile needs this", explanation: "Any project should retrospect. Agile retrospects every Sprint; Waterfall retrospects at project end."),
                                Challenge.Option(id: "D", text: "Too much of a time waste", explanation: "2 hours of retrospective could save 2 weeks of problems in the next project."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "No retrospective = no learning = repeating mistakes",
                                "Retrospective is about learning, not blame",
                            ],
                            explanation: "Retrospectives are key to organizational learning. BAs can facilitate retros: collect feedback -> classify (What went well/didn't/lessons) -> define action items -> track improvements.",
                            frameworkTip: "Retro: What went well / What didn't / What to improve + Specific Action Items"
                        ),
                        Challenge(
                            id: 2,
                            name: "Lessons Learned",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Why weren't the Retro lessons applied?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Knowledge Transfer",
                                narrative: "The Retrospective produced great lessons learned. But you discover that last year's project also had a retro with nearly identical conclusions: \"unclear requirements,\" \"insufficient communication,\" \"not enough testing time.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Colleagues don't listen", explanation: "Not an attitude problem. It's a process problem."),
                                Challenge.Option(id: "B", text: "Missing a mechanism to \"turn lessons into specific actions and track them.\" Retros can't just \"list lessons\" -- they need specific action items + owner + deadline + tracking", explanation: "Correct! The most common Retro failure: lessons without actions. \"Unclear requirements\" -> Action: Next project introduces Definition of Ready + BA does upfront analysis in Sprint 0 + Owner: BA Lead + Implement in Q2 project. Lessons without actions are empty words."),
                                Challenge.Option(id: "C", text: "Retros are useless", explanation: "Retros are very useful but need follow-through."),
                                Challenge.Option(id: "D", text: "These problems are inherently unsolvable", explanation: "These problems all have solutions. The issue is not implementing them."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Lesson without Action = empty words",
                                "Every lesson needs: Action + Owner + Deadline",
                            ],
                            explanation: "The value of Retros lies not in \"listing lessons\" but in \"changing behavior.\" Every lesson must be converted to an action item (specific action + who + when) and tracked.",
                            frameworkTip: "Lessons Learned implementation: Lesson -> Specific Action -> Owner -> Deadline -> Track in next project"
                        ),
                    ]
                ),
                Quest(
                    id: "38-6",
                    name: "BA Ultimate Challenge",
                    description: "End-to-end comprehensive business analysis challenge",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: End-to-End BA Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Digital Transformation Project",
                                narrative: "You are the BA at a traditional retail company (10 physical stores, $30M annual revenue). The CEO has decided on digital transformation: build an e-commerce platform + loyalty system + data analytics capability.\n\nBudget $500K, 12 months. Team: PM x1, BA x1 (you), Dev x4, QA x1, Designer x1.\n\nChallenges: Employee resistance to digitization, outdated IT infrastructure, no digital talent, competitors already online.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "MVP's key is \"the minimum scope that independently produces value\"",
                                "Digital transformation's biggest challenge is usually people, not technology",
                            ],
                            explanation: "End-to-end BA = Stakeholder management + Requirements analysis + MVP definition + Stories + Risk management + Metrics + Plan. The BA is the project's \"brain\": connecting business goals with technical implementation.",
                            frameworkTip: "End-to-end BA: Stakeholders -> Requirements -> MVP -> Stories -> Risks -> Metrics -> Plan"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 42: Business Systems
        World(
            id: 42,
            name: "Business Systems",
            emoji: "🏗️",
            description: "Understand the architecture and selection strategies for enterprise systems (ERP/CRM/Workflow)",
            quests: [
                Quest(
                    id: "42-1",
                    name: "ERP Concepts & Modules",
                    description: "Understand core ERP modules and implementation strategies",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ERP Core Value",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the core value of implementing an ERP?",
                            scenario: 
                            Challenge.Scenario(
                                title: "ERP Implementation Assessment",
                                narrative: "You join a mid-size manufacturing company ($50M annual revenue, 200 employees) as a BA. The company currently uses Excel for finance, Email for order tracking, and paper for inventory management. The CEO asks: \"Do we need an ERP?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Makes the company look more professional", explanation: "Professional image is a side benefit, not the core value."),
                                Challenge.Option(id: "B", text: "Establish a Single Source of Truth, integrate cross-department data, and eliminate information silos", explanation: "Correct! The core value of ERP is \"one system, one dataset.\" When finance, sales, and inventory are on the same platform, an incoming order automatically updates inventory -> triggers procurement -> records revenue. No more manual Excel reconciliation."),
                                Challenge.Option(id: "C", text: "Replace all existing software", explanation: "ERP doesn't necessarily replace all software. Some specialized systems (like CRM, BI) may be better suited for specific needs."),
                                Challenge.Option(id: "D", text: "Automate all processes", explanation: "ERP can automate many processes, but not \"all.\" The core value is data integration; automation is an extended benefit."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Think about what the biggest problem with Excel management is",
                                "Data Silos are a pain point for mid-size companies",
                            ],
                            explanation: "ERP core value = Single Source of Truth. The pain points it solves: data scattered across departments in Excel/systems, version inconsistencies, manual reconciliation needed, unreliable decision-making basis.",
                            frameworkTip: "ERP value formula: Single Source of Truth + Cross-department integration + Process standardization + Real-time visibility"
                        ),
                        Challenge(
                            id: 2,
                            name: "ERP Implementation Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which implementation strategy would you recommend?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Implementation Approach",
                                narrative: "Your company has decided to implement SAP S/4HANA. Modules to go live: Finance (FI), Sales (SD), Inventory (MM).\n\nCurrent situation:\n- 5 offices, 3 warehouses\n- Month-end closing is the most critical business process\n- Average employee age is 45, resistant to new systems",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Big Bang: All modules, all locations go live simultaneously", explanation: "Too risky. Employee resistance + critical month-end closing process cannot afford errors. If it fails, the entire company is paralyzed."),
                                Challenge.Option(id: "B", text: "Phased Rollout: Start with FI module (1 office) -> Once stable, add SD/MM -> Gradually expand to all locations", explanation: "Correct! Considerations: (1) Employee resistance -> start small, build success stories (2) Critical month-end closing -> stabilize FI module first before expanding (3) Phased reduces risk, each phase provides lessons learned."),
                                Challenge.Option(id: "C", text: "Parallel Run: Run old and new systems simultaneously for 6 months", explanation: "Parallel Run can work for critical modules (like FI), but not as an overall strategy -- double workload will make already resistant employees even more dissatisfied."),
                                Challenge.Option(id: "D", text: "Build a custom new system from scratch", explanation: "SAP has already been selected. The question is about implementation strategy, not technology selection."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "High-resistance environments call for small, quick steps",
                                "Critical business processes need extra protection",
                            ],
                            explanation: "Phased Rollout is the best strategy for high-risk environments: validate at small scale -> build confidence -> gradually expand. Especially suitable for: high employee resistance, critical processes that can't be interrupted, and situations needing lessons learned.",
                            frameworkTip: "Implementation strategy: High risk/large scale -> Phased / Small team/urgent -> Big Bang / Critical processes -> Add Parallel Run"
                        ),
                    ]
                ),
                Quest(
                    id: "42-2",
                    name: "CRM System Design",
                    description: "Design sales pipelines and Customer 360 views",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CRM Pipeline Design",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the primary principle for Pipeline Stage design?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Company CRM",
                                narrative: "You work at a B2B SaaS company ($10K-$100K annual contract per customer). The sales team has 15 people, currently tracking customers in Excel. The VP of Sales asks you to design a Salesforce CRM.\n\nHe says: \"I need to see each rep's Pipeline and predict how many deals we can close this quarter.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The more Stages the better, the more granular the better", explanation: "Too many Stages make reps feel it's tedious and they won't update. Usually 5-7 Stages work best."),
                                Challenge.Option(id: "B", text: "Each Stage must have clear \"entry criteria\" and \"verifiable customer behaviors\"", explanation: "Correct! A good Pipeline = each Stage represents an objective, verifiable milestone. For example, \"Qualified\" isn't when a rep \"feels\" there's an opportunity, but when the customer has confirmed Budget + Authority + Need + Timeline (BANT). This makes forecasting accurate."),
                                Challenge.Option(id: "C", text: "Design based on company internal processes", explanation: "Should be designed around the \"customer buying journey,\" not internal company processes."),
                                Challenge.Option(id: "D", text: "Just use Salesforce default Stages", explanation: "Default Stages are generic and need to be customized based on your company's sales process."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The purpose of Pipeline is \"accurate revenue forecasting\"",
                                "Subjective judgment vs objective verification",
                            ],
                            explanation: "The golden rule of Pipeline Stage design: each Stage has clear Entry Criteria based on the customer's Verifiable Outcomes, not the rep's subjective judgment.",
                            frameworkTip: "Pipeline Stage = Customer behavior milestones (not internal process steps) + BANT for Qualification"
                        ),
                        Challenge(
                            id: 2,
                            name: "Customer 360",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the key to solving this problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Data Integration",
                                narrative: "The company has three systems:\n- Marketing: HubSpot (tracks website behavior, email open rates)\n- Sales: Salesforce (customer contact records, opportunities)\n- Support: Zendesk (service tickets, satisfaction)\n\nProblem: Sales calls a customer not knowing they just filed a complaint ticket. Marketing sends emails to customers about to churn.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Move all functionality to Salesforce", explanation: "Not realistic. Each system has its strengths. HubSpot's marketing automation and Zendesk's service features are hard to fully replicate in Salesforce."),
                                Challenge.Option(id: "B", text: "Build a Customer 360 view: integrate data from all three systems so every team can see the full customer picture", explanation: "Correct! Customer 360 = in any one system, you can see the customer's key information from other systems. Implementation: API integration + unified customer ID + real-time sync of key fields (e.g., latest ticket status, contract expiry, marketing interactions)."),
                                Challenge.Option(id: "C", text: "Send a weekly customer report to all teams", explanation: "Too slow. Sales needs to see customer status \"in real-time\" when calling, not weekly."),
                                Challenge.Option(id: "D", text: "Have the support team manually notify the sales team", explanation: "Manual notification is unreliable and doesn't scale. It will miss cases and cause delays."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Cross-system data silos are a common problem",
                                "Integration doesn't mean consolidation; you can keep each system's strengths",
                            ],
                            explanation: "Customer 360 is the core of CRM strategy: not merging all systems, but enabling data flow through API integration. Key elements: unified customer ID + real-time sync + full view at every touchpoint.",
                            frameworkTip: "Customer 360 = Unified ID + API integration + Real-time sync of key fields + Visible at every touchpoint"
                        ),
                        Challenge(
                            id: 3,
                            name: "CRM Automation Rules",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How would you design Lead Assignment automation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Lead Assignment",
                                narrative: "The company gets 500 inbound leads per month (from website, events, referrals). Currently the VP of Sales manually assigns them to reps.\n\nProblems:\n- Uneven distribution (some reps have too many, others too few)\n- Response too slow (average 48 hours; industry standard < 1 hour)\n- No follow-up tracking mechanism",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Assign in alphabetical rotation", explanation: "Too simple. Doesn't consider lead quality, rep expertise, territory, etc."),
                                Challenge.Option(id: "B", text: "Lead Scoring + Round-Robin + SLA Alert: Score and tier first, then auto-assign by territory/product line, set response SLA", explanation: "Correct! Three layers of automation: (1) Lead Scoring: auto-score based on company size, job title, website behavior (2) Assignment Rules: Round-Robin by territory/product line/rep capacity (3) SLA: No response in 1 hour -> alert manager, no response in 4 hours -> auto-reassign."),
                                Challenge.Option(id: "C", text: "Let AI handle everything automatically", explanation: "AI can assist with Lead Scoring, but Assignment Rules need to be designed based on the company's sales strategy, not purely AI-driven."),
                                Challenge.Option(id: "D", text: "Let reps pick their own leads", explanation: "Creates \"cherry-picking\" internal competition; small customers get neglected."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "The key to automation is rule design, not just technology",
                                "Response speed is a critical factor in lead conversion",
                            ],
                            explanation: "CRM automation three-layer design: (1) Lead Scoring for auto-grading (2) Assignment Rules for auto-distribution (3) SLA + Escalation to ensure timeliness. Research shows: leads contacted within 5 minutes have 21x higher conversion than those contacted after 30 minutes.",
                            frameworkTip: "CRM automation: Lead Scoring (tier) -> Assignment Rules (distribute) -> SLA Alert (timeliness) -> Escalation (safety net)"
                        ),
                    ]
                ),
                Quest(
                    id: "42-3",
                    name: "Workflow & Approval Systems",
                    description: "Design enterprise approval and automation workflows",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Approval Flow Design",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the best approval flow design principle?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Procurement Approval Workflow",
                                narrative: "You need to design a procurement approval workflow for a 500-person company. Current problems:\n- All purchases require CFO signature; CFO spends 2 hours daily on approvals\n- Even small purchases (office supplies, software) wait 3 days\n- Urgent purchases can't find an approver",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All purchases follow the same process", explanation: "One-size-fits-all processes create bottlenecks. Different amounts should have different approval levels."),
                                Challenge.Option(id: "B", text: "Tiered approval by amount + delegate mechanism + emergency channel", explanation: "Correct! Three-layer design: (1) Amount tiers: <$1K direct manager auto-approves / $1K-$10K department head / >$10K CFO (2) Delegates: when manager is away, auto-route to delegate (3) Emergency channel: execute first, retroactive approval. This way CFO only signs large purchases, improving efficiency by 80%."),
                                Challenge.Option(id: "C", text: "Eliminate all approvals completely, trust employees", explanation: "No approvals at all creates financial risk and compliance issues."),
                                Challenge.Option(id: "D", text: "Add more approvers to ensure safety", explanation: "More approvers = slower = more bottlenecks. The approach should be \"strict where needed, flexible where possible.\""),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Approval workflow goal is balancing \"risk control\" and \"efficiency\"",
                                "Different risk levels need different controls",
                            ],
                            explanation: "Approval Flow design core principle: Risk-Proportional. Higher amount, higher risk -> higher approval level. Small amounts pass quickly; large amounts get strict review. Plus delegate and emergency mechanisms for exceptions.",
                            frameworkTip: "Approval design three elements: Amount tiers (Risk-Based) + Delegates (Delegation) + Emergency channel (Exception Path)"
                        ),
                        Challenge(
                            id: 2,
                            name: "Workflow Automation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which steps are best suited for automation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Onboarding Automation",
                                narrative: "You work at a Fintech company. New customer account opening process:\n1. Fill out application form\n2. Upload identity documents\n3. KYC (identity verification)\n4. Risk assessment\n5. Account activation\n6. Welcome Email\n\nCurrently all manual, averaging 5 business days. CEO wants it down to 1 day.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Automate everything, no human intervention needed", explanation: "KYC and risk assessment may involve regulatory requirements; some cases need manual review (e.g., high-risk customers, unclear documents)."),
                                Challenge.Option(id: "B", text: "Steps 1, 2, 6 fully automated + Steps 3, 4 semi-automated (AI-assisted + human review for high-risk cases) + Step 5 automated", explanation: "Correct! Automation strategy: (1) Form validation -> instant format checking (2) Document upload -> OCR auto-recognition (3) KYC -> API integration with identity verification service; low-risk auto-approve, high-risk manual review (4) Risk assessment -> rules engine auto-classification (5) Activation -> automatic (6) Welcome -> auto-triggered. Target: 80% fully automated, 20% high-risk with human intervention."),
                                Challenge.Option(id: "C", text: "Only automate the Welcome Email", explanation: "Automating only the last step barely impacts overall timeline. The bottleneck is in KYC and review."),
                                Challenge.Option(id: "D", text: "Add more staff to speed things up", explanation: "Adding staff is costly and doesn't scale. Automation is the long-term solution."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Automation isn't 0% or 100%; find the right \"automation ratio\"",
                                "Regulatory compliance steps need human fallback",
                            ],
                            explanation: "Workflow automation strategy: (1) Identify fully automatable steps (2) Regulatory steps use \"AI + human review\" (3) Set SLA and Escalation (4) Target 80/20: 80% fully automated, 20% human intervention.",
                            frameworkTip: "Workflow automation: Fully auto (low risk) + Semi-auto AI+human (high risk/regulatory) + SLA + Escalation"
                        ),
                    ]
                ),
                Quest(
                    id: "42-4",
                    name: "Internal Tools Design",
                    description: "Design efficient internal management tools",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Build vs Buy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you evaluate Build vs Buy?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Internal Tool Decision",
                                narrative: "You work at an e-commerce company (100 people). The operations team needs a \"Refund Management System\":\n- Search orders\n- Request refund (reason, amount)\n- Manager approval\n- Execute refund (integrate with payment system)\n- Reports (refund trends, processing time)\n\nThe tech lead says: \"We can build it ourselves, 2 months.\"\nThe ops manager says: \"Just buy Zendesk and add a module.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Listen to the tech lead; building is most flexible", explanation: "Building requires considering: 2 months development + ongoing maintenance + developer attrition risk. It's not just about development time."),
                                Challenge.Option(id: "B", text: "Evaluate four dimensions: (1) Is it a core competency? (2) Are there market solutions? (3) Customization percentage needed (4) Maintenance capability -- then decide", explanation: "Correct! Evaluation results: (1) Refund management is not a core competency -> leans Buy (2) Market solutions exist (Zendesk, Freshdesk) -> yes (3) Need to integrate with proprietary payment system -> ~20% customization -> acceptable (4) 100-person company, limited dev resources -> maintenance pressure is high. Conclusion: Buy + light customization is likely the best approach."),
                                Challenge.Option(id: "C", text: "Buy the most expensive enterprise solution to ensure quality", explanation: "Most expensive doesn't mean best fit. A 100-person company doesn't need an enterprise-grade solution."),
                                Challenge.Option(id: "D", text: "Manage with Excel for now; switch when absolutely necessary", explanation: "The problem already exists. The cost of waiting (low efficiency, high error rate) may be more expensive than the solution."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Build vs Buy isn't a gut feeling; it needs an evaluation framework",
                                "Consider TCO (Total Cost of Ownership), not just purchase price",
                            ],
                            explanation: "Build vs Buy decision framework: (1) Core competency? (2) Market solutions available? (3) Customization < 30%? (4) Maintenance capability? If (1)=No (2)=Yes (3)=Yes (4)=No -> strongly recommend Buy.",
                            frameworkTip: "Build vs Buy decision: Core competency -> Build / Common needs + market solutions + customization < 30% -> Buy"
                        ),
                        Challenge(
                            id: 2,
                            name: "Admin Panel Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best approach to improve Admin Panel efficiency?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Back-office Design",
                                narrative: "You need to design an Admin Panel for an e-commerce platform. Target users are the operations team (10 people) who daily:\n- Process 200 orders (change status, handle issues)\n- Manage 5,000 SKUs (list/delist, change prices)\n- Respond to 50 customer complaints\n\nThe ops manager complains: \"The current back-office is terrible. Each order takes 8 clicks to process, and finding an order takes 30 seconds.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Add more feature options", explanation: "More features doesn't mean more usable. The problem is efficiency (click count, search speed), not insufficient features."),
                                Challenge.Option(id: "B", text: "Redesign information architecture: (1) Reduce clicks (Batch operations) (2) Enhanced search (instant search + filters) (3) Show related info on same screen (Context-Rich)", explanation: "Correct! Internal tool efficiency = reduce operation steps + speed up information retrieval. (1) Batch Operations: select multiple orders at once to change status (2) Instant search: search-as-you-type, support order number/customer name/phone (3) Context-Rich: order page simultaneously shows customer info + order history + complaint records. From 8 clicks down to 3."),
                                Challenge.Option(id: "C", text: "Switch to a completely new back-office system", explanation: "May not need a system replacement. The problem could be UX design, not the system itself. Fixing UX is cheaper than replacing the system."),
                                Challenge.Option(id: "D", text: "Let the operations team adapt", explanation: "Tools should adapt to users, not users to tools. Inefficient tools reduce team output."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Internal tool design goal is Efficiency",
                                "Think about 200 orders daily x 8 clicks = 1,600 clicks",
                            ],
                            explanation: "Internal tool design three principles: (1) Efficiency First -- reduce clicks, support Batch (2) Context-Rich -- related info on same screen (3) Searchability -- instant search + multi-condition filters. Each click saved x 200 orders/day = 200 fewer operations daily.",
                            frameworkTip: "Internal tool efficiency: Reduce clicks (Batch) + Context-Rich (same screen) + Enhanced search (instant + filters)"
                        ),
                    ]
                ),
                Quest(
                    id: "42-5",
                    name: "System Adoption & Change Management",
                    description: "Drive system adoption and change management",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ADKAR Model",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "According to the ADKAR model, where is the problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "New System Adoption Resistance",
                                narrative: "Your company implemented a new CRM system (Salesforce), replacing the old Excel approach. Two months after go-live:\n- Only 40% of sales reps are using it\n- 30% are secretly using Excel again\n- Reps complain: \"I don't know why we changed\" \"It's too complicated\" \"Where's my data?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The system is bad; we need a different one", explanation: "Salesforce is a market leader. The problem isn't the system itself, but the implementation approach."),
                                Challenge.Option(id: "B", text: "Awareness and Knowledge stages were insufficient: users don't understand \"why we changed\" + inadequate training", explanation: "Correct! \"I don't know why we changed\" = insufficient Awareness (didn't explain the reason and benefits of change). \"Too complicated\" = insufficient Knowledge (not enough training). \"Where's my data\" = insufficient Ability (not enough practice and support). 30% using Excel again = no Reinforcement (old system not decommissioned)."),
                                Challenge.Option(id: "C", text: "Mandate usage; dock performance reviews for non-compliance", explanation: "Coercive measures increase resistance. Users should \"want to use\" (Desire) not \"be forced to use.\""),
                                Challenge.Option(id: "D", text: "Wait a few more months; they'll get used to it naturally", explanation: "They won't naturally adapt. Unmanaged change only gets worse over time."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Each ADKAR stage is necessary",
                                "Diagnose the problem by finding the missing stage",
                            ],
                            explanation: "ADKAR diagnosis: (1) Don't know why -> lacking Awareness (2) Don't want to -> lacking Desire (3) Don't know how -> lacking Knowledge (4) Can't do it well -> lacking Ability (5) Reverting to old ways -> lacking Reinforcement. Targeted treatment is effective.",
                            frameworkTip: "ADKAR diagnosis: Ask three questions -> \"Do they know why?\" \"Can they use it?\" \"Do they have support?\""
                        ),
                        Challenge(
                            id: 2,
                            name: "Rollout Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most suitable rollout strategy?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Global Deployment Strategy",
                                narrative: "You work at a multinational company (1,000 people, 5 countries). The company is migrating all offices from old ERP to new cloud ERP.\n\nChallenges:\n- Different regulations per country (tax, accounting standards)\n- Different time zones; can't train simultaneously\n- Some offices have weaker IT infrastructure\n- Business can't stop (24/7 operations)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Big Bang: All countries switch simultaneously", explanation: "Cross-country simultaneous switch is extremely risky. Different regulations, time zones, and IT capabilities all increase failure probability."),
                                Challenge.Option(id: "B", text: "Pilot + Phased: Pilot in one country first -> fix issues -> roll out by region in batches", explanation: "Correct! (1) Choose a \"low-risk, high-cooperation\" office for Pilot (e.g., country with best IT) (2) Pilot collects lessons learned, builds a playbook (3) Batch rollout: sequence by regulatory complexity and IT readiness (4) Leave buffer time between batches to fix issues. 24/7 operations -> use Feature Flags for gradual switching."),
                                Challenge.Option(id: "C", text: "Each country picks its own system", explanation: "Defeats the purpose of a unified ERP. Returns to the data silo problem."),
                                Challenge.Option(id: "D", text: "Outsource everything to a consulting firm", explanation: "Consultants can help, but strategy needs to be designed by internal BA based on company context."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Cross-country deployment = high risk -> needs incremental strategy",
                                "Pilot purpose is to validate in a \"low-risk environment\"",
                            ],
                            explanation: "Pilot + Phased is the gold standard for multinational deployments: (1) Pilot validates under best conditions (2) Build Playbook (training materials, issue list, solutions) (3) Batch Rollout, each using the Playbook (4) Leave time between batches for improvement.",
                            frameworkTip: "Global rollout: Pilot (validate) -> Playbook (standardize) -> Phased Rollout (batch) -> Continuous improvement"
                        ),
                        Challenge(
                            id: 3,
                            name: "Training Plan Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most effective training strategy?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Training Strategy",
                                narrative: "One month before the new ERP goes live, you need to train 200 employees.\n\nEmployee composition:\n- Finance dept: 30 people (daily heavy usage)\n- Sales dept: 80 people (daily moderate usage)\n- Management: 20 people (reports only)\n- Other depts: 70 people (occasional usage)\n\nChallenge: Employees are busy with daily work; can't pull everyone into a full-day class.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Everyone attends the same 8-hour training session", explanation: "Management doesn't need to learn operational details; finance needs deeper training. One-size-fits-all training is inefficient and wastes time."),
                                Challenge.Option(id: "B", text: "Tiered training + Super Users + multiple channels", explanation: "Correct! (1) Tiered: Finance 4-hour deep training / Sales 2-hour core operations / Management 1-hour reports / Others 30-min video (2) Super Users: train 1-2 people per department as \"internal experts\" for daily support (3) Multiple channels: in-person classes + recordings + Quick Reference Cards + Sandbox practice. No need to pull everyone into class, plus continuous support."),
                                Challenge.Option(id: "C", text: "Only train Super Users and let them teach others", explanation: "Super Users are an important support role, but can't completely replace formal training. Everyone needs to learn basic operations."),
                                Challenge.Option(id: "D", text: "Send user manuals to everyone", explanation: "Few people will proactively read through a user manual. Hands-on practice is needed to truly learn."),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Different roles need different training depths",
                                "Super Users are a key role in Change Management",
                            ],
                            explanation: "Training strategy three elements: (1) Tiered Training by role and usage frequency (2) Super Users as internal experts for ongoing support (3) Multi-channel delivery (classes + videos + manuals + practice environment).",
                            frameworkTip: "Training three layers: Tiered training (by role) + Super Users (internal expert per dept) + Multi-channel (class/video/manual/Sandbox)"
                        ),
                    ]
                ),
                Quest(
                    id: "42-6",
                    name: "System Selection Case",
                    description: "End-to-end system selection comprehensive challenge",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Full System Selection Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce ERP Selection",
                                narrative: "You are the BA at a fast-growing D2C e-commerce company ($20M annual revenue, 150 people, 60% year-over-year growth). Current system architecture:\n\n- Finance: QuickBooks (overwhelmed)\n- Order Management: Custom-built system (insufficient features)\n- Inventory: Excel (frequent discrepancies)\n- CRM: None (customer data scattered everywhere)\n\nThe CEO decides: \"We need an integrated enterprise system. Budget $300K (first year), core functionality live within 6 months.\"\n\nVendor candidates:\n- Vendor A: NetSuite (Cloud ERP + CRM, $80K/year, 4-month implementation)\n- Vendor B: SAP Business One (ERP, $120K/year, 6-month implementation) + Salesforce (CRM, $40K/year)\n- Vendor C: Odoo (Open-source ERP + CRM, $30K/year, needs 2 developers for customization, $50K implementation fee)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "TCO is not just license fees; include implementation, customization, staffing, and maintenance",
                                "60% annual growth means the system must scale",
                            ],
                            explanation: "System selection showcases comprehensive BA skills: requirements analysis + vendor evaluation + financial analysis + risk management + change management. The key is using \"structured frameworks\" rather than \"gut feeling\" to make decisions.",
                            frameworkTip: "System selection end-to-end: Requirements definition -> Scoring Matrix -> TCO analysis -> Risk assessment -> Decision -> Implementation strategy (including Change Management)"
                        ),
                    ]
                ),
            ]
        ),

    ]
}
