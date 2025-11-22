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
/*
Se está quitando la columna [dbo].[DimCustomer].[CustomerType]; puede que se pierdan datos.

La columna FirstName de la tabla [dbo].[DimCustomer] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna LastName de la tabla [dbo].[DimCustomer] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[DimCustomer])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
La columna StatusValue de la tabla [dbo].[DimOrderStatus] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[DimOrderStatus])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
La columna MethodName de la tabla [dbo].[DimShippingMethod] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[DimShippingMethod])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Se está quitando la columna [dbo].[FactOrders].[TotalAmount]; puede que se pierdan datos.
*/

IF EXISTS (select top 1 1 from [dbo].[FactOrders])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderLines_Address]...';


GO
ALTER TABLE [dbo].[FactOrderLines] DROP CONSTRAINT [FK_FactOrderLines_Address];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrders_Address]...';


GO
ALTER TABLE [dbo].[FactOrders] DROP CONSTRAINT [FK_FactOrders_Address];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderLines_Customer]...';


GO
ALTER TABLE [dbo].[FactOrderLines] DROP CONSTRAINT [FK_FactOrderLines_Customer];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrders_Customer]...';


GO
ALTER TABLE [dbo].[FactOrders] DROP CONSTRAINT [FK_FactOrders_Customer];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderStatusHistory_Date]...';


GO
ALTER TABLE [dbo].[FactOrderStatusHistory] DROP CONSTRAINT [FK_FactOrderStatusHistory_Date];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderLines_Date]...';


GO
ALTER TABLE [dbo].[FactOrderLines] DROP CONSTRAINT [FK_FactOrderLines_Date];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrders_Date]...';


GO
ALTER TABLE [dbo].[FactOrders] DROP CONSTRAINT [FK_FactOrders_Date];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderStatusHistory_OrderStatus]...';


GO
ALTER TABLE [dbo].[FactOrderStatusHistory] DROP CONSTRAINT [FK_FactOrderStatusHistory_OrderStatus];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderLines_Status]...';


GO
ALTER TABLE [dbo].[FactOrderLines] DROP CONSTRAINT [FK_FactOrderLines_Status];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrders_Status]...';


GO
ALTER TABLE [dbo].[FactOrders] DROP CONSTRAINT [FK_FactOrders_Status];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrderLines_Shipping]...';


GO
ALTER TABLE [dbo].[FactOrderLines] DROP CONSTRAINT [FK_FactOrderLines_Shipping];


GO
PRINT N'Quitando Clave externa [dbo].[FK_FactOrders_Shipping]...';


GO
ALTER TABLE [dbo].[FactOrders] DROP CONSTRAINT [FK_FactOrders_Shipping];


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[DimCustomer]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DimCustomer] (
    [CustomerSK]    INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]    INT           NOT NULL,
    [FirstName]     VARCHAR (200) NOT NULL,
    [LastName]      VARCHAR (200) NOT NULL,
    [Email]         VARCHAR (350) NULL,
    [EffectiveFrom] DATE          NOT NULL,
    [EffectiveTo]   DATE          NOT NULL,
    [IsCurrent]     BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerSK] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DimCustomer])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimCustomer] ON;
        INSERT INTO [dbo].[tmp_ms_xx_DimCustomer] ([CustomerSK], [CustomerID], [FirstName], [LastName], [Email], [EffectiveFrom], [EffectiveTo], [IsCurrent])
        SELECT   [CustomerSK],
                 [CustomerID],
                 [FirstName],
                 [LastName],
                 [Email],
                 [EffectiveFrom],
                 [EffectiveTo],
                 [IsCurrent]
        FROM     [dbo].[DimCustomer]
        ORDER BY [CustomerSK] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimCustomer] OFF;
    END

DROP TABLE [dbo].[DimCustomer];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DimCustomer]', N'DimCustomer';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[DimOrderStatus]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DimOrderStatus] (
    [OrderStatusSK] INT           IDENTITY (1, 1) NOT NULL,
    [StatusID]      INT           NOT NULL,
    [StatusValue]   VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderStatusSK] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DimOrderStatus])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimOrderStatus] ON;
        INSERT INTO [dbo].[tmp_ms_xx_DimOrderStatus] ([OrderStatusSK], [StatusID], [StatusValue])
        SELECT   [OrderStatusSK],
                 [StatusID],
                 [StatusValue]
        FROM     [dbo].[DimOrderStatus]
        ORDER BY [OrderStatusSK] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimOrderStatus] OFF;
    END

DROP TABLE [dbo].[DimOrderStatus];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DimOrderStatus]', N'DimOrderStatus';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[DimShippingMethod]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DimShippingMethod] (
    [ShippingMethodSK] INT             IDENTITY (1, 1) NOT NULL,
    [MethodID]         INT             NOT NULL,
    [MethodName]       VARCHAR (200)   NOT NULL,
    [Cost]             DECIMAL (10, 2) NULL,
    [EffectiveFrom]    DATE            NOT NULL,
    [EffectiveTo]      DATE            NOT NULL,
    [IsCurrent]        BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([ShippingMethodSK] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DimShippingMethod])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimShippingMethod] ON;
        INSERT INTO [dbo].[tmp_ms_xx_DimShippingMethod] ([ShippingMethodSK], [MethodID], [MethodName], [Cost], [EffectiveFrom], [EffectiveTo], [IsCurrent])
        SELECT   [ShippingMethodSK],
                 [MethodID],
                 [MethodName],
                 [Cost],
                 [EffectiveFrom],
                 [EffectiveTo],
                 [IsCurrent]
        FROM     [dbo].[DimShippingMethod]
        ORDER BY [ShippingMethodSK] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimShippingMethod] OFF;
    END

