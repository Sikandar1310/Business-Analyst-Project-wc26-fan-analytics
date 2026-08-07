# FIFA World Cup 2026 Fan Analytics & Ticketing Insights

## Project Overview

This project simulates the role of a **Business Analyst** supporting FIFA's Fan Engagement & Ticketing team following the FIFA World Cup 2026. It spans two connected phases: an analytics engagement that surfaced a real operational failure in the tournament's fan experience, and a follow-on process-improvement engagement investigating and redesigning the cause of that failure.

---

## Project Phases

**Phase 1 — Fan Ticket Demand & Attendance Analytics** established demand, revenue, and fan-experience findings via SQL analysis and an interactive Power BI dashboard. One finding stood out: a specific venue recorded the tournament's worst fan-experience metrics despite not being the most crowded — a genuine operational failure, not a demand problem.

**Phase 2 — Stadium Entry & Security Process Improvement** investigates that exact finding. It grounds the analysis in real, cited, publicly reported entry-delay incidents from the actual 2026 tournament, conducts a root cause analysis, and produces a redesigned entry process addressing the causes found to be fixable.

Phase 2 exists because of a finding in Phase 1 — this isn't two unrelated case studies sharing a repository, it's one engagement with two stages.

---

# Phase 1: Fan Ticket Demand & Attendance Analytics

## Dataset & Methodology

This project uses a **hybrid dataset**: real tournament structure combined with a synthetic transactional layer, in the same spirit as how analysts commonly practice on Northwind or AdventureWorks — a real-world frame paired with generated data for analysis practice.

**What's real:**
- All 16 tournament venues, all 48 teams, and the tournament dates (June 11 – July 19, 2026)
- The actual Final result (Spain beat Argentina 1-0 at MetLife Stadium), the actual Third Place result, and the actual opening match (Mexico vs. South Africa)

**What's synthetic:**
- Individual match scores beyond the results above, ticket sales transactions, attendance-as-percentage-of-capacity, and fan survey responses
- Group draws beyond Groups A and D are illustrative, not pulled from the verified official draw

**Known limitations, disclosed rather than hidden:**
- No transaction timestamp or session-level platform data exists in this dataset — any recommendation involving real-time or transaction-level behaviour (e.g. platform load, queue timing) is explicitly noted in the BRD as a reasoned recommendation based on volume concentration, not a measured finding
- No transit-access or transportation data was available — flagged as a data gap and a functional requirement for future collection, not analysed
- Channel and ticket price tier were generated as independent variables, so channel-level pricing patterns (e.g. hospitality pricing at a premium) don't reflect real-world pricing structures
- Knockout-stage match scheduling was simplified for this portfolio dataset

Full detail on scope and assumptions is in the [Phase 1 BRD](Documentation/BRD.md).

## Business Problem

FIFA wants to improve its ticketing platform for the 2030 World Cup.

As a Business Analyst, my responsibility was to analyse tournament data to answer questions such as:

- Which matches generated the highest demand?
- Which ticket sales channels generated the highest revenue?
- Which venues delivered the poorest fan experience?
- What operational issues reduced customer satisfaction?
- Which platform capabilities should be introduced for the 2030 tournament?

The findings were translated into functional requirements supported by SQL analysis and interactive Power BI dashboards.

## Objectives

- Analyse attendance and ticket demand patterns
- Identify revenue trends across ticket sales channels
- Evaluate venue-level fan experience
- Segment matches into demand tiers
- Translate analytical findings into business requirements
- Build an interactive executive dashboard for stakeholders

## Business Questions Answered

- Which venues achieved the highest attendance rates?
- Which matches experienced the longest wait times?
- Which ticket sales channels generated the highest revenue?
- How should matches be classified into demand tiers?
- Which venues delivered the poorest fan experience?
- Does venue capacity or region influence demand?
- What functional improvements should FIFA implement for the 2030 ticketing platform?

## Dashboard Highlights

The Power BI dashboard includes:

- Executive KPI Summary (Total Revenue, Total Attendance, Occupancy Rate, Tickets Sold, Avg. Satisfaction)
- Revenue by Ticket Sales Channel
- Demand Tier Analysis (venue-level and match-level)
- Attendance by Stage
- Venue Fan Experience Analysis, including a match-level wait time vs. satisfaction scatter plot
- Interactive filtering by Stage, Region, Venue and Sales Channel

## Key Findings

- Match-level analysis identified **40 Blockbuster**, **31 Standard**, and **33 Low-Interest** fixtures — venue-level averages alone masked this variation.
- FIFA.com Ticketing Platform generated approximately **2.23×** the revenue of the next-largest sales channel.
- **MetLife Stadium recorded the poorest operational performance** despite not being the highest-attended venue (96.52% attendance-to-capacity, 4th of 16) — indicating operational inefficiencies rather than demand-related issues. This finding is the direct origin of Phase 2.
- Venue capacity and geographic region showed little observable relationship with attendance percentage within the analysed dataset.
- Wait time and satisfaction showed a real, moderate negative correlation (-0.319) tournament-wide, not just at the worst-performing venue.

## Functional Recommendations

