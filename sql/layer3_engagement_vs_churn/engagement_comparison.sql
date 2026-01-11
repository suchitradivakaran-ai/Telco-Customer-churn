SELECT
  CASE
    WHEN Churn IS TRUE THEN 'Churned'
    ELSE 'Retained'
  END AS customer_status,

  COUNT(*) AS customers,
  ROUND(AVG(tenure), 1) AS avg_tenure_months,
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
  ROUND(AVG(SAFE_CAST(TotalCharges AS FLOAT64)), 2) AS avg_total_charges

FROM `hybrid-coyote-480606-r6.Telco_Churn.customers`
GROUP BY customer_status;
