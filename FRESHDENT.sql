
													
USE master
GO
											

CREATE DATABASE FRESHDENT 
GO

USE FRESHDENT 
GO

CREATE TABLE Expediente (																
IdExpediente INT PRIMARY KEY IDENTITY (1,1),											
Cedula VARCHAR (100),																	
Nombres VARCHAR (80),																	
Apellidos VARCHAR (80),																	
Fecha_Nacimiento VARCHAR (30),															
Telefono_Celular VARCHAR (30),																	
Municipio VARCHAR (50),																	 
Departamento VARCHAR (50),																
CONSTRAINT Expediente_Paciente UNIQUE (Cedula, Fecha_Nacimiento, Telefono_Celular)
);

CREATE TABLE Receta (																	--Creaci�n de la tabla Receta.
IdReceta INT PRIMARY KEY IDENTITY (1,1),												--Almacena c�digo de receta m�dica.
Nombre VARCHAR (50),																	--Almacena el nombre de lo medicamento.
Presentacion VARCHAR (100),																--Almacena la informaci�n del medicamento.
Cantidad VARCHAR (20),																			--Almacena cantidad de medicamentos.
Descripcion VARCHAR (150),																--Almacena la indicaci�n de la toma del medicamento.
CONSTRAINT Receta_Info UNIQUE (Nombre, Cantidad)
);

CREATE TABLE Especialidad (																--Creaci�n de la tabla Especialidad.
IdEspecialidad INT PRIMARY KEY IDENTITY (1,1),											--Almacena c�digo de especialidad.
NombreEspecialidad VARCHAR (50),														--Almacena nombre de especialidad.
DescpEspecialidad VARCHAR (500),														--Almacena descripci�n de especialidad.
CONSTRAINT Especialista UNIQUE (NombreEspecialidad, DescpEspecialidad)
);

CREATE TABLE Medico (																	--Creaci�n de la tabla M�dico
IdMedico INT PRIMARY KEY IDENTITY (1,1),												--Almacena el c�digo del m�dico.
NombreMedico VARCHAR (30),																--Almacena el nombre del m�dico.
Telefono_Celular VARCHAR (20),																	--Almacena el n�mero telef�nico personal del m�dico.
IdEspecialidad INT																		/*Almacena el c�digo de la especialidad.*/
FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad (IdEspecialidad),
CONSTRAINT Medico_Nombre UNIQUE (Telefono_Celular)
);

CREATE TABLE Cita (																		--Creaci�n de la tabla Cita.
IdCita INT PRIMARY KEY IDENTITY (1,1),													--Almacena c�digo de la cita.
FechaCita VARCHAR (30),																		--Almacena fecha de cita.
HoraDisponible VARCHAR (30),																	--Almacena hora disponible de la cita.
Precio VARCHAR (20),																			--Almacena costo de la cita.
Tipo VARCHAR (50),																		--Almacena el tipo de cita, es decir si est� programada o no.
IdExpediente INT																		/*Almacena el c�digo del expediente.*/
FOREIGN KEY (IdExpediente) REFERENCES Expediente (IdExpediente),
IdMedico INT																			/*Almacena el c�digo del m�dico.*/
FOREIGN KEY (IdMedico) REFERENCES Medico (IdMedico)
);

CREATE TABLE Consulta (																	--Creaci�n de la tabla Consulta.
IdConsulta INT PRIMARY KEY IDENTITY (1,1),												--Almacena c�digo de consulta.
Fecha VARCHAR(20),																				--Almacena la fecha que se est� realizando la consulta.
Hora VARCHAR (20),																			--Almacena la hora que se est� realizando la consulta.
Sintoma VARCHAR (250),																	--Almacena los s�ntomas mencionada por la persona que est� en consulta.
Diagnostico VARCHAR (200),																--Almacena el diagn�stico que determina el medico.
IdExpediente INT																		/*Almacena el c�digo del expediente.*/
FOREIGN KEY (IdExpediente) REFERENCES Expediente (IdExpediente),
IdMedico INT																			/*Almacena el c�digo del m�dico.*/
FOREIGN KEY (IdMedico) REFERENCES Medico (IdMedico),
);

CREATE TABLE Consulta_Receta(
IdConsulta INT																			/*Almacena c�digo de consulta.*/
FOREIGN KEY (IdConsulta) REFERENCES Consulta (IdConsulta),
IdReceta INT																			/*Almacena c�digo de receta m�dica.*/
FOREIGN KEY (IdReceta) REFERENCES Receta (IdReceta),
);

 ----------------------------------------------------------------PROCEDIMIENTO ALMACENADO------------------------------------------------------------------------------------

 --Se crea el procedimiento almacenado para la tabla Expediente
