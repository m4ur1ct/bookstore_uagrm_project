USE [Bookstore]
GO

/****** Object:  Table [dbo].[country]    Script Date: 9/11/2025 12:21:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[country](
	[country_id] [int] NOT NULL,
	[country_name] [varchar](200) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
