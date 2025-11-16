CREATE TABLE [dbo].[DimShippingMethod]
(
    [ShippingMethodSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimShippingMethod PRIMARY KEY,

    [MethodID]         INT               NOT NULL,  -- desde OLTP
    [MethodName]       VARCHAR(100)      NULL,
    [Cost]             DECIMAL(10, 2)    NULL,

    -- SCD si la tarifa cambia en el tiempo
    [EffectiveFrom]    DATE              NOT NULL,
    [EffectiveTo]      DATE              NOT NULL,
    [IsCurrent]        BIT               NOT NULL
);
GO
