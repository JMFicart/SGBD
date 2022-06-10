create procedure dbo.usp_UsingVariableOutputParam
	@pCategoryId int,
	@pProductCount int output

as 
begin
	SET NOCOUNT ON;

	select ProductName, UnitPrice
	from Products
	where CategoryID = @pCategoryId;

	select @pProductCount = @@ROWCOUNT;
end
