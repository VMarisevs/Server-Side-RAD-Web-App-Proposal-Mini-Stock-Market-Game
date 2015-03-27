CREATE TABLE [dbo].[TransactionHistory] (
    [Id]           INT      IDENTITY (10001, 1) NOT NULL,
    [userId]       INT      NOT NULL,
    [sharesAmount] INT      NOT NULL,
    [buySell]      CHAR (1) NOT NULL,
    [companyId]    INT      NOT NULL,
    [priceBought]  MONEY    NOT NULL,
    [priceSold]    MONEY    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionHistory_Companies] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_TransactionHistory_Users] FOREIGN KEY ([userId]) REFERENCES [dbo].[Users] ([Id])
);

