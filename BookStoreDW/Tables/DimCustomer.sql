CREATE TABLE [dbo].[DimCustomer]
(
    [CustomerSK]  INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimCustomer PRIMARY KEY,
    [CustomerID]  INT               NOT NULL,
    [FirstName]   VARCHAR(200)      NULL,
    [LastName]    VARCHAR(200)      NULL,
    [Email]       VARCHAR(350)      NULL,
    [Address]     VARCHAR(400)      NULL,
    [City]        VARCHAR(100)      NULL,
    [State]       VARCHAR(100)      NULL,
    [ZipCode]     VARCHAR(20)       NULL,
    [Country]     VARCHAR(100)      NULL
);
GO