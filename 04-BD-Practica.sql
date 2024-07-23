use MaxiFlix_DB;	
-- forma de obtener todos los datos de las tablas
select * from Categorias;
select * from Clasificaciones;
select * from Peliculas;
select * from Reparto;
select * from Generos;
select * from Media;
select * from Usuarios;
select * from Plataformas;
select * from Paises;
select * from [Peliculas.Clasificaciones];
select * from [Peliculas.Plataformas];
select * from [Peliculas.Puntuacion];
select * from [Peliculas.Categorias];
select * from [Usuarios.Favoritos];
select * from [Peliculas.Generos];
select * from [Media.Tipos];
select * from [Peliculas.Reparto];
-- 1) Obtener las Películas estrenadas en la Década de los '80.
select * from Peliculas where year(FechaEstreno) between 1980 and 1989;

-- 2) Obtener los Actores nacidos en la Década de los '70.
select P.Nombre as Pais, R.Nombre,R.Apellido,R.FechaNacimiento from Reparto as R
inner join Paises as P
on R.IdNacionalidad = P.Id
where year(FechaNacimiento) between 1970 and 1979;

-- 3) Obtener las Peliculas que se encuentran en la Plataforma de Disney+
-- El Distinct permite evitar la duplicidad en los registros
select distinct PL.Nombre,Titulo from Peliculas as P
inner join Media as M
on M.IdPelicula = P.Id
inner join [Peliculas.Plataformas] as PP
on M.IdPelicula = PP.IdPelicula
inner join Plataformas as PL
on PP.IdPlataforma = PL.Id
where Nombre like '%Disney+%';

--4)_Obtener la Cantidad de Películas con Clasificación R. (Considerar usar el Comando LIKE)
select count(*) as "Cantidad de Peliculas" from Peliculas as P 
inner join [Peliculas.Clasificaciones] as PC
on PC.IdPelicula = P.Id
inner join Clasificaciones as CL
on CL.Id = PC.Id
where Descripcion like '%R%';

-- 5)_ Obtener la Película que mayor duración tiene.
select top 1 Titulo, MinutosDuracion as "Maxima Duracion "from Peliculas order by(MinutosDuracion) desc;

-- 6)_ Obtener las Películas de Categoría 'Superhéroes'.
select C.Descripcion as Genero,Titulo from Peliculas as P
join [Peliculas.Categorias] as PC
ON PC.IdPelicula = P.Id 
inner join Categorias as C
ON PC.IdCategoria = C.Id
where Descripcion like '%Superhéroes%';

-- 7) Obtener la Cantidad de Actores que trabajaron en la Película 'Los Intocables'.
select  count(P.Id) as "Cantidad Actores" from Peliculas as P
inner join [Peliculas.Reparto] as PR
on PR.IdPelicula = P.Id
where P.Id = 7;

-- 8) Obtener los Actores que trabajaron en la Películas 'Los Intocables'.
select PAIS.Nombre as Pais, R.Nombre,R.Apellido,R.FechaNacimiento, Titulo from Peliculas as P
inner join [Peliculas.Reparto] as PR
on PR.IdPelicula = P.Id
inner join Reparto as R
on PR.IdReparto = R.Id
inner join Paises as PAIS
on PAIS.Id = R.IdNacionalidad
where Titulo like '%Los Intocables%';

-- 9) Obtener el Total de Películas del Catálogo.
select count(*) as "Total Peliculas" from Peliculas;
-- forma equivalente de hacer lo mismo
select count (Id) as "Total Peliculas" from Peliculas;

-- 10)_ obtener la lista de usuarios inactivos
select Nombre,Apellido,Email,FechaCreacion,FotoPerfilURL from Usuarios where Activo = 0; 

																			--CONSULTAS DE INSERT
-- 11) Ingresar el siguiente Film.
--Película: "The Good, the Bad and the Ugly"
--Biografía: "Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse."
--Duración: 162 minutos
--Fecha de Estreno: 11 de enero de 1968
--12) En base al Film recientemente agregado al Catálogo, agregárselo como Favorito a Severus Snape.
--13) Ahora hagamos que esta pelicula se pueda ver en las Plataformas de Netflix y Amazon.
insert into Peliculas (Titulo,Bio,MinutosDuracion,FechaEstreno) values ('The Good, the Bad and the Ugly','Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse.',162,'1968-01-11');
insert into [Usuarios.Favoritos] (IdPelicula,IdUsuario,FechaFavorito) values (34,4,''); 
insert into [Peliculas.Plataformas] values (44,34,1,'','');
insert into [Peliculas.Plataformas] values (45,34,2,'','');
--14)_ ¿Cuál es la "relación" que tienen estas consultas al Ejecutarse? ¿Cuál es el motivo?
-- EN LA TABLA DE PELICULAS.CATEGORIAS SE MENCIONA QUE LA PELICULA POSEE EL ID 2 MIENTRAS QUE EN LA TABLA DE PELICULAS.PLATAFORMA INDICA ID 24 POR LO TANTO NO SE RELACIONAN 
INSERT INTO Peliculas (FechaEstreno, Titulo, MinutosDuracion, Bio, IdDirector) VALUES ('2014-08-21', 'Relatos Salvajes', 122, 'Seis relatos que alternan la intriga, la comedia y la violencia. Sus personajes se verán empujados hacia el abismo y hacia el innegable placer de perder el control al cruzar la delgada línea que separa la civilización de la barbarie.', 112);
INSERT INTO [Peliculas.Categorias] (Id, IdCategoria, IdPelicula) VALUES (75, 6, 2);
INSERT INTO [Peliculas.Plataformas] (IdPelicula, IdPlataforma, FechaAlta) VALUES (24, 10, '2024-03-27');

											-- CONSULTAS DE DELETE --

-- 19) El Usuario Homero Simpson hace mucho tiempo que está inactivo. Hay que eliminarlo de la Base de manera física.
Delete from Usuarios where Nombre like 'Homero' and Apellido = 'Simpson';
-- 20)Realizar una limpieza de las Puntuaciones de las Películas. Eliminar todas las Puntuaciones desde el 2020 hasta el 2023 (inclusive).
-- ¿Se podrá realizar la Consulta?
delete from [Peliculas.Puntuacion] where year(FechaPuntuacion) between 2020 and 2023; 
-- 21) Se debe realizar una limpieza de Películas. Hay que eliminar las Películas que se hayan estrenado desde 1980 hseasta 1989
-- (inclusive). ¿Se podrá realizar la Consulta?
-- (NO SE PUDO REALIZAR LA CONSULTA) Instrucción DELETE en conflicto con la restricción tabla 'dbo.Media', column 'IdPelicula
Delete from Peliculas where YEAR(FechaEstreno) between 1980 and 1989;

								-- CONSULTA DE UPDATE
-- 16) Hubo un error al momento de registrar la película de Iron Man. El Protagonista no fue Robert Downey Jr., quién interpretó el papel fue Diego Peretti.
update Reparto set Nombre = 'Diego', Apellido = 'Peretti' where Id = 1;
-- 17) La Plataforma Tubi TV cambia de firma, dado que cambiará su nombre a MaxiPrograma TV.
insert into Plataformas (Id,Nombre,Precio)values(10,'Tubi TV',12.22);
update Plataformas set Nombre = 'Maxi Programa TV' where Id=10;
-- 18) La Película de Spiderman cambia su Clasificación de PG-13 a 'Apta para todos los Públicos'.
Update [Peliculas.Clasificaciones] set IdClasificacion = 1 where IdPelicula = 12;