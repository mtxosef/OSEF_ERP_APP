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
			WHERE  name = 'web_spS_AvanzarMesaReportePorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_AvanzarMesaReportePorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 03 de Febrero de 2015
-- Description:	Avanzar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_AvanzarMesaReportePorID
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Mov		VARCHAR(50),
	@IDNuevo	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE
		@MovA			VARCHAR(50),
		@MovID			VARCHAR(10),
		@Origen			VARCHAR(50),
		@OrigenID		VARCHAR(10),
		@Sucursal		CHAR(10),
		@FechaEmision	SMALLDATETIME,
		@Observaciones	VARCHAR(200),
		@Estatus		VARCHAR(20),
		@Usuario		VARCHAR(50),
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
		@Zona			VARCHAR(80),
		@Cuadrilla		VARCHAR(200),
		@ImporteTotal	DECIMAL(20,2) 
		
	SELECT
		@MovA = Mov,
		@MovID = MovID,
		@Origen = Origen,
		@OrigenID = OrigenID,
		@Sucursal = Sucursal,
		@FechaEmision = FechaEmision,
		@Observaciones = Observaciones,
		@Estatus = Estatus,
		@Usuario = Usuario,
		@Reporte = Reporte,
		@Division = Division,
		@FechaOrigen =  FechaOrigen,
		@FechaMaximaAtencion = FechaMaximaAtencion,
		@DiasAtencion = DiasAtencion,
		@Reporto = Reporto,
		@TrabajoRequerido = TrabajoRequerido,
		@Atiende = Atiende,
		@TrabajoRealizado = TrabajoRealizado,
		@CodigoFalla = CodigoFalla,
		@TieneFotos	= TieneFotos,
		@TieneReporte = TieneReporte,
		@FechaLlegada = FechaLlegada,
		@HoraLlegada = HoraLlegada,
		@FechaFinActividad = FechaFinActividad,
		@HoraFinActividad = HoraFinActividad,
		@Zona = Zona,
		@Cuadrilla = Cuadrilla,
		@ImporteTotal = ImporteTotal
	FROM
		OrdenesEstimaciones
	WHERE
		ID = @ID
		
	INSERT INTO
		OrdenesEstimaciones
		(
			Mov,
			MovID,
			Origen,
			OrigenID,
			Sucursal,
			FechaEmision,
			Observaciones,
			Estatus,
			Usuario,
			Reporte,
			Division,
			FechaOrigen,
			FechaMaximaAtencion,
			DiasAtencion,
			Reporto,
			TrabajoRequerido,
			Atiende,
			TrabajoRealizado,
			CodigoFalla ,
			TieneFotos	,
			TieneReporte,
			FechaLlegada ,
			HoraLlegada ,
			FechaFinActividad ,
			HoraFinActividad ,
			Zona ,
			Cuadrilla,
			ImporteTotal
		)
	VALUES
		(
			@Mov,
			NULL,
			@MovA,
			@MovID,
			@Sucursal,
			GETDATE(),
			NULL,
			'PENDIENTE',
			@Usuario,
			@Reporte,
			@Division,
			@FechaOrigen,
			@FechaMaximaAtencion,
			@DiasAtencion,
			@Reporto,
			@TrabajoRequerido,
			@Atiende,
			@TrabajoRealizado,
			@CodigoFalla ,
			@TieneFotos	,
			@TieneReporte ,
			@FechaLlegada ,
			@HoraLlegada ,
			@FechaFinActividad ,
			@HoraFinActividad ,
			@Zona ,
			@Cuadrilla,
			@ImporteTotal
		)
	
	SELECT @IDNuevo = SCOPE_IDENTITY()
    
END
GO