USE [Cars]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCarInfo]    Script Date: 2020. 07. 22. 23:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCarInfo]
(
	@ModelID int,
	@DetailsID int,

	/*Models table*/
	@ModelName nvarchar(25),
	@CompanyName nvarchar(50),

	/*Details table*/
	@FirstRegistration date,
	@Price money,
	@FuelType nvarchar(10),
	@Colour nvarchar (10),
	@Mileage decimal(18,0),
	@Transmission nchar(20)
	
)
AS
BEGIN
	DECLARE @CompanyID int
	IF @CompanyName = 'Audi'
		SET @CompanyID = 1
	ELSE IF @CompanyName = 'Ford'
		SET @CompanyID = 2
	ELSE
		SET @CompanyID = 3

	UPDATE Models SET ModelName=@ModelName,CompanyID=@CompanyID WHERE ModelID = @ModelID
	UPDATE Details SET FirstRegistration = @FirstRegistration,Price = @Price,FuelType = @FuelType,Colour = @Colour,Mileage = @Mileage,Transmission = @Transmission WHERE DetailsID = @DetailsID
END
GO
