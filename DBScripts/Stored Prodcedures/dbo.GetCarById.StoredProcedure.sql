USE [Cars]
GO
/****** Object:  StoredProcedure [dbo].[GetCarById]    Script Date: 2020. 07. 22. 23:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCarById]
(
	@ModelID int
)
AS
BEGIN
	SELECT m.ModelID,m.DetailsID,a.CompanyName,m.ModelName,d.FuelType,d.Price,d.Colour,d.FirstRegistration,d.Mileage,d.Transmission
	FROM Cars.dbo.Automakers AS a
	INNER JOIN Cars.dbo.Models AS m
		ON a.CompanyID = m.CompanyID
	INNER JOIN Cars.dbo.Details AS d
		ON m.DetailsID = d.DetailsID
	WHERE m.ModelID = @ModelID
END
GO
