CREATE TABLE [dbo].[DimBook]
(
    [BookSK]   INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimBook PRIMARY KEY,
    [BookID]   INT               NOT NULL,
    [Title]    VARCHAR(500)      NULL,
    [ISBN]     VARCHAR(30)       NULL,
    [PublisherID] INT            NULL,
    [LanguageID]  INT            NULL
);
GO
