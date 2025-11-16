CREATE TABLE [dbo].[DimBook]
(
    [BookSK]          INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimBook PRIMARY KEY,

    [BookID]          INT               NOT NULL,      -- desde OLTP

    [Title]           VARCHAR(400)      NULL,
    [ISBN13]          VARCHAR(13)       NULL,
    [NumPages]        INT               NULL,
    [PublicationDate] DATE              NULL,

    -- Relación a otras dimensiones mediante SK (snowflake controlado)
    [PublisherSK]     INT               NULL,
    [LanguageSK]      INT               NULL,

    -- SCD si consideras cambios de título o editorial
    [EffectiveFrom]   DATE              NOT NULL,
    [EffectiveTo]     DATE              NOT NULL,
    [IsCurrent]       BIT               NOT NULL
);
GO

ALTER TABLE [dbo].[DimBook]
    ADD CONSTRAINT FK_DimBook_Publisher
        FOREIGN KEY (PublisherSK) REFERENCES [dbo].[DimPublisher](PublisherSK);
GO

ALTER TABLE [dbo].[DimBook]
    ADD CONSTRAINT FK_DimBook_Language
        FOREIGN KEY (LanguageSK) REFERENCES [dbo].[DimLanguage](LanguageSK);
GO