- Match-level demand **reporting**, since venue-level averages were shown to mask meaningful match-level variation (predictive forecasting using fixture characteristics is a reasonable future capability, but wasn't tested in this analysis — matchup identity showed no measurable relationship to attendance in this dataset)
- Scalable ticketing platform with queue management and load balancing
- Venue operational monitoring using fan experience KPIs
- Collection of venue accessibility and transport data for future analytics

---

# Phase 2: Stadium Entry & Security Process Improvement

## Business Problem

Phase 1 found that a specific venue's fan experience failed independent of attendance volume. Phase 2 investigates *why*, grounded in real, cited, publicly reported entry-delay incidents from the actual 2026 tournament — not hypothetical scenarios.

## Grounding & Evidence Standard

Two real incidents anchor this analysis, tiered explicitly by source reliability rather than treated as equally confirmed:

- **MetLife Stadium (the actual Final):** well-corroborated across multiple independent outlets — 2-4 hour entry delays, driven by a doubled security-checkpoint design and a transit-capacity constraint.
- **Houston (NRG Stadium):** two separate facts, not one incident — a real, reported bottleneck at the actual Houston opener (social-media-sourced, not venue-confirmed), documented separately from an unexplained wait-time anomaly in this project's synthetic data. No causal link is claimed between the two.

Full sourcing, including verified citations (an actual $14M federal settlement from a related 2024 incident, and an on-record quote from NJ's governor ordering the security review that shaped MetLife's design) is in the [Phase 2 BRD](Process-Improvement/BRD.md).

## Root Cause Analysis

Three converging, independently-sourced causes were identified for the MetLife delay, each treated differently in the redesign:

1. **Risk-transfer design flaw (repeatable, fixable):** MetLife's doubled security checkpoints trace to a real 2024 security breach at a shared World Cup venue (Hard Rock Stadium). The fix for that breach — enclosed multi-checkpoint screening — created a new bottleneck for legitimate ticket-holders as an unintended consequence.
2. **Transit infrastructure constraint (repeatable, but physical, not a process fix):** NJ Transit officially capped Final rail tickets at 40,000/matchday — half of MetLife's capacity — based on a documented single rail line's throughput limit.
3. **Exceptional security escalation (non-repeatable, excluded from redesign):** the Final's SEAR-1 federal security designation, driven by a specific VIP attendee, is not representative of a typical match and is explicitly excluded from steady-state process design.

## AS-IS → TO-BE Process Redesign

Built as swimlane diagrams (draw.io) across four lanes — Fan, Ticketing/Entry, Security Screening, Venue Operations — the TO-BE process introduces three targeted fixes, each traced to a specific root cause via a formal Gap Analysis:

- **Credentialed fast-track** at the second security checkpoint for already-screened fans, preserving the legitimate double-checkpoint security posture rather than removing it
- **Timed-entry / staggered gate assignment** for non-rail arrivals specifically, to flatten the arrival curve the transit cap doesn't reach
- **Real-time wait-time monitoring against each venue's own historical baseline**, enabling in-match intervention — a capability independently arrived at from Phase 1's own recommendations, a convergent signal that it's a genuine gap

## Risk Register

Implementation risk was assessed for each fix, including risks the fixes themselves could introduce (e.g. a spoofable fast-track credential reintroducing the original breach risk it was designed to prevent) and honest documentation of what remains genuinely unresolved (Houston's underlying cause is still unconfirmed; the transit constraint is a permanent boundary condition, not something a process fix removes). Full register in [Process-Improvement/Risk_Register.md](Process-Improvement/Risk_Register.md).

## Phase 2 Status

| Deliverable | Status |
|---|---|
| AS-IS Process Map | ✅ Complete |
| Root Cause Analysis | ✅ Complete |
| Gap Analysis | ✅ Complete |
| TO-BE Process Map | ✅ Complete |
| Risk Register | ✅ Complete |

*Scope note: unlike Phase 1, Phase 2 does not include an implementation Jira backlog — this phase's deliverable is the process analysis and redesign itself, not a tracked delivery plan for building it. A deliberate scope decision, not an incomplete item.*

---

## Repository Structure

```
📁 Data                    Phase 1 tournament datasets
📁 SQL                     Phase 1 business-focused SQL analysis
📁 Documentation           Phase 1: BRD, Traceability Matrix, Data Dictionary, Data Quality Assessment
📁 Power.bi                Phase 1 interactive dashboard + screenshots
📁 Jira                    Phase 1: Epic, User Stories, Sprint planning, process write-up
📁 Process-Improvement     Phase 2: BRD, AS-IS/TO-BE process maps, Risk Register

README.md
```

## Tools Used

- SQL
- SQLite
- Power BI
- Jira
- draw.io
- GitHub
- Microsoft Word

## Deliverables

- Business Requirements Documents (Phase 1 and Phase 2)
- Traceability Matrix, Data Dictionary, Data Quality Assessment
- Jira Epic, User Stories and Sprint Board (Phase 1)
- SQL Analysis Scripts
- Interactive Power BI Dashboard
- AS-IS / TO-BE Process Maps
- Root Cause Analysis, Gap Analysis, and Risk Register

## Skills Demonstrated

### Business Analysis

- Stakeholder Requirement Analysis
- User Story Development
- Acceptance Criteria Definition
- Business Process Modelling & Swimlane Diagramming
- Root Cause / Gap Analysis
- Risk Register Development
- Requirements Documentation
- Functional Requirement Elicitation

### Data Analysis

- SQL Joins, Subqueries, CTEs
- Aggregations
- Business KPI Development
- Data Interpretation
- Source Reliability Evaluation

### Data Visualisation & Process Design

- Interactive Power BI Dashboards
- Executive Reporting
- AS-IS / TO-BE Process Mapping
- Dashboard Storytelling

---

## About This Project

This project was independently designed as a two-phase portfolio case study demonstrating an end-to-end Business Analyst workflow: an analytics engagement that surfaces a real problem, followed by a process-improvement engagement that investigates and redesigns it. Phase 1's dataset is a synthetic transactional layer built on real tournament structure; Phase 2 is grounded in real, cited news reporting of actual 2026 tournament incidents. See **Dataset & Methodology** and **Grounding & Evidence Standard** above for full detail on what's real versus simulated in each phase.
