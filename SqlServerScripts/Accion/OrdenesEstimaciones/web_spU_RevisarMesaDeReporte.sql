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
			WHERE  name = 'web_spU_RevisarMesaDeReporte' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_RevisarMesaDeReporte
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 01 de Junio de 2015
-- Description:	Revisa un registro de Mesa de Reporte con estatus concluido y MovLinea 1
-- =============================================
CREATE PROCEDURE web_spU_RevisarMesaDeReporte
	-- Add the parameters for the stored procedure here
	@ID				INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
    -- Insert statements for procedure here  
	DECLARE @Revisado BIT;
	SET @Revisado = (SELECT oe.Revisado FROM OrdenesEstimaciones oe WHERE oe.ID = @ID); 
	IF @Revisado = 0
		BEGIN
			UPDATE OrdenesEstimaciones
			SET Revisado = 1
			WHERE ID = @ID
		END 
	ELSE
			UPDATE OrdenesEstimaciones
			SET Revisado = 0
			WHERE ID = @ID;
	END 
GO