CREATE TABLE [dbo].[Users] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [Login]            VARCHAR (50) NOT NULL,
    [Password]         VARCHAR (50) NOT NULL,
    [Email]            VARCHAR (50) NOT NULL,
    [Name]             VARCHAR (50) NOT NULL,
    [Surname]          VARCHAR (50) NOT NULL,
    [DataOfBirth]      DATE         NOT NULL,
    [verification]     TINYINT      NOT NULL,
    [LastLogin]        DATETIME     NOT NULL,
    [RegistrationDate] DATETIME     NOT NULL,
    [Role]             TINYINT      NOT NULL,
    [Company] INT NOT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
);

