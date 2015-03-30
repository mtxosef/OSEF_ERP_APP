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
			WHERE  name = 'web_spS_ObtenerPreciarioGeneralSubCategoriasPorPreciario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarioGeneralSubCategoriasPorPreciario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 26 de Marzo de 2015
-- Description:	Obtener todas las SubCategorias por el ID del Preciario
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarioGeneralSubCategoriasPorPreciario
	-- Add the parameters for the stored procedure here
	@Preciario	CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		CLAVE,
		Preciario,
		Descripcion,
		Categoria,
		Usuario,
		Estatus,
		FechaAlta
	FROM
		PreciariosGeneralesSubCategorias
	WHERE
		Preciario = @Preciario
END
GO