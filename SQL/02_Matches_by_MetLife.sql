SELECT
    m.match_date,
    m.stage,
    v.venue_name,
    v.city
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id
WHERE v.venue_name = 'MetLife Stadium';
