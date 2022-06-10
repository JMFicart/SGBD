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
-- Description:	Génération des dates d'une années
-- =============================================
alter PROCEDURE usp_GenerateYearDate 
	-- Add the parameters for the stored procedure here
	@pYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @StartDate as date = concat(@pYear, '0101')
	declare @EndDate as date = concat(@pYear, '1231')
	declare @DaysCount as int

	select @DaysCount = count(calendarday) 
	from Calendar
	where year(calendarday) = @pYear;

	if @DaysCount = 0
		begin
			-- Insert statements for procedure here
			while @StartDate <= @EndDate
				begin
					insert into Calendar (calendarday) values (@StartDate);
					set @StartDate = DATEADD(day, 1, @StartDate);
				end
		end
	else
		begin
			raiserror(15600,-1,-1,'usp_GenerateYearDate')
		end

	select * 
	from Calendar
	where year(calendarday) = @pYear;
END
GO
