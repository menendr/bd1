-- ============================================================================
-- BASES DE DATOS 1 - OBLIGATORIO 2
-- DML de datos de prueba para Oracle SQL
--
-- Ejecutar sobre las tablas vacias creadas por el DDL proporcionado.
-- El archivo contiene solamente sentencias INSERT y comentarios.
-- Las fechas relativas evitan depender de un formato NLS de fecha.
-- ============================================================================

-- ============================================================================
-- 1. USUARIOS
-- Q11:
--   u_alta          -> 6 agentes  -> Responsabilidad Alta.
--   u_limite        -> 5 agentes  -> limite exacto, Responsabilidad baja.
--   u_sin_agentes   -> 0 agentes  -> valida LEFT JOIN y valores cero/NULL.
--   u_cero_publica  -> 1 agente sin publicaciones -> valida maximo igual a 0.
-- ============================================================================

INSERT INTO USUARIO (alias, nombreUsuario, email, fechaRegistro)
VALUES ('u_alta', 'Usuario Alta', 'alta@prueba.uy', TRUNC(SYSDATE) - 300);

INSERT INTO USUARIO (alias, nombreUsuario, email, fechaRegistro)
VALUES ('u_limite', 'Usuario Limite', 'limite@prueba.uy', TRUNC(SYSDATE) - 250);

INSERT INTO USUARIO (alias, nombreUsuario, email, fechaRegistro)
VALUES ('u_sin_agentes', 'Usuario Sin Agentes', 'sinagentes@prueba.uy', TRUNC(SYSDATE) - 200);

INSERT INTO USUARIO (alias, nombreUsuario, email, fechaRegistro)
VALUES ('u_cero_publica', 'Usuario Cero Publica', 'ceropublica@prueba.uy', TRUNC(SYSDATE) - 150);

-- ============================================================================
-- 2. AGENTES
-- Las fechas -20, -25, -8 y -5 son del ultimo mes.
-- Las restantes quedan claramente fuera del limite de 30 dias.
-- ============================================================================

-- Usuario con 6 agentes: Q11-1.
INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (101, 'u_alta', 'Agente Universal', 'Activo', 'Simple', TRUNC(SYSDATE) - 200);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (102, 'u_alta', 'Agente Q2 Valido', 'Activo', 'Compuesta', TRUNC(SYSDATE) - 20);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (103, 'u_alta', 'Agente Q1 Valido', 'Activo', 'Simple', TRUNC(SYSDATE) - 70);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (104, 'u_alta', 'Agente IA Parcial', 'Activo', 'Compuesta', TRUNC(SYSDATE) - 80);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (105, 'u_alta', 'Agente Moderador', 'Activo', 'Simple', TRUNC(SYSDATE) - 60);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (106, 'u_alta', 'Agente Seguidor', 'Activo', 'Simple', TRUNC(SYSDATE) - 60);

-- Usuario con exactamente 5 agentes: Q11-2.
INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (201, 'u_limite', 'Agente Q2 Voto Positivo', 'Activo', 'Compuesta', TRUNC(SYSDATE) - 25);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (202, 'u_limite', 'Agente Q2 Voto Negativo', 'Activo', 'Compuesta', TRUNC(SYSDATE) - 70);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (203, 'u_limite', 'Agente Cuatro Votos', 'Activo', 'Simple', TRUNC(SYSDATE) - 8);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (204, 'u_limite', 'Agente Sin Comentarios', 'Activo', 'Simple', TRUNC(SYSDATE) - 70);

INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (205, 'u_limite', 'Agente Suspendido', 'Suspendido', 'Compuesta', TRUNC(SYSDATE) - 70);

-- Q11-8: todos los agentes de este usuario tienen cero publicaciones.
INSERT INTO AGENTE (idAgente, aliasUsuario, nombreAgente, estadoAgente, configuracion, fechaCreacion)
VALUES (301, 'u_cero_publica', 'Agente Cero Publicaciones', 'Activo', 'Simple', TRUNC(SYSDATE) - 5);

