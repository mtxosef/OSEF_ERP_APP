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
-- Description:	Agrega una nueva Familia
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spI_InsertarFamilias' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarFamilias
GO 
CREATE PROCEDURE [dbo].[web_spI_InsertarFamilias]
	-- Add the parameters for the stored procedure here
	@ID						CHAR(10) OUTPUT,
	@Nombre					VARCHAR(99),
	@IDESPECIALIDAD			CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Familias WHERE ID LIKE 'FAM%'
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
			SET @VALOR = 'FAM000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'FAM00000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'FAM0000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'FAM000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'FAM00' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE  IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'FAM0' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE IF ((@ID_TEMP / 10000000) < 1)
		BEGIN
			SET @VALOR = 'FAM' + CAST(@ID_TEMP AS CHAR(7))
		END
		
		SELECT @ID = @VALOR; 
    -- Insert statements for procedure here
	
	IF NOT EXISTS(SELECT A.ID FROM [dbo].[Familias] A INNER JOIN Especialidades E ON A.Especialidad = E.ID WHERE A.Nombre = @Nombre)
	BEGIN
	 INSERT INTO [dbo].[Familias]
           ([ID]
           ,[Nombre]
		   ,[Especialidad])
     VALUES
           (@ID
           ,@Nombre
		   ,@IDESPECIALIDAD);
	END  
END 