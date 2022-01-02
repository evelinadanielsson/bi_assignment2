CREATE TABLE Fact_InternetSales (
	SalesOrderLineNumber VARCHAR(50) NOT NULL,
    SalesOrderNumber VARCHAR(50) NOT NULL,
    OrderDateKey INT NOT NULL,
    OrderDate DATE NOT NULL,
    DueDateKey INT NOT NULL,
	DueDate DATE NOT NULL,
    ShipDateKey INT NOT NULL, 
    ShipDate DATE NOT NULL,
    ProductKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    ShipToLocationKey INT NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    ShipMethod VARCHAR(50) NOT NULL,
    OrderQty INT NOT NULL,
    UnitPrice DECIMAL(13,4) NOT NULL,
    OrderLineTotal DECIMAL(13,4) NOT NULL,
    OrderLineProfit DECIMAL(13,4) NOT NULL,
    OrderLineTaxAmt DECIMAL(13,4) NOT NULL,
    OrderLineShippingCost DECIMAL(13,4) NOT NULL,
    CONSTRAINT PK_FactInternetSales PRIMARY KEY (SalesOrderLineNumber),
	CONSTRAINT FK_Customer_FactInteretSales FOREIGN KEY (CustomerKey)  
    REFERENCES Dim_Customer(CustomerKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
	CONSTRAINT FK_ShipToLocation_FactInteretSales FOREIGN KEY (ShipToLocationKey)  
    REFERENCES Dim_Location(LocationKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
	CONSTRAINT FK_Product_FactInteretSales FOREIGN KEY (ProductKey)  
    REFERENCES Dim_Product(ProductKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
	CONSTRAINT FK_OrderDate_FactInteretSales FOREIGN KEY (OrderDateKey)  
    REFERENCES Dim_Date(DateKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
	CONSTRAINT FK_DueDate_FactInteretSales FOREIGN KEY (DueDateKey)  
    REFERENCES Dim_Date(DateKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
	CONSTRAINT FK_ShipDate_FactInteretSales FOREIGN KEY (ShipDateKey)  
    REFERENCES Dim_Date(DateKey)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE
);  
