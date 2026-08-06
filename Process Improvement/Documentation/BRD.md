# Business Requirements Document (BRD)

**Project:** Stadium Entry & Security Process Improvement
**Purpose:** Process analysis and redesign recommendations for stadium entry/security operations, grounded in two real reported entry-delay incidents during the FIFA World Cup 2026.
**Related project:** Builds on the synthetic dataset and venue/match data from `FIFA World Cup 2026 Fan Ticket Demand & Attendance Analytics` (Project 1, same repository).

## Status

| Phase | Status |
|---|---|
| AS-IS Process Map | ✅ Complete |
| Root Cause Analysis | ✅ Complete (MetLife/Match 104) — Houston has no confirmed root cause; documented as an unexplained data anomaly (see below) |
| Gap Analysis | ✅ Complete — summary below, full detail in `Gap_Analysis.md` |
| TO-BE Process Map | ⬜ Not started |
| Risk Register | ⬜ Not started — will live in `Risk_Register.md` once complete |

This document will be updated as later phases are completed. It is **not** a finished deliverable yet.

## 1. Business Objective

Identify why stadium entry/security processes failed catastrophically at specific matches during the FIFA World Cup 2026, and produce evidence-based process redesign recommendations to reduce the risk of recurrence at future large-scale events at the same or similar venues.

## 2. Background — Two Reported Incidents

- **MetLife Stadium (Match 104, Final, Jul 19 2026):** Fans reported 2–4 hour entry delays. Well-corroborated across multiple independent outlets.
- **Houston / NRG Stadium:** A real, reported security-line/bottleneck incident occurred at Houston's actual World Cup opener (Germany v. Curaçao, Jun 14 2026). That match is **not** present in this project's synthetic dataset — NRG Stadium's synthetic schedule uses different fixtures entirely. Separately, the synthetic dataset independently shows a catastrophic wait-time/satisfaction anomaly at match_id=7 (USA v. Paraguay, Jun 21), with no real-world explanation on record for that specific match. These two facts are documented separately below and are **not** presented as causally linked.

## 3. Evidence Tiering — Incident Divergences

**MetLife (Match 104, Final):** Real, well-corroborated across multiple independent outlets. Structural, repeatable cause: security checks were conducted at both the outer perimeter and the primary turnstiles, effectively doubling queue bottlenecks, compounded by the vast majority of 80,000+ attendees arriving simultaneously via transit/rideshare near the American Dream complex [Yahoo Sports]. Layered on top, non-repeatable: the Final received a SEAR-1 federal security designation — the highest tier — driven specifically by President Trump's attendance, which required Secret Service screening and consistently produces longer lines at any event he attends [Yahoo Sports]. One outlet mentions "FIFA system glitches" as a minor contributing factor — single-sourced, noted but not treated as primary cause.

**Houston (NRG Stadium):** Two separate facts, not one incident.
1. The dataset's synthetic survey data shows an unexplained anomaly at match_id=7 (USA v. Paraguay, Jun 21) — 163 min avg wait vs. 25–33 min for every other NRG match, no corresponding real-world cause on record for this specific match.
2. Independently, Houston's actual World Cup opener (Germany v. Curaçao, Jun 14 — not present in this dataset) had a real, independently-reported entry bottleneck during a flood watch, with a social-media-sourced, venue-unverified claim of fans fainting in line [Houston Public Media; Yahoo Sports/Chron].

(2) is cited as venue-level precedent establishing that entry-bottleneck failure is a documented risk at this venue — it is not offered as the cause of (1). No causal link between the two is claimed.

## 4. Root Cause Analysis — MetLife Final (Match 104) Entry Delay

Three converging, independently-sourced causes:

**1. Risk-transfer design flaw (repeatable — priority TO-BE target).** The 2024 Copa América Final at Hard Rock Stadium (a shared 2026 World Cup venue) saw ticketless fans breach security gates, delaying the match 1hr 20min, causing injuries and arrests, and triggering a federal lawsuit [Axios; CNN]. Hard Rock's 2026 response — three enclosed perimeter checkpoints — became a cross-venue security standard: NJ Governor Murphy convened MetLife leadership directly into the resulting security review ("let's make sure it never happens here") [Yahoo Sports/AOL]. MetLife's Final used the same doubled-checkpoint posture (outer perimeter + turnstile). This is a control implemented to eliminate one risk (unticketed breach) that created a new risk (legitimate-ticket-holder bottleneck) as an unintended consequence — a named category of process design failure, not arbitrary poor planning.

