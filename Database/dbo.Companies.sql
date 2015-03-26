CREATE TABLE [dbo].[Companies] (
    [Id]           INT           NOT NULL IDENTITY,
    [Name]         VARCHAR(50) NOT NULL,
    [Abbreviation] VARCHAR(10)    NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

