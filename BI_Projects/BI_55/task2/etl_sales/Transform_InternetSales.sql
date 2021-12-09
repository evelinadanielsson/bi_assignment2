INSERT IGNORE INTO Fact_InternetSales (SalesOrderLineNumber, SalesOrderNumber, OrderDateKey, OrderDate, DueDateKey, DueDate, ShipDateKey, 
    ShipDate, ProductKey, CustomerKey, ShipToLocationKey, OrderStatus, ShipMethod, OrderQty, UnitPrice, OrderLineTotal,
    OrderLineProfit, OrderLineTaxAmt, OrderLineShippingCost)
SELECT 
    CONCAT('SOL', TB_SalesOrderDetail.SalesOrderID, '-', TB_SalesOrderDetail.SalesOrderDetailID) AS SalesOrderLineNumber,
    SalesOrderNumber AS SalesOrderNumber,
    YEAR(OrderDate) * 10000 + MONTH(OrderDate) * 100 + DAYOFMONTH(OrderDate) AS OrderDateKey,
    OrderDate AS OrderDate,
    YEAR(DueDate) * 10000 + MONTH(DueDate) * 100 + DAYOFMONTH(DueDate) AS DueDateKey,
    DueDate AS DueDate,
    YEAR(ShipDate) * 10000 + MONTH(ShipDate) * 100 + DAYOFMONTH(ShipDate) AS ShipDateKey,
    ShipDate AS ShipDate,
    TB_SalesOrderDetail.ProductID AS ProductKey,
    CustomerID AS CustomerKey,
    TB_Address.CountryID AS ShipToLocationKey,
    OrderStatusID AS OrderStatus,
    TB_ShipMethod.ShipMethodName AS ShipMethod,
    OrderQty AS OrderQty,
    UnitPrice AS UnitPrice,
    (OrderQty * UnitPrice) AS OrderLineTotal,
    ((OrderQty * UnitPrice) - OrderQty * StandardCost) AS OrderLineProfit,
    ((OrderQty * UnitPrice) * TaxRate) AS OrderLineTaxAmount,
    ShipSurcharge + ShipBase + (OrderQty * ShipRate * ShipCoeff) AS OrderLineShippingCost
FROM BI_Bikes_55.TB_SalesOrderDetail
INNER JOIN BI_Bikes_55.TB_SalesOrderHeader ON BI_Bikes_55.TB_SalesOrderHeader.SalesOrderID=BI_Bikes_55.TB_SalesOrderDetail.SalesOrderID
INNER JOIN BI_Bikes_55.TB_Address ON BI_Bikes_55.TB_Address.AddressID=BI_Bikes_55.TB_SalesOrderHeader.ShipToAddressID
INNER JOIN BI_Bikes_55.TB_Product ON BI_Bikes_55.TB_Product.ProductID=BI_Bikes_55.TB_SalesOrderDetail.ProductID
INNER JOIN BI_Bikes_55.TB_Country ON BI_Bikes_55.TB_Country.CountryID=BI_Bikes_55.TB_Address.CountryID
INNER JOIN BI_Bikes_55.TB_ShipMethod ON BI_Bikes_55.TB_SalesOrderHeader.ShipMethodID=BI_Bikes_55.TB_SalesOrderHeader.ShipMethodID
INNER JOIN BI_Bikes_55.TB_ProductSubCategory ON BI_Bikes_55.TB_Product.ProductSubCategoryID=BI_Bikes_55.TB_ProductSubCategory.ProductSubCategoryID
INNER JOIN BI_Bikes_55.TB_ProductTopCategory ON BI_Bikes_55.TB_ProductTopCategory.ProductTopCategoryID=BI_Bikes_55.TB_ProductSubCategory.ProductTopCategoryID