-- ============================================================================
-- 3. COMUNIDADES
-- C1 y C2: ultimos 30 dias.
-- C1 a C5: dentro de los ultimos 3 meses.
-- C6: fuera de los ultimos 3 meses.
-- ============================================================================

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (1, 'Comunidad Moderadores', TRUNC(SYSDATE) - 10, 'Moderacion y pruebas', 101);

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (2, 'Comunidad Mixta', TRUNC(SYSDATE) - 20, 'Pruebas recientes', 101);

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (3, 'Comunidad Seguidores', TRUNC(SYSDATE) - 45, 'Interaccion', 101);

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (4, 'Comunidad IA Aplicada', TRUNC(SYSDATE) - 50, 'IA aplicada', 101);

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (5, 'Comunidad Inteligencia', TRUNC(SYSDATE) - 60, 'Inteligencia artificial', 101);

INSERT INTO COMUNIDAD (idComunidad, nombre, fechaCreacion, tema, idAgenteCreador)
VALUES (6, 'Comunidad Archivo', TRUNC(SYSDATE) - 120, 'Archivo historico', 101);

-- ============================================================================
-- 4. PARTICIPACIONES
-- ============================================================================

-- Q9/Q10: el agente 101 participa en todas las comunidades y luego publicara en todas.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 101, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 101, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (3, 101, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 101, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (5, 101, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (6, 101, 'Generador');

-- Q2-1, Q2-7 y Q2-8: candidato valido.
-- Publicara como Generador en C5, es Moderador en C1 y Seguidor en C3.
-- Votara en otras comunidades, pero nunca en C3.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 102, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (3, 102, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (5, 102, 'Generador');

-- Q2-2: tiene roles Generador y Moderador, pero no realizara publicaciones.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 103, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 103, 'Generador');

-- Q2-4 y Q4: publica como Generador, no es Moderador; participa en C4 y C5,
-- pero no en C6, permitiendo detectar el falso positivo de LIKE '%IA%'.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 104, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 104, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (5, 104, 'Seguidor');

-- Q2-3 y Q7: publica como Moderador, pero no publica en la comunidad donde es Generador.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 105, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (3, 105, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (5, 105, 'Generador');

-- Q9 positivo no universal: participa y publica en C1 y C2.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 106, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 106, 'Seguidor');

-- Q2-5: publica como Generador y es Moderador en otra comunidad,
-- pero votara positivamente en C3, donde es Seguidor.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 201, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (3, 201, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 201, 'Generador');

-- Q2-6: publica como Generador y es Moderador en otra comunidad,
-- pero votara negativamente en C1, donde es Seguidor.
-- Su publicacion de C3, como Moderador, sirve ademas como caso negativo de Q7:
-- tiene comentario, pero solamente voto negativo.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (1, 202, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (3, 202, 'Moderador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 202, 'Generador');

-- Q3: en C2 hay simultaneamente un Moderador reciente (201)
-- y un Seguidor reciente (203), por lo que C2 no debe aparecer.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 203, 'Seguidor');

-- Q4: participa en las tres comunidades detectadas por la consulta actual,
-- pero se excluye por estado Suspendido.
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (2, 205, 'Generador');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (4, 205, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (5, 205, 'Seguidor');
INSERT INTO PARTICIPA (idComunidad, idAgente, rol) VALUES (6, 205, 'Seguidor');

-- ============================================================================
-- 5. PUBLICACIONES
-- ============================================================================

-- Q10: una publicacion del agente 101 en cada comunidad.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1001, 1, 101, 'Universal C1', 'Publicacion base en comunidad uno', TRUNC(SYSDATE) - 8);

-- Q5-5 / Q8-1 / Q8-3 / Q8-6:
-- puntaje global +3 y 100% positivo, pero sin comentarios; no compite en Q5.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1002, 2, 101, 'Sin comentario alto', 'Prueba de puntaje sin comentario', TRUNC(SYSDATE) - 8);

-- Q6: segunda publicacion de 101 en C2; permite comparar cantidad 2 contra cantidad 1.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1007, 2, 101, 'Universal C2 extra', 'Publicacion adicional para conteos', TRUNC(SYSDATE) - 7);

INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1003, 3, 101, 'Universal C3', 'Publicacion base en comunidad tres', TRUNC(SYSDATE) - 40);

INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1004, 4, 101, 'Universal C4', 'Publicacion base en comunidad cuatro', TRUNC(SYSDATE) - 20);

INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1005, 5, 101, 'Universal C5', 'Publicacion base en comunidad cinco', TRUNC(SYSDATE) - 20);

-- Q4: 'DIARIO' contiene la subcadena mayuscula 'IA'.
-- Q5-4 / Q8-1: comunidad antigua y puntaje global +3.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (
    1006,
    6,
    101,
    'Falso positivo IA',
    'DIARIO de pruebas del sistema',
    ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 5) + 4
);

-- Q5-1 / Q5-6 / Q7 / Q12: ganadora valida, dos comentarios y puntaje 0.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1101, 1, 105, 'Empate valido A', 'Evaluacion de modelos', TRUNC(SYSDATE) - 5);

-- Q5-1 / Q12: segunda ganadora valida, un comentario y puntaje 0.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1102, 1, 106, 'Empate valido B', 'Comparacion de respuestas', TRUNC(SYSDATE) - 4);

-- Q5-2: publicacion valida de puntaje -1, inferior a las dos ganadoras.
-- Q2-4: el autor publica como Generador pero no es Moderador en otra comunidad.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1201, 2, 104, 'Puntaje inferior', 'Resultado de prueba controlada', TRUNC(SYSDATE) - 3);

-- Q5-7 / Q8-7: activa, reciente y comentada, pero sin votos.
-- La consulta actual de Q5 la omite porque comienza desde VOTA.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1202, 2, 106, 'Comentada sin votos', 'Caso sin valoraciones', TRUNC(SYSDATE) - 3);

-- Q5-3 / Q8-1: puntaje +3 y comentario, pero autor Suspendido.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1203, 2, 205, 'Alto agente suspendido', 'Caso de control por estado', TRUNC(SYSDATE) - 2);

-- Q7 positivo y Q12: Moderador, comentarios y al menos un voto positivo.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1301, 3, 105, 'Moderador con interaccion', 'Debate moderado', TRUNC(SYSDATE) - 18);

-- Q12 y Q8-3: Seguidor con comentarios, voto y 100% positivo.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1302, 3, 201, 'Seguidor positivo', 'Aporte de un seguidor', TRUNC(SYSDATE) - 17);

-- Q7 negativo / Q12 / Q8-4: Moderador con comentario, pero solo voto negativo.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1303, 3, 202, 'Moderador negativo', 'Aporte con rechazo', TRUNC(SYSDATE) - 16);

-- Q2-5 / Q8-3: publicacion como Generador del agente 201.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1401, 4, 201, 'Generador voto positivo', 'Publicacion generadora positiva', TRUNC(SYSDATE) - 20);

-- Q2-6 / Q8-2 / Q8-4 / Q8-6: publicacion como Generador del agente 202;
-- sera la peor votada y tendra 100% de votos negativos.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (1402, 4, 202, 'Generador peor votada', 'Publicacion generadora negativa', TRUNC(SYSDATE) - 19);

-- Q4: primera comunidad IA real, fecha del primer semestre y al menos un voto.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (
    1403,
    4,
    104,
    'Publicacion IA real',
    'Aplicaciones de IA en procesos',
    ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 5) + 5
);

-- Q2-1 y Q4: publicacion como Generador del agente valido en la segunda comunidad IA.
INSERT INTO PUBLICACION (idPublicacion, idComunidad, idAgente, titulo, contenido, fecha)
VALUES (
    1501,
    5,
    102,
    'Publicacion frase IA',
    'Debate sobre Inteligencia Artificial responsable',
    ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), 5) + 6
);

-- ============================================================================
-- 6. COMENTARIOS
-- ============================================================================

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5001, 1006, TRUNC(SYSDATE) - 1, 'Comentario en falso positivo IA');

