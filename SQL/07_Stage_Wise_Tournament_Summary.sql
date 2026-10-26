WITH revenue_by_stage AS
(
    SELECT
        m.stage,
        SUM(t.quantity * t.unit_price_usd) AS total_revenue_by_stage
    FROM ticket_sales t
    JOIN matches m ON t.match_id = m.match_id
    GROUP BY m.stage
),
satisfaction_by_stage AS
(
    SELECT
        m.stage,
        AVG(f.satisfaction_score) AS avg_satisfaction
    FROM fan_survey f
    JOIN matches m ON f.match_id = m.match_id
    GROUP BY m.stage
)

SELECT
    m.stage,
    SUM(m.attendance) AS total_attendance,
    COUNT(m.match_id) AS total_matches,
    r.total_revenue_by_stage,
    s.avg_satisfaction
FROM matches m
JOIN revenue_by_stage r ON m.stage = r.stage
JOIN satisfaction_by_stage s ON m.stage = s.stage
GROUP BY
    m.stage,
    r.total_revenue_by_stage,
    s.avg_satisfaction
ORDER BY
    CASE m.stage
        WHEN 'Group Stage' THEN 1
        WHEN 'Round of 32' THEN 2
        WHEN 'Round of 16' THEN 3
        WHEN 'Quarterfinal' THEN 4
        WHEN 'Semifinal' THEN 5
        WHEN 'Third Place Playoff' THEN 6
        WHEN 'Final' THEN 7
        ELSE 8
    END;
