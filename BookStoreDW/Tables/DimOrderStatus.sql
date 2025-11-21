CREATE TABLE [dbo].[DimOrderStatus]
(
    [OrderStatusSK]  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [StatusID]       INT               NOT NULL,  -- Business key (OLTP)
    [StatusValue]    VARCHAR(100)      NOT NULL
);
GO
