USE [Cars]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCarInfo]    Script Date: 2020. 07. 22. 23:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCarInfo]
(
	@ModelID int
)
AS
BEGIN
	DECLARE @DetailsID int
	SET @DetailsID = (SELECT DetailsID FROM Models WHERE ModelID=@ModelID)

	DELETE FROM dbo.Models WHERE ModelID = @ModelID
	DELETE FROM dbo.Details WHERE DetailsID = @DetailsID
END
GO
