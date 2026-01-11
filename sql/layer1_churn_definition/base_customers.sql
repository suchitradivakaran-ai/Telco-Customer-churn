-- Layer 1: Base customer table with churn flag
-- Purpose: Clean core fields and define churn consistently

SELECT
  customerID,
  gender,
  SeniorCitizen,
  Partner,
  Dependents,

  -- Tenure
  tenure,

  -- Service details
  PhoneService,
  InternetService,
  Contract,
  PaperlessBilling,
  PaymentMethod,

  -- Charges
  SAFE_CAST(TotalCharges AS FLOAT64) AS TotalCharges,
  MonthlyCharges,

  -- Churn flag (BOOLEAN-safe)
  CASE
    WHEN Churn IS TRUE THEN 1
    ELSE 0
  END AS is_churned

FROM `hybrid-coyote-480606-r6.Telco_Churn.customers`;
