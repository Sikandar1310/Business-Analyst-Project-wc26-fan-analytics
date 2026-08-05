# Data Quality Assessment

**Project:** FIFA World Cup 2026 Fan Ticket Demand & Attendance Analytics
**Method:** Assessed against six standard data quality dimensions. All checks below were executed directly against `wc26_portfolio.db`, not estimated — see the SQL equivalents in `SQL/` where applicable.

---

## Summary

| Dimension | Result |
|---|---|
| Completeness | Pass — zero NULLs across all 5 tables, 23 columns checked |
| Uniqueness | Pass — all 5 primary keys 100% unique |
| Referential Integrity | Pass — zero orphaned foreign keys across all relationships |
| Validity | Pass — zero logically impossible values found |
| Consistency | **2 known issues** — disclosed below, not hidden |
| Accuracy | **Mixed by design** — see note below |

---

## 1. Completeness

Checked all 23 columns across all 5 tables for NULL values. **Result: zero NULLs found anywhere.**

This reflects the dataset being fully generated rather than collected — a real-world dataset of this size would typically show some missing values from data entry or system gaps. Worth noting as a limitation of "too clean" synthetic data, not a strength to overstate.

**Schema-level completeness gaps** (fields that don't exist at all, not missing values within existing fields):
- No transaction timestamp or session-level data in `ticket_sales`
- No transit, parking, or travel-time data anywhere in the schema

## 2. Uniqueness

Verified `COUNT(*) = COUNT(DISTINCT primary_key)` for all 5 tables:

| Table | Rows | Distinct PKs |
|---|---|---|
| `teams` | 48 | 48 |
| `venues` | 16 | 16 |
| `matches` | 104 | 104 |
| `ticket_sales` | 39,075 | 39,075 |
| `fan_survey` | 2,858 | 2,858 |

No duplicate keys anywhere.

## 3. Referential Integrity

Checked every foreign key against its parent table:
- `matches.venue_id` → `venues.venue_id`: 0 orphaned rows
- `matches.team1_id` / `team2_id` → `teams.team_id`: 0 orphaned rows
- `ticket_sales.match_id` → `matches.match_id`: 0 orphaned rows
- `fan_survey.match_id` → `matches.match_id`: 0 orphaned rows

## 4. Validity

Checked values against logical and real-world constraints:
- **Attendance never exceeds venue capacity** (0 violations across 104 matches) — an important logical check, since synthetic generation could theoretically produce an impossible value here
- `satisfaction_score` and `entry_experience_score`: 100% within the valid 1–5 range
- `ticket_sales.quantity` and `unit_price_usd`: 100% positive, no zero or negative values
- No match has a team playing itself (`team1_id ≠ team2_id`, verified)

## 5. Consistency — 2 known issues, disclosed

**Issue 1: Knockout-stage matches share a single date within each round.** Quantified directly: all 16 Round of 32 matches share exactly 1 date, all 8 Round of 16 matches share 1 date, and so on through the Final. Real tournaments spread knockout matches across several days; this dataset simplifies each round to a single date. Does not affect any finding in this analysis, since no finding depends on intra-round date variation.

**Issue 2: `channel` and `price_tier` are statistically independent**, when in reality ticket channel and price tier would correlate (e.g. hospitality-channel tickets priced at a premium). Confirmed in the BRD's Assumptions section — average ticket price is nearly flat across all 4 channels (~$191–194) in this dataset, which would not hold in a real ticketing system.

## 6. Accuracy — mixed by design, not a defect

Accuracy isn't a single yes/no for this dataset, because it's intentionally hybrid:
- **Real and accurate:** all 16 venues, all 48 teams, tournament dates, the actual Final result (Spain 1–0 Argentina), the actual Third Place result, the actual opening match, and the actual USA vs. Bosnia & Herzegovina Round of 32 fixture.
- **Synthetic by design, not "inaccurate":** ticket transactions, attendance-as-percentage-of-capacity, and survey responses were generated for this exercise and were never claimed to be real transactional records — see the [Dataset & Methodology](../README.md#dataset--methodology) section of the main README.

---

## Overall Fitness for Purpose

This dataset is fit for its intended purpose — a portfolio exercise demonstrating SQL, requirements analysis, and dashboard-building skills — precisely because its limitations are documented rather than discovered. Every finding in the BRD and dashboard has been checked against what this data can and cannot support, and caveated accordingly (e.g. FR-01's forecasting note, FR-02's data-gap disclosure). No finding in this project relies on a value that fails the checks above.