CREATE PROCEDURE InsertExpediente
 @Cedula VARCHAR (100),
 @Nombres VARCHAR (80),																	
 @Apellidos VARCHAR (80),																	
 @Fecha_Nacimiento VARCHAR (30),															
 @Telefono_Celular VARCHAR (30),																	
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
CREATE PROCEDURE SelectExpediente
	@IdExpediente INT

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
CREATE PROCEDURE UpdateExpediente
 @IdExpediente INT,
 @Cedula VARCHAR (100),
 @Nombres VARCHAR (80),																	
 @Apellidos VARCHAR (80),																	
 @Fecha_Nacimiento VARCHAR (30),															
 @Telefono_Celular VARCHAR (30),																	
 @Municipio VARCHAR (50),																	
 @Departamento VARCHAR (50)

 AS
	BEGIN

		SET NOCOUNT ON;

		UPDATE Expediente SET Cedula=@Cedula, Nombres=@Nombres, Apellidos=@Apellidos, 
		Fecha_Nacimiento=@Fecha_Nacimiento, Telefono_Celular=@Telefono_Celular,
		 Municipio=@Municipio, Departamento=@Departamento WHERE IdExpediente = @IdExpediente
	END
GO
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteExpediente                                                             -- elimina campos de la base de dato
	@IdExpediente INT
	
AS

	BEGIN

		SET NOCOUNT ON;

		DELETE Expediente WHERE IdExpediente = @IdExpediente

	END
GO
-----------------------------------------------------------------------------------------------------------------------
--------- Se crea el procedimiento paa la tabla  Receta
CREATE PROCEDURE InsertReceta
	@Nombre varchar(50),
	@Presentacion varchar(100),
	@Cantidad varchar(20),
	@Descripcion varchar(150)

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
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectReceta
		@IdReceta INT
AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Receta WHERE IdReceta = @IdReceta
	END
GO
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectRecetaAll
	AS
		BEGIN

			SET NOCOUNT ON;

			SELECT * FROM Receta
		END
	GO
-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateReceta
	@IdReceta INT,
	@Nombre varchar(50),
	@Presentacion varchar(100),
	@Cantidad varchar(20),
	@Descripcion varchar(150)

AS
	BEGIN
		SET NOCOUNT ON;

		UPDATE Receta SET Nombre = @Nombre, Presentacion = @Presentacion, Cantidad = @Cantidad,
		Descripcion = @Descripcion WHERE IdReceta = @IdReceta
	END
GO
------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteReceta
		@IdReceta INT
AS 
	BEGIN
		SET NOCOUNT ON;

		DELETE Receta WHERE IdReceta = @IdReceta
	END
GO
-----------------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Especialidad
CREATE PROCEDURE InsertEspecialidad
	@NombreEspecialidad VARCHAR (50),
	@DescpEspecialidad VARCHAR (500)
AS
	BEGIN
		SET NOCOUNT ON;

	    INSERT INTO Especialidad(
		NombreEspecialidad,
		DescpEspecialidad
		) VALUES (
		@NombreEspecialidad,
		 @DescpEspecialidad
		 )
	END 
GO
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectEspecialidad
	@IdEspecialidad INT
AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Especialidad WHERE IdEspecialidad = @IdEspecialidad
	END
GO
-----------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectEspecalidadAll
AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Especialidad
	END
GO
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateEspecialidad
		@IdEspecialidad INT,
		@NombreEspecialidad VARCHAR (50),
	    @DescpEspecialidad VARCHAR (500)
AS
	BEGIN
		SET NOCOUNT ON;
			
			UPDATE Especialidad SET NombreEspecialidad = @NombreEspecialidad, DescpEspecialidad = @DescpEspecialidad
			WHERE IdEspecialidad = @IdEspecialidad
	END
GO
-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteEspecialidad
	@IdEspecialidad INT
AS
	BEGIN
		SET NOCOUNT ON;
			
		DELETE Especialidad WHERE IdEspecialidad = @IdEspecialidad
	END
GO
--------------------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla M�dico
CREATE PROCEDURE InsertMedico
	 @NombreMedico VARCHAR (30), 
	 @Telefono_Celular VARCHAR (20),
	 @IdEspecialidad INT
AS
	BEGIN
		SET NOCOUNT ON;

		INSERT INTO Medico(
		NombreMedico,
		Telefono_Celular,
		IdEspecialidad
		) VALUES (
		@NombreMedico, 
		@Telefono_Celular,
		@IdEspecialidad
		)
	END
