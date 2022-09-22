--create view
/*
create view VwGetProductDetails
as
SELECT 
       p.[id]
       ,p.[Name] [Product Name]
      ,p.[Description]
      ,c.[Name] [Category Name]
      ,p.[CreatedDate]
  FROM [dbo].[Product] p 
  left join [dbo].[Category] c on p.CategoryId=c.id
*/
