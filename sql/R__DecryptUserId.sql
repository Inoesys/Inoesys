

/****** Object:  UserDefinedFunction [dbo].[DecryptUserId]    Script Date: 12/15/2020 7:48:26 PM ******/
DROP FUNCTION If Exists [dbo].[DecryptUserId]
GO

/****** Object:  UserDefinedFunction [dbo].[DecryptUserId]    Script Date: 12/15/2020 7:48:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create FUNCTION [dbo].[DecryptUserId] (@UserId varchar(max))
RETURNS Bigint
AS
BEGIN
Declare @ReturnUserId varbinary(max);
Declare @Id bigint;
set @ReturnUserId=  CONVERT(VARBINARY(max), @UserId,2);
set @Id= dbo.DecryptId(@ReturnUserId);
Return @Id;
END
GO