**2. Transit infrastructure constraint (repeatable, but physical — not a process fix).** Secaucus Junction is the sole rail link between Manhattan and the Meadowlands. NJ Transit officially capped Final rail tickets at 40,000/matchday to stay within that link's throughput [NJ Transit, official] — covering only half of the 82,500-seat capacity. The remaining 40,000+ attendees necessarily arrived by bus or rideshare, concentrated into the same pre-kickoff window.

**3. Exceptional security escalation (non-repeatable — excluded from TO-BE baseline).** President Trump's confirmed attendance triggered a SEAR-1 federal security designation (the highest tier), placing the Secret Service in a lead security role — a pattern that consistently produces longer lines at any event he attends, but is not representative of a typical match.

**Implication for TO-BE redesign:** target cause (1), the checkpoint-design risk-transfer problem, as the primary fix — it's structural, repeatable, and within the venue's control. Treat (2) as a known hard constraint to design around, not something a process fix eliminates. Exclude (3) entirely from steady-state redesign assumptions.

## 5. Gap Analysis (Summary)

Three gaps identified, each tied directly to a root cause from Section 4 — no new causes are introduced. Full detail (AS-IS capability, linked root cause, required TO-BE capability, and priority rationale for each) is in `Gap_Analysis.md`.

- **G1 (High):** No credential carry-through between the outer perimeter and turnstile checkpoints, so every fan is fully re-screened twice. Fixes Cause 1 — the repeatable design flaw that's actually within the venue's control.
- **G2 (High):** No arrival-pacing mechanism for the ~40,000+ attendees not on NJ Transit's rail cap. Works around Cause 2's hard physical constraint rather than trying to eliminate it.
- **G3 (Medium):** No real-time anomaly detection against a venue's own historical baseline. Doesn't explain Houston's unconfirmed anomaly, but shortens time-to-detection for the next one — and independently converges with Project 1's FR-03 recommendation for the FIFA 2030 platform.

Cause 3 (SEAR-1/Presidential security escalation) deliberately produces **no gap entry** — it's non-repeatable by definition, and building standing capability around an exceptional event would contradict the evidence tiering already established in Section 4.

## 6. Risk Register (Summary)

*Pending.* This section, and the full `Risk_Register.md`, will be completed once the Risk Register phase is done.

## 7. Sources

- Axios — Hard Rock Stadium 2026 security redesign, Miami-Dade Sheriff's Office: https://www.axios.com/local/miami/2025/06/04/world-cup-hard-rock-security-copa-america
- CNN — Copa América 2024 federal class action lawsuit: https://www.cnn.com/2024/07/20/sport/copa-america-finals-match-lawsuit-ticketed-fans/index.html
- Yahoo Sports/AOL — Cross-venue security review, NJ Gov. Murphy/MetLife: https://www.aol.com/sports/copa-am-rica-chaos-club-024755508.html
- NJ Transit (official) — Regional Stadium Mobility Plan, 40,000 rail cap: https://www.njtransit.com/press-releases/fifa-world-cup-2026tm-new-york-new-jersey-host-committee-and-nj-transit-announce
- Yahoo Sports — "Why MetLife Stadium Was The Worst Possible Choice": https://ca.sports.yahoo.com/news/why-metlife-stadium-worst-possible-111500169.html
- Yahoo Sports — Trump visit / security lines: https://sports.yahoo.com/articles/trump-visit-triggers-long-security-172922136.html
- Yahoo Sports — Fans stuck in "total chaos": https://sports.yahoo.com/articles/fans-entering-metlife-stadium-stuck-180409362.html
- Houston Public Media — Houston opener rain/bottleneck: https://www.houstonpublicmedia.org/articles/news/sports/world-cup/2026/06/14/554487/world-cup-houston-weather-germany-curacao-nrg-stadium/
- Yahoo Sports/Chron — Houston fainting claim (social-media-sourced): https://sports.yahoo.com/articles/fans-describe-security-delays-houston-192347562.html
