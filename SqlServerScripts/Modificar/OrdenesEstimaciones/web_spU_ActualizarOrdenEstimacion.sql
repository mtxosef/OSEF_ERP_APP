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
			WHERE  name = 'web_spU_ActualizarOrdenEstimacion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarOrdenEstimacion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Actualizar un registro de Revision por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarOrdenEstimacion
	-- Add the parameters for the stored procedure here
	@ID				INT,
	@Mov			CHAR(50),
	@MovID			CHAR(10),
	@Sucursal		CHAR(10),
	@Observaciones	VARCHAR(200),
	@Estatus		VARCHAR(10),
	@Origen			VARCHAR(30),
	@OrigenID		VARCHAR(30),
	@Reporte		VARCHAR(50),
	@Division		VARCHAR(30),
	@FechaOrigen	SMALLDATETIME,
	@FechaMaximaAtencion SMALLDATETIME,
	@DiasAtencion	DECIMAL(5,0),
	@Reporto		VARCHAR(100),
	@TrabajoRequerido VARCHAR(850),
	@Atiende		VARCHAR(100),
	@TrabajoRealizado VARCHAR(500),
		@CodigoFalla	VARCHAR(30),
		@TieneFotos		VARCHAR(10),
		@TieneReporte	VARCHAR(10),
		@FechaLlegada	SMALLDATETIME,
	@HoraLlegada	DATETIME,
		@FechaFinActividad SMALLDATETIME,
		@HoraFinActividad DATETIME,
		@Cuadrilla		CHAR(10) ,
		@ImporteTotal	DECIMAL(20,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		OrdenesEstimaciones
	SET
		Mov = @Mov,
		MovID = @MovID,
		Sucursal = @Sucursal,
		Observaciones = @Observaciones,
		Estatus = @Estatus,
		Origen = @Origen,
		OrigenID = @OrigenID,
		Reporte = @Reporte,
		Division = @Division,
		FechaOrigen =  @FechaOrigen,
		FechaMaximaAtencion = @FechaMaximaAtencion,
		DiasAtencion = @DiasAtencion,
		Reporto = @Reporto,
		TrabajoRequerido = @TrabajoRequerido,
		Atiende = @Atiende,
		TrabajoRealizado = @TrabajoRealizado,
		CodigoFalla = @CodigoFalla,
		TieneFotos	= @TieneFotos,
		TieneReporte = @TieneReporte,
		FechaLlegada = @FechaLlegada,
		HoraLlegada = @HoraLlegada,
		FechaFinActividad = @FechaFinActividad,
		HoraFinActividad = @HoraFinActividad,
		Cuadrilla = @Cuadrilla,
		ImporteTotal = @ImporteTotal
		
	WHERE
		ID = @ID
END
GO