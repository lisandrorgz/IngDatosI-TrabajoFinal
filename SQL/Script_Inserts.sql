-- Insertar Fases
exec sp_insertar_fase 'Octavos de Final';
exec sp_insertar_fase 'Cuartos de Final';
exec sp_insertar_fase 'Semifinales';
exec sp_insertar_fase 'Final';

SELECT * FROM fases

-- Insertar Entrenadores
exec sp_insertar_entrenador 'Lionel', 'Scaloni'; -- Argentina
exec sp_insertar_entrenador 'Didier', 'Deschamps'; -- Francia
exec sp_insertar_entrenador 'Tite', ''; -- Brasil
exec sp_insertar_entrenador 'Fernando', 'Santos'; -- Portugal

SELECT * FROM entrenadores

-- Insertar Equipos
exec sp_insertar_equipo 'Argentina', 1;
exec sp_insertar_equipo 'Francia', 2;
exec sp_insertar_equipo 'Brasil', 3;
exec sp_insertar_equipo 'Portugal', 4;

SELECT * FROM equipos

-- Insertar Posiciones
exec sp_insertar_posicion 'Delantero';
exec sp_insertar_posicion 'Centrocampista';
exec sp_insertar_posicion 'Defensa';
exec sp_insertar_posicion 'Portero';

SELECT * FROM posiciones

-- Insertar Jugadores
--Jugadores Argentinos
exec sp_insertar_jugador 'Emiliano', 'Martínez', 1, 'Portero';
exec sp_insertar_jugador 'Nahuel', 'Molina', 1, 'Defensa';
exec sp_insertar_jugador 'Cristian', 'Romero', 1, 'Defensa';
exec sp_insertar_jugador 'Nicolás', 'Otamendi', 1, 'Defensa';
exec sp_insertar_jugador 'Marcos', 'Acuña', 1, 'Defensa';
exec sp_insertar_jugador 'Rodrigo', 'De Paul', 1, 'Centrocampista';
exec sp_insertar_jugador 'Leandro', 'Paredes', 1, 'Centrocampista';
exec sp_insertar_jugador 'Giovani', 'Lo Celso', 1, 'Centrocampista';
exec sp_insertar_jugador 'Lionel', 'Messi', 1, 'Delantero';
exec sp_insertar_jugador 'Lautaro', 'Martínez', 1, 'Delantero';
exec sp_insertar_jugador 'Ángel', 'Di María', 1, 'Delantero';
--Jugadores Franceses
exec sp_insertar_jugador 'Hugo', 'Lloris', 2, 'Portero';
exec sp_insertar_jugador 'Benjamin', 'Pavard', 2, 'Defensa';
exec sp_insertar_jugador 'Raphaël', 'Varane', 2, 'Defensa';
exec sp_insertar_jugador 'Presnel', 'Kimpembe', 2, 'Defensa';
exec sp_insertar_jugador 'Lucas', 'Hernández', 2, 'Defensa';
exec sp_insertar_jugador 'Golo', 'Kanté', 2, 'Centrocampista';
exec sp_insertar_jugador 'Paul', 'Pogba', 2, 'Centrocampista';
exec sp_insertar_jugador 'Adrien', 'Rabiot', 2, 'Centrocampista';
exec sp_insertar_jugador 'Antoine', 'Griezmann', 2, 'Delantero';
exec sp_insertar_jugador 'Kylian', 'Mbappé', 2, 'Delantero';
exec sp_insertar_jugador 'Karim', 'Benzema', 2, 'Delantero';
--Jugadores Brasileros
exec sp_insertar_jugador 'Alisson', 'Becker', 3, 'Portero';
exec sp_insertar_jugador 'Danilo', 'Luiz da Silva', 3, 'Defensa';
exec sp_insertar_jugador 'Marquinhos', 'Corrêa', 3, 'Defensa';
exec sp_insertar_jugador 'Thiago', 'Silva', 3, 'Defensa';
exec sp_insertar_jugador 'Alex', 'Sandro', 3, 'Defensa';
exec sp_insertar_jugador 'Casemiro', 'Casimiro', 3, 'Centrocampista';
exec sp_insertar_jugador 'Lucas', 'Paquetá', 3, 'Centrocampista';
exec sp_insertar_jugador 'Fred', 'Rodrigues', 3, 'Centrocampista';
exec sp_insertar_jugador 'Neymar', 'Junior', 3, 'Delantero';
exec sp_insertar_jugador 'Gabriel', 'Jesus', 3, 'Delantero';
exec sp_insertar_jugador 'Vinícius', 'Júnior', 3, 'Delantero';
--Jugadores portugueses
exec sp_insertar_jugador 'Rui', 'Patrício', 4, 'Portero';
exec sp_insertar_jugador 'João', 'Cancelo', 4, 'Defensa';
exec sp_insertar_jugador 'Pepe', 'Ferreira', 4, 'Defensa';
exec sp_insertar_jugador 'Rúben', 'Dias', 4, 'Defensa';
exec sp_insertar_jugador 'Raphaël', 'Guerreiro', 4, 'Defensa';
exec sp_insertar_jugador 'Bernardo', 'Silva', 4, 'Centrocampista';
exec sp_insertar_jugador 'Bruno', 'Fernandes', 4, 'Centrocampista';
exec sp_insertar_jugador 'João', 'Moutinho', 4, 'Centrocampista';
exec sp_insertar_jugador 'Diogo', 'Jota', 4, 'Delantero';
exec sp_insertar_jugador 'Cristiano', 'Ronaldo', 4, 'Delantero';
exec sp_insertar_jugador 'André', 'Silva', 4, 'Delantero';

