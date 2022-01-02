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