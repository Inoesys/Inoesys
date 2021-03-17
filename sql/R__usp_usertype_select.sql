Drop procedure if exists [dbo].[usp_usertype_select]
GO
CREATE PROCEDURE [dbo].[usp_usertype_select](
@RoleName nvarchar(255)
)
AS
SET NOCOUNT ON;
DECLARE @Roles nvarchar(100)
SELECT @Roles=[Value] FROM [Configuration] 
WHERE Category='UserDropDownConfig' 
AND [Name]=@RoleName;

SELECT Id,[Name] FROM [AspNetRoles] WHERE ID in (
SELECT value FROM STRING_SPLIT(@Roles, ','))
