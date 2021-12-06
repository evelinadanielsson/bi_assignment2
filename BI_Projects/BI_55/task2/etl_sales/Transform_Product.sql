INSERT INTO Dim_Product (ProductKey, ProductName, ProductModelName, ProductSubCategoryName, 
ProductTopCategoryName, StandardCost, ListPrice, StartDate, EndDate, ProductStatus)
SELECT ProductID, ProductName, ProductModelName, TB_ProductSubCategory.Name, TB_ProductTopCategory.Name,
StandardCost, ListPrice, SellStartDate, SellEndDate, 
        CASE 
        WHEN SellEndDate IS NULL OR SellEndDate>'2021-09-30' THEN 'Current'
        ELSE 'Discontinued' END
FROM BI_Bikes_55.TB_Product
INNER JOIN BI_Bikes_55.TB_ProductModel ON BI_Bikes_55.TB_Product.ProductModelID=BI_Bikes_55.TB_ProductModel.ProductModelID
INNER JOIN BI_Bikes_55.TB_ProductSubCategory ON BI_Bikes_55.TB_Product.ProductSubCategoryID=BI_Bikes_55.TB_ProductSubCategory.ProductSubCategoryID
INNER JOIN BI_Bikes_55.TB_ProductTopCategory ON BI_Bikes_55.TB_ProductSubCategory.ProductTopCategoryID=BI_Bikes_55.TB_ProductTopCategory.ProductTopCategoryID;
