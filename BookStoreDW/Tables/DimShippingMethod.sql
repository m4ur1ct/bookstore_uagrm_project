CREATE TABLE [dbo].[DimShippingMethod]
(
    [ShippingMethodSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimShippingMethod PRIMARY KEY,
    [ShippingMethodID] INT              NOT NULL,
    [MethodName]       VARCHAR(200)     NULL,
    [Cost]             DECIMAL(10, 2)   NULL
);
GO