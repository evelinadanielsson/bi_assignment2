SELECT Country, CalendarYear as year, EnglishMonthName as Month_Name, sum(OrderLineShippingCost) Shipping_Costs
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
INNER JOIN BI_BikesDW_55.Dim_Date on BI_BikesDW_55.Fact_InternetSales.OrderDateKey = BI_BikesDW_55.Dim_Date.DateKey
WHERE Country = "United Kingdom" and ShipMethod = "Cargo International" and (OrderDate between '2020/01/01' and '2020/06/30')
GROUP BY CalendarYear, Month_Name;