SELECT * FROM jugadores

-- Insertar Ubicaciones
exec sp_insertar_ubicacion 'Estados Unidos';
exec sp_insertar_ubicacion 'Canada';
exec sp_insertar_ubicacion 'Mexico';

SELECT * FROM ubicaciones

-- Insertar Estadios
exec sp_insertar_estadio 'MetLife Stadium', 82500, 'Estados Unidos';
exec sp_insertar_estadio 'BC Place', 54000, 'Canada';
exec sp_insertar_estadio 'Estadio Azteca', 87500, 'Mexico';

SELECT * FROM estadios

-- Insertar Partidos
exec sp_agregar_partido '2022-12-13', '20:00', 1, 'Semifinales', 1, 2;
exec sp_agregar_partido '2022-12-14', '20:00', 2, 'Semifinales', 3, 4;
exec sp_agregar_partido '2022-12-18', '18:00', 3, 'Final', 1, 3;

select * from partidos

-- Insertar Árbitros
exec sp_insertar_arbitro 'Antonio', 'Mateu Lahoz', 'España';
exec sp_insertar_arbitro 'Daniele', 'Orsato', 'Italia';
exec sp_insertar_arbitro 'Wilton', 'Sampaio', 'Brasil';

SELECT * FROM arbitros

-- Insertar Goles
EXEC sp_agregar_gol 15, 'normal', 1, 1;
EXEC sp_agregar_gol 25, 'penal', 2, 1;
EXEC sp_agregar_gol 35, 'tiro libre', 3, 1;
EXEC sp_agregar_gol 50, 'normal', 4, 1;

EXEC sp_agregar_gol 10, 'normal', 5, 2;
EXEC sp_agregar_gol 22, 'penal', 6, 2;
EXEC sp_agregar_gol 44, 'normal', 7, 2;
EXEC sp_agregar_gol 58, 'tiro libre', 8, 2;

EXEC sp_agregar_gol 20, 'normal', 1, 3;
EXEC sp_agregar_gol 33, 'normal', 3, 3;
EXEC sp_agregar_gol 47, 'penal', 5, 3;
EXEC sp_agregar_gol 65, 'tiro libre', 7, 3;

select * from goles