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
	@CodigoMainSaver		CHAR(50) OUTPUT,
	@Especialidad			CHAR(10),
	@Familia				CHAR(10),
	@SubEspecialidad		CHAR(10), 
	@Descripcion			VARCHAR(500),
	@Dias					CHAR(5),
	@Prioridad				CHAR(2),
	@TiempoEstimado			CHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
    -- Insert statements for procedure here  
	
INSERT INTO [dbo].[CodigoPPTA]
           ([CodigoMainSaver]
           ,[Especialidad]
           ,[Familia]
           ,[SubEspecialidad]
           ,[Descripcion]
           ,[Dias]
           ,[Prioridad]
           ,[TiempoEstimado])
     VALUES
           (@CodigoMainSaver,
		   @Especialidad,
		   @Familia,
		   @SubEspecialidad,
		   @Descripcion,
		   @Dias,
		   @Prioridad,
		   @TiempoEstimado); 

END
