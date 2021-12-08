INSERT INTO Dim_Date (DateKey, FullDataAlternateKey, DayNumberOfWeek, EnglishDayNameOfWeek, 
DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear, EnglishMonthName, MonthNumberOfYear, CalendarQuarter, CalendarYear)
SELECT 
    YEAR(OrderDate) * 10000 + MONTH(OrderDate) * 100 + DAYOFMONTH(OrderDate) AS DateKey,
    OrderDate AS FullDataAlternateKey,
    DAYOFWEEK(OrderDate) AS DayNumberOfWeek,
    DAYNAME(OrderDate) AS EnglishDayNameOfWeek,
    DAYOFMONTH(OrderDate) AS DayNumberOfMonth,
    DAYOFYEAR(OrderDate) AS DayNumberOfYear,
    WEEK(OrderDate) AS WeekNumberOfYear,
    MONTHNAME(OrderDate) AS EnglishMonthName,
    MONTH(OrderDate) AS MonthNumberOfYear,
    QUARTER(OrderDate) AS CalendarQuarter,
    YEAR(OrderDate) AS CalendarYear
FROM BI_Bikes_55.TB_SalesOrderHeader
UNION SELECT
    YEAR(DueDate) * 10000 + MONTH(DueDate) * 100 + DAYOFMONTH(DueDate) AS DateKey,
    DueDate AS FullDataAlternateKey,
    DAYOFWEEK(DueDate) AS DayNumberOfWeek,
    DAYNAME(DueDate) AS EnglishDayNameOfWeek,
    DAYOFMONTH(DueDate) AS DayNumberOfMonth,
    DAYOFYEAR(DueDate) AS DayNumberOfYear,
    WEEK(DueDate) AS WeekNumberOfYear,
    MONTHNAME(DueDate) AS EnglishMonthName,
    MONTH(DueDate) AS MonthNumberOfYear,
    QUARTER(DueDate) AS CalendarQuarter,
    YEAR(DueDate) AS CalendarYear
FROM BI_Bikes_55.TB_SalesOrderHeader 
UNION SELECT 
    YEAR(ShipDate) * 10000 + MONTH(DueDate) * 100 + DAYOFMONTH(DueDate) AS DateKey,
    ShipDate AS FullDataAlternateKey,
    DAYOFWEEK(ShipDate) AS DayNumberOfWeek,
    DAYNAME(ShipDate) AS EnglishDayNameOfWeek,
    DAYOFMONTH(ShipDate) AS DayNumberOfMonth,
    DAYOFYEAR(ShipDate) AS DayNumberOfYear,
    WEEK(ShipDate) AS WeekNumberOfYear,
    MONTHNAME(ShipDate) AS EnglishMonthName,
    MONTH(ShipDate) AS MonthNumberOfYear,
    QUARTER(ShipDate) AS CalendarQuarter,
    YEAR(ShipDate) AS CalendarYear
FROM BI_Bikes_55.TB_SalesOrderHeader WHERE ShipDate IS NOT NULL
