USE [StockMarketGame]
GO
CREATE TABLE [dbo].[News] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [NewsText] TEXT             DEFAULT ('') NOT NULL,
    [PostDate] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	[UpdateDate] DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
--SET IDENTITY_INSERT [dbo].[News] ON
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('ZomboCorp Inc. stock price reaches record high of $800.')
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Vladislavs "The Enforcer" Marisevs reaches spiritual enlightenment through normalizing rows. This DBA cares about each and every row and nevers leaves them orphaned.')
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Forest fire in the Leitrim district causes the Wood Material stock to sky rocket!')
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('New theme park "Fingtasia" opens up in the Galway district, only 9 bucks for entry, could this theme park possibly make it onto the stock street?')
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Oversupply of graduates is causing the GMIT EDU stock price to plumment, sell while you can!')
--SET IDENTITY_INSERT [dbo].[News] OFF

-- Feedback tables and records
GO
CREATE TABLE [dbo].[Feedback_Options] (
    [Id]   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Name] VARCHAR (50)     DEFAULT ('') NOT NULL,
    [TYPE] VARCHAR (2)      DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_Feedback_Options] PRIMARY KEY CLUSTERED ([Id] ASC)
)

GO
CREATE TABLE [dbo].[Feedback_List] (
    [Id]                UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Experience]        TEXT             DEFAULT ('') NOT NULL,
    [PostDate]          DATETIME         DEFAULT (getdate()) NOT NULL,
    [LearnAboutWebsite] UNIQUEIDENTIFIER NOT NULL,
    [AccessMedium]      UNIQUEIDENTIFIER NOT NULL,
    [VisitingReason]    UNIQUEIDENTIFIER NOT NULL,
    [Comeback]          TINYINT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Feedback_List] PRIMARY KEY CLUSTERED ([Id] ASC),
    --CONSTRAINT [FK_Feedback_List_FeedbackOptions_AccessMedium] FOREIGN KEY ([AccessMedium]) REFERENCES [dbo].[Feedback_Options] ([Id]),
    --CONSTRAINT [FK_Feedback_List_FeedbackOptions_LearnAboutWebsite] FOREIGN KEY ([LearnAboutWebsite]) REFERENCES [dbo].[Feedback_Options] ([Id]),
    --CONSTRAINT [FK_Feedback_List_FeedbackOptions_VisitingReason] FOREIGN KEY ([VisitingReason]) REFERENCES [dbo].[Feedback_Options] ([Id])
)

GO
CREATE TABLE [dbo].[Feedback_Devices] (
    [ListId]   UNIQUEIDENTIFIER NOT NULL,
    [DeviceId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Feedback_Devices] PRIMARY KEY CLUSTERED ([ListId] ASC, [DeviceId] ASC),
    CONSTRAINT [FK_Feedback_Devices_Feedback_List] FOREIGN KEY ([ListId]) REFERENCES [dbo].[Feedback_List] ([Id]),
    CONSTRAINT [FK_Feedback_Devices_Feedback_Options] FOREIGN KEY ([DeviceId]) REFERENCES [dbo].[Feedback_Options] ([Id])
)

GO
--SET IDENTITY_INSERT [dbo].[Feedback_Options] ON
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'8a15e70f-7d7c-453c-b11e-114141c95c14', N'Curious', N're')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'2d49f85d-4f09-423e-8f5b-19d5f0dd2335', N'Advertisment', N'ab')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'b7790209-5a04-4d6e-9de4-1f53cd21cdcc', N'Laptop', N'ac')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'5ec1448d-6a78-40db-ab10-40fa7226bfdd', N'Gathering Information', N're')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'e68322a5-81dd-4e5d-b6bd-49f1ef9a91d7', N'Wireless', N'me')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'91106b9a-36ac-4e75-b8d8-5168e80b8632', N'Tablet', N'ac')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'e15f83aa-8197-4ebb-a4cf-7e8808aa980f', N'DSL', N'me')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'19e938ed-9a4c-473a-9a67-9f5bbf591c17', N'Search Engine', N'ab')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'cbaece6f-ee90-49cd-bbeb-bc147b71e1b6', N'Cable', N'me')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'b4660bdc-7099-4989-8b63-cac1444a3096', N'PC', N'ac')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'93b5bc49-c273-4a6a-a4c8-cd0c0b799afe', N'Mobile', N'ac')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'705d209b-9a96-4efe-b9cc-d54c32355214', N'Dial-Up', N'me')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'15cb41d9-691a-4330-82e6-d7fc31ee4635', N'Other Reason', N're')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'80df5f17-224a-4d2f-8790-e4d04bd7e683', N'Word of Mouth', N'ab')
INSERT INTO [dbo].[Feedback_Options] ([Id], [Name], [TYPE]) VALUES (N'a1b234da-4434-455d-9bc1-f5602141635c', N'Email', N'ab')
--SET IDENTITY_INSERT [dbo].[Feedback_Options] OFF





