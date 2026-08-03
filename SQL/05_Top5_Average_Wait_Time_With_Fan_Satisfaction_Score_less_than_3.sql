SELECT
   matches.match_id,
    venue_name,
    AVG(wait_time_minutes) AS avg_wait_time,
    AVG(satisfaction_score) AS avg_satisfaction
FROM matches
JOIN venues
ON matches.venue_id = venues.venue_id
JOIN fan_survey
ON matches.match_id = fan_survey.match_id
GROUP BY matches.match_id
HAVING AVG(satisfaction_score) < 3
ORDER BY avg_wait_time DESC
LIMIT 5;