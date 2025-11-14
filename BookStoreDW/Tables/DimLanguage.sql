CREATE TABLE [dbo].[DimLanguage]
(
    [LanguageSK]   INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimLanguage PRIMARY KEY,
    [LanguageID]   INT               NOT NULL,
    [LanguageCode] VARCHAR(8)        NULL,
    [LanguageName] VARCHAR(100)      NULL
);
GO