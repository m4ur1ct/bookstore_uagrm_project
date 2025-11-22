CREATE TABLE DimBook (
    BookKey          INT IDENTITY(1,1) PRIMARY KEY,
    BookID           INT NOT NULL,
    Title            VARCHAR(400),
    ISBN13           VARCHAR(13),
    NumPages         INT,
    PublicationDate  DATE,
    LanguageName     VARCHAR(50),
    PublisherName    VARCHAR(400),
    LoadDate         DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO
CREATE UNIQUE INDEX ux_DimBook_BookID ON DimBook(BookID);
GO