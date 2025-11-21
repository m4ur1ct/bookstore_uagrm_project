CREATE TABLE [dbo].[FactOrders]
(
    [OrderID]          INT             NOT NULL PRIMARY KEY,   -- Business key

    -- Date dimension
    [OrderDateKey]     INT             NOT NULL,

    -- DIM references
    [CustomerSK]       INT             NOT NULL,
    [ShippingMethodSK] INT             NULL,
    [OrderStatusSK]    INT             NULL,
    [AddressSK]        INT             NULL,

    -- Aggregated metrics from order lines
    [TotalItems]       INT             NULL,   -- SUM(quantity)
    [DistinctBooks]    INT             NULL,   -- COUNT(DISTINCT BookID)
    [HasMultipleBooks] BIT             NULL    -- 1 = pedido contiene varios libros
);
GO

-- Foreign keys

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Date
        FOREIGN KEY (OrderDateKey) REFERENCES [dbo].[DimDate] (DateKey);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Customer
        FOREIGN KEY (CustomerSK) REFERENCES [dbo].[DimCustomer] (CustomerSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_ShippingMethod
        FOREIGN KEY (ShippingMethodSK) REFERENCES [dbo].[DimShippingMethod] (ShippingMethodSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Status
        FOREIGN KEY (OrderStatusSK) REFERENCES [dbo].[DimOrderStatus] (OrderStatusSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Address
        FOREIGN KEY (AddressSK) REFERENCES [dbo].[DimAddress] (AddressSK);
GO