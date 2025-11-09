USE [Bookstore]
GO

/****** Object:  Table [dbo].[customer_address]    Script Date: 9/11/2025 12:23:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customer_address](
	[customer_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[status_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_custaddr] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_ca_addr] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_ca_addr]
GO

ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_ca_cust] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO

ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_ca_cust]
GO

ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_customer_address_addres_status_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[address_status] ([status_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_customer_address_addres_status_id]
GO
