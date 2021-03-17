SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([Id], [Address], [City], [StateId], [Country], [ZipCode], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [Address2]) VALUES (1, N'Address1', N'City1', 1, N'USA', N'569987', CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO

--SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [MiddleName], [LastName], [Suffix], [ProfileDescription], [Active], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [AddressId]) 
VALUES ( N'ramaraor117@yahoo.com', N'RAMARAOR117@YAHOO.COM', N'ramaraor117@yahoo.com', N'RAMARAOR117@YAHOO.COM', 0, 
N'AQAAAAEAACcQAAAAEFFtLBzUSZYvXCa4YG/4Mx9kXPnj4hqFoORcpc6OgzhjGkN3TPduylSNIgZjNeOQrg==', 
N'26VTX6AH6ITNAF5WYTSD4XKLB3HVJLMJ', N'c6f19928-41d3-4ea1-a451-37152ad96456', NULL, 0, 0, NULL, 1, 0, N'RamaRao', NULL, N'Ragolu', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[AspNetUsers] ([UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [MiddleName], [LastName], [Suffix], [ProfileDescription], [Active], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [AddressId]) 
VALUES ( N'varshitharaor117@yahoo.com', N'VARSHITHARAOR117@YAHOO.COM', N'varshitharaor117@yahoo.com', N'VARSHITHARAOR117@YAHOO.COM', 0, 
N'AQAAAAEAACcQAAAAEFFtLBzUSZYvXCa4YG/4Mx9kXPnj4hqFoORcpc6OgzhjGkN3TPduylSNIgZjNeOQrg==', N'26VTX6AH6ITNAF5WYTSD4XKLB3HVJLMJ', 
N'c6f19928-41d3-4ea1-a451-37152ad96456', NULL, 0, 0, NULL, 1, 0, N'VarshithaRao ', NULL, N'Ragolu', N'Miss', NULL, 1, NULL, NULL, NULL, NULL, 1)
GO
--SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO

INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (2, 2)
GO