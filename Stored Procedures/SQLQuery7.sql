
CREATE PROCEDURE Usp_CalculateInventory
	-- Add the parameters for the stored procedure here
	@pLimitAmount as decimal(10,2)
AS
BEGIN
	SET NOCOUNT ON;

	declare @Inventory decimal(10,2)
	select @Inventory = sum(unitprice * unitsinstock)
	from products

	if @Inventory > @pLimitAmount
		begin
			print 'ATTENTION Inventaire sup�rieur � la limite';
		end
	else
		begin
			print 'BRAVO Inventaire inf�rieur � la limite';
		end
END
GO
