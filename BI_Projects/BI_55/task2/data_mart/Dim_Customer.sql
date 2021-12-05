CREATE TABLE Dim_Customer (
    CustomerKey INT NOT NULL,
    AccountNumber VARCHAR(30) NOT NULL,
    FullName VARCHAR(150) NOT NULL,
    Gender VARCHAR(1),
	Age INT,
    CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerKey)
);  
