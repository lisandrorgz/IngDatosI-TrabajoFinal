--Verifica si jugador pertenece a partido
create function jugador_pertenece_partido (
   @id_jugador int, 
   @id_partido int
)
returns bit
as
begin
	if (@id_jugador in 
		(select j.id_jugador
		 from jugadores j
		 join equipos e on j.id_equipo = e.id_equipo
		 join partidos p on e.id_equipo in (p.id_equipo_1, p.id_equipo_2)
		 where p.id_partido = @id_partido)
	    )
		return 1

	return 0
end;

--Insertar fase
create procedure sp_insertar_fase(
@nombre varchar(20)
)
as
begin
	insert into fases 
		(nombre) 
	values 
		(@nombre)
end

--Insertar entrenador
create procedure sp_insertar_entrenador(
@nombre varchar(20),
@apellido varchar(20)
)
as
begin
	insert into entrenadores 
		(nombre, apellido)
	values
		(@nombre, @apellido)
end

--Insertar equipo
create procedure sp_insertar_equipo (
@pais varchar (20),
@id_entrenador int
)
as
begin
	insert into equipos 
		(pais, id_entrenador)
	values
		(@pais, @id_entrenador)
end

--Insertar posicion
create procedure sp_insertar_posicion(
@descripcion varchar(20)
)
as
begin
	insert into posiciones
		(descripcion)
	values
		(@descripcion)
end

--Insertar jugador
create procedure sp_insertar_jugador(
@nombre varchar(20),
@apellido varchar(20),
@id_equipo int,
@posicion varchar(20)
)
as
begin
	insert into jugadores
		(nombre, apellido, id_equipo, posicion)
	values
		(@nombre, @apellido, @id_equipo, @posicion)
end

--Insertar ubicacion
create procedure sp_insertar_ubicacion(
@nombre varchar(20)
)
as
begin
	insert into ubicaciones
		(nombre)
	values
		(@nombre)
end

--Insertar estadio
create procedure sp_insertar_estadio(
@nombre varchar(20),
@capacidad int,
@ubicacion varchar(20)
)
as
begin
	insert into estadios
		(nombre, capacidad, ubicacion)
	values
		(@nombre, @capacidad, @ubicacion)
end

--Insertar partido
create procedure sp_agregar_partido(
@fecha date,
@hora datetime,
@id_estadio int,
@fase varchar(20),
@id_equipo_1 int,
@id_equipo_2 int
)
as
begin
	insert into partidos
		(fecha, hora, id_estadio, fase, id_equipo_1, id_equipo_2)
	values
		(@fecha, @hora, @id_estadio, @fase, @id_equipo_1, @id_equipo_2)
end

--Agregar gol
create procedure sp_agregar_gol(
@minuto int,
@tipo_gol varchar(20),
@id_jugador int,
@id_partido int
)
as
begin
	if(dbo.jugador_pertenece_partido(@id_jugador, @id_partido) = 1)
		insert into goles
			(minuto, tipo_gol, id_jugador, id_partido)
		values
			(@minuto, @tipo_gol, @id_jugador, @id_partido)
	else
		print 'El jugador no participa en el partido seleccionado'
end

--Insertar arbitro
create procedure sp_insertar_arbitro(
@nombre varchar(20),
@apellido varchar(20),
@nacionalidad varchar(20)
)
as
begin
	insert into arbitros 
		(nombre, apellido, nacionalidad)
	values
		(@nombre, @apellido, @nacionalidad)
end

--Agregar amonestacion
create procedure sp_agregar_amonestacion(
@tipo_tarjeta varchar(20),
@minuto int,
@motivo varchar(50),
@id_jugador int,
@id_partido int
)
as
begin
	if(dbo.jugador_pertenece_partido(@id_jugador, @id_partido) = 1)
		insert into amonestaciones
			(tipo_tarjeta, minuto, motivo, id_jugador, id_partido)
		values
			(@tipo_tarjeta, @minuto, @motivo, @id_jugador, @id_partido)
	else
		print 'El jugador no participa en el partido seleccionado'
end

--Terminar partido
create procedure sp_terminar_partido(
@id_partido int,
@duracion int
)
as
begin
	declare @goles_equipo_1 int;
	declare @goles_equipo_2 int;
	declare @equipo_ganador int;

	set @goles_equipo_1 = (select count(g.id_gol)
	from partidos p
	join jugadores j on p.id_equipo_1 = j.id_equipo
	join goles g on j.id_jugador = g.id_jugador
	where p.id_partido = @id_partido);

	set @goles_equipo_2 = (select count(g.id_gol)
	from partidos p
	join jugadores j on p.id_equipo_2 = j.id_equipo
	join goles g on j.id_jugador = g.id_jugador
	where p.id_partido = @id_partido);

	if @goles_equipo_1 > @goles_equipo_2
		set @equipo_ganador = (select id_equipo_1
							   from partidos
							   where id_partido = @id_partido)
	
	if @goles_equipo_2 > @goles_equipo_1
		set @equipo_ganador = (select id_equipo_2
							   from partidos
							   where id_partido = @id_partido)

	update partidos set
		duracion = @duracion, 
		id_equipo_ganador = @equipo_ganador,
		resultado = CONCAT(GREATEST(@goles_equipo_1, @goles_equipo_2), 
					'-', 
					LEAST(@goles_equipo_1, @goles_equipo_2))

end