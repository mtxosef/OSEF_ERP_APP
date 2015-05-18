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
			WHERE  name = 'web_spS_ObtenerOrdenesCambios' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerOrdenesCambios
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Obtener todos los registros de Revisiones
-- =============================================
CREATE PROCEDURE web_spS_ObtenerOrdenesCambios
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Mov,
		MovID,
		Sucursal,
		FechaEmision,
		Observaciones,
		Estatus,
		Usuario,
		Origen,
		OrigenID,
		Reporte,
		Division,
		FechaOrigen,
		FechaMaximaAtencion,
		DiasAtencion,
		Reporto,
		TrabajoRequerido,
		TrabajoRealizado,
		CodigoFalla,
		FechaLlegada,
		HoraLlegada,
		FechaFinActividad,
		HoraFinActividad,
		Cuadrilla,
		ImporteTotal,
		HoraOrigen,
		RutaImagen
	FROM
		OrdenesEstimaciones
	WHERE 
	 Mov ='Orden de Cambio'
END
GO