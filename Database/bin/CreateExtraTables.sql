GO
CREATE TABLE [dbo].[News] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [NewsText] TEXT             DEFAULT ('') NOT NULL,
    [PostDate] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	[UpdateDate] DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('ZomboCorp Inc. stock price reaches record high of $800.')
GO
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Vladislavs "The Enforcer" Marisevs reaches spiritual enlightenment through normalizing rows. This DBA cares about each and every row and nevers leaves them orphaned.')
GO
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Forest fire in the Leitrim district causes the Wood Material stock to sky rocket!')
GO
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('New theme park "Fingtasia" opens up in the Galway district, only 9 bucks for entry, could this theme park possibly make it onto the stock street?')
GO
INSERT INTO [dbo].[News] ([NewsText]) VALUES ('Oversupply of graduates is causing the GMIT EDU stock price to plumment, sell while you can!')