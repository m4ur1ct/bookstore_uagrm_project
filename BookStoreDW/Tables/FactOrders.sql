CREATE TABLE [dbo].[FactOrders]
(
    [OrderID]            INT            NOT NULL PRIMARY KEY,

    [OrderDateKey]       INT            NOT NULL,

    [CustomerSK]         INT            NULL,
    [ShippingMethodSK]   INT            NULL,
    [OrderStatusSK]      INT            NULL,

    [TotalItems]         INT            NULL,
    [TotalAmount]        DECIMAL(10,2)  NULL
);
GO

ALTER TABLE FactOrders ADD CONSTRAINT FK_FactOrders_Date
    FOREIGN KEY (OrderDateKey) REFERENCES DimDate(DateKey);
GO

ALTER TABLE FactOrders ADD CONSTRAINT FK_FactOrders_Customer
    FOREIGN KEY (CustomerSK) REFERENCES DimCustomer(CustomerSK);
GO

ALTER TABLE FactOrders ADD CONSTRAINT FK_FactOrders_Shipping
    FOREIGN KEY (ShippingMethodSK) REFERENCES DimShippingMethod(ShippingMethodSK);
GO

ALTER TABLE FactOrders ADD CONSTRAINT FK_FactOrders_Status
    FOREIGN KEY (OrderStatusSK) REFERENCES DimOrderStatus(OrderStatusSK);
GO
