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
			WHERE  name = 'web_spI_InsertarPreciarioGeneralSubSubCategorias' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarPreciarioGeneralSubSubCategorias
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 16 de Diciembre de 2014
-- Description:	Insertar un registro de Articulo
-- =============================================
CREATE PROCEDURE web_spI_InsertarPreciarioGeneralSubSubCategorias
	-- Add the parameters for the stored procedure here
	@ID				CHAR(10) OUTPUT,
	@CLAVE			CHAR(7),
	@Preciario		VARCHAR(50),
	@Descripcion	VARCHAR(100),
	@Categoria		CHAR(10),
	@SubCategoria	CHAR(10),
	@Usuario		VARCHAR(50),
	@Estatus		VARCHAR(20),
	@FechaAlta		SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 6, LEN(ID)) AS INT)) FROM PreciariosGeneralesSubSubCategorias WHERE ID LIKE 'SSCTG%'
		IF (@ID_TEMP IS NOT NULL)
		BEGIN
			SET @ID_TEMP = @ID_TEMP + 1
		END
		ELSE
		BEGIN
			SET @ID_TEMP = 1
		END

		--DECIMAL
		IF ((@ID_TEMP / 10) < 1)
		BEGIN
			SET @VALOR = 'SSCTG0000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'SSCTG000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'SSCTG00' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'SSCTG0' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE
		BEGIN
			SET @VALOR = 'SSCTG' + CAST(@ID_TEMP AS CHAR(5))
		END
		
		SELECT @ID = @VALOR

    -- Insert statements for procedure here
    INSERT INTO
		PreciariosGeneralesSubSubCategorias
		(
			ID,
			CLAVE,
			Preciario,
			Descripcion,
			categoria,
			SubCategoria,
			Usuario,
			Estatus,
			FechaAlta
		)
	VALUES
		(
			@ID,
			@CLAVE,
			@Preciario,
			@Descripcion,
			@Categoria,
			@SubCategoria,
			@Usuario,
			@Estatus,
			@FechaAlta
		)
END
GO