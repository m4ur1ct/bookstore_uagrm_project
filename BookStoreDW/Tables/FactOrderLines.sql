CREATE TABLE [dbo].[FactOrderLines]
(
    [LineID]             INT             NOT NULL,   -- order_line.line_id
    [OrderID]            INT             NOT NULL,   -- cust_order.order_id

    [OrderDateKey]       INT             NOT NULL,

    [CustomerSK]         INT             NULL,
    [BookSK]             INT             NULL,
    [PublisherSK]        INT             NULL,
    [LanguageSK]         INT             NULL,
    [ShippingMethodSK]   INT             NULL,
    [OrderStatusSK]      INT             NULL,

    [Quantity]           INT             NULL,
    [Price]              DECIMAL(10, 2)  NULL,
    [LineAmount] AS (Quantity * Price)
);
GO

ALTER TABLE FactOrderLines ADD CONSTRAINT PK_FactOrderLines PRIMARY KEY (LineID);
GO

-- Foreign Keys
ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Date
    FOREIGN KEY (OrderDateKey) REFERENCES DimDate(DateKey);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Customer
    FOREIGN KEY (CustomerSK) REFERENCES DimCustomer(CustomerSK);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Book
    FOREIGN KEY (BookSK) REFERENCES DimBook(BookSK);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Publisher
    FOREIGN KEY (PublisherSK) REFERENCES DimPublisher(PublisherSK);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Language
    FOREIGN KEY (LanguageSK) REFERENCES DimLanguage(LanguageSK);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Shipping
    FOREIGN KEY (ShippingMethodSK) REFERENCES DimShippingMethod(ShippingMethodSK);

ALTER TABLE FactOrderLines ADD CONSTRAINT FK_FactOrderLines_Status
    FOREIGN KEY (OrderStatusSK) REFERENCES DimOrderStatus(OrderStatusSK);
GO