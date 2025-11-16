CREATE TABLE [dbo].[FactOrders]
(
    -- Clave de negocio del pedido (degenerate dimension)
    [OrderID]          INT            NOT NULL CONSTRAINT PK_FactOrders PRIMARY KEY,

    [OrderDateKey]     INT            NOT NULL,  -- FK a DimDate

    [CustomerSK]       INT            NOT NULL,
    [ShippingMethodSK] INT            NULL,
    [OrderStatusSK]    INT            NULL,
    [AddressSK]        INT            NULL,      -- dirección de envío

    [TotalItems]       INT            NULL,
    [TotalAmount]      DECIMAL(10, 2) NULL
);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Date
        FOREIGN KEY (OrderDateKey) REFERENCES [dbo].[DimDate](DateKey);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Customer
        FOREIGN KEY (CustomerSK) REFERENCES [dbo].[DimCustomer](CustomerSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Shipping
        FOREIGN KEY (ShippingMethodSK) REFERENCES [dbo].[DimShippingMethod](ShippingMethodSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Status
        FOREIGN KEY (OrderStatusSK) REFERENCES [dbo].[DimOrderStatus](OrderStatusSK);
GO

ALTER TABLE [dbo].[FactOrders]
    ADD CONSTRAINT FK_FactOrders_Address
        FOREIGN KEY (AddressSK) REFERENCES [dbo].[DimAddress](AddressSK);
GO
