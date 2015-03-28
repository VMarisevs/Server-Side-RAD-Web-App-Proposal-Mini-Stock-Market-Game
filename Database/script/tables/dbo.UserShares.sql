CREATE TABLE [dbo].[UserShares] (
    [userId]    UNIQUEIDENTIFIER NOT NULL,
    [companyId] INT              NOT NULL,
    [shares]    INT              NOT NULL,
    [price]     MONEY            NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC, [companyId] ASC),
    CONSTRAINT [FK_UserShares_companyId] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_UserShares_aspnet_Users] FOREIGN KEY ([userId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);

