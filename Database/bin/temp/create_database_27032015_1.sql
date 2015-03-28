IF DB_ID('StockMarketGame') IS NOT NULL
	DROP DATABASE StockMarketGame
	
CREATE DATABASE StockMarketGame
GO

USE [StockMarketGame]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
-- table in here
CREATE TABLE [dbo].[Categories] (
    [Id]         INT           IDENTITY (1001, 1) NOT NULL,
    [shortName]  VARCHAR (15)  NOT NULL,
    [Volatility] INT           NOT NULL,
    [longName]   VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
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
)
GO
CREATE TABLE [dbo].[Role] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Role] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
CREATE TABLE [dbo].[StockHistory] (
    [Id]        BIGINT   IDENTITY (10001, 1) NOT NULL,
    [updated]   DATETIME NOT NULL,
    [companyId] INT      NOT NULL,
    [price]     MONEY    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StockHistory_Companies] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id])
)
GO
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
)
GO
CREATE TABLE [dbo].[Users] (
    [Id]               INT          IDENTITY (10001, 1) NOT NULL,
    [Login]            VARCHAR (50) NOT NULL,
    [Password]         VARCHAR (50) NOT NULL,
    [Email]            VARCHAR (50) NOT NULL,
    [Name]             VARCHAR (50) NOT NULL,
    [Surname]          VARCHAR (50) NOT NULL,
    [DataOfBirth]      DATE         NOT NULL,
    [LastLogin]        DATETIME     NOT NULL,
    [RegistrationDate] DATETIME     NOT NULL,
    [Role]             TINYINT      NOT NULL,
    [Avatar]           VARCHAR (50) NULL,
    [SecretQ]          INT          NULL,
    [SecretA]          VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
)
GO
CREATE TABLE [dbo].[UserShares] (
    [userId]    INT   NOT NULL,
    [companyId] INT   NOT NULL,
    [shares]    INT   NOT NULL,
    [price]     MONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC, [companyId] ASC),
    CONSTRAINT [FK_UserShares_companyId] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_UserShares_userId] FOREIGN KEY ([userId]) REFERENCES [dbo].[Users] ([Id])
)
-- all tables
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1001, N'IT', 5, N'Information Technology')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1002, N'MAT', 15, N'Materials')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1003, N'ENG', 10, N'Engineering')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1004, N'EDU', 8, N'Education')
SET IDENTITY_INSERT [dbo].[Categories] OFF

GO
SET IDENTITY_INSERT [dbo].[Companies] ON
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10001, N'Google', N'g', NULL, CAST(20.0000 AS Money), 20, 1001, 10, N'Google 
Internet company', N'Google is an American multinational corporation specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, and software.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10002, N'Microsoft Corporation', N'MS', NULL, CAST(20.0000 AS Money), 20, 1001, 8, N'Microsoft Corporation
Computer software company', N'Microsoft Corporation is an American multinational corporation headquartered in Redmond, Washington, that develops, manufactures, licenses, supports and sells computer software, consumer electronics and personal computers and services.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10003, N'Amazon.com, Inc.', N'AMZN', NULL, CAST(20.0000 AS Money), 20, 1001, 14, N'Amazon.com, Inc.
Electronic commerce company', N'Amazon.com, Inc. is an American electronic commerce company with headquarters in Seattle, Washington. It is the largest Internet-based retailer in the United States.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10004, N'Royal Dutch Shell', N'Shell', NULL, CAST(20.0000 AS Money), 20, 1002, 20, N'Royal Dutch Shell
Oil industry company', N'Royal Dutch Shell plc, commonly known as Shell, is an Anglo–Dutch multinational oil and gas company headquartered in the Netherlands and incorporated in the United Kingdom.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10007, N'Mobil', N'Mobil', NULL, CAST(20.0000 AS Money), 20, 1002, 22, N'', N'Mobil, previously known as the Socony-Vacuum Oil Company, was a major Anglo-American oil company which merged with Exxon in 1999 to form ExxonMobil.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10009, N'Bayerische Motoren Werke AG', N'BMW', NULL, CAST(20.0000 AS Money), 20, 1003, 10, N'', N'Bayerische Motoren Werke AG, commonly known as BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10010, N'Audi AG', N'Audi', NULL, CAST(20.0000 AS Money), 20, 1003, 9, N'', N'Audi AG is a German automobile manufacturer that designs, engineers, produces, markets and distributes luxury automobiles. Audi oversees worldwide operations from its headquarters in Ingolstadt, Bavaria, Germany.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10011, N'Volkswagen Group', N'VW', NULL, CAST(20.0000 AS Money), 20, 1003, 10, N'', N'Volkswagen Group and its subsidiaries, is a German multinational automotive manufacturing company headquartered in Wolfsburg, Lower Saxony, Germany.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10012, N'Mercedes-Benz', N'MB', NULL, CAST(20.0000 AS Money), 20, 1003, 7, N'', N'Mercedes-Benz is a German automobile manufacturer, a multinational division of the German manufacturer Daimler AG. The brand is used for luxury automobiles, buses, coaches, and trucks.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10013, N'Galway-Mayo Institute of Technology', N'GMIT', NULL, CAST(20.0000 AS Money), 20, 1004, 13, N'', N'Galway-Mayo Institute of Technology is a third level institute of education and is based at five locations in the west of Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10014, N'National University of Ireland, Galway', N'NUIG', NULL, CAST(20.0000 AS Money), 20, 1004, 12, N'', N'The National University of Ireland, Galway is a constituent university of the National University of Ireland. It is a tertiary-level educational institution located in Galway, Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10015, N'Trinity College, Dublin', N'TCD', NULL, CAST(20.0000 AS Money), 20, 1004, 15, N'', N'Trinity College, known in full as the College of the Holy and Undivided Trinity of Queen Elizabeth near Dublin, is a research university and the sole constituent college of the University of Dublin in Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10016, N'University of Limerick', N'UL', NULL, CAST(20.0000 AS Money), 20, 1004, 18, N'', N'The University of Limerick is a university in the city of Limerick, Ireland . It was established in 1972 as the National Institute for Higher Education, Limerick and became a university by statute in ...')
SET IDENTITY_INSERT [dbo].[Companies] OFF

GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT INTO [dbo].[Role] ([Id], [Role]) VALUES (1, N'Admin')
INSERT INTO [dbo].[Role] ([Id], [Role]) VALUES (2, N'User')
INSERT INTO [dbo].[Role] ([Id], [Role]) VALUES (3, N'Guest')
SET IDENTITY_INSERT [dbo].[Role] OFF

GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10001, N'Vlad', N'Vlad', N'Vlad@gmit.ie', N'Vladislavs', N'Marisevs', N'1989-12-07', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10002, N'Ronan', N'Ronan', N'Ronan@gmit.ie', N'Ronan', N'Connolly', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10003, N'Vytas', N'Vytas', N'Vytas@gmit.ie', N'Vytas', N'Vaiciulis', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10004, N'Fintan', N'Fintan', N'Fintan@gmit.ie', N'Fintan', N'Williams', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10005, N'Ben', N'Ben', N'Ben@gmit.ie', N'Ben', N'Ramsey', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10006, N'Cameron', N'Cameron', N'Cameron@gmit.ie', N'Cameron', N'Mcgee', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10007, N'Clint', N'Clint', N'Clint@gmit.ie', N'Clint', N'Mckinney', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10008, N'Marcia', N'Marcia', N'Marcia@gmit.ie', N'Marcia', N'Pierce', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 1, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10009, N'Delbert', N'Delbert', N'Delbert@gmit.ie', N'Delbert', N'Hamilton', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10010, N'Roosevelt', N'Roosevelt', N'Roosevelt@gmit.ie', N'Roosevelt', N'Hines', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10011, N'Maryann', N'Maryann', N'Maryann@gmit.ie', N'Maryann', N'Valdez', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10012, N'Blake', N'Blake', N'Blake@gmit.ie', N'Blake', N'Lawrence', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10013, N'William', N'William', N'William@gmit.ie', N'William', N'Bowers', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10014, N'Lorraine', N'Lorraine', N'Lorraine@gmit.ie', N'Lorraine', N'Rivera', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10015, N'Angel', N'Angel', N'Angel@gmit.ie', N'Angel', N'Myers', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10016, N'Regina', N'Regina', N'Regina@gmit.ie', N'Regina', N'Ramirez', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10017, N'Randall', N'Randall', N'Randall@gmit.ie', N'Randall', N'Matthews', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10018, N'Jorge', N'Jorge', N'Jorge@gmit.ie', N'Jorge', N'Christensen', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10019, N'Edith', N'Edith', N'Edith@gmit.ie', N'Edith', N'Murray', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10020, N'David', N'David', N'David@gmit.ie', N'David', N'Tucker', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10021, N'Daryl', N'Daryl', N'Daryl@gmit.ie', N'Daryl', N'Bailey', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10022, N'Ann', N'Ann', N'Ann@gmit.ie', N'Ann', N'Willis', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10023, N'Delores', N'Delores', N'Delores@gmit.ie', N'Delores', N'Watts', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10024, N'Violet', N'Violet', N'Violet@gmit.ie', N'Violet', N'Robbins', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10025, N'Morris', N'Morris', N'Morris@gmit.ie', N'Morris', N'Reed', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10026, N'Virgil', N'Virgil', N'Virgil@gmit.ie', N'Virgil', N'Garza', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10027, N'Guadalupe', N'Guadalupe', N'Guadalupe@gmit.ie', N'Guadalupe', N'Montgomery', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10028, N'Doug', N'Doug', N'Doug@gmit.ie', N'Doug', N'Mcdonald', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10029, N'Marc', N'Marc', N'Marc@gmit.ie', N'Marc', N'Sparks', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10030, N'Elisa', N'Elisa', N'Elisa@gmit.ie', N'Elisa', N'Guerrero', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10031, N'Nathaniel', N'Nathaniel', N'Nathaniel@gmit.ie', N'Nathaniel', N'Flores', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10032, N'Genevieve', N'Genevieve', N'Genevieve@gmit.ie', N'Genevieve', N'Cortez', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10033, N'Adrian', N'Adrian', N'Adrian@gmit.ie', N'Adrian', N'Byrd', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
INSERT INTO [dbo].[Users] ([Id], [Login], [Password], [Email], [Name], [Surname], [DataOfBirth], [LastLogin], [RegistrationDate], [Role], [Avatar], [SecretQ], [SecretA]) VALUES (10034, N'Stella', N'Stella', N'Stella@gmit.ie', N'Stella', N'Webb', N'2015-01-01', N'2015-01-01 00:00:00', N'2015-01-01 00:00:00', 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF

