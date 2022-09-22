
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Elgun,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

alter PROCEDURE dbo.spDeleteProduct 
@productId int
AS
BEGIN
	set xact_abort on;
	SET NOCOUNT ON;
	
	begin try
	begin transaction delete_product
	insert into [Archive].[Products]
	select [Name]
           ,[Description]
           ,[CategoryId]
           ,[CreatedDate]
		   ,getdate()
		   from [dbo].[Product] where [id]=@productId
		
   delete from [dbo].[Product] where [id]=@productId
   commit
   end try
   begin catch
   rollback
   end catch
END
GO
