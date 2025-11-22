CREATE TABLE DimShippingMethod (
    ShippingMethodKey INT IDENTITY(1,1) PRIMARY KEY,
    MethodID          INT NOT NULL,
    MethodName        VARCHAR(100),
    StandardCost      DECIMAL(6,2)
);
GO