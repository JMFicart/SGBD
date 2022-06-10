alter procedure dbo.usp_UsingVariable
as 
begin
	SET NOCOUNT ON;
	-- Exemple1
	--declare @product_count as int;
	--set @product_count = (select count(*) from Products);
	--select @product_count;

	-- Exemple 2
	--declare @product_name varchar(50)
	--		, @unit_price decimal(10,2);
	--select @product_name = ProductName, @unit_price = unitprice
	--from Products
	--where productid = 2;

	-- Output
	--select @product_name as Nom_Produit, @unit_price Prix;

	-- Exemple 3
	declare @ProductName_List as varchar(8000);
	set @ProductName_List = '';

	select @ProductName_List = @ProductName_List + ProductName + char(10)
	from Products
	where CategoryID = 1;

	select @ProductName_List;
end
