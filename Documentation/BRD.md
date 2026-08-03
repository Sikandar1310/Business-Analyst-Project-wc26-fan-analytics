# Business Requirements Document (BRD)

**Project:** FIFA World Cup 2026 Fan Ticket Demand & Attendance Analytics
**Purpose:** Requirements analysis to inform the FIFA 2030 Ticketing Platform.

## 1. Business Objective

This analysis evaluates ticket demand, attendance, ticket sales channels, and fan experience from the FIFA World Cup 2026 to identify evidence-based requirements for the FIFA 2030 ticketing platform. The objective is to support strategic decisions related to ticket allocation, channel strategy, venue operations, and fan engagement by translating analytical findings into functional platform capabilities.

## 2. Scope

### In Scope
- Analysis of match-level ticket demand and attendance.
- Revenue analysis by ticket sales channel.
- Venue-level operational performance using wait time, entry experience, and fan satisfaction.
- Demand segmentation using attendance as a percentage of venue capacity.
- Business recommendations and functional requirements for the 2030 platform.

### Out of Scope
- Platform transaction timestamps, session logs, and technical performance metrics.
- Transit accessibility, parking utilisation, and external transportation data.
- Official verification of illustrative group draws beyond Groups A and D.
- Predictive modelling beyond descriptive analytics.

## 3. Stakeholders
- Fan Engagement Manager
- Finance Manager
- Stadium Operations Manager
- Tournament Director

## 4. Functional Requirements

**FR-01:** The system shall support match-level demand reporting, rather than venue-level alone, since venue-level attendance averages masked significant variation across individual matches (40 Blockbuster / 31 Standard / 33 Low-Interest fixtures on a 94%/97% capacity-based tier system). *(Note: match-level forecasting using fixture characteristics like team ranking or rivalry is a reasonable future capability, but wasn't tested in this analysis — matchup identity showed no measurable relationship to attendance in this dataset.)*

**FR-02:** The system shall support scalable queue management and load balancing for the primary ticketing platform. This requirement is based on FIFA.com generating approximately 2.23× the revenue of the next-largest sales channel. The analysis did not include timestamp, session, or platform performance data.

**FR-03:** The system shall monitor average wait time, entry experience score, and overall fan satisfaction for each venue and generate configurable alerts when predefined thresholds are exceeded. This requirement is supported by the MetLife Stadium finding (52.4-minute average wait, 3.50 entry experience, 3.58 satisfaction, despite 96.52% average attendance).

**FR-04:** The system shall capture venue accessibility information, including transit availability, parking utilisation, and estimated travel times, to support future analysis of factors influencing fan demand and experience. Transit and accessibility data was not available in this analysis — venue records only included city, region, and capacity.

## 5. Assumptions & Constraints
- The project uses a synthetic transactional dataset built on real tournament venues, dates, and selected verified results.
- No transaction timestamp or session-level platform data was available.
- No transit-access or transport infrastructure data was available.
- Channel and ticket price tier were generated as independent variables in this synthetic dataset, so channel-level pricing patterns (e.g. hospitality pricing at a premium) don't reflect real-world pricing structures.
- Knockout-stage scheduling was simplified for the portfolio dataset.
- Demand analysis was performed primarily at the match level because venue-level averages masked meaningful variation.

## 6. Key Findings Summary
- Match-level demand segmentation identified 40 Blockbuster, 31 Standard, and 33 Low-Interest fixtures, while venue-level averages remained tightly clustered.
- FIFA.com Ticketing Platform generated approximately 2.23× the revenue of the next-largest sales channel, indicating heavy concentration of ticket sales.
- MetLife Stadium recorded the poorest operational performance with a 52.4-minute average wait time, a 3.50 average entry experience score, and a 3.58 average satisfaction score despite operating at 96.52% average attendance.
- Venue capacity and region showed little observable relationship with attendance percentage, suggesting these factors alone were not strong indicators of demand within this dataset.
