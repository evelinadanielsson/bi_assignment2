INSERT INTO Dim_Customer (CustomerKey, AccountNumber, Fullname, Gender, Age)
SELECT CustomerID, AccountNumber, CONCAT(FirstName,' ',MiddleName,' ',LastName), Gender, DATEDIFF('2021-09-30', BirthDate)/365
FROM BI_Bikes_55.TB_Customer
INNER JOIN BI_Bikes_55.TB_Person ON BI_Bikes_55.TB_Customer.PersonID=BI_Bikes_55.TB_Person.PersonID;