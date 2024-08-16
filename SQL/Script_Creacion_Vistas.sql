--Visualizar goles por jugador
create view v_goles_jugador
as
	select concat(j.nombre, ' ', j.apellido) as Jugador, count(g.id_gol) as 'Cantidad de Goles'
	from jugadores j
	join goles g on j.id_jugador = g.id_jugador
	group by(concat(j.nombre, ' ', j.apellido))

select * from v_goles_jugador
order by [Cantidad de Goles] desc

--Visualizar partidos ganados por equipo
create view v_partidos_ganados_equipo
as
	select e.pais, count(p.id_equipo_ganador) as 'Partidos Ganados'
	from equipos e
	join partidos p on e.id_equipo = p.id_equipo_ganador
	group by (e.pais)

--Visualizar partidos empatados por equipo
create view v_partidos_empatados_equipo
as
	select e.pais, count(p.id_equipo_ganador) as 'Partidos Empatados'
	from equipos e
	join partidos p on e.id_equipo in (p.id_equipo_1, p.id_equipo_2)
	where p.id_equipo_ganador is null and p.duracion is not null
	group by (e.pais)

--Visualizar partidos perdidos por equipo
create view v_partidos_perdidos_equipo
as
	select e.pais, count(p.id_equipo_ganador) as 'Partidos Perdidos'
	from equipos e
	join partidos p on e.id_equipo in (p.id_equipo_1, p.id_equipo_2)
	where p.id_equipo_ganador != e.id_equipo and p.duracion is not null
	group by (e.pais)

--Visualizar amonestaciones por arbitro
create view v_amonestaciones_arbitro
as
	select concat(a.nombre, ' ', a.apellido) as Arbitro, count(am.id_amonestacion) as 'Cantidad Amonestaciones'
	from arbitros a
	join amonestaciones am on a.id_arbitro = am.id_arbitro
	group by (concat(a.nombre, ' ', a.apellido))

--Visualizar cantidad de partidos por estadio
create view v_partidos_estadio
as
	select e.nombre as Estadio, count(p.id_partido) as 'Cantidad de Partidos'
	from estadios e
	join partidos p on e.id_estadio = p.id_estadio
	group by (e.nombre)

--Visualizar ganador del mundial
create view v_ganador
as
	select e.pais as Ganador
	from equipos e
	join partidos p on e.id_equipo = p.id_equipo_ganador
	where p.fase = 'Final'