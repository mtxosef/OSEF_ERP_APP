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
			WHERE  name = 'web_spI_InsertarVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarVolumetria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Insertar un registro de Revisiones
-- =============================================
CREATE PROCEDURE web_spI_InsertarVolumetria
	-- Add the parameters for the stored procedure here
	@ID				INT OUTPUT,
	@Mov			VARCHAR(50),
	@MovID			VARCHAR(10),
	@Sucursal		CHAR(10),
	@FechaEmision	SMALLDATETIME,
	@Observaciones	VARCHAR(200),
	@Estatus		VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		-- Insert statements for procedure here
	INSERT INTO
		Revisiones
		(
			Mov,
			MovID,
			Sucursal,
			FechaEmision,
			Observaciones,
			Estatus
		)
	VALUES (
			@Mov,
			@MovID,
			@Sucursal,
			@FechaEmision,
			@Observaciones,
			@Estatus
			)
	SELECT @ID = SCOPE_IDENTITY()
END
GO