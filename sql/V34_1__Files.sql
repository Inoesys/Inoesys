CREATE TABLE [dbo].[Files](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NormalizedName] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_QuestionId]  DEFAULT ((0)) FOR [QuestionId]
GO

ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO