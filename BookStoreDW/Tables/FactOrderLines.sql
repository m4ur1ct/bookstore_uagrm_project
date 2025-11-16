CREATE TABLE [dbo].[FactOrderLines]
(
    [OrderID]          INT             NOT NULL,  -- clave de negocio
    [LineID]           INT             NOT NULL,  -- clave de negocio de línea

    [OrderDateKey]     INT             NOT NULL,

    [CustomerSK]       INT             NOT NULL,
    [BookSK]           INT             NOT NULL,
    [ShippingMethodSK] INT             NULL,
    [OrderStatusSK]    INT             NULL,
    [AddressSK]        INT             NULL,

    [Quantity]         INT             NOT NULL,
    [UnitPrice]        DECIMAL(10, 2)  NOT NULL,
    [LineAmount]       AS ([Quantity] * [UnitPrice]) PERSISTED
);
GO

-- Granularidad: OrderID + LineID
ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT PK_FactOrderLines PRIMARY KEY (OrderID, LineID);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Date
        FOREIGN KEY (OrderDateKey) REFERENCES [dbo].[DimDate](DateKey);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Customer
        FOREIGN KEY (CustomerSK) REFERENCES [dbo].[DimCustomer](CustomerSK);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Book
        FOREIGN KEY (BookSK) REFERENCES [dbo].[DimBook](BookSK);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Shipping
        FOREIGN KEY (ShippingMethodSK) REFERENCES [dbo].[DimShippingMethod](ShippingMethodSK);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Status
        FOREIGN KEY (OrderStatusSK) REFERENCES [dbo].[DimOrderStatus](OrderStatusSK);
GO

ALTER TABLE [dbo].[FactOrderLines]
    ADD CONSTRAINT FK_FactOrderLines_Address
        FOREIGN KEY (AddressSK) REFERENCES [dbo].[DimAddress](AddressSK);
GO
