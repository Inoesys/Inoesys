DROP PROCEDURE IF EXISTS usp_createtoken
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_createtoken](
@UserId NVARCHAR(MAX),
@TokenExpirationDays INT=0,
@TokenTypeId INT
)
AS
BEGIN
DECLARE @TokenHash NVARCHAR(200)
SET @TokenHash=CONVERT(varchar(max),dbo.EncryptId(dbo.DecryptUserId(@UserId)),2)

UPDATE TOKEN
    SET TokenUsed = 1
    WHERE UserId = dbo.DecryptUserId(@UserId) AND TokenTypeId = @TokenTypeId

INSERT INTO Token 
	(UserName,
	TokenHash,
	TokenIssueDate,
	ExpirationDate,
	TokenUsed,
	UserId,
	TokenTypeId)
	VALUES(NULL,@TokenHash,GETDATE(),DATEADD(day, @TokenExpirationDays, GETDATE()),0,dbo.DecryptUserId(@UserId),@TokenTypeId)

SELECT @TokenHash
END