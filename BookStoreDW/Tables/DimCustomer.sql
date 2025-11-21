CREATE TABLE [dbo].[DimCustomer]
(
    [CustomerSK]     INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CustomerID]     INT               NOT NULL, -- Business key (OLTP)

    [FirstName]      VARCHAR(200)      NOT NULL,
    [LastName]       VARCHAR(200)      NOT NULL,
    [Email]          VARCHAR(350)      NULL,

    -- SCD Type 2 tracking
    [EffectiveFrom]  DATE              NOT NULL,
    [EffectiveTo]    DATE              NOT NULL,
    [IsCurrent]      BIT               NOT NULL
);
GO
