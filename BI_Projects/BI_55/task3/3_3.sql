SELECT RANK() OVER(ORDER BY sum(OrderLineProfit) DESC) Customer_Rank, FullName as Customer_Name, sum(OrderLineProfit) Profit
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Customer on BI_BikesDW_55.Fact_InternetSales.CustomerKey = BI_BikesDW_55.Dim_Customer.CustomerKey
WHERE OrderDate between '2021/01/01' and '2021/06/30'
GROUP BY Customer_Name
ORDER BY Profit desc
LIMIT 10;
