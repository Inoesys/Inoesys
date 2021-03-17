

/****** Object:  StoredProcedure [dbo].[usp_users_selectbyid]    Script Date: 12/29/2020 11:45:12 PM ******/
DROP PROCEDURE If exists  [dbo].[usp_users_selectbyid]
GO

/****** Object:  StoredProcedure [dbo].[usp_users_selectbyid]    Script Date: 12/29/2020 11:45:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_users_selectbyid]  
(  
@UserId NVARCHAR(MAX)=NULL  
)  
AS  
BEGIN  
DECLARE @uId BIGINT 
SET @uId=dbo.DecryptUserId(@UserId)  
 SELECT TOP 1 au.Id,au.FirstName,au.LastName,au.Email,au.MiddleName,au.PhoneNumber,au.ProfileDescription,F.NormalizedName as ProfilePicName,
 au.Suffix,ar.Name as UserType,au.Active, dd.NationalProviderIdentifier,
 n.Network,n.IsActive,f.Type,f.Name  FROM AspNetUsers au  
 INNER JOIN AspNetUserRoles aur ON aur.UserId=au.Id  
 LEFT JOIN AspNetRoles ar ON ar.Id=aur.RoleId
 LEFT JOIN NetworkUsers nu ON nu.UserId=au.Id
 LEFT JOIN DoctorDetails dd on dd.UserId = au.Id
 LEFT JOIN Network n ON n.Id=nu.NetworkId
 LEFT JOIN Files F on F.UserId=au.Id
 WHERE au.Id=@uId
 ORDER BY f.CreatedOn DESC
END
GO


