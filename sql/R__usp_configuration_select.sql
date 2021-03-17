Drop procedure if exists [dbo].[usp_configuration_select]
GO
Create Procedure usp_configuration_select(
	@ConfigCategory nvarchar(100)
)
AS
SELECT [Name],[Value] From [Configuration] WHERE Category=@ConfigCategory 
