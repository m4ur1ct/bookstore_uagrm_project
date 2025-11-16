CREATE TABLE [dbo].[DimAuthor]
(
    [AuthorSK]    INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimAuthor PRIMARY KEY,

    [AuthorID]    INT               NOT NULL,  -- desde OLTP
    [AuthorName]  VARCHAR(400)      NULL
);
GO
