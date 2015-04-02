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
			WHERE  name = 'web_spI_InsertarImagenOrdenEstimacionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarImagenOrdenEstimacionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 19 de Febrero de 2015
-- Description:	Insertar un registro de ImagenVolumetriaD
-- =============================================
CREATE PROCEDURE web_spI_InsertarImagenOrdenEstimacionD
	-- Add the parameters for the stored procedure here
	@ID					INT,
	@Concepto			CHAR(10),
	@Numero				VARCHAR(50),
	@Descripcion		VARCHAR(500),
	@Eje				VARCHAR(50),
	@EntreEje1			VARCHAR(50),
	@EntreEje2			VARCHAR(50),
	@Area				VARCHAR(500),
	@Largo				FLOAT,
	@Ancho				FLOAT,
	@Alto				FLOAT,
	@Cantidad			DECIMAL(10,2),
	@Total				DECIMAL(10,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		GeneradorOrdenEstimacionD
		(
			MovID,
			ConceptoID,
			Numero,
			Descripcion,
			Eje,
			EntreEje1,
			EntreEje2,
			Area,
			Largo,
			Ancho,
			Alto,
			Cantidad,
			Total
		)
	VALUES
		(
			@ID,
			@Concepto,
			@Numero,
			@Descripcion,
			@Eje,
			@EntreEje1,
			@EntreEje2,
			@Area,
			@Largo,
			@Ancho,
			@Alto,
			@Cantidad,
			@Total				
		)
END
GO