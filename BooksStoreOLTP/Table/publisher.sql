USE [Bookstore]
GO

/****** Object:  Table [dbo].[publisher]    Script Date: 9/11/2025 12:24:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[publisher](
	[publisher_id] [int] NOT NULL,
	[publisher_name] [varchar](400) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_publisher] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
