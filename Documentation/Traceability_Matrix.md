# Requirements Traceability Matrix

**Project:** FIFA World Cup 2026 Fan Ticket Demand & Attendance Analytics
**Purpose:** Traces each functional requirement in the [BRD](BRD.md) back to the specific analysis and finding that justifies it.

| FR ID | Business Need | Analysis Evidence | Finding | Requirement |
|-------|---------------|--------------------|---------|-------------|
| FR-01 | Improve ticket demand visibility | Match-level SQL analysis (94%/97% capacity-based demand tiers) | Venue-level attendance averages masked significant match-level variation (40 Blockbuster / 31 Standard / 33 Low-Interest fixtures) | Match-level demand reporting |
| FR-02 | Improve platform scalability and resilience | Channel revenue concentration analysis | FIFA.com Ticketing Platform generated ~2.23× the revenue of the next-largest channel, indicating single-channel dependency risk | Scalable queue management and load balancing for the primary channel |
| FR-03 | Improve fan experience monitoring | Fan survey analysis (wait time, entry experience, satisfaction by venue) | MetLife Stadium recorded the worst performance on all three experience metrics (52.4-min avg. wait, 3.50 entry score, 3.58 satisfaction) despite not being the most crowded venue (96.52% attendance-to-capacity, 4th of 16) | Per-venue KPI monitoring with configurable alerts |
| FR-04 | Improve venue accessibility planning | Venue data schema review | Transit, parking, and travel-time data were unavailable in this analysis — venue records only included city, region, and capacity | Venue accessibility data capture for future analysis |

---

*Note: this matrix reflects requirements evidenced by the 2026 analysis. Predictive/forecasting capabilities referenced in FR-01's full description in the BRD are a recommended future capability, not a finding this analysis tested — see BRD Section 4 for the complete requirement text and caveats.*
