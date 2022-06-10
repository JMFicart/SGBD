use Northwind

--execute "Sales by Year" '1997-01-01', '1997-12-31'

--exec "Sales by Year" '1997-01-01', '1997-12-31'

--select * from dbo.fn_CAMensuelsAnnee(1997)

--exec "Employee Sales by Country" '1997-01-01', '1997-12-31'

--exec dbo.usp_productslist @min_price = 10, @filter = 'ale'

--exec dbo.usp_UsingVariable

--declare @ResultCount int;
--declare @PrixMoyen decimal(10,4);
--exec dbo.usp_UsingVariableOutputParam @pCategoryId = 7, 
--	@pProductCount = @ResultCount Output,
--	@pAveragePrice = @PrixMoyen Output;

--select @ResultCount NbreArticles, @PrixMoyen as PrixMoyen

--exec Usp_CalculateInventory 75000

--exec usp_GenerateYearDate 2015
--exec usp_GenerateYearDate 2017

--select CalendarDay, cast(cast(cast(calendarday as datetime) as float) as int),
--datediff(day, '1900-01-01', CalendarDay)
--from calendar
--where year(CalendarDay) = 2016;

