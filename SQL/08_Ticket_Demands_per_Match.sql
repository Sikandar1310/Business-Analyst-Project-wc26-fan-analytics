WITH tickets_per_match AS
(
    SELECT
        match_id,
        SUM(quantity) AS tickets_sold
    FROM ticket_sales
    GROUP BY match_id
)

SELECT
    m.match_id,
    v.venue_name,
    m.stage,
    t.tickets_sold,
    m.attendance,
    v.capacity,
    ROUND((m.attendance * 100.0 / v.capacity),2) AS attendance_pct,
    CASE
        WHEN (m.attendance * 100.0 / v.capacity) >= 97 THEN 'Blockbuster'
        WHEN (m.attendance * 100.0 / v.capacity) >= 94 THEN 'Standard'
        ELSE 'Low-Interest'
    END AS demand_tier
FROM matches m
JOIN venues v
ON m.venue_id = v.venue_id
JOIN tickets_per_match t
ON m.match_id = t.match_id
ORDER BY attendance_pct DESC;