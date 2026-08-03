SELECT
    channel,
    SUM(quantity) AS tickets_sold,
    SUM(quantity * unit_price_usd) AS total_gross_revenue,
    ROUND(AVG(unit_price_usd), 2) AS average_ticket_price
FROM ticket_sales
GROUP BY channel
ORDER BY total_gross_revenue DESC;