GO
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectMedico
	@IdMedico INT
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
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateMedico
   @IdMedico INT,
   @NombreMedico VARCHAR (30), 
   @Telefono_Celular VARCHAR (20),
   @IdEspedialidad INT
AS
	BEGIN
	    SET NOCOUNT ON;

	UPDATE Medico SET NombreMedico = @NombreMedico, Telefono_Celular = @Telefono_Celular,IdEspecialidad=IdEspecialidad where @IdMedico=IdMedico
	END
GO
------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteMedico
	@IdMedico INT
AS
	BEGIN
		SET NOCOUNT ON;
	DELETE Medico WHERE IdMedico = @IdMedico
	END
GO
-------------------------------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Consulta
CREATE PROCEDURE InsertConsulta				
    @Fecha VARCHAR(20),																				
    @Hora VARCHAR (20),																			
    @Sintoma VARCHAR (250),																	
    @Diagnostico VARCHAR (200),															
    @IdExpediente INT, 
	@IdMedico	 int
AS
	BEGIN 
		SET NOCOUNT ON;

		INSERT INTO Consulta(
		Fecha,
		Hora,
		Sintoma,
		Diagnostico,
		IdExpediente,
		IdMedico
		) VALUES (
		@Fecha,
		@Hora,
		@Sintoma,
		@Diagnostico,
		@IdExpediente,
		@IdMedico
		)
	END
GO
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectConsulta
		@IdConsulta INT
AS
	BEGIN 
			SET NOCOUNT ON;
			
			SELECT * FROM Consulta WHERE IdConsulta = @IdConsulta
	END
GO
--------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectConsultaAll
 AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Consulta
	END
GO
--------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateConsulta
    @IdConsulta INT, 												
    @Fecha VARCHAR(20),																				
    @Hora VARCHAR (20),																			
    @Sintoma VARCHAR (250),																	
    @Diagnostico VARCHAR (200),															
    @IdExpediente INT ,
	@IdMedico int
	as
	BEGIN
		SET NOCOUNT ON;

		UPDATE Consulta SET Fecha = @Fecha, Hora = @Hora , Sintoma = @Sintoma, Diagnostico = @Diagnostico,
		IdExpediente = @IdExpediente, IdMedico=@IdMedico WHERE IdConsulta = @IdConsulta
	END
GO
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteConsulta
		 @IdConsulta INT
AS
	BEGIN

	SET NOCOUNT ON;

    DELETE Consulta WHERE IdConsulta = @IdConsulta
	END
GO
----------------------------------------------------------------------------------------------------------------
--Se crea el procedimiento almacenado para la tabla Cita
CREATE PROCEDURE InsertCita
	@FechaCita VARCHAR (30),																		
	@HoraDisponible VARCHAR (30),																	
	@Precio VARCHAR (20),
	@Tipo VARCHAR (50)	,
	@IdExpediente int, 
	@IdMedico int																	
AS
	BEGIN
		SET NOCOUNT ON;

		INSERT INTO Cita(
		FechaCita,
		HoraDisponible,
		Precio,
		Tipo,
		IdExpediente, 
	    IdMedico 
		) VALUES (
		@FechaCita,
		@HoraDisponible, 
		@Precio, 
		@Tipo,
		@IdExpediente, 
	    @IdMedico 
		)
	END
GO
---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectCita
		@IdCita INT
AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Cita WHERE IdCita = @IdCita
	END
GO
------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectCitaAll
AS
	BEGIN
		SET NOCOUNT ON;

		SELECT * FROM Cita
	END
GO
----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateCita
	@IdCita INT,
	@FechaCita VARCHAR (30),																		
	@HoraDisponible VARCHAR (30),																	
	@Precio VARCHAR (20),
	@Tipo VARCHAR (50),
	@IdExpediente INT,
	@IdMedico INT	
AS
	BEGIN
		SET NOCOUNT ON;

		UPDATE Cita SET FechaCita = @FechaCita, HoraDisponible = @HoraDisponible, Precio = @Precio, Tipo = @Tipo, IdExpediente = @IdExpediente, 
		IdMedico = @IdMedico WHERE IdCita = @IdCita 
	END
GO
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteCita
	@IdCita INT
AS
	BEGIN
		SET NOCOUNT ON;
		
		DELETE Cita WHERE IdCita = @IdCita
	END
GO
-------------------------------------------------------------------------------------------------------------


