

/****** Object:  UserDefinedFunction [dbo].[EncryptId]    Script Date: 12/8/2020 1:21:06 PM ******/
DROP FUNCTION IF EXISTS [dbo].[EncryptId]
GO

/****** Object:  UserDefinedFunction [dbo].[EncryptId]    Script Date: 12/8/2020 1:21:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[EncryptId] (@Number2Encrypt BIGINT)
RETURNS varbinary(max)
AS
BEGIN
Declare @Encrypt varbinary(max);
SET @Encrypt = EncryptByPassPhrase('B0380EF7-BB3E-4C16-A00F-FBDF4E95E6D0', convert(varchar(max),@Number2Encrypt));
RETURN @Encrypt;
END
GO


