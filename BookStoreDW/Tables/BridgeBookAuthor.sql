CREATE TABLE [dbo].[BridgeBookAuthor]
(
    [BookSK]   INT NOT NULL,
    [AuthorSK] INT NOT NULL,

    CONSTRAINT PK_BridgeBookAuthor PRIMARY KEY (BookSK, AuthorSK)
);
GO

ALTER TABLE [dbo].[BridgeBookAuthor]
    ADD CONSTRAINT FK_BridgeBookAuthor_Book
        FOREIGN KEY (BookSK) REFERENCES [dbo].[DimBook](BookSK);
GO

ALTER TABLE [dbo].[BridgeBookAuthor]
    ADD CONSTRAINT FK_BridgeBookAuthor_Author
        FOREIGN KEY (AuthorSK) REFERENCES [dbo].[DimAuthor](AuthorSK);
GO