-- Q5-6: dos comentarios sobre 1101 no deben multiplicar su puntaje.
INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5101, 1101, TRUNC(SYSDATE) - 2, 'Primer comentario empate A');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5102, 1101, TRUNC(SYSDATE) - 1, 'Segundo comentario empate A');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5103, 1102, TRUNC(SYSDATE) - 1, 'Comentario empate B');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5201, 1201, TRUNC(SYSDATE) - 1, 'Comentario puntaje inferior');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5202, 1202, TRUNC(SYSDATE) - 1, 'Comentario sin votos');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5203, 1203, TRUNC(SYSDATE) - 1, 'Comentario agente suspendido');

-- Q12: C3 acumula 5 comentarios en 3 publicaciones validas.
INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5301, 1301, TRUNC(SYSDATE) - 10, 'Primer comentario moderador');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5302, 1301, TRUNC(SYSDATE) - 9, 'Segundo comentario moderador');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5303, 1302, TRUNC(SYSDATE) - 8, 'Primer comentario seguidor');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5304, 1302, TRUNC(SYSDATE) - 7, 'Segundo comentario seguidor');

INSERT INTO COMENTARIO (idComentario, idPublicacion, fechaComentario, texto)
VALUES (5305, 1303, TRUNC(SYSDATE) - 6, 'Comentario moderador negativo');

-- ============================================================================
-- 7. VOTOS
--
-- Resumen Q1 por agente:
--   103 -> 5 votos positivos y alguna publicacion comentada: aparece.
--   202 -> 5 votos, todos negativos: no aparece.
--   203 -> exactamente 4 votos positivos: no aparece.
--   204 -> 5 votos positivos, todos sobre publicaciones sin comentarios: no aparece.
--
-- Resumen Q8 por publicacion:
--   1002, 1006 y 1203 -> puntaje maximo +3.
--   1402             -> puntaje minimo -4.
--   1002, 1302, 1401 -> 100% positivo.
--   1303, 1402       -> 100% negativo.
-- ============================================================================

-- P1002: +3, 100% positivo. Q8-1, Q8-3 y solapamiento Q8-6.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (103, 1002, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (203, 1002, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (204, 1002, 1);

-- P1203: +3 con 80% positivo; queda fuera de Q5 por autor Suspendido.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (103, 1203, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (203, 1203, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (101, 1203, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (102, 1203, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (205, 1203, -1);

-- P1006: +3 con 80% positivo; queda fuera de Q5 por comunidad antigua.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (103, 1006, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (203, 1006, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (105, 1006, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (106, 1006, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (201, 1006, -1);

-- P1402: -4, 100% negativo. Q8-2, Q8-4 y solapamiento Q8-6.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (101, 1402, -1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (102, 1402, -1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (105, 1402, -1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (106, 1402, -1);

-- P1303: -1, 100% negativo; empata en mayor porcentaje negativo.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (104, 1303, -1);

-- P1302: +1, 100% positivo.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (103, 1302, 1);

-- P1401: +2, 100% positivo.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (103, 1401, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (204, 1401, 1);

-- P1101: puntaje 0. Q5 ganadora A. El voto negativo de 202 es en C1,
-- donde 202 es Seguidor, por lo que valida Q2-6.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (203, 1101, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (202, 1101, -1);

-- P1102: puntaje 0. Q5 ganadora B.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (102, 1102, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (101, 1102, -1);

-- P1201: puntaje -1, publicacion valida pero inferior en Q5.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (102, 1201, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (202, 1201, -1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (105, 1201, -1);

-- P1301: puntaje 0. El voto positivo de 201 es en C3,
-- donde 201 es Seguidor, por lo que valida Q2-5.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (201, 1301, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (202, 1301, -1);

-- P1403 y P1501: ambas publicaciones IA tienen votos y puntaje 0.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (204, 1403, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (202, 1403, -1);

INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (204, 1501, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (202, 1501, -1);

-- P1004: puntaje 0 y sin comentarios. Completa los cinco votos positivos
-- del agente 204 sin crear una publicacion comentada entre las que voto.
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (204, 1004, 1);
INSERT INTO VOTA (idAgente, idPublicacion, voto) VALUES (201, 1004, -1);
