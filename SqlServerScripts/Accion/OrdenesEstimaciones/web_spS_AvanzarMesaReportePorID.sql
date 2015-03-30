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
		@Usuario		VARCHAR(50)
	SELECT
		@MovA = Mov,
		@MovID = MovID,
		@Origen = Origen,
		@OrigenID = OrigenID,
		@Sucursal = Sucursal,
		@FechaEmision = FechaEmision,
		@Observaciones = Observaciones,
		@Estatus = Estatus,
		@Usuario = Usuario
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
			Usuario
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
			@Usuario
		)
	
	SELECT @IDNuevo = SCOPE_IDENTITY()
    
END
GO