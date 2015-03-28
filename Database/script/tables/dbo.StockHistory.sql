CREATE TABLE [dbo].[StockHistory] (
    [Id]        BIGINT   IDENTITY (10001, 1) NOT NULL,
    [updated]   DATETIME NOT NULL,
    [companyId] INT      NOT NULL,
    [price]     MONEY    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StockHistory_Companies] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id])
);

