CREATE TABLE FactSales (
    SalesFactKey       INT IDENTITY(1,1) PRIMARY KEY,

    -- Foreign Keys
    DateKey            INT NOT NULL,
    BookKey            INT NOT NULL,
    CustomerKey        INT NOT NULL,
    AddressKey         INT NOT NULL,
    ShippingMethodKey  INT NOT NULL,

    -- Degenerate Dimensions
    OrderID            INT NOT NULL,
    OrderLineID        INT NOT NULL,

    -- Measures
    Quantity           INT NOT NULL,
    UnitPrice          DECIMAL(10,2) NOT NULL,
    ExtendedPrice      AS (Quantity * UnitPrice) PERSISTED,

    LoadDate           DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (BookKey) REFERENCES DimBook(BookKey),
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (AddressKey) REFERENCES DimAddress(AddressKey),
    FOREIGN KEY (ShippingMethodKey)
        REFERENCES DimShippingMethod(ShippingMethodKey)
);
GO