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
			WHERE  name = 'web_spS_ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 04 de Mayo de 2015
-- Description:	Obtener un registro de un Bien Mueble para una Solicitud de Pr�stamo por su SolicitudPrestamo
-- =============================================
CREATE PROCEDURE web_spS_ObtenerBienMuebleSolicitudPrestamoPorSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@SolicitudPrestamo	CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT
		ID,
		SolicitudPrestamo,
		Ubicacion,
		Tipo,
		Inscripcion,
		Valor
	FROM
		BienesMueblesSolicitudesPrestamos
	WHERE
		SolicitudPrestamo = @SolicitudPrestamo
END
GO