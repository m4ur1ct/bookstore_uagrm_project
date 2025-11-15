CREATE TABLE [dbo].[PackageConfig]
(
    [PackageID]      INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PackageConfig PRIMARY KEY,
    [TableName]      VARCHAR(50) NOT NULL,
    [LastRowVersion] BIGINT      NULL
);
GO