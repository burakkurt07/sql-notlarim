SELECT (SUM(Income.amount) - SUM(Expense.amount)) AS net_income
FROM Income, Expense
WHERE YEAR(Income.date) = YEAR(CURRENT_DATE) AND MONTH(Income.date) = MONTH(CURRENT_DATE);
