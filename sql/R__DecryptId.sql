

/****** Object:  UserDefinedFunction [dbo].[DecryptId]    Script Date: 12/8/2020 1:21:59 PM ******/
DROP FUNCTION IF EXISTS [dbo].[DecryptId]
GO

/****** Object:  UserDefinedFunction [dbo].[DecryptId]    Script Date: 12/8/2020 1:21:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DecryptId] (@String2Decrypt varbinary(max))
RETURNS Varchar(max)
AS
BEGIN
Declare @Decrypt Varchar(max);
 SET  @Decrypt= convert(varchar(max),DecryptByPassPhrase('B0380EF7-BB3E-4C16-A00F-FBDF4E95E6D0',@String2Decrypt ))
RETURN @Decrypt;
END
GO


