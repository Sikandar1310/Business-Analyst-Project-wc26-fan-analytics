# Data Model — WC26 Portfolio Dataset

```
teams (48 rows)
  team_id       INTEGER PK
  team_name     TEXT
  group_letter  TEXT

venues (16 rows)
  venue_id      INTEGER PK
  venue_name    TEXT
  city          TEXT
  country       TEXT
  capacity      INTEGER
  region        TEXT

matches (104 rows)
  match_id      INTEGER PK
  match_date    TEXT
  stage         TEXT      -- Group Stage / Round of 32 / Round of 16 / Quarterfinal / Semifinal / Third Place Playoff / Final
  venue_id      INTEGER FK -> venues.venue_id
  team1_id      INTEGER FK -> teams.team_id
  team2_id      INTEGER FK -> teams.team_id
  team1_score   INTEGER
  team2_score   INTEGER
  attendance    INTEGER

ticket_sales (39,075 rows)
  sale_id         INTEGER PK
  match_id        INTEGER FK -> matches.match_id
  price_tier      TEXT      -- Category 1-4, Hospitality
  quantity        INTEGER
  unit_price_usd  REAL
  channel         TEXT      -- FIFA.com / Official Hospitality / Ticket Lottery / Verified Resale
  buyer_country   TEXT

fan_survey (2,858 rows)
  survey_id               INTEGER PK
  match_id                INTEGER FK -> matches.match_id
  wait_time_minutes       INTEGER
  entry_experience_score  INTEGER  -- 1-5
  satisfaction_score      INTEGER  -- 1-5
  would_recommend         TEXT     -- Y/N
```

Relationships: `matches` is the hub table. `ticket_sales` and `fan_survey` both
join to it on `match_id`; `matches` joins out to `venues` and twice to `teams`
(once for each side). That double join to the same table (`teams`) via two
different foreign keys is a common real-world SQL pattern worth understanding,
not just executing.
