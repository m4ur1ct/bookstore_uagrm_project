CREATE TABLE [dbo].[DimPublisher]
(
    [PublisherSK]    INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimPublisher PRIMARY KEY,

    [PublisherID]    INT               NOT NULL,   -- desde OLTP
    [PublisherName]  VARCHAR(400)      NULL,

    -- SCD Tipo 2 si quieres trazar cambios de nombre
    [EffectiveFrom]  DATE              NOT NULL,
    [EffectiveTo]    DATE              NOT NULL,
    [IsCurrent]      BIT               NOT NULL
);
GO
