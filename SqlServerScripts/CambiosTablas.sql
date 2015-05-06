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

--Cambio 5 de Marzo 2015
ALTER TABLE PreciarioConceptos ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioSubCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioSubSubCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 9 de Marzo 2015
ALTER TABLE SUCURSALES ADD  DireccionZona VARCHAR(50)
ALTER TABLE SUCURSALES DROP COLUMN TerminoContrato

ALTER TABLE CLIENTES DROP COLUMN EMPRESACALLES
ALTER TABLE CLIENTES ADD  EMPRESACALLE VARCHAR(100)
ALTER TABLE CLIENTES ALTER COLUMN Profesion CHAR(7) NULL 

-- Cambios 30 de Marzo 
ALTER TABLE PreciariosGeneralesConceptos ALTER COLUMN CLAVE CHAR(30) NULL
ALTER TABLE PreciariosGeneralesConceptos ADD  MONEDA VARCHAR(30) NULL

--Cambios 31 de Marzo
ALTER TABLE OrdenesEstimaciones ADD  Reporte VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  Division VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaOrigen SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaMaximaAtencion SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  DiasAtencion DECIMAL(5,0) NULL 
ALTER TABLE OrdenesEstimaciones ADD  Reporto VARCHAR(100) NULL
ALTER TABLE OrdenesEstimaciones ADD  TrabajoRequerido VARCHAR(850) NULL
ALTER TABLE OrdenesEstimaciones ADD  Atiende VARCHAR(100) NULL

--Cambios 6 de abril
ALTER TABLE OrdenesEstimacionesD ADD IntExt VARCHAR(30) NULL

--Cambios 10 de Abril
ALTER TABLE OrdenesEstimaciones ADD  TrabajoRealizado VARCHAR(500) NULL
ALTER TABLE OrdenesEstimaciones ADD  CodigoFalla VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  TieneFotos VARCHAR(10) NULL
ALTER TABLE OrdenesEstimaciones ADD  TieneReporte VARCHAR(10) NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaLlegada SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  HoraLlegada datetime NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaFinActividad SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  HoraFinActividad datetime NULL
ALTER TABLE OrdenesEstimaciones ADD  Zona VARCHAR(80) NULL
ALTER TABLE OrdenesEstimaciones ADD  Cuadrilla VARCHAR(200) NULL

--Cambios Giovanni 12 de abril
alter table sucursales drop column codigoPostal

ALTER TABLE Sucursales 
ADD CodigoPostal char(10) NULL 
FOREIGN KEY REFERENCES CodigosPostales(ID)

--Cambios Christian 14 de abril
ALTER TABLE Usuarios ADD  Empresa VARCHAR(200) NULL

--Cambios Giovanni 15 de abril
ALTER TABLE OrdenesEstimaciones DROP COLUMN Cuadrilla
ALTER TABLE OrdenesEstimaciones ADD Cuadrilla CHAR(10) NULL FOREIGN KEY REFERENCES Cuadrillas(ID)

ALTER TABLE dbo.OrdenesEstimaciones
ADD CONSTRAINT fk_OrdenesEstimacionesID
FOREIGN KEY (Cuadrilla) 
REFERENCES dbo.Cuadrillas(ID)

--Cambios Christian 17 de abril
ALTER TABLE OrdenesEstimaciones ADD ImporteTotal DECIMAL (20,2)
ALTER TABLE OrdenesEstimacionesD ADD Moneda VARCHAR(10)

--Cambios Christian 21 de Abril
ALTER TABLE OrdenesEstimaciones DROP COLUMN Zona 

--Cambios Christian 04 de Mayo
ALTER TABLE OrdenesEstimaciones DROP COLUMN Atiende 
ALTER TABLE GeneradorOrdenEstimacionD DROP COLUMN Numero 
ALTER TABLE GeneradorVolumetriaD DROP COLUMN Numero 

