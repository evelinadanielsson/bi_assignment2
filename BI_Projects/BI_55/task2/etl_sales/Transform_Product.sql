INSERT INTO Dim_Product (ProductKey, ProductName, ProductModelName, ProductSubCategoryName, 
ProductTopCategoryName, StandardCost, ListPrice, StartDate, EndDate, ProductStatus)
SELECT ProductID, ProductName, ProductModelName, TB_ProductSubCategory.Name, TB_ProductTopCategory.Name,
StandardCost, ListPrice, SellStartDate, SellEndDate, 
        CASE 
        WHEN SellEndDate IS NULL OR SellEndDate>'2021-09-30' THEN 'Current'
        ELSE 'Discontinued' END
FROM TB_Product
INNER JOIN TB_ProductModel ON TB_Product.ProductModelID=TB_ProductModel.ProductModelID
INNER JOIN TB_ProductSubCategory ON TB_Product.ProductSubCategoryID=TB_ProductSubCategory.ProductSubCategoryID
INNER JOIN TB_ProductTopCategory ON TB_ProductSubCategory.ProductTopCategoryID=TB_ProductTopCategory.ProductTopCategoryID;
