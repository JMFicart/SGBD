use Northwind

--execute "Sales by Year" '1997-01-01', '1997-12-31'

--exec "Sales by Year" '1997-01-01', '1997-12-31'

--select * from dbo.fn_CAMensuelsAnnee(1997)

--exec "Employee Sales by Country" '1997-01-01', '1997-12-31'

--exec dbo.usp_productslist @min_price = 10, @filter = 'ale'

--exec dbo.usp_UsingVariable

declare @ResultCount int;
exec dbo.usp_UsingVariableOutputParam @pCategoryId = 1, @pProductCount = @ResultCount Output;

select @ResultCount as CountProducts;

