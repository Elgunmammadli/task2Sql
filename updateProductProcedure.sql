
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Elgun>
-- Create date: <2022-09-22>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE dbo.spUpdateProduct 
	-- Add the parameters for the stored procedure here
	@name nvarchar(100),
	@description nvarchar(100),
	@categoryName nvarchar(100)
AS
BEGIN
	
	set xact_abort on;
	SET NOCOUNT ON;
	declare @productId int
	select @productId=[id] from [dbo].[Product] where [Name]=@name

	declare @categoryId int
	select @categoryId=[id] from [dbo].[Category] where [Name]=@categoryName

	if @categoryId is null
	begin
	  insert [dbo].[Category]([Name])
	  values (@categoryName)
	  set @categoryId=SCOPE_IDENTITY()
    end

	if @productId is null
	begin
	  insert [dbo].[Product]([Name],[Description],[CategoryId],[CreatedDate])
	  values (@name,@description,@categoryId,getdate())
	  set @productId=SCOPE_IDENTITY()
    end
	else
	begin

    Update [dbo].[Product]
    
	set [Name]=@name ,[Description]=@description,[CategoryId]=@categoryId,[CreatedDate]=getdate()
	where [id]=@productId
	end
    

END
GO