										--GESTOR DE BASE DATOS = SQL SERVER 2014 MANAGEMENT STUDIO--

CREATE DATABASE FRESHDENT /*SE CREA LA BASE DE DATOS APLICANDO NOMBRE A ELLA*/
GO

USE FRESHDENT /*SE MANDA A LLAMAR EL NOMBRE DE LA BASE DE DATOS PARA GUARDAR LA CODIFICACIÓN QUE TENDRÁ PARA QUE MÁS ADELANTE UTILIZARLA PARA GUARDAR INFORMACIÓN POR OTROS MEDIOS PROGRAMATIVOS, EN ESTE CASO EL SISTEMA
				QUE ESTÁ CREADO EN VISUAL STUDIO RELACIONADO A ODONTOLOGIA*/
GO

CREATE TABLE Expediente (																--Creación de la tabla Expediente.
IdExpediente INT PRIMARY KEY IDENTITY (1,1),											--Almacena el código de expediente.
Cedula VARCHAR (100),																	--Almacena la cédula de la persona en el expediente.
Nombres VARCHAR (50),																	--Almacena los nombres de la persona en el expediente.
Apellidos VARCHAR (80),																	--Almacena los apellidos de la persona en el expediente.
Fecha_Nacimiento varchar (30),															--Almacena la fecha de nacimiento de la persona en el expediente.
Telefono_Celular varchar (30),															--Almacena el teléfono-celular de la persona en el expediente.
Municipio VARCHAR (50),																	--Almacena el municipio donde vive la persona en el expediente. 
Departamento VARCHAR (50),																--Almacena el departamento que forma parte el municipio donde vive la persona en el expediente.
--CONSTRAINT Expediente_Paciente UNIQUE (Cedula, Fecha_Nacimiento, Telefono_Celular)
);
GO
-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Receta (																	--Creación de la tabla Receta.
IdReceta INT PRIMARY KEY IDENTITY (1,1),												--Almacena código de receta médica.
Nombre VARCHAR (50),																	--Almacena el nombre de lo medicamento.
Presentacion VARCHAR (100),																--Almacena la información del medicamento.
Cantidad VARCHAR (20),																	--Almacena cantidad de medicamentos.
Descripcion VARCHAR (150),																--Almacena la indicación de la toma del medicamento.
--CONSTRAINT Receta_Info UNIQUE (Nombre, Cantidad)
);
GO
--------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Medico (																	--Creación de la tabla Médico
IdMedico INT PRIMARY KEY IDENTITY (1,1),												--Almacena el código del médico.
Nombre_Medico VARCHAR (30),																--Almacena el nombre del médico.
Telefono_Celular VARCHAR (20),															--Almacena el número telefónico personal del médico.
--CONSTRAINT Medico_Nombre UNIQUE (Telefono_Celular)
);
GO
--------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Consulta (																	--Creación de la tabla Consulta.
IdConsulta INT PRIMARY KEY IDENTITY (1,1),												--Almacena código de consulta.
Fecha VARCHAR (10),																				--Almacena la fecha que se está realizando la consulta.
Hora VARCHAR (10),																				--Almacena la hora que se está realizando la consulta.
Sintoma VARCHAR (250),																	--Almacena los síntomas mencionada por la persona que está en consulta.
Diagnostico VARCHAR (200),																--Almacena el diagnóstico que determina el medico.
Nombres_Paciente VARCHAR (50),																	/*Almacena el código del expediente.*/
--FOREIGN KEY (Nombres_Paciente) REFERENCES Expediente (Nombres_Paciente),
NombreMedico VARCHAR (50)																			/*Almacena el código del médico.*/
--FOREIGN KEY (NombreMedico) REFERENCES Medico (NombreMedico),
);
GO
 ----------------------------------------------------------------PROCEDIMIENTO ALMACENADO------------------------------------------------------------------------------------

 --Se crea el procedimiento almacenado para la tabla Expediente

CREATE PROCEDURE InsertExpediente  --Guarda la información insertada.
	@Cedula VARCHAR (100),
	@Nombres VARCHAR (50),
	@Apellidos VARCHAR (80),
	@Fecha_Nacimiento varchar (20),
	@Telefono_Celular VARCHAR(30), 
	@Municipio VARCHAR (50), 
	@Departamento VARCHAR (50)
