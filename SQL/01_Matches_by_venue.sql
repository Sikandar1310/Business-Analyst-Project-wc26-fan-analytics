SELECT
    m.match_date,
    m.stage,
    v.venue_name
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id;
