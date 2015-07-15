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
			WHERE  name = 'web_spI_InsertarAhorroD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarAhorroD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 29 de Junio de 2015
-- Description:	Insertar un registro de AhorrosD
-- =============================================
CREATE PROCEDURE web_spI_InsertarAhorroD
	-- Add the parameters for the stored procedure here
	@Ahorro			INT,
	@Renglon		TINYINT,
	@Articulo		CHAR(2),
	@SaldoAnterior	MONEY,
	@Importe		MONEY,
	@Saldo			MONEY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	INSERT INTO
		AhorrosD
		(
			Ahorro,
			Renglon,
			Articulo,
			SaldoAnterior,
			Importe,
			Saldo
		)
	VALUES
		(
			@Ahorro,
			@Renglon,
			@Articulo,
			@SaldoAnterior,
			@Importe,
			@Saldo
		)
END
GO