CREATE TABLE [dbo].[DimAddress]
(
    [AddressSK]      INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [AddressID]      INT               NOT NULL, -- Business key (OLTP)

    [StreetNumber]   VARCHAR(10)       NULL,
    [StreetName]     VARCHAR(200)      NULL,
    [City]           VARCHAR(100)      NULL,
    [CountryName]    VARCHAR(100)      NULL
);
GO
