INSERT INTO Dim_Location (LocationKey, Country, Region, TaxRate, ShipCoeff)
SELECT CountryID, Country, Region, TaxRate, ShipCoeff
FROM BI_Bikes_55.TB_Country;