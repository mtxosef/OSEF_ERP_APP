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
			WHERE  name = 'web_spU_ActualizarPreciario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarPreciario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 21 de Enero de 2015
-- Description:	Actualizar un registro de Preciario por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarPreciario
	-- Add the parameters for the stored procedure here
	@ID				CHAR(7) OUTPUT,
	@Descripcion	VARCHAR(50),
	@Sucursal		CHAR(10),
	@Archivo		VARCHAR(200),
	@Estatus		VARCHAR(20),
	@FechaAlta		SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Preciario
	SET
		Descripcion = @Descripcion,
		Sucursal = @Sucursal,
		Archivo = @Archivo,
		Estatus = @Estatus,
		FechaAlta = @FechaAlta
	WHERE
		ID = @ID
END
GO