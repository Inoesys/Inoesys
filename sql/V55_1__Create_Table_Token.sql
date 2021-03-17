CREATE TABLE [dbo].[Token](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[TokenHash] [nvarchar](100) NOT NULL,
	[TokenIssueDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[TokenUsed] [bit] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[TokenTypeId] [int] NULL
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO