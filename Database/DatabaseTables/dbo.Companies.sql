CREATE TABLE [dbo].[Companies] (
    [Id]               INT          IDENTITY (10001, 1) NOT NULL,
    [Name]             VARCHAR (50) NOT NULL,
    [Abbreviation]     VARCHAR (10) NOT NULL,
    [logo]             VARCHAR (50) NULL,
    [curprice]         MONEY        NOT NULL,
    [shareAmount]      INT          NOT NULL,
    [categoryId]       INT          NOT NULL,
    [volatility]       INT          NOT NULL,
    [shortDescription] VARCHAR (50) NULL,
    [longDescription]  TEXT         NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Companies_ToTable] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[Categories] ([Id])
);

