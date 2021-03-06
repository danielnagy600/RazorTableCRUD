USE [Cars]
GO
/****** Object:  StoredProcedure [dbo].[InsertCarInfo]    Script Date: 2020. 07. 22. 23:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCarInfo]
(
	/*Models table*/
	@ModelName nvarchar(25)= '',
	@CompanyName nvarchar(50)='',

	/*Details table*/
	@FirstRegistration date,
	@Price money= '',
	@FuelType nvarchar(10)= '',
	@Colour nvarchar (10)= '',
	@Mileage decimal(18,0)= '',
	@Transmission nchar(20)= ''
)
AS
BEGIN
	/*SET CompanyID*/
	DECLARE @CompanyID int
	DECLARE @DetailsID int

	IF @CompanyName = 'Audi'
		SET @CompanyID = 1
	ELSE IF @CompanyName = 'Ford'
		SET @CompanyID = 2
	ELSE
		SET @CompanyID = 3
	/*Store Details*/
	INSERT INTO Details (FirstRegistration,Price,FuelType,Colour,Mileage,Transmission) VALUES(@FirstRegistration,@Price,@FuelType,@Colour,@Mileage,@Transmission)
	SET @DetailsID = (SELECT MAX(DetailsID) FROM Details)
	/*Store Models*/
	INSERT INTO Models(CompanyID,ModelName,DetailsID) VALUES (@CompanyID,@ModelName,@DetailsID)
END
GO
