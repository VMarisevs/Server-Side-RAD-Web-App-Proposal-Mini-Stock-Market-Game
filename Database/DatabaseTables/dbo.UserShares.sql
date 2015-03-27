CREATE TABLE [dbo].[UserShares] (
    [userId]    INT   NOT NULL,
    [companyId] INT   NOT NULL,
    [shares]    INT   NOT NULL,
    [price]     MONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC, [companyId] ASC),
    CONSTRAINT [FK_UserShares_companyId] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_UserShares_userId] FOREIGN KEY ([userId]) REFERENCES [dbo].[Users] ([Id])
);

