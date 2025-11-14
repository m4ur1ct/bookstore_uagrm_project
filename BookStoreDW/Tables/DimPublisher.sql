CREATE TABLE [dbo].[DimPublisher]
(
    [PublisherSK]   INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimPublisher PRIMARY KEY,
    [PublisherID]   INT               NOT NULL,
    [PublisherName] VARCHAR(400)      NULL
);
GO