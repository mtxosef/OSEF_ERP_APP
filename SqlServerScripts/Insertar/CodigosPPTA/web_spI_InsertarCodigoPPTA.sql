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
-- Author:		Giovanni Flores
-- Create date: 15/04/2015 12:11:59
-- Description:	Agrega un nuevo codigo de falla 
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spI_InsertarCodigoPPTA' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCodigoPPTA
GO 
CREATE PROCEDURE web_spI_InsertarCodigoPPTA
	-- Add the parameters for the stored procedure here
	@ID						CHAR(10) OUTPUT,
	@Especialidad			CHAR(10),
	@Familia				VARCHAR(100),
	@SubEspecialidad			CHAR(10),
	@CodigoMainSaver		VARCHAR(50),
	@Descripcion			VARCHAR(500),
	@Dias					CHAR(5),
	@Prioridad				CHAR(2),
	@TiempoEstimado			CHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) FROM Cuadrillas WHERE ID LIKE 'CF%'
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
			SET @VALOR = 'CF0000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'CF000000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'CF00000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'CF0000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'CF000' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE  IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'CF00' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE IF ((@ID_TEMP / 10000000) < 1)
		BEGIN
			SET @VALOR = 'CF0' + CAST(@ID_TEMP AS CHAR(7))
		END
		ELSE 
		BEGIN
			SET @VALOR ='CF'+CAST(@ID_TEMP AS CHAR(8))
		END
		
		SELECT @ID = @VALOR; 
    -- Insert statements for procedure here  

INSERT INTO [dbo].[CodigoFallas]
           ([ID]
           ,[Especialidad]
           ,[Familia]
           ,[SubEspecialidades]
           ,[CodigoMainSaver]
           ,[Descripcion]
           ,[Dias]
           ,[Prioridad]
           ,[TiempoEstimado])  
     VALUES
           (@ID,
		   @Especialidad,
		   @Familia,
		   @SubEspecialidad,
		   @CodigoMainSaver,
		   @Descripcion,
		   @Dias,
		   @Prioridad,
		   @TiempoEstimado);
END
