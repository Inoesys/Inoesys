DROP PROCEDURE If Exists [dbo].[usp_update_normalizedemail]
GO
/****** Object:  StoredProcedure [dbo].[usp_update_normalizedemail]    Script Date: 15-01-2021 17:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_normalizedemail](
@Email NVARCHAR(MAX)
)
AS
BEGIN

UPDATE AspNetUsers
SET NormalizedEmail = UPPER(@Email)
WHERE Email = @Email

END