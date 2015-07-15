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
			WHERE  name = 'web_spI_InsertarAhorro' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarAhorro
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 29 de Junio de 2015
-- Description:	Insertar un registro de Ahorros
-- =============================================
CREATE PROCEDURE web_spI_InsertarAhorro
	-- Add the parameters for the stored procedure here
	@ID				INT OUTPUT,
	@Mov			VARCHAR(50),
	@MovID			VARCHAR(10),
	@FechaEmision	SMALLDATETIME,
	@Cliente		CHAR(8),
	@Importe		MONEY,
	@Saldo			MONEY,
	@Usuario		VARCHAR(50),
	@Estatus		VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		-- Insert statements for procedure here
	INSERT INTO
		Ahorros
		(
			Mov,
			MovID,
			FechaEmision,
			Cliente,
			Importe,
			Saldo,
			Usuario,
			Estatus
		)
	VALUES 
		(
			@Mov,
			@MovID,
			@FechaEmision,
			@Cliente,
			@Importe,
			@Saldo,
			@Usuario,
			@Estatus
		)
			
	SELECT @ID = SCOPE_IDENTITY()
END
GO