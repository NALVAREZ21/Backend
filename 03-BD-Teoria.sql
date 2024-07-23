use MaxiFlix_DB;

-- forma de obtener todos los datos de las tablas
select * from Categorias;
select * from Peliculas;
select * from Reparto;
select * from Plataformas;
select * from Paises;
select * from [Peliculas.Reparto];
-- forma de obtener datos especificos de la tabla Peliculas
select Titulo,MinutosDuracion as "Minutos de duracion",Bio as Descripcion from Peliculas;

-- formas de obtener la cantidad de peliculas de la tabla Peliculas
select count (*) as ContadorPeliculas from Peliculas;
select count (id) as "Cantidad de Peliculas" from Peliculas;
-- obtengo la sumatoria total de minutos de todas las peliculas
select sum(MinutosDuracion) as "Duracion Total" from Peliculas;
-- obtengo la pelicula con menor duracion de minutos
select min(MinutosDuracion) as "Menor Duracion" from Peliculas;
-- -- obtengo la pelicula con maxima duracion de minutos
select max(MinutosDuracion) as MayorDuracion from Peliculas;

-- La cláusula WHERE (donde) se usa para filtrar y seleccionar datos específicos de una 
-- tabla.Permite establecer condiciones que deben cumplirse 
select * from Peliculas where id<6; 
select * from Peliculas where id = 5;

-- selecciono las peliculas que duran mas de 2 horas
select Titulo,Bio,MinutosDuracion from Peliculas where MinutosDuracion >=120;
-- selecciono las peliculas que duran menos de 2 horas
select * from Peliculas where MinutosDuracion<120;

select * from Reparto where id=11;
-- obtengo de las tabla peliculas todas las peliculas que empiecen con la letra T o t
select * from Peliculas where Titulo like 't%';
-- obtengo de las tabla peliculas todas las peliculas que terminen con la letra O y o
select * from Peliculas where Titulo Like '%O';
-- obtengo de las tabla peliculas todas las peliculas que contengan con la letra S y s
select * from Peliculas where Titulo like '%s%';

-- obtengo de la tabla plataforma distintos datos
select * from Plataformas where Nombre like '%+'; 
select * from Plataformas where Nombre like 'a%';
select * from Plataformas where Nombre like '%e%';
select Precio from Plataformas where Nombre like '%o';

-- obtengo las primeras 5 rows de la tabla peliculas
select top 5 * from Peliculas;

select * from Peliculas where MinutosDuracion > 120;
select * from Reparto where Dirige = 1;
select * from Reparto where Id = 43;
select * from Paises where Id = 39;

-- ¿Quien actua en la pelicula karate kit?

Select * from Peliculas where Id = 9;
select * from [Peliculas.Reparto] where IdPelicula =9;
select Id,Nombre,Apellido from Reparto where Id >= 45 and Id<=49;
select * from Reparto where Dirige=1 and Id>=45 and Id<=49;
select * from Paises where Id = 11;
select * from Peliculas where Titulo like '%n';

--selecciono los datos de Peliculas mientras contenga la palabra los
select Titulo,FechaEstreno, MinutosDuracion as "Cantidad Horas" from Peliculas where Titulo like '%los%';

-- selecciono todo de la tabla reparto mientras el nombre contenga Sa
select * from Reparto where Nombre like '%ca%';
-- selecciono todo de la tabla reparto mientras el apellido termine en z 
select * from Reparto where Apellido like '%Z';

-- repaso de los operadores logicos (and, or y not)
-- traigo todo de la tabla reparto mientras el id sea 5 o 10
select * from Reparto where Id=5 or Id=10;

-- selecciono de las tablas peliculas mientras cumplas los minutos pero que bio y titulo cumpla
select * from Peliculas where MinutosDuracion>99 and MinutosDuracion<=120
and Bio like '%polic%'and Titulo like '%a%'

-- selecciono de las tablas peliculas mientras cumplas los minutos pero no arranque con a
select * from Peliculas where MinutosDuracion>=99 and MinutosDuracion<=120 and not
Titulo like 'a%';

