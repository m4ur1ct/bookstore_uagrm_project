USE [Bookstore]
GO

/****** Object:  Table [dbo].[order_line]    Script Date: 9/11/2025 12:23:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order_line](
	[line_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[book_id] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_orderline] PRIMARY KEY CLUSTERED 
(
	[line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO

ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_book]
GO

ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[cust_order] ([order_id])
GO

ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_order]
GO
