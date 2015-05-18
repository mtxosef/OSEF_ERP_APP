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
			WHERE  name = 'web_spI_InsertarOrdenEstimacion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarOrdenEstimacion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Insertar un registro de Revisiones
-- =============================================
CREATE PROCEDURE web_spI_InsertarOrdenEstimacion
	-- Add the parameters for the stored procedure here
	@ID				INT OUTPUT,
	@Mov			VARCHAR(50),
	@MovID			VARCHAR(10),
	@Sucursal		CHAR(10),
	@FechaEmision	SMALLDATETIME,
	@Observaciones	VARCHAR(200),
	@Estatus		VARCHAR(20),
	@Usuario		VARCHAR(50),
	@Origen			VARCHAR(50),
	@OrigenID		VARCHAR(50),
	@Reporte		VARCHAR(50),
	@Division		VARCHAR(30),
	@FechaOrigen	SMALLDATETIME,
	@FechaMaximaAtencion SMALLDATETIME,
	@DiasAtencion	DECIMAL(5,0),
	@Reporto		VARCHAR(100),
	@TrabajoRequerido VARCHAR(850),
	@TrabajoRealizado VARCHAR(500),
	@CodigoFalla	VARCHAR(30),
	@FechaLlegada	SMALLDATETIME,
	@HoraLlegada	DATETIME,
	@FechaFinActividad SMALLDATETIME,
	@HoraFinActividad DATETIME,
	@Cuadrilla		CHAR(10),
	@ImporteTotal	DECIMAL(20,2),
	@HoraOrigen		DATETIME,
	@RutaImagen		VARCHAR(500),
	@Atendido		VARCHAR(5)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		-- Insert statements for procedure here
	INSERT INTO
		OrdenesEstimaciones
		(
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
			CodigoFalla ,
			FechaLlegada ,
			HoraLlegada ,
			FechaFinActividad ,
			HoraFinActividad ,
			Cuadrilla,
			ImporteTotal,
			HoraOrigen,
			RutaImagen,
			Atendido
		)
	VALUES (
			@Mov,
			@MovID,
			@Sucursal,
			@FechaEmision,
			@Observaciones,
			@Estatus,
			@Usuario,
			@Origen,
			@OrigenID,
			@Reporte,
			@Division,
			@FechaOrigen,
			@FechaMaximaAtencion,
			@DiasAtencion,
			@Reporto,
			@TrabajoRequerido,
			@TrabajoRealizado,
			@CodigoFalla ,
			@FechaLlegada ,
			@HoraLlegada ,
			@FechaFinActividad ,
			@HoraFinActividad ,
			@Cuadrilla,
			@ImporteTotal,
			@HoraOrigen,
			@RutaImagen,
			@Atendido
			)
	SELECT @ID = SCOPE_IDENTITY()
END
GO