SELECT
    v.venue_name,
    v.capacity,
    v.region,
    ROUND(AVG(m.attendance),0) AS avg_attendance,
    ROUND(AVG(m.attendance * 100.0 / v.capacity),2) AS avg_attendance_pct
FROM matches m
JOIN venues v
ON m.venue_id = v.venue_id
GROUP BY
    v.venue_name,
    v.capacity,
    v.region
ORDER BY
    v.region,
    avg_attendance_pct DESC;