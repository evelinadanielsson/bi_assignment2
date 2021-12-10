# 1st
SELECT ProductTopCategoryName as Product_Top_Category, sum(OrderLineProfit) as Profit
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Product on BI_BikesDW_55.Fact_InternetSales.ProductKey = BI_BikesDW_55.Dim_Product.ProductKey
WHERE year(OrderDate)=2021
GROUP BY Product_Top_Category
ORDER BY Profit desc;

# 2nd
SELECT Country, sum(OrderLineTotal) Revenue
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
WHERE year(OrderDate)=2019
GROUP BY Country
ORDER BY Revenue desc;

# 3rd
SELECT RANK() OVER(ORDER BY sum(OrderLineProfit) DESC) Customer_Rank, FullName as Customer_Name, sum(OrderLineProfit) Profit
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Customer on BI_BikesDW_55.Fact_InternetSales.CustomerKey = BI_BikesDW_55.Dim_Customer.CustomerKey
WHERE OrderDate between '2021/01/01' and '2021/06/30'
GROUP BY Customer_Name
ORDER BY Profit desc
LIMIT 10;

# 4th
SELECT Region, FullName as Customer_Name, sum(OrderQty) Quantity_Sold, RANK() OVER(ORDER BY sum(OrderQty) DESC) Customer_Rank
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Customer on BI_BikesDW_55.Fact_InternetSales.CustomerKey = BI_BikesDW_55.Dim_Customer.CustomerKey
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
WHERE Region = "Europe"
GROUP BY Customer_Name
ORDER BY Quantity_Sold desc
LIMIT 5;

# 5th
SELECT Country, CalendarYear as year, EnglishMonthName as Month_Name, sum(OrderLineShippingCost) Shipping_Costs
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
INNER JOIN BI_BikesDW_55.Dim_Date on BI_BikesDW_55.Fact_InternetSales.OrderDateKey = BI_BikesDW_55.Dim_Date.DateKey
WHERE Country = "United Kingdom" and ShipMethod = "Cargo International" and (OrderDate between '2020/01/01' and '2020/06/30')
GROUP BY CalendarYear, Month_Name;

# 6thTB_ProductSubCategory
SELECT Product_Top_Category, Product_Sub_Category, Product_Model, Quantity_Sold
FROM (SELECT Product_Top_Category, Product_Sub_Category, Product_Model, sum(Quantity_Sold) as Quantity_Sold,
		row_number() OVER (PARTITION BY Product_Top_Category Order by sum(Quantity_Sold) DESC) as rank_num
FROM (SELECT ProductTopCategoryName as Product_Top_Category, ProductSubCategoryName as Product_Sub_Category, ProductModelName as Product_Model, sum(OrderQty) as Quantity_Sold, OrderDate, ShipToLocationKey, ShipMethod
      FROM BI_BikesDW_55.Fact_InternetSales
      INNER JOIN BI_BikesDW_55.Dim_Product on BI_BikesDW_55.Fact_InternetSales.ProductKey = BI_BikesDW_55.Dim_Product.ProductKey
      INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Dim_Location.LocationKey = BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey
      WHERE Country = "United Kingdom" and ShipMethod = "Cargo International" and (OrderDate between '2020/01/01' and '2020/06/30')
      GROUP BY Product_Model, ProductTopCategoryName, ProductSubCategoryName, OrderDate, ShipToLocationKey, ShipMethod
      ORDER BY Quantity_Sold DESC) as T
GROUP BY Product_Model, Product_Top_Category, Product_Sub_Category) as H
WHERE rank_num <= 3;


# 7th 
SELECT Country, sum(OrderLineProfit) Profit
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
WHERE UnitPrice >= 1000 and UnitPrice <=2000
GROUP BY Country
LIMIT 3;

# 8th
SELECT CalendarYear as Calendar_Year, EnglishMonthName as Month, Country, sum(OrderLineTaxAmt) as Tax_Amount
FROM BI_BikesDW_55.Fact_InternetSales 
INNER JOIN BI_BikesDW_55.Dim_Location on BI_BikesDW_55.Fact_InternetSales.ShipToLocationKey = BI_BikesDW_55.Dim_Location.LocationKey
INNER JOIN BI_BikesDW_55.Dim_Date on BI_BikesDW_55.Fact_InternetSales.OrderDateKey = BI_BikesDW_55.Dim_Date.DateKey
WHERE (Country = "France" or Country = "Germany") and (OrderDate between '2021/01/01' and '2021/06/30')
GROUP BY Calendar_Year, Month, Country;
