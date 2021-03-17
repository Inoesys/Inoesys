IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_file_insert') AND type IN ( N'P', N'PC' ) ) 
BEGIN
  DROP PROCEDURE usp_file_insert
END
GO
CREATE PROCEDURE [dbo].usp_file_insert 
(
@Id INT OUTPUT,
@Name nvarchar(50),
@NormalizedName nvarchar(200),
@Type nvarchar(30),
@CreatedOn datetime,
@CreatedBy NVARCHAR(MAX),
@UserId NVARCHAR(MAX)=NULL
)
AS
BEGIN
    SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET FMTONLY OFF;
       BEGIN TRY
       BEGIN TRANSACTION
	   BEGIN
	INSERT INTO dbo.Files
                       (
	Name,
	NormalizedName,
	Type,
	CreatedOn,
	CreatedBy,UserId)
			 VALUES (
	@Name,
	@NormalizedName,
	@Type,
	@CreatedOn,
	dbo.DecryptUserId(@CreatedBy),dbo.DecryptUserId(@UserId))
			 --GET  ID AND INSERT STATUS HISTORY
			 SET @Id = CAST(SCOPE_IDENTITY() AS INT) 	
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
		SET @Id = 0
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
	END