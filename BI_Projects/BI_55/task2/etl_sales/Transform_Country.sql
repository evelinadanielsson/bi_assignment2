INSERT INTO Dim_Location (LocationKey, Country, Region, TaxRate, ShipCoeff)
SELECT CountryID, Country, Region, TaxRate, ShipCoeff
FROM TB_Country;