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
-- Author:		Giovanni Flores
-- Create date: Miercoles 25 de Febrero de 2015
-- Description:	Obtiene los cambios en el preciario
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCambiosPreciarios
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here or any select
SELECT        V.Observaciones, V.Preciario, P.Descripcion, S.Nombre, S.CR, S.Calle, S.NoExterior, S.NoInterior, S.CodigoPostal, S.Colonia, VD.ConceptoID, 
                         PC.Descripcion AS DESC_CONCEPTO, PC.Utilizada, PC.Cantidad, V.FechaEmision, IVD.Nombre AS Expr1, IVD.Direccion, PC.Categoria, PC.SubCategoria, 
                         PC.SubSubCategoria, PC.Unidad, PC.ImporteFinal, PC.Importe, PC.CLAVE, PC.Costo, dbo.Estados.Descripcion AS Estado, 
                         dbo.Municipios.Descripcion AS Municipios
FROM            dbo.Municipios INNER JOIN
                         dbo.Sucursales AS S ON dbo.Municipios.ID = S.Municipio INNER JOIN
                         dbo.Estados ON dbo.Municipios.Estado = dbo.Estados.ID AND S.Estado = dbo.Estados.ID RIGHT OUTER JOIN
                         dbo.Volumetrias AS V LEFT OUTER JOIN
                         dbo.Preciarios AS P ON P.ID = V.Preciario LEFT OUTER JOIN
                         dbo.VolumetriasD AS VD ON V.ID = VD.Volumetria LEFT OUTER JOIN
                         dbo.ImagenesVolumetriasD AS IVD ON IVD.Volumetria = V.ID LEFT OUTER JOIN
                         dbo.PreciarioConceptos AS PC ON PC.Preciario = P.ID AND VD.ConceptoID = PC.ID ON S.ID = V.Sucursal;
END
