SELECT
    v.venue_name,
    v.city,
    COUNT(m.match_id) AS matches_played
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id
GROUP BY
    v.venue_name,
    v.city;
