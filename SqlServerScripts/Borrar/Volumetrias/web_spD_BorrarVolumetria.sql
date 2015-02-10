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
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spD_BorrarVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarVolumetria
GO
-- =============================================
-- Author:		Christian Medina
-- Create date: Martes 10 de Febrero de 2015
-- Description:	Borrar un registro de Volumetria por su ID
-- =============================================
CREATE PROCEDURE web_spD_BorrarVolumetria
	-- Add the parameters for the stored procedure here
	@ID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM
		Volumetrias
	WHERE
		ID = @ID
END
GO