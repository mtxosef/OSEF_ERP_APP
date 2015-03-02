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
	@Utilizada		DECIMAL(10,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @PRECIO DECIMAL (20,2),
@TOTALFINAL DECIMAL(20,2)

SELECT 
@PRECIO = Costo 
FROM 
PreciarioConceptos 
WHERE 
ID =  @ID
SET 
@TOTALFINAL = @PRECIO * @Utilizada

    -- UPDATE statements for procedure here
    UPDATE
		PreciarioConceptos
	SET
		Utilizada =@Utilizada,
		ImporteFinal = @TOTALFINAL
		
	WHERE
		ID = @ID
END
GO