------------------------------------------------------------------
-- Step 1. Create MySQL user

DROP USER IF EXISTS bi2021@localhost;
-- delete user if already exists

CREATE USER bi2021@localhost IDENTIFIED BY 'bi2021W!'; 
-- create a user to implement all the tasks of the assignment
FLUSH PRIVILEGES; 
-- we must flush the privileges each time we add or edit a user

GRANT ALL PRIVILEGES ON *.* TO bi2021@localhost;
FLUSH PRIVILEGES; 

------------------------------------------------------------------
-- Step 2. Drop if exists and re-create databases

DROP DATABASE IF EXISTS BI_Bikes_XX;
DROP DATABASE IF EXISTS BI_BikesDW_XX;
CREATE DATABASE IF NOT EXISTS BI_Bikes_XX;
CREATE DATABASE IF NOT EXISTS BI_BikesDW_XX; 
-- please make sure you replace XX with YOUR GROUP NUMBER


