create database universidad001;

use universidad001;

create table escuela (
	id_esc integer identity primary key not null,
	nombre varchar (100) not null,
	direccion varchar (100) not null
	);

create table materia (
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

INSERT INTO escuela (nombre,direccion)
	VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');

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

-- 14.- Que estudiantes(nombres, apellidos y la dirección) forman parte de la escuela “San Felipe Asturias II”.

select est.nombre, est.apellido, esc.direccion, esc.nombre
from escuela as esc
inner join estudiante as est on esc.id_esc = est.id_esc
where esc.nombre = 'San Felipe Asturias II';

-- 15.- Mostrar todos los estudiantes(nombres, apellidos, edad, genero)
--     *que forman parte de la escuela “San Felipe Asturias II”, mostrar
--     *dirección de la escuela.
--     *Siempre y cuando la edad sea mayor a 22 y ademas el genero sea
--     *masculino/femenino

select est.nombre, est.apellido, est.edad, est.sexo, esc.direccion
from escuela as esc
inner join estudiante as est on esc.id_esc = est.id_esc
where esc.nombre = 'San Felipe Asturias II'
and est.sexo = 'masculino'
and est.edad > 22;

-- 16.- Mostrar los nombres y apellidos de todos los estudiantes aprobados en la materia Fisica Basica.

select est.nombre, est.apellido, kar.nota_num, mat.nombre_mat
from kardex as kar
inner join estudiante as est on kar.id_est_cedula = est.id_est_cedula
inner join materia as mat on kar.id_mat = mat.id_mat
where kar.nota_num >= 51
and mat.nombre_mat = 'Fisica Basica';

-- 17.- Mostrar los nombres de todo los estudiantes que aprobaron

SELECT est.nombre, est.apellido, kar.estado
FROM kardex AS kar, estudiante AS est
WHERE kar.id_est_cedula = est.id_est_cedula AND
      kar.nota_num >= 51;

-- 18.- Realizar el ejercicio anterior utilizando INNER JOIN.

select est.nombre, est.apellido, kar.estado
from kardex as kar
inner join estudiante as est on kar.id_est_cedula = est.id_est_cedula
where kar.nota_num >= 51;

-- 19.- Mostrar los nombres y apellidos de los estudiantes aprobados y que tengan mayor a 25 años.

SELECT est.nombre, est.apellido, kar.estado, est.edad
FROM estudiante AS est 
INNER JOIN kardex AS kar ON kar.id_est_cedula = est.id_est_cedula 	
WHERE kar.nota_num >= 51 and est.edad >= 25;

-- 20.- Mostrar el semestre  y el año del estudiante que tenga la cédula igual a “6775688”

select per.semestre, per.ano_gestion
from kardex as kar
inner join periodo as per on kar.id_per = per.id_per
where kar.id_est_cedula = '6775688';
