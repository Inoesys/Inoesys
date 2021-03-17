/****** Object:  StoredProcedure [dbo].[usp_userprofile_insert]    Script Date: 12/29/2020 11:44:16 PM ******/
DROP PROCEDURE If Exists [dbo].[usp_getdecryptedid]
GO

/****** Object:  StoredProcedure [dbo].[usp_getdecryptedid]    Script Date: 20-01-2021 16:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_getdecryptedid] 
(
@ReturnDecryptedId BIGINT OUTPUT,
@Id NVARCHAR(MAX) 
)
AS
BEGIN
    SET @ReturnDecryptedId = dbo.DecryptUserId(@Id)
END
