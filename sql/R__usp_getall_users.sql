

/****** Object:  StoredProcedure [dbo].[usp_getall_users]    Script Date: 12/29/2020 11:42:44 PM ******/
DROP PROCEDURE If Exists [dbo].[usp_getall_users]
GO
/****** Object:  StoredProcedure [dbo].[usp_getall_users]    Script Date: 12/29/2020 11:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getall_users]  
(@NetworkId BIGINT =NULL,  
@UserId NVARCHAR(MAX)=NULL  
)  
AS  
BEGIN  
DECLARE @uId BIGINT  
DECLARE @RoleId BIGINT  
DECLARE @RoleName NVARCHAR(50)  
IF(@UserId IS NOT NULL)  
BEGIN  
 SET @uId=dbo.DecryptUserId(@UserId)  
 SET @RoleName=(SELECT [Name] FROM AspNetUserRoles aur INNER JOIN AspNetRoles ar ON ar.Id=aur.RoleId WHERE UserId=@uId)  
 IF(@NetworkId IS NULL)  
 BEGIN  
 SET @NetworkId=(SELECT DefaultNetworkId FROM NetworkUsers WHERE UserId=@uId)  
 END  
 END  
 IF(@RoleName='Systems Administrator')  
 BEGIN  
 SELECT  CONVERT(varchar(max),dbo.EncryptId(au.Id),2) as UserId,au.FirstName,au.LastName,au.Email,au.MiddleName,au.PhoneNumber,au.ProfileDescription,au.Suffix,ar.Name as UserType,au.Active,n.Network as name,n.IsActive FROM AspNetUsers au  
 INNER JOIN AspNetUserRoles aur ON aur.UserId=au.Id  
 LEFT JOIN AspNetRoles ar ON ar.Id=aur.RoleId  
 LEFT JOIN NetworkUsers nu ON nu.UserId=au.Id  
 LEFT JOIN Network n ON n.Id=nu.NetworkId  
 WHERE n.Id=@NetworkId  AND Active=1 --AND au.Id=@uId   
 END  
 ELSE IF(@RoleName='Networks Administrator')  
 BEGIN  
 SELECT CONVERT(varchar(max),dbo.EncryptId(au.Id),2) as UserId,au.FirstName,au.LastName,au.Email,au.MiddleName,au.PhoneNumber,au.ProfileDescription,au.Suffix,ar.Name as UserType,au.Active, n.Network as name,n.IsActive FROM AspNetUsers au  
 INNER JOIN AspNetUserRoles aur ON aur.UserId=au.Id  
 LEFT JOIN AspNetRoles ar ON ar.Id=aur.RoleId  
 LEFT JOIN NetworkUsers nu ON nu.UserId=au.Id  
 LEFT JOIN Network n ON n.Id=nu.NetworkId  
 WHERE n.Id=@NetworkId AND ar.Name<>'Systems Administrator' AND Active=1  
 END  
 ELSE IF(@RoleName='Clinic Admin')  
 BEGIN  
 SELECT CONVERT(varchar(max),dbo.EncryptId(au.Id),2) as UserId,au.FirstName,au.LastName,au.Email,au.MiddleName,au.PhoneNumber,au.ProfileDescription,au.Suffix,ar.Name as UserType,au.Active,n.Network as name,n.IsActive  FROM AspNetUsers au  
 INNER JOIN AspNetUserRoles aur ON aur.UserId=au.Id  
 LEFT JOIN AspNetRoles ar ON ar.Id=aur.RoleId  
 LEFT JOIN NetworkUsers nu ON nu.UserId=au.Id  
 LEFT JOIN Network n ON n.Id=nu.NetworkId  
 WHERE ar.Name='Doctor' AND Active=1  
 END  
END
GO


