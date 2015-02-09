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
			WHERE  name = 'web_spU_ActualizarPreciarioConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarPreciarioConcepto
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 16 de Diciembre de 2014
-- Description:	Actualizar un Articulo por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarPreciarioConcepto
	-- Add the parameters for the stored procedure here
	@ID				CHAR(10),
	@Preciario		VARCHAR(50),
	@Descripcion	VARCHAR(2000),
	@Categoria		VARCHAR(100),
	@SubCategoria	VARCHAR(100),
	@SubSubCategoria VARCHAR(100),
	@Unidad			VARCHAR(100),
	@Costo			DECIMAL(20,2),
	@Cantidad		DECIMAL(10,2),
	@Importe		DECIMAL(20,2),
	@Estatus		VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		PreciarioConceptos
	SET
		
		Preciario =@Preciario,
		Descripcion = @Descripcion,
		Categoria = @Categoria,
		SubCategoria = @SubCategoria,
		SubSubCategoria = @SubSubCategoria,
		Unidad = @Categoria,
		Costo = @Unidad,
		Cantidad = @Cantidad,
		Importe= @Costo,
		Estatus = @Estatus
		
	WHERE
		ID = @ID
END
GO