-- Cambio 25 de Enero 2015
-- Cambio 3 de Febreo 2015
ALTER TABLE Revisiones ADD Origen VARCHAR(50) NULL
ALTER TABLE Revisiones ADD OrigenID VARCHAR(50) NULL


--Cambio 8 de Febrero 2015
ALTER TABLE Clientes ADD TipoSocio VARCHAR(20) NOT NULL
ALTER TABLE Clientes ADD NumeroSocio VARCHAR(11) NULL

--Cambio 9 de Febrero 2015
ALTER TABLE Clientes ADD EmpresaTelefonoExt INT NULL

--Cambio 16 de Febrero 2015
ALTER TABLE Clientes ALTER COLUMN TelefonoMovil VARCHAR(19) NULL
ALTER TABLE Clientes ADD EmpresaEstado CHAR(2) NULL FOREIGN KEY REFERENCES Estados(ID)
ALTER TABLE Clientes ADD EmpresaMunicipio CHAR(4) NULL FOREIGN KEY REFERENCES Municipios(ID)

--Cambio 18 de Febrero 2015
ALTER TABLE Volumetrias ADD Origen VARCHAR(50) NULL
ALTER TABLE Volumetrias ADD OrigenID VARCHAR(50) NULL

--Cambio 18 de Febrero 2015
ALTER TABLE PreciarioConceptos ADD Utilizada DECIMAL(10,2) NULL

--Cambio 21 de Febrero 2015
ALTER TABLE Volumetrias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 21 de Febrero 2015
ALTER TABLE Preciarios ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 3 de Marzo 2015
ALTER TABLE PreciarioConceptos ADD ImporteFinal DECIMAL(20,2) NULL 


