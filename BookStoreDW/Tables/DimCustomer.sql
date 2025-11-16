CREATE TABLE [dbo].[DimCustomer]
(
    [CustomerSK]   INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimCustomer PRIMARY KEY,

    -- Clave de negocio desde OLTP
    [CustomerID]   INT               NOT NULL,

    [FirstName]    VARCHAR(200)      NULL,
    [LastName]     VARCHAR(200)      NULL,
    [Email]        VARCHAR(350)      NULL,

    -- Atributos generales de cliente (no dirección específica)
    [CustomerType] VARCHAR(50)       NULL,   -- opcional si lo quieres usar

    -- Campos SCD Tipo 2
    [EffectiveFrom] DATE             NOT NULL,
    [EffectiveTo]   DATE             NOT NULL,
    [IsCurrent]     BIT              NOT NULL
);
GO