AS
	BEGIN

		SET NOCOUNT ON;

		INSERT INTO Expediente (
		Cedula,	
		Nombres,																														
		Apellidos,															
		Fecha_Nacimiento,														
		Telefono_Celular,																	
		Municipio,															
		Departamento
		) VALUES (
		@Cedula,
		@Nombres,
		@Apellidos,
		@Fecha_Nacimiento,
		@Telefono_Celular, 
		@Municipio, 
		@Departamento
		
		)
	END
GO
-----------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectExpediente --Muestra toda la información guardada.
	@IdExpediente INT
	--@Nombres VARCHAR(50),
	--@Cedula VARCHAR (100),
	--@Apellidos VARCHAR (80),
	--@Fecha_Nacimiento varchar (20),
	--@Telefono_Celular varchar(30), 
	--@Municipio VARCHAR (50), 
	--@Departamento VARCHAR (50)
AS
	BEGIN

		SET NOCOUNT ON;

		SELECT * FROM Expediente WHERE IdExpediente = @IdExpediente
	END
GO
-----------------------------------------------------------------------------------------
CREATE PROCEDURE SelectExpedienteAll
AS
	BEGIN
		SET NOCOUNT ON;
		
		SELECT * FROM Expediente
	END
GO
-----------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateExpediente -- actualiza los dato de expediente
	@IdExpediente INT,
	@Cedula VARCHAR (100),
	@Nombres VARCHAR (50),
	@Apellidos VARCHAR (80),
	@Fecha_Nacimiento varchar (20),
	@Telefono_Celular varchar(30), 
	@Municipio VARCHAR (50), 
	@Departamento VARCHAR (50)
AS
	BEGIN

		SET NOCOUNT ON;

		UPDATE Expediente SET Cedula=@Cedula, Nombres=@Nombres, Apellidos=@Apellidos, 
		Fecha_Nacimiento=@Fecha_Nacimiento, Telefono_Celular=@Telefono_Celular, Municipio=@Municipio,Departamento=@Departamento WHERE IdExpediente = @IdExpediente
	END
GO
----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteExpediente-- elimina campos de la base de dato
	@IdExpediente INT
	--@Cedula VARCHAR (100),
	--@Apellidos VARCHAR (80),
	--@Fecha_Nacimiento varchar (20),
	--@Telefono_Celular varchar(30), 
	--@Municipio VARCHAR (50), 
	--@Departamento VARCHAR (50)
AS

	BEGIN

		SET NOCOUNT ON;

		DELETE Expediente WHERE IdExpediente = @IdExpediente

	END
GO
----------------------------------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Médico

CREATE PROCEDURE InsertMedico  --Guarda la información insertada.
	@Nombre_Medico VARCHAR (30),
	@Telefono_Celular VARCHAR(20)
AS
	BEGIN

	SET NOCOUNT ON;

 INSERT INTO Medico(
		Nombre_Medico,
		Telefono_Celular
		) VALUES (
		@Nombre_Medico,
		@Telefono_Celular
		
		)
	END
GO
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectMedico --Muestra toda la información guardada.
	@IdMedico INT
	--@Telefono_Celular VARCHAR(20)
AS
	BEGIN

		SET NOCOUNT ON;

		SELECT * FROM Medico WHERE IdMedico = @IdMedico
	END
GO
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectMedicoAll
AS
	BEGIN

		SET NOCOUNT ON;

		SELECT * FROM Medico
	END
GO
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateMedico -- actualiza los dato
	@IdMedico INT,
	@Nombre_Medico VARCHAR (30),
	@Telefono_Celular VARCHAR(20)
AS
	BEGIN

		SET NOCOUNT ON;

		UPDATE Medico SET Nombre_Medico = @Nombre_Medico, Telefono_Celular = @Telefono_Celular WHERE IdMedico = @IdMedico
	END
GO
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteMedico-- elimina campos de la base de dato
	@IdMedico INT
	--@Telefono_Celular VARCHAR(20)
AS

	BEGIN

		SET NOCOUNT ON;

		DELETE Medico WHERE IdMedico = @IdMedico

	END
GO
---------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Consulta

