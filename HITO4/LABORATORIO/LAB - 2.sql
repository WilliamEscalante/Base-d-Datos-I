create database hito4_Funciones
use hito4_Funciones

--Manejo de funciones

--una funcion de agreagacion se ejecuta
--en la clausula SELECT
--ADEMAS siempre retorna un unico valor (una fila)
--es aplicado en un grupo de registro(a na columna de la tabla)

create table Estudiantes(
nombre varchar(25) not null,
id_est integer identity primary key not null,
apellido varchar(30) not null,
edad integer not null,
fono integer not null,
email varchar(100) not null,
direccion varchar(200) not null,
genero varchar(50) not null,
id_esc integer  not null,
licencia_conducir bit not null,
foreign key (id_esc) references Escuela(id_esc));

INSERT INTO estudiantes (nombre, apellido, edad, fono, email, direccion, genero, licencia_conducir, id_esc) values
						 ('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino', 0, 1),
						 ('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino', 0, 2),
						  ('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino', 0,3),
						  ('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',0,4),
						  ('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',0,1),
						  ('Ana' ,'Gonzales Veliz', 20, 2832115, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino', 1,2),
						('Pepito' ,'Gonzales Veliz', 20, 2832115, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',0,3);

   --MIN el menor de todos
   --MAX mayor de tosods
   --AVG sacar promedio
   --COUNT contar
  
  --Dterminar cuanto estudiantes registrados hay
  select est.*
  from Estudiantes as est;

  select COUNT(est.id_est)
  from Estudiantes as est;

  --determinar la minima edad de los estudiantes
  select min(est.edad) as min_edad
  from Estudiantes as est

  --determinar la cantidad de genero femenino
  select count(est.genero)
  from Estudiantes as est
  where est.genero = 'Femenino'

  --agregar una tabla
  alter table estudiantes add licencia_conducir bit

  INSERT INTO estudiantes (nombre, apellido, edad, fono, email, direccion, genero, licencia_conducir) values
   ('Ana' ,'Gonzales Veliz', 20, 2832115, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino', 1),
 ('Pepito' ,'Montes Valenzuela', 24, 2832119, 'pepito@gmail.com', 'Av. 6 de Agosto', 'masculino',0);
  
select count (est.id_est)
from Estudiantes as est


--Promedio de edades
    
select avg (est.edad)
from Estudiantes as est

--maxima edad
select max (est.edad)
from Estudiantes as est



--
select max (est.edad)
from Estudiantes as est
where est.genero = 'masculino' or est.genero = 'femenino'


--CONTENGA la palabra EL
select count (est.id_est)
from Estudiantes as est
where est.apellido like '%EL%' and est.genero = 'masculino' 

--Determinar cuántos estudiantes tienen una edad mayor  a 20 y menor a 30 de los estudiantes que tengan licencia de conducir.
--coun con primary key
select count (est.id_est)
from Estudiantes as est
where est.edad > 20 and est.edad < 30 and est.LICENCIA_CONDUCIR = 1 or est.LICENCIA_CONDUCIR = 0
--  ooooooooooooooooooooooooooo
select count (est.id_est)
from Estudiantes as est
where est.edad > 20 and est.edad < 30 and est.licencia_conducir between 0 and 1
--

select count (est.id_est)
from Estudiantes as est
where est.edad between 21 and 29 and est.licencia_conducir = 1 or est.LICENCIA_CONDUCIR = 0

--
create table Escuela(
id_esc integer identity primary key not null, 
nombre varchar(25) not null,
direccion varchar(100) not null,
turno varchar(20) not null);

insert into Escuela(nombre, direccion, turno) values('San Simon', 'Cochabamba', 'manana'),
													('Andres Bello', 'El Alto', 'manana-tarde'), 
													('Amor de Dios Fe y Alegria', 'El Alto', 'manana-tarde'),
													('Don Bosco', 'La Paz', 'manana-tarde-noche');

--DETERMINAR CUANTOS ESTUDIANTES TIENEN LICENCIA DE CONDUCIR
select count(es.id_est)
from Estudiantes as es
WHERE ES.licencia_conducir = 1;

--Determinar cuantos estudiantes menores a 20 anhos no tienen licencia de conducir
select COUNT(es.id_est)
from Estudiantes as es
where es.edad < 20 and es.licencia_conducir = 0



--Determinar cuantos estudiantes son de la escuela "Amor de Dios Fe y Alegria"
select count (es.id_est)
from Estudiantes as es
inner join Escuela as ec on es.id_esc = ec.id_esc
where ec.id_esc = 3
--ooo
select count (es.id_est) as coun
from Estudiantes as es
inner join Escuela as ec on es.id_esc = ec.id_esc
where ec.nombre = 'Amor de Dios Fe y Alegria';

--Determinar cuántos estudiantes forman parte de las escuelas que tienen los horarios de mañana y tarde;
select count(est.id_est) as ESTUDIANTES
from Estudiantes as est
inner join Escuela as esc on est.id_esc = esc.id_esc
where esc.turno = 'manana-tarde'


--Determinar cuantos estudiantes mmayores a 25 anhos estan en escuelas que tienen el turno de la tarde
select count(es.id_est)
from Estudiantes as es
inner join Escuela as ec on es.id_esc = ec.id_esc
WHERE es.edad > 25 AND ec.turno like '%tarde%'


--CREAR FUNCIONES 
create function retorna_nombre_materia()

returns varchar(20) as 

begin
	return 'Base de Datos'
end;


--Ver Funcion
select dbo.retorna_nombre_materia() as DBA;


--Declarar Variables, utilizar @

create function retorna_nombre_materia_V2()
	returns varchar(25) as
	begin
		declare @nombre varchar(25);
		set @nombre = 'Base de Datos I';
		return @nombre;
	end;

	select  dbo.retorna_nombre_materia_V2() as DBA_V2;



--Alterar una funcion
ALTER function 	select  dbo.retorna_nombre_materia_V2() as DBA_V2;()
	returns varchar(25) as
	begin
		declare @nombre varchar(25);
		set @nombre = 'Base de Datos III';
		return @nombre;
	end;

	select  dbo.retorna_nombre_materia_V2() as DBA_V2;



--enviar 
create function dbo.retorna_nombre_materia_V3(@nombreMateria varchar(25))
returns varchar (25) as 
begin
	declare @nombre varchar(25);
	set @nombre = @nombreMateria;
	return @nombre;
end;

--         (.-.-.-.-..-.-)
select 	  dbo.retorna_nombre_materia_V3('DBA I') as DBA_V3;



--SUMA DE DOS NUMEROS
create function retorna_nombre_materia_V4()
returns integer as 
begin
	declare @resultado integer;
	set @resultado = 45+12;
	return @resultado;
end;

select dbo.retorna_nombre_materia_V4() as Suma


create function suma(@num integer, @num2 integer, @num3 integer)
returns integer as 
begin
	declare @resultado integer;
	set @resultado = @num + @num2 + @num3;
	return @resultado;
end;
select dbo.suma(25,25,25) as Suma


select* from Escuela
select* from Estudiantes