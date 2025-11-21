CREATE TABLE [dbo].[DimShippingMethod]
(
    [ShippingMethodSK] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [MethodID]         INT               NOT NULL, -- Business key (OLTP)
    [MethodName]       VARCHAR(200)      NOT NULL,
    [Cost]             DECIMAL(10,2)     NULL,

    -- SCD2 tracking
    [EffectiveFrom]    DATE              NOT NULL,
    [EffectiveTo]      DATE              NOT NULL,
    [IsCurrent]        BIT               NOT NULL
);
GO