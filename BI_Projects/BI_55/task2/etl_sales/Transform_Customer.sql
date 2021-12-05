INSERT INTO Dim_Customer (CustomerKey, AccountNumber, Fullname, Gender, Age)
SELECT CustomerID, AccountNumber, CONCAT(FirstName,' ',MiddleName,' ',LastName), Gender, DATEDIFF('2021-09-30', BirthDate)/365
FROM TB_Customer
INNER JOIN TB_Person ON TB_Customer.PersonID=TB_Person.PersonID;