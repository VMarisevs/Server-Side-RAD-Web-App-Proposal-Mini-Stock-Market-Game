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

CREATE TABLE [dbo].[Companies] (
    [Id]               INT          IDENTITY (10001, 1) NOT NULL,
    [Name]             VARCHAR (50) NOT NULL,
    [Abbreviation]     VARCHAR (10) NOT NULL,
    [logo]             VARCHAR (50) NULL,
    [curprice]         MONEY        NOT NULL DEFAULT '100',
    [shareAmount]      INT          NOT NULL,
    [categoryId]       INT          NOT NULL,
    [volatility]       INT          NOT NULL,
    [shortDescription] VARCHAR (50) NULL,
    [longDescription]  TEXT         NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Companies_ToTable] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[Categories] ([Id])
)

CREATE TABLE [dbo].[StockHistory] (
    [Id]        BIGINT   IDENTITY (10001, 1) NOT NULL,
    [updated]   DATETIME NOT NULL,
    [companyId] INT      NOT NULL,
    [price]     MONEY    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StockHistory_Companies] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id])
)

CREATE TABLE [dbo].[TransactionHistory] (
    [Id]           BIGINT           IDENTITY (10001, 1) NOT NULL,
    [userId]       UNIQUEIDENTIFIER NOT NULL,
    [sharesAmount] INT              NOT NULL,
    [buySell]      CHAR (1)         NOT NULL,
    [companyId]    INT              NOT NULL,
    [priceBought]  MONEY            NOT NULL,
    [priceSold]    MONEY            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionHistory_Companies] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_TransactionHistory_aspnet_Users] FOREIGN KEY ([userId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
)

CREATE TABLE [dbo].[UserShares] (
    [userId]    UNIQUEIDENTIFIER NOT NULL,
    [companyId] INT              NOT NULL,
    [shares]    INT              NOT NULL,
    [price]     MONEY            NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC, [companyId] ASC),
    CONSTRAINT [FK_UserShares_companyId] FOREIGN KEY ([companyId]) REFERENCES [dbo].[Companies] ([Id]),
    CONSTRAINT [FK_UserShares_aspnet_Users] FOREIGN KEY ([userId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
)


-- all tables
GO
SET ANSI_PADDING OFF
-- all records
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1001, N'IT', 1, N'Information Technology')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1002, N'MAT', 2, N'Materials')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1003, N'ENG', 3, N'Engineering')
INSERT INTO [dbo].[Categories] ([Id], [shortName], [Volatility], [longName]) VALUES (1004, N'EDU', 4, N'Education')
SET IDENTITY_INSERT [dbo].[Categories] OFF

