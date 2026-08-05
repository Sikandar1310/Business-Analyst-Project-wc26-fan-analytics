# Data Dictionary

**Project:** FIFA World Cup 2026 Fan Ticket Demand & Attendance Analytics
**Database:** `wc26_portfolio.db` (SQLite) / equivalent CSVs in `Data/`

Each field is labeled **Real** (drawn from actual 2026 World Cup facts) or **Synthetic** (generated for this portfolio exercise). See the [BRD](BRD.md) for full scope and assumptions.

---

## `teams` (48 rows)

| Column | Type | Description | Source |
|---|---|---|---|
| `team_id` | INTEGER (PK) | Unique identifier, 1–48 | Generated |
| `team_name` | TEXT | Official team name | **Real** — actual 2026 qualified nations |
| `group_letter` | TEXT | Group stage assignment (A–L) | **Real** for Groups A & D (publicly confirmed); **illustrative** for all other groups — not the verified official draw |

## `venues` (16 rows)

| Column | Type | Description | Source |
|---|---|---|---|
| `venue_id` | INTEGER (PK) | Unique identifier | Generated |
| `venue_name` | TEXT | Official stadium name | **Real** |
| `city` | TEXT | Host city | **Real** |
| `country` | TEXT | USA / Mexico / Canada | **Real** |
| `capacity` | INTEGER | Listed stadium capacity | **Real** |
| `region` | TEXT | Central / East / West | **Generated** grouping for regional analysis — not an official FIFA designation |

## `matches` (104 rows)

| Column | Type | Description | Source |
|---|---|---|---|
| `match_id` | INTEGER (PK) | Unique identifier | Generated |
| `match_date` | TEXT (date) | Fixture date | **Real** for 4 anchor matches (opener, USA vs. Bosnia R32, Final, Third Place); **Synthetic** for all others — see Known Limitations |
| `stage` | TEXT | Group Stage / Round of 32 / Round of 16 / Quarterfinal / Semifinal / Third Place Playoff / Final | **Real** — matches actual tournament format (72 group + 32 knockout matches) |
| `venue_id` | INTEGER (FK → venues) | Host venue | Mixed (see above) |
| `team1_id`, `team2_id` | INTEGER (FK → teams) | The two competing teams | **Real** for the 4 anchor matches; **Synthetic** pairing/ordering elsewhere |
| `team1_score`, `team2_score` | INTEGER | Final score | **Real** for the 4 anchor matches (incl. the actual Final: Spain 1–0 Argentina); **Synthetic** elsewhere |
| `attendance` | INTEGER | Reported attendance | **Synthetic** — generated as 90–99.5% of venue capacity (Group Stage) or 95–99.9% (knockout), reflecting real-world near-sellout World Cup attendance patterns |

## `ticket_sales` (39,075 rows)

| Column | Type | Description | Source |
|---|---|---|---|
| `sale_id` | INTEGER (PK) | Unique transaction identifier | Generated |
| `match_id` | INTEGER (FK → matches) | Associated match | Generated |
| `price_tier` | TEXT | Category 1–4, Hospitality | **Synthetic** |
| `quantity` | INTEGER | Tickets in this transaction (1–6) | **Synthetic** |
| `unit_price_usd` | REAL | Price per ticket | **Synthetic** — generated independently of `channel` (see Known Limitations) |
| `channel` | TEXT | FIFA.com Ticketing Platform / Official Hospitality Package / Ticket Lottery Allocation / Verified Resale Platform | **Synthetic** — weighted distribution (55/25/10/10%) approximating typical primary-channel dominance |
| `buyer_country` | TEXT | Purchaser's country | **Synthetic** |

## `fan_survey` (2,858 rows)

| Column | Type | Description | Source |
|---|---|---|---|
| `survey_id` | INTEGER (PK) | Unique response identifier | Generated |
| `match_id` | INTEGER (FK → matches) | Associated match | Generated |
| `wait_time_minutes` | INTEGER | Reported entry wait time | **Synthetic** — normal range 10–45 min; deliberately elevated (90–240 min) for 2 matches flagged as reflecting real, publicly reported entry-queue incidents (Houston opener, MetLife Final) |
| `entry_experience_score` | INTEGER (1–5) | Entry experience rating | **Synthetic**, same incident logic as above |
| `satisfaction_score` | INTEGER (1–5) | Overall satisfaction rating | **Synthetic**, same incident logic as above |
| `would_recommend` | TEXT (Y/N) | Would recommend attending | **Synthetic** — derived from `satisfaction_score` ≥ 3 |

---

## Derived Fields (Power BI)

| Name | Type | Table/Location | Logic |
|---|---|---|---|
| `Demand Tier` | Calculated column | `matches` | Blockbuster (≥97% attendance/capacity), Standard (94–96.99%), Low-Interest (<94%) |
| `Stage Order` | Calculated column | `matches` | Maps `stage` to 1–7 for correct tournament-order sorting |
| `Total Revenue` | Measure | `ticket_sales` | `SUMX(ticket_sales, quantity * unit_price_usd)` |
| `Total Attendance` | Measure | `matches` | `SUM(matches[attendance])` |
| `Tickets Sold` | Measure | `ticket_sales` | `SUM(ticket_sales[quantity])` |
| `Avg Ticket Price` | Measure | `ticket_sales` | `DIVIDE([Total Revenue], [Tickets Sold])` — weighted, not a plain column average |
| `Occupancy Rate` | Measure | `matches` | `AVERAGEX(matches, DIVIDE(attendance, RELATED(venues[capacity])))` |
| `Avg Satisfaction Score` | Measure | `fan_survey` | `AVERAGE(fan_survey[satisfaction_score])` |
| `% Would Recommend` | Measure | `fan_survey` | Share of responses with `would_recommend = "Y"` |
| `Avg Revenue per Match` | Measure | `ticket_sales`/`matches` | `DIVIDE([Total Revenue], DISTINCTCOUNT(matches[match_id]))` |

---

## Known Limitations (summary — see [BRD](BRD.md) Section 5 for full detail)

- No transaction timestamp or session-level data exists in `ticket_sales` — any timing/load-related requirement in the BRD is a reasoned recommendation, not a measured finding.
- No transit, parking, or travel-time data exists anywhere in the schema.
- `channel` and `price_tier` were generated as independent variables — hospitality-channel sales don't show the price premium they would in reality.
- Within each knockout stage, all matches share a single `match_date` (e.g. all 16 Round of 32 matches show the same date) — a scheduling simplification, not a real tournament characteristic.
- Group draws beyond Groups A and D are illustrative, not the verified official draw.
