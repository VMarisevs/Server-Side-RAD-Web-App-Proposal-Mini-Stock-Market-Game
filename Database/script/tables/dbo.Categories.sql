CREATE TABLE [dbo].[Categories] (
    [Id]         INT           IDENTITY (1001, 1) NOT NULL,
    [shortName]  VARCHAR (15)  NOT NULL,
    [Volatility] INT           NOT NULL,
    [longName]   VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

