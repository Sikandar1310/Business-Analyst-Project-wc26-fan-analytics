SELECT v.venue_name,
       ROUND(AVG(f.wait_time_minutes),1) AS avg_wait,
       ROUND(AVG(f.entry_experience_score),2) AS avg_entry_score,
       ROUND(AVG(f.satisfaction_score),2) AS avg_satisfaction
FROM matches m
JOIN venues v ON m.venue_id = v.venue_id
JOIN fan_survey f ON m.match_id = f.match_id
GROUP BY v.venue_name
ORDER BY avg_wait DESC;