SELECT
    v.venue_name,
    v.city,
    t1.team_name AS team1_name,
    t2.team_name AS team2_name,
    m.team1_score,
    m.team2_score
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id;