CREATE PROCEDURE InsertConsulta  --Guarda la información insertada.
	@Fecha VARCHAR(10), 
	@Hora VARCHAR(10),
	@Sintoma VARCHAR (250), 
	@Diagnostico VARCHAR (200), 
	@Nombres_Paciente VARCHAR (50), 
	@NombreMedico VARCHAR (50)
	
	AS
	BEGIN

	SET NOCOUNT ON;

	INSERT INTO Consulta(
		Fecha, 
		Hora, 
		Sintoma, 
		Diagnostico, 
		Nombres_Paciente, 
		NombreMedico
	) VALUES (
		@Fecha, 
		@Hora, 
		@Sintoma, 
		@Diagnostico, 
		@Nombres_Paciente, 
		@NombreMedico
		
		)
	END
GO
------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectConsulta --Muestra toda la información guardada.
	@IdConsulta INT
	
AS
	BEGIN

		SET NOCOUNT ON;
		SELECT * FROM Consulta WHERE IdConsulta = @IdConsulta
		
	END
GO
-----------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectConsultaAll

AS
	BEGIN

		SET NOCOUNT ON;
		SELECT * FROM Consulta
		
	END
GO
-----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateConsulta -- actualiza los dato
	@IdConsulta INT,
	@Fecha VARCHAR(10),
	@Hora VARCHAR(10),
	@Sintoma VARCHAR(250),
	@Diagnostico VARCHAR(200),
	@Nombres_Paciente VARCHAR(50),
	@NombreMedico VARCHAR (50)
AS
	BEGIN

		SET NOCOUNT ON;

		UPDATE Consulta SET Fecha=@Fecha, Hora=@Hora, Sintoma=@Sintoma, Diagnostico=@Diagnostico, 
		Nombres_Paciente = @Nombres_Paciente, NombreMedico = @NombreMedico WHERE IdConsulta = @IdConsulta
	END
GO
----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteConsulta-- elimina campos de la base de dato
	@IdConsulta INT
	--@Fecha VARCHAR(10),
	--@Hora VARCHAR(10),
	--@Sintoma VARCHAR (250), 
	--@Diagnostico VARCHAR (200), 
	--@Nombres_Paciente INT, 
	--@NombreMedico INT
	
AS

	BEGIN

		SET NOCOUNT ON;

		DELETE Consulta WHERE IdConsulta = @IdConsulta

	END
GO
--------------------------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Receta

CREATE PROCEDURE InsertReceta  --Guarda la información insertada.
	 @Nombre VARCHAR (50), 
	 @Presentacion VARCHAR (100), 
	 @Cantidad VARCHAR(20),
	 @Descripcion VARCHAR (150)
	AS
		BEGIN
			SET NOCOUNT ON;

	INSERT INTO Receta(
	 Nombre, 
	 Presentacion, 
	 Cantidad, 
	 Descripcion
	) VALUES (
	 @Nombre, 
	 @Presentacion, 
	 @Cantidad, 
	 @Descripcion
		)
	END
GO
----------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectReceta--Muestra toda la información guardada.
	 @IdReceta INT
	 --@Nombre VARCHAR (50), 
	 --@Presentacion VARCHAR (100), 
	 --@Cantidad VARCHAR(20),
	 --@Descripcion VARCHAR (150)
	
AS
	BEGIN

		SET NOCOUNT ON;
		SELECT * from Receta WHERE IdReceta = @IdReceta
		
	END
GO
---------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectRecetaAll
	
AS
	BEGIN

		SET NOCOUNT ON;
		SELECT * from Receta
	END
GO
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateReceta -- actualiza los dato
	@IdReceta INT,
	@Nombre VARCHAR (50),
	@Presentacion VARCHAR (100),	
	@Cantidad VARCHAR (20),
	@Descripcion VARCHAR (150)
AS
	BEGIN

		SET NOCOUNT ON;

		UPDATE Receta SET Nombre= @Nombre, Presentacion=@Presentacion, Cantidad=@Cantidad, Descripcion=@Descripcion WHERE IdReceta = @IdReceta
	END
GO
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteReceta-- elimina campos de la base de dato
	 @IdReceta INT
	 --@Nombre VARCHAR (50), 
	 --@Presentacion VARCHAR (100), 
	 --@Cantidad VARCHAR(20),
	 --@Descripcion VARCHAR (150)
	
	
AS

	BEGIN

		SET NOCOUNT ON;

		DELETE Receta WHERE IdReceta = @IdReceta

	END
GO