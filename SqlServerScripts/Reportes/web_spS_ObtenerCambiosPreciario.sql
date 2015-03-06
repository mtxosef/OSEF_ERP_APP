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
			WHERE  name = 'web_spS_ObtenerCambiosPreciario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCambiosPreciario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Obtener un registro de Clientes por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCambiosPreciario
	-- Add the parameters for the stored procedure here
	@idconcepto CHAR(10),	
	@idpreciario CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT V.Sucursal,V.Observaciones,V.Preciario,P.Descripcion,S.Nombre,S.CR,S.Calle,
S.NoExterior,S.NoInterior,S.CodigoPostal,S.Colonia,S.Estado,S.Municipio,VD.ConceptoID,
PC.Descripcion AS DESC_CONCEPTO,PC.Utilizada,PC.Cantidad ,V.FechaEmision, IVD.Nombre,IVD.Direccion,PC.Categoria,
PC.SubCategoria,PC.SubSubCategoria,PC.Unidad,PC.ImporteFinal, PC.Importe,PC.CLAVE,PC.Costo
FROM Volumetrias V
LEFT JOIN VolumetriasD VD 
ON V.ID= VD.Volumetria
LEFT JOIN ImagenesVolumetriasD IVD 
ON IVD.Volumetria =  V.ID
LEFT JOIN PreciarioS P 
ON P.ID = V.Preciario
LEFT JOIN PreciarioConceptos PC 
ON PC.Preciario = P.ID AND VD.ConceptoID = PC.ID
LEFT JOIN Sucursales S
ON S.ID = V.Sucursal
WHERE VD.ConceptoID=@idconcepto
AND V.Preciario=@idpreciario

END
GO