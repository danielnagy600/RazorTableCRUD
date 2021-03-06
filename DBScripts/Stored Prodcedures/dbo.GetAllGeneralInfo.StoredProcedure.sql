USE [Cars]
GO
/****** Object:  StoredProcedure [dbo].[GetAllGeneralInfo]    Script Date: 2020. 07. 22. 23:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllGeneralInfo]
AS
BEGIN
	SELECT *
	FROM Cars.dbo.Automakers AS a
	INNER JOIN Cars.dbo.Models AS m
		ON a.CompanyID = m.CompanyID
	INNER JOIN Cars.dbo.Details AS d
		ON m.DetailsID = d.DetailsID
END
GO
