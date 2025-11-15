/****** Object:  Table [dbo].[cust_order]    Script Date: 9/11/2025 12:21:55 ******/
CREATE TABLE [dbo].[cust_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[customer_id] [int] NULL,
	[shipping_method_id] [int] NULL,
	[dest_address_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_custorder] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_addr] FOREIGN KEY([dest_address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_addr]
GO

ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_cust] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO

ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_cust]
GO

ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_ship] FOREIGN KEY([shipping_method_id])
REFERENCES [dbo].[shipping_method] ([method_id])
GO

ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_ship]
GO
