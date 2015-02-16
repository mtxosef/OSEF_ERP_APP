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
			WHERE  name = 'web_spS_ObtenerClientePorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerClientePorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Obtener un registro de Clientes por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerClientePorID
	-- Add the parameters for the stored procedure here
	@ID	CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Nombre,
		APaterno,
		AMaterno,
		RFC,
		CURP,
		FechaNacimiento,
		Edad,
		Sexo,
		EstadoCivil,
		Profesion,
		Correo,
		Telefono,
		TelefonoMovil,
		Calle,
		NoExterior,
		NoInterior,
		Colonia,
		CodigoPostal,
		EntreCalles,
		Estado,
		Municipio,
		Empresa,
		EmpresaCalle,
		EmpresaNoExterior,
		EmpresaNoInterior,
		EmpresaColonia,
		EmpresaCodigoPostal,
		EmpresaEntreCalles,
		EmpresaEstado,
		EmpresaMunicipio,
		EmpresaTelefono,
		EmpresaTelefonoExt,
		Puesto,
		TipoSocio,
		NumeroSocio,
		FechaAlta,
		Estatus,
		Usuario
	FROM
		Clientes
	WHERE
		ID = @ID
END
GO