SELECT Country, sum(OrderLineProfit) Profit
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
WHERE UnitPrice >= 1000 and UnitPrice <=2000
GROUP BY Country
LIMIT 3;