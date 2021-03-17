DROP PROCEDURE IF Exists usp_userprofile_update
GO
CREATE PROCEDURE [dbo].[usp_userprofile_update] 
(
@UserId NVARCHAR(MAX),
@FirstName nvarchar(20),
@MiddleName nvarchar(20)= NULL,
@LastName nvarchar(20),
@ProfileDescription nvarchar(500)= NULL,
@Suffix varchar(5)= NULL,
@Prefix VARCHAR(5)= NULL,
@UserType nvarchar(100),
@NetworkId bigint,
@UpdatedOn datetime= NULL,
@UpdatedBy NVARCHAR(MAX)= NULL,
@Email nvarchar(100)=NULL,
@PhoneNumber nvarchar(100)=NULL,
@RowsEffected INT OUTPUT
)
AS
BEGIN
	DECLARE @Id INT;
	SET @Id=dbo.DecryptUserId(@UserId)
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET FMTONLY OFF;

        BEGIN 

        BEGIN TRANSACTION
		BEGIN
			IF EXISTS(SELECT Id from [dbo].AspNetUsers WHERE ACTIVE=1 AND Id=@Id) 
			  
				UPDATE dbo.AspNetUsers
							SET 
							FirstName=@FirstName,
	MiddleName=@MiddleName,
	LastName=@LastName,
	Email=@Email,
	PhoneNumber=@PhoneNumber,
	ProfileDescription=@ProfileDescription,
	Suffix=@Suffix,UpdatedOn=@UpdatedOn,
								UpdatedBy=dbo.DecryptUserId(@UpdatedBy)
							WHERE Id=@Id
					--Return recently effected rows count
					SET @RowsEffected = CAST(@@ROWCOUNT AS INT)
					
	
			
		END					
        COMMIT TRANSACTION
    

end
end
GO