GO
SET IDENTITY_INSERT [dbo].[Companies] ON
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10001, N'Google', N'g', NULL,  20, 1001, 1, N'Google 
Internet company', N'Google is an American multinational corporation specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, and software.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10002, N'Microsoft Corporation', N'MS', NULL,  20, 1001, 2, N'Microsoft Corporation
Computer software company', N'Microsoft Corporation is an American multinational corporation headquartered in Redmond, Washington, that develops, manufactures, licenses, supports and sells computer software, consumer electronics and personal computers and services.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10003, N'Amazon.com, Inc.', N'AMZN', NULL,  20, 1001, 3, N'Amazon.com, Inc.
Electronic commerce company', N'Amazon.com, Inc. is an American electronic commerce company with headquarters in Seattle, Washington. It is the largest Internet-based retailer in the United States.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10004, N'Royal Dutch Shell', N'Shell',  NULL, 20, 1002, 4, N'Royal Dutch Shell
Oil industry company', N'Royal Dutch Shell plc, commonly known as Shell, is an Angloâ€“Dutch multinational oil and gas company headquartered in the Netherlands and incorporated in the United Kingdom.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10005, N'Mobil', N'Mobil', NULL, 20, 1002, 5, N'', N'Mobil, previously known as the Socony-Vacuum Oil Company, was a major Anglo-American oil company which merged with Exxon in 1999 to form ExxonMobil.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10006, N'Bayerische Motoren Werke AG', N'BMW', NULL, 20, 1003, 10, N'', N'Bayerische Motoren Werke AG, commonly known as BMW or BMW AG, is a German automobile, motorcycle and engine manufacturing company founded in 1916. BMW is headquartered in Munich, Bavaria')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10007, N'Audi AG', N'Audi', NULL, 20, 1003, 4, N'', N'Audi AG is a German automobile manufacturer that designs, engineers, produces, markets and distributes luxury automobiles. Audi oversees worldwide operations from its headquarters in Ingolstadt, Bavaria, Germany.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10008, N'Volkswagen Group', N'VW', NULL, 20, 1003, 3, N'', N'Volkswagen Group and its subsidiaries, is a German multinational automotive manufacturing company headquartered in Wolfsburg, Lower Saxony, Germany.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10009, N'Mercedes-Benz', N'MB', NULL, 20, 1003, 2, N'', N'Mercedes-Benz is a German automobile manufacturer, a multinational division of the German manufacturer Daimler AG. The brand is used for luxury automobiles, buses, coaches, and trucks.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10010, N'Galway-Mayo Institute of Technology', N'GMIT', NULL,  20, 1004, 1, N'', N'Galway-Mayo Institute of Technology is a third level institute of education and is based at five locations in the west of Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10011, N'National University of Ireland, Galway', N'NUIG', NULL,  20, 1004, 2, N'', N'The National University of Ireland, Galway is a constituent university of the National University of Ireland. It is a tertiary-level educational institution located in Galway, Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10012, N'Trinity College, Dublin', N'TCD', NULL,  20, 1004, 3, N'', N'Trinity College, known in full as the College of the Holy and Undivided Trinity of Queen Elizabeth near Dublin, is a research university and the sole constituent college of the University of Dublin in Ireland.')
INSERT INTO [dbo].[Companies] ([Id], [Name], [Abbreviation], [logo], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (10013, N'University of Limerick', N'UL', NULL, 20, 1004, 4, N'', N'The University of Limerick is a university in the city of Limerick, Ireland . It was established in 1972 as the National Institute for Higher Education, Limerick and became a university by statute in ...')
SET IDENTITY_INSERT [dbo].[Companies] OFF

GO
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'6059d1f7-16f3-49c0-b8b7-8e02a8faa4ac', 10001, 20, CAST(15.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'6059d1f7-16f3-49c0-b8b7-8e02a8faa4ac', 10002, 132, CAST(13.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'6059d1f7-16f3-49c0-b8b7-8e02a8faa4ac', 10003, 9, CAST(12.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'0988fc7b-fb90-4f6e-92cb-df0b1fc28c13', 10001, 30, CAST(9.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'0988fc7b-fb90-4f6e-92cb-df0b1fc28c13', 10012, 8, CAST(11.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'0988fc7b-fb90-4f6e-92cb-df0b1fc28c13', 10011, 12, CAST(32.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'0988fc7b-fb90-4f6e-92cb-df0b1fc28c13', 10002, 43, CAST(23.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'f3433288-7fc5-4012-a02c-f8c86b9340d8', 10001, 22, CAST(11.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'f3433288-7fc5-4012-a02c-f8c86b9340d8', 10002, 32, CAST(41.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'f3433288-7fc5-4012-a02c-f8c86b9340d8', 10007, 23, CAST(12.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'f3433288-7fc5-4012-a02c-f8c86b9340d8', 10004, 32, CAST(12.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'9aac98f4-9c27-43a9-ae62-3084e3caf170', 10001, 32, CAST(4.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'9aac98f4-9c27-43a9-ae62-3084e3caf170', 10002, 31, CAST(12.0000 AS Money))
INSERT INTO [dbo].[UserShares] ([userId], [companyId], [shares], [price]) VALUES (N'9aac98f4-9c27-43a9-ae62-3084e3caf170', 10012, 23, CAST(11.0000 AS Money))
