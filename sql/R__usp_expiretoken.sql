DROP PROCEDURE If Exists [dbo].[usp_expiretoken]
GO
/****** Object:  StoredProcedure [dbo].[usp_createtoken]    Script Date: 18-01-2021 17:20:59 ******/
CREATE PROCEDURE [dbo].[usp_expiretoken](
@UserId NVARCHAR(MAX),
@TokenTypeId INT
)
AS
BEGIN

UPDATE Token
SET TokenUsed = 1
WHERE UserId = dbo.DecryptUserId(@UserId) AND TokenTypeId = @TokenTypeId
END