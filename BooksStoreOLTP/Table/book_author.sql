USE [Bookstore]
GO

/****** Object:  Table [dbo].[book_author]    Script Date: 9/11/2025 12:20:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[book_author](
	[book_id] [int] NOT NULL,
	[author_id] [int] NOT NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_bookauthor] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [fk_ba_author] FOREIGN KEY([author_id])
REFERENCES [dbo].[author] ([author_id])
GO

ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [fk_ba_author]
GO

ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [fk_ba_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO

ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [fk_ba_book]
GO