DROP TABLE [dbo].[DimShippingMethod];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DimShippingMethod]', N'DimShippingMethod';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[FactOrders]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_FactOrders] (
    [OrderID]          INT NOT NULL,
    [OrderDateKey]     INT NOT NULL,
    [CustomerSK]       INT NOT NULL,
    [ShippingMethodSK] INT NULL,
    [OrderStatusSK]    INT NULL,
    [AddressSK]        INT NULL,
    [TotalItems]       INT NULL,
    [DistinctBooks]    INT NULL,
    [HasMultipleBooks] BIT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[FactOrders])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_FactOrders] ([OrderID], [OrderDateKey], [CustomerSK], [ShippingMethodSK], [OrderStatusSK], [AddressSK], [TotalItems])
        SELECT   [OrderID],
                 [OrderDateKey],
                 [CustomerSK],
                 [ShippingMethodSK],
                 [OrderStatusSK],
                 [AddressSK],
                 [TotalItems]
        FROM     [dbo].[FactOrders]
        ORDER BY [OrderID] ASC;
    END

DROP TABLE [dbo].[FactOrders];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_FactOrders]', N'FactOrders';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[DimAddress]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DimAddress] (
    [AddressSK]    INT           IDENTITY (1, 1) NOT NULL,
    [AddressID]    INT           NOT NULL,
    [StreetNumber] VARCHAR (10)  NULL,
    [StreetName]   VARCHAR (200) NULL,
    [City]         VARCHAR (100) NULL,
    [CountryName]  VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([AddressSK] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DimAddress])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimAddress] ON;
        INSERT INTO [dbo].[tmp_ms_xx_DimAddress] ([AddressSK], [AddressID], [StreetNumber], [StreetName], [City], [CountryName])
        SELECT   [AddressSK],
                 [AddressID],
                 [StreetNumber],
                 [StreetName],
                 [City],
                 [CountryName]
        FROM     [dbo].[DimAddress]
        ORDER BY [AddressSK] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DimAddress] OFF;
    END

DROP TABLE [dbo].[DimAddress];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DimAddress]', N'DimAddress';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[DimDate]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DimDate] (
    [DateKey]          INT      NOT NULL,
    [FullDate]         DATE     NOT NULL,
    [Year]             SMALLINT NOT NULL,
    [Month]            TINYINT  NOT NULL,
    [Day]              TINYINT  NOT NULL,
    [Quarter]          TINYINT  NOT NULL,
    [WeekOfYear]       TINYINT  NOT NULL,
    [CalendarQuarter]  TINYINT  NOT NULL,
    [CalendarSemester] TINYINT  NOT NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DimDate])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_DimDate] ([DateKey], [FullDate], [Year], [Month], [Day], [Quarter], [WeekOfYear], [CalendarQuarter], [CalendarSemester])
        SELECT   [DateKey],
                 [FullDate],
                 [Year],
                 [Month],
                 [Day],
                 [Quarter],
                 [WeekOfYear],
                 [CalendarQuarter],
                 [CalendarSemester]
        FROM     [dbo].[DimDate]
        ORDER BY [DateKey] ASC;
    END

DROP TABLE [dbo].[DimDate];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DimDate]', N'DimDate';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creando Clave externa [dbo].[FK_FactOrders_Address]...';


GO
ALTER TABLE [dbo].[FactOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_FactOrders_Address] FOREIGN KEY ([AddressSK]) REFERENCES [dbo].[DimAddress] ([AddressSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactOrders_Customer]...';


GO
ALTER TABLE [dbo].[FactOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_FactOrders_Customer] FOREIGN KEY ([CustomerSK]) REFERENCES [dbo].[DimCustomer] ([CustomerSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactOrders_Date]...';


GO
ALTER TABLE [dbo].[FactOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_FactOrders_Date] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactOrders_Status]...';


GO
ALTER TABLE [dbo].[FactOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_FactOrders_Status] FOREIGN KEY ([OrderStatusSK]) REFERENCES [dbo].[DimOrderStatus] ([OrderStatusSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactOrders_ShippingMethod]...';


GO
ALTER TABLE [dbo].[FactOrders] WITH NOCHECK
    ADD CONSTRAINT [FK_FactOrders_ShippingMethod] FOREIGN KEY ([ShippingMethodSK]) REFERENCES [dbo].[DimShippingMethod] ([ShippingMethodSK]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[FactOrders] WITH CHECK CHECK CONSTRAINT [FK_FactOrders_Address];

ALTER TABLE [dbo].[FactOrders] WITH CHECK CHECK CONSTRAINT [FK_FactOrders_Customer];

ALTER TABLE [dbo].[FactOrders] WITH CHECK CHECK CONSTRAINT [FK_FactOrders_Date];

ALTER TABLE [dbo].[FactOrders] WITH CHECK CHECK CONSTRAINT [FK_FactOrders_Status];

ALTER TABLE [dbo].[FactOrders] WITH CHECK CHECK CONSTRAINT [FK_FactOrders_ShippingMethod];


GO
PRINT N'Actualización completada.';


GO
