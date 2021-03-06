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
			WHERE  name = 'web_spI_InsertarSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 06 de Abril de 2015
-- Description:	Insertar un registro de Solicitud de Prestamo
-- =============================================
CREATE PROCEDURE web_spI_InsertarSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@ID							CHAR(8),
	@Cliente					CHAR(8),
	@Nacionalidad				VARCHAR(20),
	@NumeroDependientes			TINYINT,
	@Edades						VARCHAR(10),
	@RegistroMatrimonial		VARCHAR(50),
	@TipoCasa					VARCHAR(50),
	@AniosDomicilio				TINYINT,
	@CalleAnterior				VARCHAR(100),
	@NoExteriorAnterior			VARCHAR(10),
	@NoInteriorAnterior			VARCHAR(10),
	@ColoniaAnterior			CHAR(10),
	@CodigoPostalAnterior		INT,
	@EntreCallesAnterior		VARCHAR(100),
	@EstadoAnterior				CHAR(2),
	@MunicipioAnterior			CHAR(4),
	@Antiguedad					TINYINT,
	@Ingresos					SMALLINT,
	@OtrosIngresos				SMALLINT,
	@Concepto					VARCHAR(100),
	@JefeNombre					VARCHAR(50),
	@JefeAPAterno				VARCHAR(50),
	@JefeAMaterno				VARCHAR(50),
	@EmpresaAnterior			VARCHAR(50),
	@ConyugeNombre				VARCHAR(50),
	@ConyugeAPaterno			VARCHAR(50),
	@ConyugeAMaterno			VARCHAR(50),
	@ConyugeFechaNacimiento		DATE,
	@ConyugeEdad				TINYINT,
	@ConyugeRFC					VARCHAR(15),
	@ConyugeTelefono			VARCHAR(15),
	@ConyugeTelefonoMovil		VARCHAR(19),
	@ConyugeCalle				VARCHAR(100),
	@ConyugeEntreCalles			VARCHAR(100),
	@ConyugeNoExterior			VARCHAR(10),
	@ConyugeNoInterior			VARCHAR(10),
	@ConyugeColonia				CHAR(10),
	@ConyugeCodigoPostal		INT,
	@ConyugeEstado				CHAR(2),
	@ConyugeMunicipio			CHAR(4),
	@ConyugeAntiguedad			TINYINT,
	@ConyugeIngresos			SMALLINT,
	@ConyugeOtrosIngresos		SMALLINT,
	@ConyugeConcepto			VARCHAR(100),
	@ConyugeEmpresa				VARCHAR(50),
	@ConyugePuesto				VARCHAR(50),
	@ConyugeEmpresaCalle		VARCHAR(100),
	@ConyugeEmpresaNoExterior	VARCHAR(10),
	@ConyugeEmpresaNoInterior	VARCHAR(10),
	@ConyugeEmpresaColonia		CHAR(10),
	@ConyugeEmpresaCodigoPostal	INT,
	@ConyugeEmpresaEntreCalles	VARCHAR(100),
	@ConyugeEmpresaEstado		CHAR(2),
	@ConyugeEmpresaMunicipio	CHAR(4),
	@ConyugeEmpresaJefeNombre	VARCHAR(50),
	@ConyugeEmpresaJefeAPaterno	VARCHAR(50),
	@ConyugeEmpresaJefeAMaterno	VARCHAR(50),
	@AvalNombre					VARCHAR(50),
	@AvalAPaterno				VARCHAR(50),
	@AvalAMaterno				VARCHAR(50),
	@AvalSocio					BIT,
	@AvalEstadoCivil			VARCHAR(10),
	@AvalRegistroMatrimonial	VARCHAR(50),
	@AvalTelefono				VARCHAR(15),
	@AvalTelefonoMovil			VARCHAR(19),
	@AvalCalle					VARCHAR(100),
	@AvalEntreCalles			VARCHAR(100),
	@AvalNoExterior				VARCHAR(10),
	@AvalNoInterior				VARCHAR(10),
	@AvalColonia				CHAR(10),
	@AvalCodigoPostal			INT,
	@AvalEstado					CHAR(2),
	@AvalMunicipio				CHAR(4),
	@AvalTipoCasa				VARCHAR(20),
	@AvalAntiguedad				TINYINT,
	@AvalEmpresa				VARCHAR(50),
	@AvalEmpresaPuesto			VARCHAR(50),
	@AvalEmpresaJefeNombre		VARCHAR(50),
	@AvalEmpresaJefeAPaterno	VARCHAR(50),
	@AvalEmpresaJefeAMaterno	VARCHAR(50),
	@AvalEmpresaAntiguedad		TINYINT,
	@AvalEmpresaIngresos		INT,
	@AvalEmpresaOtrosIngresos	INT,
	@AvalEmpresaConcepto		VARCHAR(50),
	@AvalEmpresaPropietario		BIT,
	@AvalEmpresaTipo			VARCHAR(20),
	@AvalEmpresaTelefono		VARCHAR(15),
	@AvalEmpresaTelefonoExt		SMALLINT,
	@AvalEmpresaAnterior		VARCHAR(50),
	@Cantidad					INT,
	@Plazo						SMALLINT,
	@FormaPago					VARCHAR(20),
	@DestinoPrestamo			VARCHAR(50),
	@Tipo						VARCHAR(30),
	@TablaAmortizacion			VARCHAR(200),
	@Estatus					VARCHAR(20),
	@UsuarioAlta				VARCHAR(50),
	@FechaAlta					SMALLDATETIME,
	@UsuarioModificacion		VARCHAR(50),
	@FechaModificacion			SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Formar el ID
	--DECLARE
	--	@ID_TEMP INT,
	--	@VALOR CHAR(8)
		
	--	SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) FROM SolicitudesPrestamos WHERE ID LIKE 'SP%'
	--	IF (@ID_TEMP IS NOT NULL)
	--	BEGIN
	--		SET @ID_TEMP = @ID_TEMP + 1
	--	END
	--	ELSE
	--	BEGIN
	--		SET @ID_TEMP = 1
	--	END

	--	--DECIMAL
	--	IF ((@ID_TEMP / 10) < 1)
	--	BEGIN
	--		SET @VALOR = 'SP00000' + CAST(@ID_TEMP AS CHAR(1))
	--	END
	--	ELSE IF ((@ID_TEMP / 100) < 1)
	--	BEGIN
	--		SET @VALOR = 'SP0000' + CAST(@ID_TEMP AS CHAR(2))
	--	END
	--	ELSE IF ((@ID_TEMP / 1000) < 1)
	--	BEGIN
	--		SET @VALOR = 'SP000' + CAST(@ID_TEMP AS CHAR(3))
	--	END
	--	ELSE IF ((@ID_TEMP / 10000) < 1)
	--	BEGIN
	--		SET @VALOR = 'SP00' + CAST(@ID_TEMP AS CHAR(4))
	--	END
	--	ELSE IF ((@ID_TEMP / 100000) < 1)
	--	BEGIN
	--		SET @VALOR = 'SP0' + CAST(@ID_TEMP AS CHAR(5))
	--	END
	--	ELSE
	--	BEGIN
	--		SET @VALOR = 'SP' + CAST(@ID_TEMP AS CHAR(6))
	--	END
		
	--	SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			SolicitudesPrestamos
			(
				ID,
				Cliente,
				Nacionalidad,
				NumeroDependientes,
				Edades,
				RegistroMatrimonial,
				TipoCasa,
				AniosDomicilio,
				CalleAnterior,
				NoExteriorAnterior,
				NoInteriorAnterior,
				ColoniaAnterior,
				CodigoPostalAnterior,
				EntreCallesAnterior,
				EstadoAnterior,
				MunicipioAnterior,
				Antiguedad,
				Ingresos,
				OtrosIngresos,
				Concepto,
				JefeNombre,
				JefeAPAterno,
				JefeAMaterno,
				EmpresaAnterior,
				ConyugeNombre,
				ConyugeAPaterno,
				ConyugeAMaterno,
				ConyugeFechaNacimiento,
				ConyugeEdad,
				ConyugeRFC,
				ConyugeTelefono,
				ConyugeTelefonoMovil,
				ConyugeCalle,
				ConyugeEntreCalles,
				ConyugeNoExterior,
				ConyugeNoInterior,
				ConyugeColonia,
				ConyugeCodigoPostal,
				ConyugeEstado,
				ConyugeMunicipio,
				ConyugeAntiguedad,
				ConyugeIngresos,
				ConyugeOtrosIngresos,
				ConyugeConcepto,
				ConyugeEmpresa,
				ConyugePuesto,
				ConyugeEmpresaCalle,
				ConyugeEmpresaNoExterior,
				ConyugeEmpresaNoInterior,
				ConyugeEmpresaColonia,
				ConyugeEmpresaCodigoPostal,
				ConyugeEmpresaEntreCalles,
				ConyugeEmpresaEstado,
				ConyugeEmpresaMunicipio,
				ConyugeEmpresaJefeNombre,
				ConyugeEmpresaJefeAPaterno,
				ConyugeEmpresaJefeAMaterno,
				AvalNombre,
				AvalAPaterno,
				AvalAMaterno,
				AvalSocio,
				AvalEstadoCivil,
				AvalRegistroMatrimonial,
				AvalTelefono,
				AvalTelefonoMovil,
				AvalCalle,
				AvalEntreCalles,
				AvalNoExterior,
				AvalNoInterior,
				AvalColonia,
				AvalCodigoPostal,
				AvalEstado,
				AvalMunicipio,
				AvalTipoCasa,
				AvalAntiguedad,
				AvalEmpresa,
				AvalEmpresaPuesto,
				AvalEmpresaJefeNombre,
				AvalEmpresaJefeAPaterno,
				AvalEmpresaJefeAMaterno,
				AvalEmpresaAntiguedad,
				AvalEmpresaIngresos,
				AvalEmpresaOtrosIngresos,
				AvalEmpresaConcepto,
				AvalEmpresaPropietario,
				AvalEmpresaTipo,
				AvalEmpresaTelefono,
				AvalEmpresaTelefonoExt,
				AvalEmpresaAnterior,
				Cantidad,
				Plazo,
				FormaPago,
				DestinoPrestamo,
				Tipo,
				TablaAmortizacion,
				Estatus,
				UsuarioAlta,
				FechaAlta,
				UsuarioModificacion,
				FechaModificacion
			)
		VALUES 
			(
				@ID,
				@Cliente,
				@Nacionalidad,
				@NumeroDependientes,
				@Edades,
				@RegistroMatrimonial,
				@TipoCasa,
				@AniosDomicilio,
				@CalleAnterior,
				@NoExteriorAnterior,
				@NoInteriorAnterior,
				@ColoniaAnterior,
				@CodigoPostalAnterior,
				@EntreCallesAnterior,
				@EstadoAnterior,
				@MunicipioAnterior,
				@Antiguedad,
				@Ingresos,
				@OtrosIngresos,
				@Concepto,
				@JefeNombre,
				@JefeAPAterno,
				@JefeAMaterno,
				@EmpresaAnterior,
				@ConyugeNombre,
				@ConyugeAPaterno,
				@ConyugeAMaterno,
				@ConyugeFechaNacimiento,
				@ConyugeEdad,
				@ConyugeRFC,
				@ConyugeTelefono,
				@ConyugeTelefonoMovil,
				@ConyugeCalle,
				@ConyugeEntreCalles,
				@ConyugeNoExterior,
				@ConyugeNoInterior,
				@ConyugeColonia,
				@ConyugeCodigoPostal,
				@ConyugeEstado,
				@ConyugeMunicipio,
				@ConyugeAntiguedad,
				@ConyugeIngresos,
				@ConyugeOtrosIngresos,
				@ConyugeConcepto,
				@ConyugeEmpresa,
				@ConyugePuesto,
				@ConyugeEmpresaCalle,
				@ConyugeEmpresaNoExterior,
				@ConyugeEmpresaNoInterior,
				@ConyugeEmpresaColonia,
				@ConyugeEmpresaCodigoPostal,
				@ConyugeEmpresaEntreCalles,
				@ConyugeEmpresaEstado,
				@ConyugeEmpresaMunicipio,
				@ConyugeEmpresaJefeNombre,
				@ConyugeEmpresaJefeAPaterno,
				@ConyugeEmpresaJefeAMaterno,
				@AvalNombre,
				@AvalAPaterno,
				@AvalAMaterno,
				@AvalSocio,
				@AvalEstadoCivil,
				@AvalRegistroMatrimonial,
				@AvalTelefono,
				@AvalTelefonoMovil,
				@AvalCalle,
				@AvalEntreCalles,
				@AvalNoExterior,
				@AvalNoInterior,
				@AvalColonia,
				@AvalCodigoPostal,
				@AvalEstado,
				@AvalMunicipio,
				@AvalTipoCasa,
				@AvalAntiguedad,
				@AvalEmpresa,
				@AvalEmpresaPuesto,
				@AvalEmpresaJefeNombre,
				@AvalEmpresaJefeAPaterno,
				@AvalEmpresaJefeAMaterno,
				@AvalEmpresaAntiguedad,
				@AvalEmpresaIngresos,
				@AvalEmpresaOtrosIngresos,
				@AvalEmpresaConcepto,
				@AvalEmpresaPropietario,
				@AvalEmpresaTipo,
				@AvalEmpresaTelefono,
				@AvalEmpresaTelefonoExt,
				@AvalEmpresaAnterior,
				@Cantidad,
				@Plazo,
				@FormaPago,
				@DestinoPrestamo,
				@Tipo,
				@TablaAmortizacion,
				@Estatus,
				@UsuarioAlta,
				@FechaAlta,
				@UsuarioModificacion,
				@FechaModificacion
			)
END
GO