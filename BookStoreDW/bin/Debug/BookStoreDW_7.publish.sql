/*
Script de implementación para BookStoreDW

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BookStoreDW"
:setvar DefaultFilePrefix "BookStoreDW"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creando Tabla [dbo].[DimAddress]...';


GO
CREATE TABLE [dbo].[DimAddress] (
    [AddressKey]   INT           IDENTITY (1, 1) NOT NULL,
    [AddressID]    INT           NOT NULL,
    [StreetNumber] VARCHAR (10)  NULL,
    [StreetName]   VARCHAR (200) NULL,
    [City]         VARCHAR (100) NULL,
    [CountryName]  VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([AddressKey] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimAddress].[ux_DimAddress_AddressID]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_DimAddress_AddressID]
    ON [dbo].[DimAddress]([AddressID] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimAuthor]...';


GO
CREATE TABLE [dbo].[DimAuthor] (
    [AuthorKey]  INT           IDENTITY (1, 1) NOT NULL,
    [AuthorID]   INT           NOT NULL,
    [AuthorName] VARCHAR (400) NULL,
    PRIMARY KEY CLUSTERED ([AuthorKey] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimAuthor].[ux_DimAuthor_AuthorID]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_DimAuthor_AuthorID]
    ON [dbo].[DimAuthor]([AuthorID] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimBook]...';


GO
CREATE TABLE [dbo].[DimBook] (
    [BookKey]         INT           IDENTITY (1, 1) NOT NULL,
    [BookID]          INT           NOT NULL,
    [Title]           VARCHAR (400) NULL,
    [ISBN13]          VARCHAR (13)  NULL,
    [NumPages]        INT           NULL,
    [PublicationDate] DATE          NULL,
    [LanguageName]    VARCHAR (50)  NULL,
    [PublisherName]   VARCHAR (400) NULL,
    [LoadDate]        DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([BookKey] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimBook].[ux_DimBook_BookID]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ux_DimBook_BookID]
    ON [dbo].[DimBook]([BookID] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimCustomer]...';


GO
CREATE TABLE [dbo].[DimCustomer] (
    [CustomerKey]   INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]    INT           NOT NULL,
    [FirstName]     VARCHAR (200) NULL,
    [LastName]      VARCHAR (200) NULL,
    [Email]         VARCHAR (350) NULL,
    [EffectiveFrom] DATE          NOT NULL,
    [EffectiveTo]   DATE          NOT NULL,
    [IsCurrent]     BIT           NOT NULL,
    [LoadDate]      DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimCustomer].[ix_DimCustomer_BK]...';


GO
CREATE NONCLUSTERED INDEX [ix_DimCustomer_BK]
    ON [dbo].[DimCustomer]([CustomerID] ASC, [IsCurrent] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimDate]...';


GO
CREATE TABLE [dbo].[DimDate] (
    [DateKey]       INT          NOT NULL,
    [FullDate]      DATE         NOT NULL,
    [DayNumber]     TINYINT      NOT NULL,
    [MonthNumber]   TINYINT      NOT NULL,
    [MonthName]     VARCHAR (20) NOT NULL,
    [YearNumber]    SMALLINT     NOT NULL,
    [QuarterNumber] TINYINT      NOT NULL,
    [IsWeekend]     BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[DimShippingMethod]...';


GO
CREATE TABLE [dbo].[DimShippingMethod] (
    [ShippingMethodKey] INT            IDENTITY (1, 1) NOT NULL,
    [MethodID]          INT            NOT NULL,
    [MethodName]        VARCHAR (100)  NULL,
    [StandardCost]      DECIMAL (6, 2) NULL,
    PRIMARY KEY CLUSTERED ([ShippingMethodKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[FactSales]...';


GO
CREATE TABLE [dbo].[FactSales] (
    [SalesFactKey]      INT             IDENTITY (1, 1) NOT NULL,
    [DateKey]           INT             NOT NULL,
    [BookKey]           INT             NOT NULL,
    [CustomerKey]       INT             NOT NULL,
    [AddressKey]        INT             NOT NULL,
    [ShippingMethodKey] INT             NOT NULL,
    [OrderID]           INT             NOT NULL,
    [OrderLineID]       INT             NOT NULL,
    [Quantity]          INT             NOT NULL,
    [UnitPrice]         DECIMAL (10, 2) NOT NULL,
    [ExtendedPrice]     AS              (Quantity * UnitPrice) PERSISTED,
    [LoadDate]          DATETIME2 (7)   NOT NULL,
    PRIMARY KEY CLUSTERED ([SalesFactKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PackageConfig]...';


GO
CREATE TABLE [dbo].[PackageConfig] (
    [PackageID]      INT          IDENTITY (1, 1) NOT NULL,
    [TableName]      VARCHAR (50) NOT NULL,
    [LastRowVersion] BIGINT       NULL,
    CONSTRAINT [PK_PackageConfig] PRIMARY KEY CLUSTERED ([PackageID] ASC)
);


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[DimBook]...';


GO
ALTER TABLE [dbo].[DimBook]
    ADD DEFAULT SYSDATETIME() FOR [LoadDate];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[DimCustomer]...';


GO
ALTER TABLE [dbo].[DimCustomer]
    ADD DEFAULT SYSDATETIME() FOR [LoadDate];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales]
    ADD DEFAULT SYSDATETIME() FOR [LoadDate];


GO
PRINT N'Creando Clave externa restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD FOREIGN KEY ([BookKey]) REFERENCES [dbo].[DimBook] ([BookKey]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD FOREIGN KEY ([AddressKey]) REFERENCES [dbo].[DimAddress] ([AddressKey]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [dbo].[FactSales]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD FOREIGN KEY ([ShippingMethodKey]) REFERENCES [dbo].[DimShippingMethod] ([ShippingMethodKey]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.FactSales'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Comprobando restricción:' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Error de comprobación de restricción:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Error al comprobar las restricciones', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Actualización completada.';


GO
