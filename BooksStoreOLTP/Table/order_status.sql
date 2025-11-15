/****** Object:  Table [dbo].[order_status]    Script Date: 9/11/2025 12:23:58 ******/
CREATE TABLE [dbo].[order_status](
	[status_id] [int] NOT NULL,
	[status_value] [varchar](20) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_orderstatus] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
