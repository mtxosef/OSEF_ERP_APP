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
-- Author:		Giovanni Flores
-- Create date: 15-04-2015
-- Description:	Obtiene los codigos PPTA por ID 
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerCodigoPPTAPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCodigoPPTAPorID
GO
CREATE PROCEDURE web_spS_ObtenerCodigoPPTAPorID
	-- Add the parameters for the stored procedure here 
	@ID CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 
	cf.ID, 
	cf.Especialidad, 
	cf.Familia,
	cf.SubEspecialidad,
	cf.CodigoMainSaver, 
	cf.Descripcion, 
	cf.Dias, 
	cf.Prioridad, 
	cf.TiempoEstimado 
	FROM CodigoPPTA cf WHERE cf.ID = @ID;
END
GO
