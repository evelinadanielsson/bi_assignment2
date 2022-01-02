CREATE TABLE TB_Person (
    PersonID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(1),
    Birthdate DATE,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID)
);  
