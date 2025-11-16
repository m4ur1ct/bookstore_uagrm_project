CREATE TABLE [dbo].[DimDate]
(
    [DateKey]          INT         NOT NULL CONSTRAINT PK_DimDate PRIMARY KEY, 
    -- Recomendado: formato YYYYMMDD

    [FullDate]         DATE        NOT NULL,
    [Year]             SMALLINT    NOT NULL,
    [Month]            TINYINT     NOT NULL,
    [Day]              TINYINT     NOT NULL,
    [Quarter]          TINYINT     NOT NULL,
    [WeekOfYear]       TINYINT     NOT NULL,
    [CalendarQuarter]  TINYINT     NOT NULL,
    [CalendarSemester] TINYINT     NOT NULL
);
GO
