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
			WHERE  name = 'web_spS_ObtenerCambiosPreciarios' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCambiosPreciarios
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Obtener un registro de Clientes por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCambiosPreciarios
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.Volumetrias.Sucursal, dbo.Sucursales.Nombre, dbo.Sucursales.CR, dbo.Sucursales.Calle, dbo.Sucursales.EntreCalles, dbo.Sucursales.NoExterior, 
                         dbo.Sucursales.NoInterior, dbo.Sucursales.CodigoPostal, dbo.Sucursales.Colonia, dbo.Sucursales.Estado, dbo.Sucursales.Municipio, 
                         dbo.ImagenesVolumetriasD.PreciarioConcepto, dbo.VolumetriasD.ConceptoID, dbo.VolumetriasD.Cantidad, dbo.VolumetriasD.Utilizada, dbo.VolumetriasD.Volumetria, 
                         dbo.ImagenesVolumetriasD.Direccion, dbo.Volumetrias.FechaEmision, dbo.Volumetrias.Observaciones, dbo.Volumetrias.Preciario, dbo.Preciarios.Descripcion, 
                         dbo.ImagenesVolumetriasD.Nombre AS ImgVoluNombre, dbo.PreciarioConceptos.Descripcion AS PreConDescripcion, dbo.PreciarioConceptos.Categoria, 
                         dbo.PreciarioConceptos.SubCategoria, dbo.PreciarioConceptos.SubSubCategoria, dbo.PreciarioConceptos.Unidad, dbo.PreciarioConceptos.Costo, dbo.PreciarioConceptos.CLAVE AS CLAVECONCEPTO,
                         dbo.PreciarioConceptos.Cantidad AS PreConceptoCantidad, dbo.PreciarioConceptos.Utilizada AS PreConceptoUtilizada, dbo.PreciarioConceptos.Importe, 
                         dbo.PreciarioConceptos.ImporteFinal
FROM            dbo.ImagenesVolumetriasD INNER JOIN
                         dbo.PreciarioConceptos ON dbo.ImagenesVolumetriasD.PreciarioConcepto = dbo.PreciarioConceptos.ID INNER JOIN
                         dbo.Preciarios ON dbo.PreciarioConceptos.Preciario = dbo.Preciarios.ID INNER JOIN
                         dbo.Sucursales ON dbo.Preciarios.Sucursal = dbo.Sucursales.ID INNER JOIN
                         dbo.Volumetrias ON dbo.ImagenesVolumetriasD.Volumetria = dbo.Volumetrias.ID AND dbo.Preciarios.ID = dbo.Volumetrias.Preciario AND 
                         dbo.Sucursales.ID = dbo.Volumetrias.Sucursal INNER JOIN
                         dbo.VolumetriasD ON dbo.PreciarioConceptos.ID = dbo.VolumetriasD.ConceptoID AND dbo.Volumetrias.ID = dbo.VolumetriasD.Volumetria

END
GO