SELECT Region, FullName as Customer_Name, sum(OrderQty) Quantity_Sold, RANK() OVER(ORDER BY sum(OrderQty) DESC) Customer_Rank
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Customer on BI_BikesDW_55.Fact_InternetSales.CustomerKey = BI_BikesDW_55.Dim_Customer.CustomerKey
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
WHERE Region = "Europe"
GROUP BY Customer_Name
ORDER BY Quantity_Sold desc
LIMIT 5;