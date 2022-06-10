-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JMF
-- Create date: 2022-06-10
-- Description:	Procédure de départ
-- =============================================
alter PROCEDURE usp_ProductsList 
	-- Add the parameters for the stored procedure here
	@min_price as decimal = 0,
	@max_price as decimal = null,
	@filter as varchar(100) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT productname, unitprice 
	from products
	where UnitPrice >= @min_price 
		and (@max_price is null or UnitPrice <= @max_price)
		and ProductName like '%' + @filter + '%'
	order by UnitPrice
END
GO
