create database mundial

create table fases (
nombre varchar(20) not null,

constraint pk_fase primary key (nombre)
)

create table entrenadores(
id_entrenador int identity,
nombre varchar(20) not null,
apellido varchar(20) not null,

constraint pk_entrenador primary key (id_entrenador)
)

create table equipos (
id_equipo int identity,
pais varchar (20) not null,
fase varchar(20) default 'Octavos de Final',
id_entrenador int not null,

constraint pk_equipos primary key (id_equipo),
constraint fk_equipos_fase foreign key (fase)
	references fases(nombre),
constraint fk_equipos_entrenador foreign key (id_entrenador) 
	references entrenadores (id_entrenador)
)

create table posiciones(
descripcion varchar(20) not null

constraint pk_posiciones primary key (descripcion)
)

create table jugadores (
id_jugador int identity,
nombre varchar(20) not null,
apellido varchar(20) not null,
id_equipo int not null,
posicion varchar(20)

constraint pk_jugadores primary key (id_jugador),
constraint fk_jugadores_equipo foreign key (id_equipo)
	references equipos (id_equipo),
constraint fk_jugadores_posicion foreign key (posicion)
	references posiciones(descripcion)
)

create table ubicaciones(
nombre varchar(20) not null

constraint pk_ubicacion primary key (nombre)
)

create table estadios (
id_estadio int identity,
nombre varchar(20) not null,
capacidad int not null,
ubicacion varchar(20) not null

constraint pk_estadio primary key (id_estadio),
constraint fk_estadio_ubicacion foreign key (ubicacion)
	references ubicaciones(nombre)
)

create table partidos (
id_partido int identity,
fecha date not null,
hora datetime not null,
resultado varchar(20),
duracion int,
id_estadio int not null,
fase varchar(20) not null,
id_equipo_1 int not null,
id_equipo_2 int not null,
id_equipo_ganador int,

constraint pk_partidos primary key (id_partido) ,
constraint fk_partidos_estadios foreign key (id_estadio) 
	references estadios(id_estadio),
constraint fk_partidos_fase foreign key (fase) 
	references fases (nombre),
constraint fk_partidos_equipo_1 foreign key (id_equipo_1)
	references equipos (id_equipo),
constraint fk_partidos_equipo_2 foreign key (id_equipo_2)
	references equipos (id_equipo),
constraint chk_equipo_ganador check(id_equipo_ganador in(id_equipo_1, id_equipo_2))
)


create table goles(
id_gol int identity,
minuto int not null,
tipo_gol varchar(20), 
id_jugador int not null,
id_partido int not null

constraint pk_gol primary key (id_gol),
constraint fk_gol_jugador foreign key (id_jugador) 
	references jugadores (id_jugador),
constraint fk_gol_partido foreign key (id_partido) 
	references partidos (id_partido),
constraint chk_gol_tipo check (tipo_gol in ('normal','penal','tiro libre')),
)

create table arbitros (
id_arbitro int identity,
nombre varchar(20) not null,
apellido varchar(20) not null,
nacionalidad varchar(20) not null

constraint pk_arbitro primary key (id_arbitro)
)

create table amonestaciones (
id_amonestacion int identity,
tipo_tarjeta varchar(20) not null,
minuto int not null,
motivo varchar(50),
id_jugador int not null,
id_partido int not null,
id_arbitro int not null,

constraint pk_amonestaciones primary key (id_amonestacion),
constraint fk_amonestaciones_jugador foreign key (id_jugador) 
	references jugadores(id_jugador),
constraint fk_amonestaciones_partido foreign key (id_partido)
	references partidos (id_partido),
constraint fk_amonestaciones_arbitro foreign key (id_arbitro)
	references arbitros (id_arbitro),
constraint chk_tarjeta_tipo check (tipo_tarjeta in ('Amarilla', 'Roja'))
)