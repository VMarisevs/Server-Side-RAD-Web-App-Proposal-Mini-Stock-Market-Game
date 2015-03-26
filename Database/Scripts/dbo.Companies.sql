CREATE TABLE [dbo].[Companies] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Abbreviation] VARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

