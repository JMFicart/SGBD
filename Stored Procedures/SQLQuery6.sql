alter procedure dbo.usp_UsingVariableOutputParam
	@pCategoryId int,
	@pProductCount int output,
	@pAveragePrice decimal(10,4) output
as 
begin
	SET NOCOUNT ON;

	declare @AveragePriceCategory decimal(10,4)

	set @AveragePriceCategory = (select avg(unitprice) from products where CategoryID = @pCategoryId);

	select ProductName, UnitPrice
	from Products
	where CategoryID = @pCategoryId;
	select @pProductCount = @@ROWCOUNT, @pAveragePrice = @AveragePriceCategory;
end
