CREATE TABLE DimAddress (
    AddressKey     INT IDENTITY(1,1) PRIMARY KEY,
    AddressID      INT NOT NULL,
    StreetNumber   VARCHAR(10),
    StreetName     VARCHAR(200),
    City           VARCHAR(100),
    CountryName    VARCHAR(200)
);
GO
CREATE UNIQUE INDEX ux_DimAddress_AddressID ON DimAddress(AddressID);
GO
