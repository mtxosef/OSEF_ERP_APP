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
			WHERE  name = 'web_spS_ObtenerOrdenEstimacionDExploradorConcluidos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerOrdenEstimacionDExploradorConcluidos
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Obtener todos los registros de RevisionesD por la relaci�n con Revision
-- =============================================
CREATE PROCEDURE web_spS_ObtenerOrdenEstimacionDExploradorConcluidos
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
			OrdenesEstimacionesD.ID AS ID,
			Renglon,
			ConceptoID, 
			Cantidad,
			Unidad,
			Precio,
			Importe
		FROM 
			OrdenesEstimacionesD 
		INNER JOIN 
			OrdenesEstimaciones OE
		ON 
			OE.ID=OrdenesEstimacionesD.ID
		WHERE 
			OE.Mov IN('Mesa de reporte','Orden de Cambio') 
		AND 
			OE.Estatus= 'CONCLUIDO'
		ORDER BY OE.FechaEmision DESC

	
	
END
GO