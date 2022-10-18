create database universidad;

use universidad;

-- 1.- Eliminar las tablas de inscripción, estudiantes y materias de la base de datos UNIVERSIDAD.

	DROP TABLE inscripcion;
	DROP TABLE estudiante;
	DROP TABLE materia;

-- 2.- Regenerar las tablas de acuerdo a la siguiente imagen 
--    (Como referencia se debe de crear las siguientes tablas y el nombre de su PRIMARY KEY).

create table escuela (
	id_esc integer identity primary key not null,
	nombre varchar (100) not null,
	direccion varchar (100) not null
	);

create table materias (
	id_mat integer identity primary key not null,
	nombre_mat varchar (100) not null, 
	cod_mat varchar (100) not null
	);

create table periodo (
	id_per integer identity primary key not null,
	ano_gestion integer not null,
	semestre varchar (50) not null
	);

create table estudiante (
	id_est_cedula integer identity primary key not null,
	nombre varchar (100) not null,
	apellido varchar (100) not null,
	sexo varchar (100) not null,
	direccion varchar (200) not null,
	telefono integer not null,
	email varchar (50) not null,
	edad integer not null,
	id_esc integer not null,
	foreign key (id_esc) references escuela (id_esc)
	);

create table kardex (
	id_kar integer identity primary key not null,
	nota_num integer not null,
	nota_alfabe varchar (100) not null,
	estado varchar (10) not null,
	id_mat integer not null,
	id_est_cedula integer not null,
	id_per integer not null,
	foreign key (id_mat) references materia (id_mat),
	foreign key (id_est_cedula) references estudiante (id_est_cedula),
	foreign key (id_per) references periodo (id_per)
	);

-- 3.- Insertar registros a las tablas.

-- Registro de la tabla ESCUELA

INSERT INTO escuela (nombre,direccion)
	VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');

-- Registro de la tabla MATERIA

INSERT INTO materia (nombre_mat, cod_mat) 
	VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materia (nombre_mat, cod_mat) 
	VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materia (nombre_mat, cod_mat) 
	VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materia (nombre_mat, cod_mat) 
	VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materia (nombre_mat, cod_mat) 
	VALUES ('Fisica Basica','ARQ-105');

--Registro de la tabla PERIODO

INSERT INTO periodo (ano_gestion, semestre) 
	VALUES (2016, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) 
	VALUES (2016, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) 
	VALUES (2017, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) 
	VALUES (2017, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) 
	VALUES (2018, 'Semestre 1');

-- Registro de la tabla ESTUDIANTE

INSERT INTO estudiante ( nombre, apellido, sexo, direccion, telefono, email, edad, id_esc) 
	VALUES ( 'Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1);
INSERT INTO estudiante ( nombre, apellido, sexo, direccion, telefono, email, edad, id_esc) 
	VALUES ( 'Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1);
INSERT INTO estudiante ( nombre, apellido, sexo, direccion, telefono, email, edad, id_esc) 
	VALUES( 'Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1);
INSERT INTO estudiante ( nombre, apellido, sexo, direccion, telefono, email, edad, id_esc) 
	VALUES ( 'Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1);
INSERT INTO estudiante ( nombre, apellido, sexo, direccion, telefono, email, edad, id_esc) 
	VALUES ( 'Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);

-- 4.- Generar los registros de la tabla kardex (Esta tabla maneja la relación entre las otras tablas)

-- Registro de la tabla KARDEX

INSERT INTO kardex(nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) 
	VALUES (51, 'cincuenta y uno', 'APROBADO',1,1,1);
INSERT INTO kardex(nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) 
	VALUES (31, 'treinta y uno', 'REPROBADO',2,2,2);
INSERT INTO kardex(nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) 
	VALUES (61, 'sesenta y uno', 'APROBADO',1,3,1);
INSERT INTO kardex(nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) 
	VALUES (41, 'cuarenta y uno', 'REPROBADO',2,4,2);
INSERT INTO kardex(nota_num, nota_alfabe, estado, id_mat, id_est_cedula, id_per) 
	VALUES (81, 'ochenta y uno', 'APROBADO',4,4,4);

-- 5.- El registro de las tablas debería de quedar de la siguiente manera.

SELECT*
FROM escuela;

SELECT*
FROM materia;

SELECT*
FROM periodo;

SELECT*
FROM estudiante;

SELECT*
FROM kardex;

-- 6.- Mostrar los nombres y apellidos de los estudiantes mayores a 24 anos y que sean del sexo masculino/femenino.

	SELECT est.nombre, est.apellido, est.edad, est.sexo
	FROM estudiante AS est
	WHERE sexo='masculino' AND  edad >= 24; 

-- 7.- Mostrar los nombres,apellidos y la edad de todos los estudiantes reprobados del sexo masculino.

	SELECT est.nombre, est.apellido, est.edad, kar.estado, kar.nota_num, est.sexo
	FROM estudiante AS est
	INNER JOIN kardex AS kar ON kar.id_est_cedula = est.id_est_cedula
	WHERE kar.nota_num<51 AND est.sexo = 'masculino';

-- EXTRAS

	SELECT*
	FROM estudiante
	WHERE sexo='masculino' and  edad >= 18;

	SELECT*
	FROM estudiante
	WHERE edad>=18;

	SELECT est.nombre, est.apellido
	FROM kardex AS kar, estudiante AS est
	WHERE kar.id_est_cedula = est.id_est_cedula AND kar.nota_num >= 51;