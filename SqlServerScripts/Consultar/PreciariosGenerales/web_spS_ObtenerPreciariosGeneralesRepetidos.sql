
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
			WHERE  name = 'web_spS_ObtenerPreciariosGeneralesRepetidos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciariosGeneralesRepetidos
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 14 de Enero de 2015
-- Description:	Obtener los registros de Sucursales por su Revisi�n
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciariosGeneralesRepetidos
	-- Add the parameters for the stored procedure here
@Descripcion VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    	IF EXISTS(SELECT A.Descripcion FROM PreciariosGenerales A  WHERE A.Descripcion = @Descripcion)
	BEGIN
		SELECT CAST(1 AS BIT)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT)
	END
	
	
	
END
GO

