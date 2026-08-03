WITH revenue_by_stage AS
(
SELECT stage, SUM(quantity*unit_price_usd) AS total_revenue_by_stage
FROM ticket_sales
JOIN matches ON ticket_sales.match_id=matches.match_id
GROUP BY matches.stage
),
satisfaction_by_stage AS (
    SELECT stage, AVG(satisfaction_score) AS avg_satisfaction
    FROM fan_survey
    JOIN matches ON fan_survey.match_id= matches.match_id
    GROUP BY matches.stage
)
SELECT matches.stage,SUM(attendance) AS total_attendance, COUNT(match_id) as Total_Matches,total_revenue_by_stage, avg_satisfaction
FROM matches
JOIN revenue_by_stage ON matches.stage=revenue_by_stage.stage
JOIN satisfaction_by_stage ON matches.stage=satisfaction_by_stage.stage
GROUP BY matches.stage
ORDER BY 
CASE matches.stage
WHEN 'Group Stage' THEN 1
WHEN 'Round of 32' THEN 2
WHEN 'Round of 16' THEN 3
WHEN 'Quarterfinal' THEN 4
WHEN 'Semifinal' THEN 5
WHEN 'Third Place Playoff' THEN 6
WHEN 'Final' THEN 7
ELSE 8
END ASC;




