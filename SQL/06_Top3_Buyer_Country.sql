WITH revenue_by_country AS
(
SELECT
buyer_country,
SUM(quantity*unit_price_usd) AS total_revenue
FROM ticket_sales
GROUP BY buyer_country
)
SELECT
buyer_country,
total_revenue
FROM  revenue_by_country
Order BY total_revenue DESC
LIMIT 3;