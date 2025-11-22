CREATE TABLE DimCustomer (
    CustomerKey     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID      INT NOT NULL,   -- business key
    FirstName       VARCHAR(200),
    LastName        VARCHAR(200),
    Email           VARCHAR(350),
    -- SCD2:
    EffectiveFrom   DATE NOT NULL,
    EffectiveTo     DATE NOT NULL,
    IsCurrent       BIT  NOT NULL,
    LoadDate        DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO
CREATE INDEX ix_DimCustomer_BK ON DimCustomer(CustomerID, IsCurrent);
GO
