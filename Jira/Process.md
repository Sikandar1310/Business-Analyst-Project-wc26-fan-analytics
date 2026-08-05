# Requirements & Delivery Process

## Overview

This project followed a structured Business Analysis process in which the Jira backlog was developed incrementally through requirements discovery rather than being fully defined at the outset. Business requirements, analysis, and deliverables evolved together, ensuring that every completed work item was supported by verifiable evidence.

---

## Requirements Process

### 1. Initial Requirements Calibration

The project began with a stakeholder calibration exercise to define:
- Business objective
- Project scope
- Primary stakeholders
- Expected analytical outcomes

This resulted in a single project Epic:

> **W26FAN-1: 2026 Fan Ticketing & Attendance Analysis to Inform 2030 Platform Requirements**

---

### 2. Epic Decomposition

The Epic was decomposed into four stakeholder-focused User Stories, each representing a distinct business objective.

| User Story | Stakeholder |
|------------|-------------|
| W26FAN-2 | Fan Engagement Manager |
| W26FAN-4 | Finance Manager |
| W26FAN-5 | Stadium Operations Manager |
| W26FAN-7 | Tournament Director |

*Note: story numbering isn't continuous. W26FAN-1 is the Epic itself, not a story. W26FAN-3 is a reserved key from an issue that was started and abandoned before saving — Jira does not reuse issue numbers once reserved. W26FAN-6 was an early draft of the Tournament Director story that was deliberately deleted and rebuilt as W26FAN-7, after review determined its scope was premature (it depended on findings from the other three stories that didn't exist yet).*

Each User Story included clearly defined Acceptance Criteria that established measurable conditions for completion.

---

### 3. Evidence-Based Delivery

The Jira backlog was **not** completed through manual status updates alone.

Each User Story remained open until SQL analysis and/or Power BI dashboard development produced evidence that satisfied its Acceptance Criteria.

Evidence included:
- SQL query outputs
- Power BI dashboard visualisations
- Analytical findings
- Business recommendations

Supporting artefacts were referenced directly within each Jira story through comments linking to the relevant query, dashboard page, or project deliverable.

---

### 4. Story Validation

A User Story was marked **Done** only after:
- All Acceptance Criteria were satisfied.
- Supporting analytical evidence had been produced.
- Findings could be independently verified through project artefacts.

---

### 5. Epic Completion

The parent Epic was closed only after all four child User Stories had been independently completed and verified.

This ensured that Epic completion represented successful delivery of the complete business objective rather than simply closing outstanding tasks.

---

## Delivery Workflow

```text
Requirements Calibration
          │
          ▼
Stakeholder Identification
          │
          ▼
Epic Creation
          │
          ▼
User Story Decomposition
          │
          ▼
Acceptance Criteria Definition
          │
          ▼
SQL Analysis & Dashboard Development
          │
          ▼
Evidence Validation
          │
          ▼
Story Completion
          │
          ▼
Epic Closure
```

---

## Outcome

This approach maintained full traceability between business requirements, analytical work, and final deliverables. Every completed Jira item is supported by verifiable project evidence, ensuring that business findings and recommendations are directly linked to documented stakeholder requirements.
