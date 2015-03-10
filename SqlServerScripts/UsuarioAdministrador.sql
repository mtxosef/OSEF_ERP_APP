USE [OSEF_ERP]
GO

INSERT INTO [dbo].[Usuarios]
           ([ID]
           ,[Correo]
           ,[Nombre]
           ,[APaterno]
           ,[AMaterno]
           ,[Contrasena]
           ,[Estatus]
           ,[Bloqueado]
           ,[EnLinea]
           ,[FechaAlta]
           ,[FechaBloqueo]
           ,[UltimoAcceso]
           ,[CambioContrasena])
     VALUES('Admin',
           'christian.m.m91@gmail.com',
           'Administrador',
           ''
           ,''
           ,'abcd1234'
           ,'ALTA'
           ,0
           ,0
           ,'2015-03-02 18:48:00'
           ,''
           ,''
           ,'')
GO