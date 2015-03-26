CREATE TABLE [dbo].[Shares] (
    [Id]          INT           NOT NULL IDENTITY,
    [Name]        NCHAR (10)    NULL,
    [Description] VARCHAR (255) NULL,
    [RealPrice]   MONEY         NOT NULL,
    [Paid]        MONEY         NOT NULL,
    [Owner]       INT           NOT NULL,
    [Company]     INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

