CREATE TABLE [dbo].[FactOrderStatusHistory]
(
    [OrderID]         INT           NOT NULL,
    [OrderStatusSK]   INT           NOT NULL,
    [StatusDateKey]   INT           NOT NULL
);
GO

ALTER TABLE FactOrderStatusHistory 
    ADD CONSTRAINT PK_FactOrderStatusHistory PRIMARY KEY (OrderID, OrderStatusSK, StatusDateKey);

ALTER TABLE FactOrderStatusHistory ADD CONSTRAINT FK_FactOrderStatusHistory_OrderStatus
    FOREIGN KEY (OrderStatusSK) REFERENCES DimOrderStatus(OrderStatusSK);

ALTER TABLE FactOrderStatusHistory ADD CONSTRAINT FK_FactOrderStatusHistory_Date
    FOREIGN KEY (StatusDateKey) REFERENCES DimDate(DateKey);
GO
