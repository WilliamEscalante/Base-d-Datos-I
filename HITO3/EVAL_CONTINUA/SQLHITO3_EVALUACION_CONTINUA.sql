create database defensa_hito3_unifranzitos;
use defensa_hito3_unifranzitos;

create table campeonato(
id_campeonato varchar(20)primary key not null,
nombre_campeonato varchar(30) not null,
sede varchar(20) not null,
);

insert into campeonato(id_campeonato, nombre_campeonato,sede) 
	values('camp-111', 'Campeonato Unifranz','El Alto'),('camp-222', 'Campeonato Unifranz','Cochabamba')

create table equipo(
id_equipo varchar(20) primary key not null,
nombre_equipo varchar(25) not null,
categoria varchar(20) not null,
id_campeonato varchar(20) not null,
foreign key (id_campeonato) references campeonato(id_campeonato)
);

insert into equipo(id_equipo, nombre_equipo, categoria, id_campeonato) 
	values('equ-111', 'Google', 'VARONES', 'camp-111'),('equ-222', '484 Not found', 'VARONES', 'camp-111'),('equ-333', 'girls unifranz', 'MUJERES', 'camp-111');

create table jugadores(
id_jugador varchar(20) primary key not null,
nombres varchar(20) not null,
apellidos varchar(20) not null,
ci varchar(20) not null,
edad integer not null,
id_equipo varchar(20) not null,
foreign key (id_equipo) references equipo(id_equipo));

insert into jugadores(id_jugador, nombres, apellidos, ci, edad, id_equipo) 
	values('jug-111', 'Carlos', 'Villa', '8997811LP', 19, 'equ-222'),('jug-222', 'Pedro', 'Salas', '8997822LP', 20, 'equ-222'),('jug-333', 'Saul', 'Araj', '8997833LP', 21, 'equ-222'),('jug-444', 'Sandra', 'Solis', '8997844LP', 20, 'equ-333'),('jug-555', 'Ana', 'Mica', '8997855LP', 23, 'equ-333')

select nombres, apellidos
from jugadores
where nombres like 'S%' and apellidos like '%s'

select jgd.nombres, jgd.apellidos, jgd.edad 
from equipo as equi
inner join jugadores as jgd on equi.id_equipo = jgd.id_equipo
where equi.nombre_equipo = '484 Not found' and jgd.edad <=20

select jug.nombres, jug.apellidos, jug.edad, eqp.id_equipo, eqp.nombre_equipo
from jugadores as jug
inner join equipo as eqp on jug.id_equipo = eqp.id_equipo 
inner join campeonato as cam on cam.id_campeonato = eqp.id_campeonato
where jug.edad > 20 and eqp.id_equipo = 'equ-333' and cam.sede = 'El Alto'

select cam.nombre_campeonato, eqp.nombre_equipo, jug.nombres, jug.apellidos
from jugadores as jug
inner join equipo as eqp on jug.id_equipo = eqp.id_equipo 
inner join campeonato as cam on cam.id_campeonato = eqp.id_campeonato
where eqp.id_equipo = 'equ-222'

select Count(nombre_equipo)
from jugadores as jug
inner join equipo as equ on equ.id_equipo = jug.id_equipo
where equ.id_equipo = 'equ-222'

create table Premios(
nombre_campeonato varchar(30) not null,
id_equipo varchar (20) not null,
nombre_equipo varchar(25) not null,
sede varchar (20) not null,
posicion integer not null,
id_jugador varchar(20),
 foreign key (id_equipo) references equipo(id_equipo));
 
 insert into Premios(nombre_campeonato, id_equipo,nombre_equipo, sede, posicion) 
	values('Campeonato Unifranz', 'equ-111', 'Google','El Alto',1),('Campeonato Unifranz', 'equ-333', 'girls unifranz','El Alto',2)

 select jug.nombres, jug.apellidos
 from equipo as equ
 inner join Premios as pre on pre.id_equipo = equ.id_equipo
 inner join jugadores as jug on equ.id_equipo = jug.id_equipo
 where pre.posicion = 1