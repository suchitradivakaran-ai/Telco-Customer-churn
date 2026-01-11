SELECT
  CASE
    WHEN tenure BETWEEN 0 AND 6 THEN '0–6 months'
    WHEN tenure BETWEEN 7 AND 12 THEN '7–12 months'
    WHEN tenure BETWEEN 13 AND 24 THEN '13–24 months'
    ELSE '25+ months'
  END AS tenure_bucket,

  COUNT(*) AS total_customers,
  SUM(is_churned) AS churned_customers,
  ROUND(SUM(is_churned) * 100.0 / COUNT(*), 2) AS churn_rate_pct

FROM (
  SELECT
    tenure,
    CASE WHEN Churn IS TRUE THEN 1 ELSE 0 END AS is_churned
  FROM `hybrid-coyote-480606-r6.Telco_Churn.customers`
)

GROUP BY tenure_bucket
ORDER BY tenure_bucket;

