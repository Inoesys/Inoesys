

/****** Object:  StoredProcedure [dbo].[usp_userprofile_insert]    Script Date: 12/29/2020 11:44:16 PM ******/
DROP PROCEDURE If Exists [dbo].[usp_userprofile_insert]
GO

/****** Object:  StoredProcedure [dbo].[usp_userprofile_insert]    Script Date: 12/29/2020 11:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_userprofile_insert] 
(
@ReturnId varchar(max) OUTPUT,
@FirstName nvarchar(20),
@MiddleName nvarchar(20)= NULL,
@LastName nvarchar(20),
@ProfileDescription nvarchar(500)= NULL,
@Suffix VARCHAR(5)= NULL,
@Prefix VARCHAR(5)= NULL,
@UserType nvarchar(100),
@NetworkId bigint,
@CreatedOn datetime= NULL,
@CreatedBy NVARCHAR(MAX)= NULL,
@Email nvarchar(100)=NULL,
@PhoneNumber nvarchar(100)=NULL
)
AS
BEGIN
    SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET FMTONLY OFF;

       BEGIN TRY
       BEGIN TRANSACTION
	   BEGIN
		BEGIN
			 INSERT INTO dbo.AspNetUsers
                       (FirstName,
	MiddleName,
	LastName,
	UserName,
	NormalizedUserName,
    Email,
	NormalizedEmail,
	PhoneNumber,
	ProfileDescription,
	Suffix,CreatedOn,
	CreatedBy,EmailConfirmed,PhoneNumberConfirmed, 
	TwoFactorEnabled, LockoutEnabled, AccessFailedCount,Active)
			 VALUES (
	@FirstName,
	@MiddleName,
	@LastName,
	@Email,
	UPPER(@Email),
	@Email,
	UPPER(@Email),
	@PhoneNumber,
	@ProfileDescription,
	@Suffix,@CreatedOn,
	dbo.DecryptUserId(@CreatedBy), 0 ,0,0,1,0,1)
	Declare @Id bigint;
	set @Id=SCOPE_IDENTITY();
			 SET @ReturnId = (select convert(varchar(max),dbo.EncryptId(@Id),2)) 
			 DECLARE @RoleId BIGINT
	if(@UserType='Systems Administrator')
	BEGIN
	SET @RoleId=(SELECT Id FROM AspNetRoles WHERE [Name]=@UserType)
	INSERT INTO AspNetUserRoles(UserId,RoleId)VALUES(@Id,@RoleId)
	INSERT INTO NetworkUsers(
	NetworkId,
	UserId,
	CreatedOn,
	CreatedBy,
	DefaultNetworkId)VALUES(
	@NetworkId,
	@Id,
	@CreatedOn,
	dbo.DecryptUserId(@CreatedBy),
	@NetworkId)
	INSERT dbo.NetworkUsers		
						(NetworkId,
	UserId,
	CreatedOn,
	CreatedBy,
	DefaultNetworkId)
	SELECT Id,
	@Id,
	@CreatedOn,
	dbo.DecryptUserId(@CreatedBy),
	@NetworkId from Network WHERE Id<>@NetworkId
	END
	ELSE
	BEGIN
	SET @RoleId=(SELECT Id FROM AspNetRoles WHERE [Name]=@UserType)
	INSERT INTO AspNetUserRoles(UserId,RoleId)VALUES(@Id,@RoleId)
	INSERT INTO NetworkUsers(
	NetworkId,
	UserId,
	CreatedOn,
	CreatedBy,
	DefaultNetworkId)VALUES(
	@NetworkId,
	@Id,
	@CreatedOn,
	dbo.DecryptUserId(@CreatedBy),
	@NetworkId)
	END
		END
					
        COMMIT TRANSACTION
		END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
        DECLARE @ErrorNumber INT = ERROR_NUMBER()
        DECLARE @ErrorLine INT = ERROR_LINE()
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
        DECLARE @ErrorState INT = ERROR_STATE()
		SET @ReturnId = 0
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
	END