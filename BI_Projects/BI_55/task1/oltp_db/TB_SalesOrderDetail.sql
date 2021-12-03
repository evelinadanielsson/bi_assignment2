CREATE TABLE TB_SalesOrderDetail (
    SalesOrderDetailID INT NOT NULL,
    SalesOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderQty INT NOT NULL,
    UnitPrice DECIMAL(13,4) NOT NULL,
    CONSTRAINT PK_SalesOrderDetail PRIMARY KEY (SalesOrderDetailID),
    CONSTRAINT FK_SalesOrder_SalesOrderDetail FOREIGN KEY (SalesOrderID)
    REFERENCES TB_SalesOrderHeader(SalesOrderID)
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
    CONSTRAINT FK_Product_SalesOrderDetail FOREIGN KEY (ProductID)
    REFERENCES TB_Product(ProductID)
    ON DELETE CASCADE  
    ON UPDATE CASCADE
);  
