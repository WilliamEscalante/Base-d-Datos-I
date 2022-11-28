 database hito_4;

use hito_4;

--AVG: utilizada para calcular el promedio de los valores de un campo determinado 
--COUNT: utilizada para devolver el numero de registros de la seleccion
--SUM: utilizada para devolver la suma de todos los valores de un campo determinado
--MAX: utilizada para devolver el valor mas alto de un campo especificado
--MIN: utilizada para devolver el valor mas bajo de un campo especificado
--podemos crear nuestra propia funcion

create table estudiantes(
id_est integer identity primary key not null,
nombres varchar (50) not null,  
apellidos varchar (50) not null,
edad integer not null,
fono integer not null,
email varchar (50) not null,
direccion varchar (50) not null,
genero varchar (50) not null

);


insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero)
values ('miguel', 'gonzales valiz', 20, 29322115, 'miguel@gmail.com', 'Av. 6 de agosto','masculino'),
       ('sandra', 'mavir udria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de agosto', 'femenino'),
       ('joel', 'adubiri mondar', 30, 29322117, '@gmail.com', 'Av. 6 de agosto','masculino'),
       ('andrea', 'arias ballesteros', 21, 29322118, '@gmail.com', 'Av. 6 de agosto','femenino'),
       ('santos', 'montes valezuela', 24, 29322119, '@gmail.com', 'Av. 6 de agosto','masculino');
-- ejer 1 

select min (est.edad) as min_edad 
from estudiantes as est;

--ejer 2 determina la cantidad de estudiantes del sexo femenino

select count (est.id_est)
from estudiantes as est
where est.genero = 'femenino';

--ejer 3 

ALTER TABLE estudiantes ADD licencia_conducir BIT;

insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero, licencia_conducir)
values ('ana', 'gonzales valiz', 20, 29322115, 'ana@gmail.com', 'Av. 6 de agosto','femenino', 1);

insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero, licencia_conducir)
values ('pepe', 'gonzales valiz', 20, 29322115, 'pepe@gmail.com', 'Av. 6 de agosto','masculino',0);


select count (est.licencia_conducir)
from estudiantes as est;

select count (est.id_est)
from estudiantes as est;
select count (*)
from estudiantes as est;
--ejercicio 4 determinar el mayor de edad
select avg (est.edad)
from estudiantes as est;


select max (est.edad)
FROM estudiantes as est
where est

select count (est.id_est)
from estudiantes as est
where est.apellidos like '%el%' and est.genero = 'masculino'; 

select count (est.id_est)
from estudiantes as est
where est.edad > 21 and est.edad < 29 and est.licencia_conducir = 1;

select * from estudiantes;

create table escuela_1(
id_esc integer identity primary key not null,
nombres varchar (50) not null,
direcion varchar (50) not null,
turno varchar (50) not null
);
insert into escuela (nombres, direcion , turno)


create table estudiantes_2(
id_est integer identity primary key not null,
nombres varchar (50) not null,  
apellidos varchar (50) not null,
edad integer not null,
fono integer not null,
email varchar (50) not null,
direccion varchar (50) not null,
genero varchar (50) not null,
id_esc varchar (50), foreign key(id_esc) references escuela_1 (id_esc)
);
insert into estudiantes_2(nombres, apellidos, edad, fono, email, direccion, genero, id_esc)
values ('miguel', 'gonzales valiz', 20, 29322115, 'miguel@gmail.com', 'Av. 6 de agosto','masculino'),
       ('sandra', 'mavir udria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de agosto', 'femenino'),
       ('joel', 'adubiri mondar', 30, 29322117, 'joel@gmail.com', 'Av. 6 de agosto','masculino'),
       ('andrea', 'arias ballesteros', 21, 29322118, 'andrea@gmail.com', 'Av. 6 de agosto','femenino'),
       ('santos', 'montes valezuela', 24, 29322119, 'santos@gmail.com', 'Av. 6 de agosto','masculino');