USE [Task2]
GO

/****** Object:  StoredProcedure [dbo].[spInsertProduct]    Script Date: 9/23/2022 8:34:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Elgun>
-- Create date: <2022-09-22>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spInsertProduct] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(100),
	@description nvarchar(100),
	@categoryName nvarchar(100)
AS
BEGIN
	
	set xact_abort on;
	SET NOCOUNT ON;

	if not exists (select * from [dbo].[Product] where  [Name]=@name)
	begin 

	declare @categoryId int
	select @categoryId=[id] from [dbo].[Category] where [Name]=@categoryName

	if @categoryId is null
	begin
	  insert [dbo].[Category]([Name])
	  values (@categoryName)
	  set @categoryId=SCOPE_IDENTITY()

    end
	
	INSERT INTO [dbo].[Product]
           ([Name]
           ,[Description]
           ,[CategoryId]
           ,[CreatedDate])
     VALUES
           (@name,
		   @description,
		   @categoryId,
		   GETDATE())

END
end
--select * from [dbo].[Product]
--select * from [dbo].[Category]
--execute [dbo].[spInsertProduct] N'iphone 17',null,N'klaviautra'
GO


