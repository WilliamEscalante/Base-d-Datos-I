create database universidad01;

use universidad01;

-- 9.- Manejo de JOINS (Conjunto de letras)

create table TABLE_A (
	letra_A varchar (10) primary key not null,
	);

create table TABLE_B (
	letra_B varchar (10) primary key not null,
	);

insert into TABLE_A (Letra_A)
	values ('D');
insert into TABLE_A (Letra_A)
	values ('E');
insert into TABLE_A (Letra_A)
	values ('F');
insert into TABLE_A (Letra_A)
	values ('G');
insert into TABLE_A (Letra_A)
	values ('H');

	SELECT ta.* FROM TABLE_A AS ta;

insert into TABLE_B (Letra_B)
	values ('A');
insert into TABLE_B (Letra_B)
	values ('E');
insert into TABLE_B (Letra_B)
	values ('B');
insert into TABLE_B (Letra_B)
	values ('H');

	select tb.* from TABLE_B as tb;

select ta.Letra_A, tb.Letra_B
from TABLE_A as ta
 inner join TABLE_B as tb on ta.Letra_A = tb.Letra_B;

 -- 10.- Manejo de Joins Nombres de paralelo (dba_i - dba_ii)

 create table TABLE_A1 (
	numero_A integer not null,
	);

create table TABLE_B1 (
	numero_B integer not null,
	);

insert into TABLE_A1 (numero_A)
	values (1);
insert into TABLE_A1 (numero_A)
	values (3);
insert into TABLE_A1 (numero_A)
	values (2);
insert into TABLE_A1 (numero_A)
	values (4);
insert into TABLE_A1 (numero_A)
	values (5);
INSERT INTO TABLE_A1 (numero_A)
	values (6);
insert into TABLE_A1 (numero_A)
	values (7);

select ta1.* from TABLE_A1 as ta1;

insert into TABLE_B1 (Numero_B)
values (4);
insert into TABLE_B1 (Numero_B)
values (5);
insert into TABLE_B1 (Numero_B)
values (6);
insert into TABLE_B1 (Numero_B)
values (7);
insert into TABLE_B1 (Numero_B)
values (8);
insert into TABLE_B1 (Numero_B)
values (9);

select tb1.* from TABLE_B1 as tb1;

 -- 11.- Manejo de JOINS con condiciones (Conjunto de letras)

select ta1.Numero_A, tb1.Numero_B
from TABLE_A1 as ta1
inner join TABLE_B1 as tb1 on ta1.Numero_A = tb1.Numero_B
where ta1.Numero_A > 5 and tb1.Numero_B > 5 

-- 12.- Manejo de JOINS con 3 tablas

create table TABLE_A2 (
	NOTS_1 integer not null,
	);

create table TABLE_B2 (
	NOTS_2 integer not null,
	);

create table TABLE_C2 (
	NOTS_3 integer not null,
	);

insert into TABLE_A2 (NOTS_1)
	values (51),(40),(60),(75),(30);

insert into TABLE_B2 (NOTS_2)
	values (60),(51),(100);

insert into TABLE_C2 (NOTS_3)
	values (20),(21),(23),(48),(51),(60);

select  ta2.NOTS_1, tb2.NOTS_2, tc2.NOTS_3
from TABLE_A2 as ta2
inner join TABLE_B2 as tb2 on ta2.NOTS_1 = tb2.NOTS_2
inner join TABLE_C2 as tc2 on ta2.NOTS_1 = tc2.NOTS_3;

