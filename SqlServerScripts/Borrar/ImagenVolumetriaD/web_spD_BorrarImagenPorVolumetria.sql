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
			WHERE  name = 'web_spD_BorrarImagenPorVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarImagenPorVolumetria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 20 de Febrero de 2014
-- Description:	Obtener los registros de Imagenes Volumetrias por su Volumetria y PreciarioConcepto
-- =============================================
CREATE PROCEDURE web_spD_BorrarImagenPorVolumetria
	-- Add the parameters for the stored procedure here
	@Volumetria			INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
		ImagenesVolumetriasD
	WHERE
		Volumetria = @Volumetria 
END
GO