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
			WHERE  name = 'web_spU_ActualizarCodigoPPTA' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarCodigoPPTA
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: 15-04-2015
-- Description:	Actualizar un registro de CodigoPPTA por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarCodigoPPTA
	-- Add the parameters for the stored procedure here
	@CodigoMainSaver				VARCHAR(50) ,
	@Especialidad				VARCHAR(10),
	@Familia						VARCHAR(100),
	@SubEspecialidad				VARCHAR(10),
	@Descripcion					VARCHAR(500) ,
	@Dias						CHAR(5) ,
	@Prioridad					CHAR(2) ,
	@TiempoEstimado				CHAR(5) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 

	UPDATE [dbo].[CodigoPPTA]
	SET [Especialidad] = @Especialidad
	  ,[Familia] = @Familia
	  ,[SubEspecialidad] = @SubEspecialidad
      ,[CodigoMainSaver] = @CodigoMainSaver
      ,[Descripcion] = @Descripcion
      ,[Dias] = @Dias
      ,[Prioridad] = @Prioridad
      ,[TiempoEstimado] = @TiempoEstimado
	WHERE [dbo].[CodigoPPTA].[CodigoMainSaver] = @CodigoMainSaver;

END
GO