--selecciono de las tablas de Plataformas si el nombre termina con + pero tiene precio < 5
select * from Plataformas where Nombre like '%+' and not Precio>5;

-- selecciono esas columnas de la tabla peliculas mientras la bio diga un o minutos sean >=60 y <=100
select Titulo,Bio,MinutosDuracion from Peliculas
where Bio like '%un%' or
MinutosDuracion>=60 and MinutosDuracion<=100;

select * from Peliculas where Id=12; 
select * from [Peliculas.Reparto] where IdPelicula = 12;
-- EN IN () -VARIOS ELEMENTOS MISMO TIEMPO -  VAN LOS VALORES QUE QUIERO QUE ENCUENTRE 
select * from Reparto where Id in(62,63,64,65,66);
-- BETWEEN MUESTRA LOS NUMEROS ENTREMEDIOS
select * from Reparto where Id between 62 and 66;

-- LISTAR LAS PELICULAS DE LA DECADA DEL 90 
-- YEAR - LO QUE HACE ES OBTENER LA FECHA DEL TIPO DE DATO SMALLDATETIME
select * from Peliculas where year(FechaEstreno) between 1990 and 1999;

-- HACIENDO USO DE EL NULO Y VACIO
update Peliculas set Bio = ''  where Id=1;
update Peliculas set Bio = NULL where Id=2;
-- SELECCIONO DE LAS TABLAS PELICULAS MIENTRAS EN LA COLUMNA BIO SEA NULO	
select * from Peliculas where bio is NULL ;
-- SELECCIONO DE LAS TABLAS PELICULAS MIENTRAS EN LA COLUMNA BIO SEA VACIO	O NULL
-- O EL ID DIRECTOR NO ES NULL. 
select * from Peliculas where Bio is NULL or BIO like '' or IdDirector is not null;

-- TIPO DE UNIONES ENTRE TABLAS 
-- INNER JOIN
-- LEFT JOIN 
-- RIGHT JOIN
-- FULL OUTER JOIN 

-- Deseo obtener Titulo de la pelicula y nombre de director
select Titulo as "Nombre Pelicula",Nombre as "Nombre Director" from Peliculas as P
inner join Reparto as R
on P.IdDirector = R.Id;

-- Saber Nombre,apellido de las personas que actuan en una pelicula determinada (volver al futuro)

select Titulo,Apellido as "Apellido Actor",Nombre as "Nombre Actor" from Peliculas as P
inner join [Peliculas.Reparto] as PR
on P.Id = PR.IdPelicula 
inner join Reparto as R
on R.Id = PR.IdReparto
where Titulo like '%Volver al futuro%';

-- REALIZANDO LAS OPERACIONES DEL CRUD 
-- INSERTAR NUEVOS REGISTROS EN LA TABLA PELICULAS
insert into Peliculas (FechaEstreno,Titulo,MinutosDuracion,Bio,IdDirector) values 
('1982-11-04','Rambo',93,'El verano de Vietnam,John Rambo,envuelve a la policia en una caceria en el bosque tras escapar de un vil comisario',1);
-- modifico el idDirector 
update Peliculas set IdDirector = 15 where Id = 26;
insert into Peliculas values ('1980-11-04','Pulp Fiction',154,'La vida de un boxeador,2 sicarios,la esposa de un ganster y 2 bandidos se entrelaza en una historia de violencia y redencion',NULL);
insert into Peliculas values ('1997-06-05','Con Air',115,'Un preso en libertad condicional,condenado por error,se encuentra en un vuelo con un grupo de prisioneros despiadados,e intenta detener un secuestro violento',20);

-- REPASO DE UNIONES ENTRE TABLAS.
--obtener titulo y nombre de director de la pelicula
select R.Nombre, R.Apellido,P.Titulo as Pelicula from Peliculas as P
inner join Reparto as R
on P.IdDirector = R.Id 
where R.Id= 11;
-- saber que personas actuan en una pelicula determinada
select Titulo,R.Nombre,R.Apellido from Peliculas as P
inner join [Peliculas.Reparto] as PR
on PR.IdPelicula = P.Id
inner join Reparto as R
on PR.IdReparto = R.Id
where P.Id =6;
