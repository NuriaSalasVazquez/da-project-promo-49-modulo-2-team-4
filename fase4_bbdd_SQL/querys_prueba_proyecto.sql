-- QUERYS PARA PROYECTO MÚSICA

USE music_stream_proyecto2;

/* Artistas más populares en Last.fm */
SELECT artist, listeners, playcount 
FROM artist_get_info_lastfm 
ORDER BY listeners DESC 
LIMIT 20;

/* Tracks más populares en Spotify */
SELECT track_name, artist_name, popularity 
FROM tracks_spoty 
ORDER BY popularity DESC 
LIMIT 20;

/* Distribución de popularidad en Spotify por género */
SELECT genero, AVG(popularity) AS avg_popularity 
FROM tracks_spoty 
GROUP BY genero 
ORDER BY avg_popularity DESC;

/* Artistas más escuchados en Last.fm y su número de reproducciones */
SELECT artist, SUM(playcount) AS total_playcount 
FROM artist_get_info_lastfm 
GROUP BY artist 
ORDER BY total_playcount DESC 
LIMIT 20;

/* Evolución de la popularidad de los lanzamientos en Spotify por año */
SELECT YEAR(release_date) AS año, AVG(popularity) AS avg_popularity 
FROM tracks_spoty 
GROUP BY año; -- aquí me sale un año como 1

/* Artistas en ambas bases de datos y su popularidad comparada */
SELECT t.artist_name, t.popularity, a.listeners, a.playcount 
FROM tracks_spoty t 
JOIN artist_get_info_lastfm a 
ON t.artist_name = a.artist; -- artistas repetidos, hay que eliminarlos


/* PANDEMIA
Popularidad de lanzamientos en 2020 comparada con otros años */
SELECT YEAR(release_date) AS año, COUNT(*) AS total_tracks, AVG(popularity) AS avg_popularity 
FROM tracks_spoty 
WHERE YEAR(release_date) BETWEEN 2018 AND 2022 
GROUP BY año 
ORDER BY año;

/* Artistas que aumentaron su popularidad en 2020 */
SELECT artist_name, AVG(popularity) AS avg_popularity_2020 
FROM tracks_spoty 
WHERE YEAR(release_date) = 2020 
GROUP BY artist_name 
ORDER BY avg_popularity_2020 DESC 
LIMIT 20;

/* PREGUNTAS GRUPO 
¿Géneros que aumentaron/disminuyeron en popularidad?*/
SELECT genero, 
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END) AS media_popu_antes,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) AS media_popu_durante,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2022 AND 2023 THEN popularity END) AS media_popu_despues
FROM tracks_spoty
GROUP BY genero;

/* ¿Artistas que se mantuvieron en el tiempo vs. artistas emergentes? */
SELECT artist_name, COUNT(DISTINCT YEAR(release_date)) AS años_activo,
       MIN(YEAR(release_date)) AS primer_lanzamiento, 
       MAX(YEAR(release_date)) AS ultimo_lanzamiento
FROM tracks_spoty
GROUP BY artist_name
HAVING años_activo > 4
ORDER BY años_activo DESC; -- otra vez el año 1

/* ¿Relación entre pandemia y cambios en hábitos de escucha? */
SELECT YEAR(release_date) AS año, 
       COUNT(id_track) AS total_tracks,
       AVG(popularity) AS media_popularidad
FROM tracks_spoty
WHERE YEAR(release_date) BETWEEN 2018 AND 2023
GROUP BY año
ORDER BY año; -- NO VALE ESTA PREGUNTA: los tracks totales son los que hemos sacado

/* Durante el año 2020, ¿cuál fue el mes con mayor número de reproducciones? ¿Y cuál el mes con menores escuchas? */

SELECT MONTH(release_date) AS mes, 
       SUM(popularity) AS total_popularity
FROM tracks_spoty
WHERE YEAR(release_date) = 2020
GROUP BY mes
ORDER BY total_popularity DESC;






