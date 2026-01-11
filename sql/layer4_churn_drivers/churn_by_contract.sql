SELECT
  Contract,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn IS TRUE THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN Churn IS TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate_pct
FROM `hybrid-coyote-480606-r6.Telco_Churn.customers`
GROUP BY Contract
ORDER BY churn_rate_pct DESC;
