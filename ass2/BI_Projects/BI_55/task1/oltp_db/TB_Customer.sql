CREATE TABLE TB_Customer (
    CustomerID INT NOT NULL,
    PersonID INT NOT NULL,
    AccountNumber VARCHAR(30) NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),
    CONSTRAINT FK_Person_Customer FOREIGN KEY (PersonID)  
    REFERENCES TB_Person(PersonID)  
    ON DELETE CASCADE  
    ON UPDATE CASCADE 
);  
