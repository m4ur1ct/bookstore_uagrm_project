CREATE TABLE [dbo].[DimAddress]
(
    [AddressSK]     INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimAddress PRIMARY KEY,

    -- Clave de negocio desde OLTP
    [AddressID]     INT               NOT NULL,

    [StreetNumber]  VARCHAR(10)       NULL,
    [StreetName]    VARCHAR(200)      NULL,
    [City]          VARCHAR(100)      NULL,
    [CountryName]   VARCHAR(100)      NULL
);
GO
