-- 1. Total number of loans
SELECT COUNT(*) AS Total_Loans FROM LoanData;

-- 2. Total number of defaults
SELECT COUNT(*) AS Total_Defaults 
FROM LoanData 
WHERE Repayment_Status = 'Defaulted';

-- 3. Default rate
SELECT 
  ROUND(
    (COUNT(CASE WHEN Repayment_Status = 'Defaulted' THEN 1 END) * 100.0) / COUNT(*), 
    2
  ) AS Default_Rate_Percent
FROM LoanData;

-- 4. Defaults by loan purpose
SELECT Loan_Purpose, COUNT(*) AS Defaults
FROM LoanData
WHERE Repayment_Status = 'Defaulted'
GROUP BY Loan_Purpose
ORDER BY Defaults DESC;

-- 5. Defaults by employment status
SELECT Employment_Status, COUNT(*) AS Defaults
FROM LoanData
WHERE Repayment_Status = 'Defaulted'
GROUP BY Employment_Status;

-- 6. Income bracket of defaulters
SELECT Monthly_Income, COUNT(*) AS Defaulters
FROM LoanData
WHERE Repayment_Status = 'Defaulted'
GROUP BY Monthly_Income
ORDER BY Monthly_Income;

-- 7. Monthly disbursement count
SELECT FORMAT(Loan_Approval_Date, 'yyyy-MM') AS Disbursement_Month, COUNT(*) AS Loan_Count
FROM LoanData
GROUP BY FORMAT(Loan_Approval_Date, 'yyyy-MM')
ORDER BY Disbursement_Month;

-- 8. Average loan amount by status
SELECT Repayment_Status, AVG(Loan_Amount) AS Avg_Loan
FROM LoanData
GROUP BY Repayment_Status;

-- 9. Loan count by gender
SELECT Gender, COUNT(*) AS Loan_Count
FROM LoanData
GROUP BY Gender;

-- 10. Default rate by gender
SELECT Gender,
  COUNT(*) AS Total,
  COUNT(CASE WHEN Repayment_Status = 'Defaulted' THEN 1 END) AS Defaults,
  ROUND(
    (COUNT(CASE WHEN Repayment_Status = 'Defaulted' THEN 1 END) * 100.0) / COUNT(*),
    2
  ) AS Default_Rate_Percent
FROM LoanData
GROUP BY Gender;

-- 11. Defaults by age group (assuming age group column or calculated logic)
SELECT Age, COUNT(*) AS Defaults
FROM LoanData
WHERE Repayment_Status = 'Defaulted'
GROUP BY Age;

-- 12. Top 5 loan purposes by total disbursement
SELECT TOP 5 Loan_Purpose, SUM(Loan_Amount) AS Total_Disbursed
FROM LoanData
GROUP BY Loan_Purpose
ORDER BY Total_Disbursed DESC;

-- 13. Repayment status by employment status
SELECT Employment_Status, Repayment_Status, COUNT(*) AS Count
FROM LoanData
GROUP BY Employment_Status, Repayment_Status
ORDER BY Employment_Status;

-- 14. Number of loans per month
SELECT FORMAT(Loan_Approval_Date, 'yyyy-MM') AS Month, COUNT(*) AS Loan_Issued
FROM LoanData
GROUP BY FORMAT(Loan_Approval_Date, 'yyyy-MM')
ORDER BY Month;

-- 15. Average loan amount per gender
SELECT Gender, AVG(Loan_Amount) AS Avg_Loan
FROM LoanData
GROUP BY Gender;

-- 16. Total disbursed per employment type
SELECT Employment_Status, SUM(Loan_Amount) AS Total_Disbursed
FROM LoanData
GROUP BY Employment_Status;

-- 17. Monthly defaults trend
SELECT FORMAT(Loan_Approval_Date, 'yyyy-MM') AS Month, COUNT(*) AS Defaults
FROM LoanData
WHERE Repayment_Status = 'Defaulted'
GROUP BY FORMAT(Loan_Approval_Date, 'yyyy-MM')
ORDER BY Month;

-- 18. Unique customers
SELECT COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM LoanData;

-- 19. Loan purpose count
SELECT Loan_Purpose, COUNT(*) AS Loan_Count
FROM LoanData
GROUP BY Loan_Purpose;

-- 20. Total loan amount disbursed
SELECT SUM(Loan_Amount) AS Total_Disbursed
FROM LoanData;
