/****** Object:  StoredProcedure [dbo].[usp_userprofile_insert]    Script Date: 12/29/2020 11:44:16 PM ******/
DROP PROCEDURE If Exists [dbo].[usp_getencryptedid]
GO

/****** Object:  StoredProcedure [dbo].[usp_getencryptedid]    Script Date: 20-01-2021 16:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_getencryptedid] 
(
@ReturnEncryptedId varchar(max) OUTPUT,
@Id bigint
)
AS
BEGIN
    SET @ReturnEncryptedId = (select convert(varchar(max),dbo.EncryptId(@Id),2)) 
END