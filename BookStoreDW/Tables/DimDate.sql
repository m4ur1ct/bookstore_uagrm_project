
CREATE TABLE DimDate (
    DateKey        INT           NOT NULL PRIMARY KEY,  -- YYYYMMDD
    FullDate       DATE          NOT NULL,
    DayNumber      TINYINT       NOT NULL,
    MonthNumber    TINYINT       NOT NULL,
    MonthName      VARCHAR(20)   NOT NULL,
    YearNumber     SMALLINT      NOT NULL,
    QuarterNumber  TINYINT       NOT NULL,
    IsWeekend      BIT           NOT NULL
);
GO
