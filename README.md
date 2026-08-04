# FIFA World Cup 2026 Fan Analytics & Ticketing Insights

## Project Overview

This project simulates the role of a **Business Analyst** supporting FIFA's Fan Engagement & Ticketing team following the FIFA World Cup 2026. The objective was to analyse tournament ticketing, attendance, and fan experience data to identify evidence-based business requirements for the FIFA World Cup 2030 ticketing platform.

The project follows a complete Business Analysis lifecycle, beginning with stakeholder requirements and ending with actionable platform recommendations.

---

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

Full detail on scope and assumptions is in the [Business Requirements Document](Documentation/BRD.md).

---

## Business Problem

FIFA wants to improve its ticketing platform for the 2030 World Cup.

As a Business Analyst, my responsibility was to analyse tournament data to answer questions such as:

- Which matches generated the highest demand?
- Which ticket sales channels generated the highest revenue?
- Which venues delivered the poorest fan experience?
- What operational issues reduced customer satisfaction?
- Which platform capabilities should be introduced for the 2030 tournament?

The findings were translated into functional requirements supported by SQL analysis and interactive Power BI dashboards.

---

## Objectives

- Analyse attendance and ticket demand patterns
- Identify revenue trends across ticket sales channels
- Evaluate venue-level fan experience
- Segment matches into demand tiers
- Translate analytical findings into business requirements
- Build an interactive executive dashboard for stakeholders

---

## Project Workflow

```
Stakeholder Brief
        │
        ▼
Business Requirements
        │
        ▼
Jira Backlog & Sprint Planning
        │
        ▼
SQL Data Analysis
        │
        ▼
Power BI Dashboard
        │
        ▼
Business Findings
        │
        ▼
Functional Requirements
```

---

## Repository Structure

```
📁 Data
    Tournament datasets

📁 SQL
    Business-focused SQL analysis

📁 Documentation
    Business Requirements Document (BRD)

📁 Power BI
    Interactive dashboard

📁 Jira
    Epic, User Stories and Sprint planning

README.md
```

---

## Tools Used

- SQL
- SQLite
- Power BI
- Jira
- GitHub
- Microsoft Word

---

## Business Questions Answered

The analysis addressed questions including:

- Which venues achieved the highest attendance rates?
- Which matches experienced the longest wait times?
- Which ticket sales channels generated the highest revenue?
- How should matches be classified into demand tiers?
- Which venues delivered the poorest fan experience?
- Does venue capacity or region influence demand?
- What functional improvements should FIFA implement for the 2030 ticketing platform?

---

## Dashboard Highlights

The Power BI dashboard includes:

- Executive KPI Summary
- Revenue by Ticket Sales Channel
- Demand Tier Analysis
- Attendance by Stage
- Venue Fan Experience Analysis
- Interactive filtering by Stage, Region and Sales Channel

---

## Key Findings

- Match-level analysis identified **40 Blockbuster**, **31 Standard**, and **33 Low-Interest** fixtures.
- FIFA.com Ticketing Platform generated approximately **2.23×** the revenue of the next-largest sales channel.
- MetLife Stadium recorded the poorest operational performance despite not being the highest-attended venue, indicating operational inefficiencies rather than demand-related issues.
- Venue capacity and geographic region showed little observable relationship with attendance percentage within the analysed dataset.

---

## Functional Recommendations

The analysis resulted in four key platform recommendations for FIFA 2030:

- Match-level demand **reporting**, since venue-level averages were shown to mask meaningful match-level variation (predictive forecasting using fixture characteristics is a reasonable future capability, but wasn't tested in this analysis — matchup identity showed no measurable relationship to attendance in this dataset)
- Scalable ticketing platform with queue management and load balancing
- Venue operational monitoring using fan experience KPIs
- Collection of venue accessibility and transport data for future analytics

---

## Deliverables

- Business Requirements Document (BRD)
- Jira Epic, User Stories and Sprint Board
- SQL Analysis Scripts
- Interactive Power BI Dashboard
- Business Findings and Recommendations

---

## Skills Demonstrated

### Business Analysis

- Stakeholder Requirement Analysis
- User Story Development
- Acceptance Criteria Definition
- Business Process Thinking
- Requirements Documentation
- Functional Requirement Elicitation

### Data Analysis

- SQL Joins
- Aggregations
- Common Table Expressions (CTEs)
- Subqueries
- Business KPI Development
- Data Interpretation

### Data Visualisation

- Interactive Power BI Dashboards
- Executive Reporting
- KPI Design
- Dashboard Storytelling

---

## About This Project

This project was independently designed as a portfolio case study to demonstrate an end-to-end Business Analyst workflow, combining business requirements, data analysis, stakeholder reporting, and solution recommendations within a realistic FIFA World Cup ticketing scenario. The underlying dataset is a synthetic transactional layer built on real tournament structure — see **Dataset & Methodology** above for full detail on what's real versus simulated.
