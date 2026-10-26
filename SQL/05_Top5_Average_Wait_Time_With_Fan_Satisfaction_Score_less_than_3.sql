SELECT
    m.match_id,
    v.venue_name,
    AVG(f.wait_time_minutes) AS avg_wait_time,
    AVG(f.satisfaction_score) AS avg_satisfaction
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id
JOIN fan_survey f ON m.match_id = f.match_id
GROUP BY
    m.match_id,
    v.venue_name
HAVING AVG(f.satisfaction_score) < 3
ORDER BY avg_wait_time DESC
LIMIT 5;
