const world6_en = `
# World 6: Business Process

> Learn to analyze and improve business processes. Many interview cases aren't about data problems — they're about process problems.

Business Process analysis is increasingly common in interviews, especially for Business Analyst, Operations Analyst, and Business Systems roles.
The core competency is: **Map the process → Find the bottleneck → Propose improvements**.

---

## 6-1: Process Mapping

### What Is Process Mapping?

Process Mapping is visualizing every step of a business process, including:
- Who is responsible (role)
- What they do (action)
- How long it takes (time)
- What comes next (flow)

### Why Draw a Process Map?

1. **Surface hidden steps** — Many processes have steps "everyone knows about but nobody documented"
2. **Find duplication and waste** — Is the same information being entered three times?
3. **Align team understanding** — Different people may have different perceptions of the process
4. **Serve as the basis for improvement** — You must know how things work now before you can improve them

### Elements of a Process Map

| Element | Description | Example |
|---------|-------------|---------|
| Trigger Event | What starts the process | Customer submits an order |
| Steps | Each action | Review the order, arrange shipping |
| Decision Points | Conditional branches | Order amount > $1000 requires manager approval? |
| Waits | Time waiting for people or systems | Waiting for credit check results (2 days) |
| End | The process endpoint | Goods delivered to customer |
| Owner | Who executes this step | Sales, warehouse, logistics |

### How to Draw It in Interviews

The interviewer won't ask you to use professional software. Describing it verbally or on a whiteboard is fine:

> "This process starts when a customer places an order. The first step is an automated inventory check. If stock is available, it enters the picking process; if not, it triggers a procurement request. After picking is complete, it goes to packaging, then logistics is notified for pickup. The entire process takes about 3 business days."

### Common Process Types

- **Order to Fulfillment**
- **Customer Complaint Resolution**
- **Employee Onboarding**
- **Purchase Approval**
- **Bug Report to Fix (Incident Management)**

---

## 6-2: Finding Bottlenecks

### What Is a Bottleneck?

A bottleneck is the **slowest** or **lowest-capacity** step in a process — it limits the speed of the entire workflow.

It's like the narrowest stretch of a road — no matter how wide the other sections are, overall traffic flow is limited by the narrowest point.

### How to Find a Bottleneck

1. **Quantify the time for each step**:
   - Processing time (actual work time)
   - Wait time (idle waiting time)
   - Total lead time = Processing + Wait

2. **Find the step with the longest wait time** — Most bottlenecks aren't in "doing work" but in "waiting"

3. **Look for accumulation**: Which step has the longest queue in front of it? That's the bottleneck

### Common Bottleneck Types

| Type | Example | Solution Direction |
|------|---------|-------------------|
| Human resource bottleneck | Only one person can approve | Add approvers, increase authorization limits |
| System bottleneck | System processing is slow | Upgrade systems, optimize performance |
| Information bottleneck | Waiting for client to provide documents | Simplify requirements, provide default values |
| Policy bottleneck | Company requires three levels of approval | Review whether each level is necessary |
| Dependency bottleneck | Waiting for another department to finish | Parallelize processing, reduce dependencies |

### Interview Example

Interviewer asks: "Customer service ticket handling time went from 2 hours to 8 hours. How would you analyze this?"

> "I would first map out each step of the ticket handling process: Receive ticket → Classify → Assign → Investigate → Reply → Confirm closure. Then I'd quantify the processing time and wait time for each step. The step with the biggest increase in wait time is the bottleneck. For example, it might be the 'assignment' step — because the support team is recently short-staffed, tickets are piling up while waiting to be assigned."

### Bottleneck Analysis Pitfalls

- Don't assume the bottleneck is the most complex step — it's often the most mundane "waiting" step
- Bottlenecks can shift — after resolving one, the next slowest step becomes the new bottleneck
- Local optimization doesn't equal global optimization — speeding up steps other than the bottleneck won't make the overall process faster

---

## 6-3: Automation Decisions

### Which Steps Should Be Automated?

Not all steps are suitable for automation. Decision criteria:

| Suitable for Automation | Not Suitable for Automation |
|------------------------|-----------------------------|
| Highly repetitive | Requires judgment and creativity |
| Clear rules | Vague rules or many exceptions |
| High volume | Very low volume (only a few times per month) |
| Low error cost | Extremely high error cost |
| Currently a bottleneck | Not a bottleneck (automation won't speed up the process) |

### Levels of Automation

1. **Notification automation**: Automatic reminders, sending emails (simplest)
2. **Data transfer automation**: Automatically syncing data from System A to System B
3. **Rule-based automation**: If condition X is met, automatically execute action Y
4. **Approval workflow automation**: Auto-approve low-risk items, route high-risk items to humans
5. **End-to-end automation**: Entire process requires no human intervention

### Interview Decision Framework

Interviewer asks: "This process has 10 steps. Which ones would you automate?"

> "I would evaluate using three dimensions:
> 1. Is this step a bottleneck? If so, the benefit of automation is greatest
> 2. Are the rules clear? If the logic can be written as if-then, it's suitable for automation
> 3. How high is the error cost? If the impact of mistakes is significant, human review may need to be retained
>
> I would start with steps that are 'high volume + clear rules + low error cost.'"

### ROI Assessment

Automation isn't free. In interviews, you can demonstrate that you consider ROI:

| Cost | Benefit |
|------|---------|
| Development and maintenance costs | Time savings on manual labor |
| Training and transition costs | Reduced error rates |
| Risk when errors occur | Faster processing speed |

---

## 6-4: Permissions & Audit

### Why Do Interviews Test This?

Because real business processes aren't just about "getting things done" — they also need to ensure:
- **The right people do the right things** (access control)
- **What was done is recorded** (audit trail)

### Basic Concepts in Permission Design

**Principle of Least Privilege**:
Each person is given only the minimum permissions needed to do their job.

Common permission models:
- **Role-based**: Permissions by role (Manager, Editor, Viewer)
- **Level-based**: Tiered by amount or risk level (< $1000 self-approve, > $1000 requires manager)
- **Separation of Duties**: The same person cannot both request and approve

### Audit Trail

Records of who performed what action at what time:
- Who modified this order?
- Who approved this discount?
- When was the customer data deleted?

### How This Appears in Interviews

Interviewer asks: "We need to design a procurement approval process. How would you think about it?"

> "Beyond the process steps, I would consider permissions and audit:
> 1. Who can initiate a procurement request?
> 2. How should approval authority be tiered? (e.g., under $5K by department head, over $5K by VP)
> 3. The same person cannot both initiate and approve (separation of duties)
> 4. Every step must have an audit trail — who approved it, when, and for what amount
> 5. Exception handling — can emergency purchases be executed first and approved retroactively?"

---

## 6-5: Exception Handling

### Process Design Is More Than the Happy Path

Most process designs only consider the scenario where "everything goes smoothly."
But the real world is full of exceptions:

- Customer cancels an order (handling differs depending on the stage of cancellation)
- Supplier delays delivery
- System crashes
- Approver is on vacation
- Customer provides incomplete information

### How to Design Exception Handling

1. **List possible exceptions** (through brainstorming or reviewing historical data)
2. **Assess the frequency and impact of each exception**
3. **Design handling workflows**:
   - High frequency + Low impact → Automate (system rules)
   - Low frequency + High impact → Manual handling + escalation path
   - High frequency + High impact → May need to redesign the core process

### Escalation Path

When frontline staff can't resolve an issue, how to escalate:

| Level | Situation | Handler | Time Limit |
|-------|-----------|---------|-----------|
| L1 | General issues | Frontline support | 2 hours |
| L2 | Technical issues | Technical support | 4 hours |
| L3 | Cross-department issues | Department head | 1 business day |
| L4 | Urgent / Revenue-impacting | VP or C-level | Immediate |

### How to Demonstrate This in Interviews

Interviewer asks: "You've designed a return process. What else should you consider?"

> "Beyond the normal return process, I would consider several exception scenarios:
> 1. Past the return deadline but the customer has a reasonable justification → Requires manager discretion
> 2. Product is damaged and cannot be resold → Requires a write-off process
> 3. Customer requests a refund but the credit card refund window has passed → Need an alternative (store credit)
> 4. Mass returns (possible quality issue or fraud) → Trigger an investigation process
>
> Each exception needs a clear handling path and escalation mechanism."

---

## 6-6: Boss — Process Improvement Case

The Boss challenge gives you a complete process improvement scenario:

1. Use **Process Mapping** to draw the current process
2. Use **Bottleneck Analysis** to find the slowest step
3. Evaluate which steps are suitable for **Automation**
4. Consider **Permissions & Audit** requirements
5. Design **Exception Handling** paths
6. Propose improvement recommendations and estimate **ROI**

This is the complete answer framework for Business Process improvement questions in interviews.

---

## Chapter Summary

| Skill | Core Question | Golden Interview Phrase |
|-------|--------------|------------------------|
| Process Mapping | What does the process look like? | "I would first draw the end-to-end process map" |
| Bottleneck | Where is it slowest? | "Find the step with the longest wait time" |
| Automation | Should it be automated? | "High volume + clear rules + low error cost makes it suitable" |
| Permissions | Who can do what? | "Principle of least privilege + separation of duties" |
| Exception | What happens when things go wrong? | "Design not just the happy path, but exception handling too" |
`;
export default world6_en;
