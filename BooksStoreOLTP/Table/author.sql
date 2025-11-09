USE [Bookstore]
GO

/****** Object:  Table [dbo].[author]    Script Date: 9/11/2025 12:19:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[author](
	[author_id] [int] NOT NULL,
	[author_name] [varchar](400) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_author] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
