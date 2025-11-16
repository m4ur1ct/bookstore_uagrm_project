CREATE TABLE [dbo].[FactOrderStatusHistory]
(
    [OrderID]        INT           NOT NULL, -- clave de negocio del pedido
    [OrderStatusSK]  INT           NOT NULL, -- estado al que pasó
    [StatusDateKey]  INT           NOT NULL, -- fecha del cambio

    CONSTRAINT PK_FactOrderStatusHistory PRIMARY KEY (OrderID, OrderStatusSK, StatusDateKey)
);
GO

ALTER TABLE [dbo].[FactOrderStatusHistory]
    ADD CONSTRAINT FK_FactOrderStatusHistory_OrderStatus
        FOREIGN KEY (OrderStatusSK) REFERENCES [dbo].[DimOrderStatus](OrderStatusSK);
GO

ALTER TABLE [dbo].[FactOrderStatusHistory]
    ADD CONSTRAINT FK_FactOrderStatusHistory_Date
        FOREIGN KEY (StatusDateKey) REFERENCES [dbo].[DimDate](DateKey);
GO
