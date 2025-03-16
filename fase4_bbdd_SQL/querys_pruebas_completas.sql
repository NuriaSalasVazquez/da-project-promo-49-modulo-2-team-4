-- QUERYS COMPLETAS TODO EQUIPO PROYECTO MÚSICA PARA ELEGIR LAS CLAVES

USE music_stream_proyecto2;

/* Artistas que se mantuvieron en el tiempo
Artistas consolidados → Aquellos que han lanzado música en varios años diferentes. */
SELECT artist_name,
       COUNT(DISTINCT YEAR(release_date)) AS num_years,
       CASE
           WHEN COUNT(DISTINCT YEAR(release_date)) > 4 THEN 'Consolidado'
       END AS categoria,
       MIN(release_date) AS first_release_date,  -- Primera fecha de lanzamiento del artista
       genero
FROM tracks_spoty as s
INNER JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
GROUP BY artist_name, genero
HAVING num_years = 6
ORDER BY num_years DESC;

-- Artistas del 2020 que aún tienen oyentes en la actualidad: 521
SELECT DISTINCT s.artist_name
FROM tracks_spoty s
JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2020);

/* Artistas que aumentaron su popularidad en 2020, midiendo su media de popularidad antes de la pandemia, durante y después */
SELECT artist_name, genero,
		AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END) AS media_popu_antes,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) AS media_popu_durante,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2022 AND 2023 THEN popularity END) AS media_popu_despues
FROM tracks_spoty
WHERE genero = "pop" -- cambiar el género para sacar una muestra de 5 artistas por género
GROUP BY artist_name, genero
HAVING media_popu_antes IS NOT NULL 
   AND media_popu_durante IS NOT NULL 
   AND media_popu_despues IS NOT NULL
ORDER BY media_popu_durante DESC
LIMIT 5;

SELECT YEAR(s.release_date) AS year,
       s.genero,
       AVG(s.popularity) AS avg_popularity,
       COUNT(s.track_name) AS num_tracks,
       SUM(a.listeners) AS total_listeners
FROM tracks_spoty s
JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2019, 2020, 2021, 2022, 2024)
GROUP BY YEAR(s.release_date), s.genero
ORDER BY year, avg_popularity DESC;

-- 41 artistas brillaron...
SELECT artist_name,
       genero,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END) AS media_popu_antes,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) AS media_popu_durante,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2022 AND 2023 THEN popularity END) AS media_popu_despues,
       (AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) -
        AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END)) AS diferencia_antes_durante
FROM tracks_spoty
WHERE genero = "rap" -- cambiar el género para sacar una muestra de 5 artistas por género
GROUP BY artist_name, genero
HAVING media_popu_antes IS NOT NULL
   AND media_popu_durante IS NOT NULL
   AND media_popu_despues IS NOT NULL
   AND media_popu_antes < media_popu_durante
   AND media_popu_durante > media_popu_despues
ORDER BY media_popu_durante DESC
LIMIT 1000;

-- 191 artistas aumentaron su popularidad en 2020:
SELECT artist_name,
       genero,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END) AS media_popu_antes,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) AS media_popu_durante
FROM tracks_spoty
WHERE genero = "rap" -- cambiar el género para sacar una muestra de 5 artistas por género
GROUP BY artist_name, genero
HAVING media_popu_antes IS NOT NULL
   AND media_popu_durante IS NOT NULL
   AND media_popu_antes < media_popu_durante
ORDER BY media_popu_durante DESC
LIMIT 1000;

/* Artistas que se mantuvieron en el tiempo
Artistas consolidados → Aquellos que han lanzado música en varios años diferentes. */
SELECT artist_name,
       COUNT(DISTINCT YEAR(release_date)) AS num_years,
       CASE
           WHEN COUNT(DISTINCT YEAR(release_date)) > 4 THEN 'Consolidado'
       END AS categoria,
       MIN(release_date) AS first_release_date,  -- Primera fecha de lanzamiento del artista
       genero
FROM tracks_spoty as s
INNER JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
GROUP BY artist_name, genero
HAVING num_years = 6
ORDER BY num_years DESC;

-- Artistas del 2020 que aún tienen oyentes en la actualidad: 521
SELECT DISTINCT s.artist_name
FROM tracks_spoty s
JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2020);

/* Artistas que aumentaron su popularidad en 2020, midiendo su media de popularidad antes de la pandemia, durante y después */
SELECT artist_name, genero,
		AVG(CASE WHEN YEAR(release_date) BETWEEN 2018 AND 2019 THEN popularity END) AS media_popu_antes,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2020 AND 2021 THEN popularity END) AS media_popu_durante,
       AVG(CASE WHEN YEAR(release_date) BETWEEN 2022 AND 2023 THEN popularity END) AS media_popu_despues
FROM tracks_spoty
WHERE genero = "pop" -- cambiar el género para sacar una muestra de 5 artistas por género
GROUP BY artist_name, genero
HAVING media_popu_antes IS NOT NULL 
   AND media_popu_durante IS NOT NULL 
   AND media_popu_despues IS NOT NULL
ORDER BY media_popu_durante DESC
LIMIT 5;

SELECT YEAR(s.release_date) AS year,
       s.genero,
       AVG(s.popularity) AS avg_popularity,
       COUNT(s.track_name) AS num_tracks,
       SUM(a.listeners) AS total_listeners
FROM tracks_spoty s
JOIN artist_get_info_lastfm a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2019, 2020, 2021, 2022, 2024)
GROUP BY YEAR(s.release_date), s.genero
ORDER BY year, avg_popularity DESC;

-- QUERYS CON GRÁFICAS

SELECT genero, COUNT(*)
	FROM tracks_spoty
	WHERE popularity > 75
	AND YEAR(release_date) = 2018
	GROUP BY genero
	HAVING genero = 'indie';
    
/* Con esto obtenemos el número de géneros populares para cada año. (Gráfica EXCEL)
Hay que ir cambiando los años y los géneros para obtener los datos */

SELECT MONTH(release_date) AS mes, COUNT(*) AS total_canciones
	FROM tracks_spoty
	WHERE YEAR(release_date) = 2018
	GROUP BY MONTH(release_date)
	ORDER BY total_canciones DESC;
    
-- 

SELECT artist_name,popularity, artist,listeners
FROM tracks_spoty
LEFT JOIN  artist_get_info_lastfm
ON artist=artist_name;

SELECT genero, 
       YEAR(release_date), 
       COUNT(track_name) AS num_tracks, 
       AVG(popularity) AS avg_popularity
FROM tracks_spoty
WHERE YEAR(release_date) BETWEEN 2019 AND 2021
GROUP BY genero, YEAR(release_date)
ORDER BY YEAR(release_date), num_tracks DESC;

SELECT artist_name AS name,
       YEAR(release_date) AS year, 
       SUM(listeners) AS total_listeners,
       AVG(listeners) AS avg_listeners
FROM artist_get_info_lastfm AS a
INNER JOIN tracks_spoty AS t
ON t.artist_name=a.artist
WHERE YEAR(release_date) BETWEEN 2019 AND 2021
GROUP BY artist_name, YEAR(release_date)
ORDER BY artist_name, YEAR(release_date);

SELECT COUNT(*)
FROM artist_get_info_lastfm;

SELECT track_name, COUNT(genero),
       artist_name, 
       YEAR(release_date), 
       AVG(popularity) AS avg_popularity
FROM tracks_spoty
WHERE YEAR(release_date) IN (2019, 2021)
GROUP BY track_name, artist_name, YEAR (release_date),genero
ORDER BY YEAR  (release_date), avg_popularity DESC;

SELECT track_name, 
       artist_name, 
       YEAR(release_date) AS release_year, 
       genero, 
       COUNT(genero) AS count_genero,
       AVG(popularity) AS avg_popularity
FROM tracks_spoty
WHERE YEAR(release_date) IN (2019, 2021)
GROUP BY track_name, artist_name, YEAR(release_date), genero
ORDER BY release_year, avg_popularity DESC;

SELECT artist_name, MAX(popularity)
FROM tracks_spoty
WHERE YEAR(release_date)= 2020
GROUP BY artist_name
LIMIT 1;

-- Comparacion popularidad en 2019 vs 2021

SELECT track_name, 
       artist_name, 
       YEAR(release_date) AS year, 
       AVG(popularity) AS avg_popularity
FROM tracks_spotY
WHERE YEAR(release_date) IN (2019, 2021)
GROUP BY track_name, artist_name, YEAR(release_date)
ORDER BY YEAR(release_date), avg_popularity DESC;

-- Géneros más populares en cada año
SELECT genero, 
       YEAR(release_date) AS year, 
       AVG(popularity) AS avg_popularity
FROM tracks_spoty
GROUP BY genero, YEAR(release_date)
ORDER BY year, avg_popularity DESC;
 
 -- Artistas que más crecieron en pandemia
  SELECT a.artist, 
       SUM(a.playcount) AS total_reproducciones, 
       COUNT(a.listeners) AS total_oyentes
FROM artist_get_info_lastfm AS a
INNER JOIN tracks_spoty AS t
ON artist_name=artist
WHERE YEAR(t.release_date) BETWEEN 2019 AND 2021
GROUP BY a.artist
ORDER BY total_reproducciones DESC
LIMIT 10;

-- Análisis de Géneros Musicales

SELECT genero, YEAR(release_date) AS year, AVG(popularity) AS avg_popularity
FROM tracks_spoty
GROUP BY genero, YEAR(release_date)
ORDER BY year, avg_popularity DESC;
 
 -- Canciones más populares de 2020 (pandemia)
SELECT  track_name, artist_name, popularity,genero
FROM tracks_spoty
WHERE YEAR(release_date) = 2020
ORDER BY popularity DESC
LIMIT 10;

-- Año con más reproducciones
SELECT YEAR(s.release_date) AS año, 
       SUM(l.playcount) AS total_reproducciones
FROM artist_get_info_lastfm AS l
JOIN tracks_spoty AS s 
ON l.artist = s.artist_name
WHERE YEAR(s.release_date) BETWEEN 2018 AND 2022
GROUP BY año
ORDER BY año DESC;

SELECT YEAR(s.release_date) AS año, 
       SUM(l.playcount) AS total_reproducciones
FROM artist_get_info_lastfm AS l
JOIN tracks_spoty AS s 
ON l.artist = s.artist_name
WHERE YEAR(s.release_date) BETWEEN 2018 AND 2022
GROUP BY año
ORDER BY año DESC;

-- Número de oyentes por año
SELECT YEAR(s.release_date) AS año, 
       SUM(l.listeners) AS total_oyentes
FROM lastfm_artists AS l
JOIN tracks_spotify AS s 
ON l.artist = s.artist_name
WHERE YEAR(s.release_date) BETWEEN 2018 AND 2022
GROUP BY año
ORDER BY año;

-- Oyentes por género y año

SELECT YEAR(s.release_date) AS año, 
       s.genero, 
       SUM(l.listeners) AS total_oyentes
FROM artist_get_info_lastfm AS l
JOIN tracks_spoty AS s 
ON l.artist = s.artist_name
WHERE YEAR(s.release_date) BETWEEN 2018 AND 2022
GROUP BY año, s.genero
ORDER BY año, total_oyentes DESC;

-- Identificar canciones duplicadas (diferentes formas de buscar esos duplicados)
   
SELECT track_name, artist_name, COUNT(DISTINCT genero) AS cantidad_generos
FROM tracks_spoty
GROUP BY track_name, artist_name
HAVING COUNT(DISTINCT genero) > 1;

SELECT track_name, artist_name, release_date, COUNT(*) AS veces_repetida
FROM tracks_spoty
GROUP BY track_name, artist_name, release_date
HAVING COUNT(*) > 1;

SELECT track_name, artist_name, COUNT(DISTINCT genero) AS cantidad_generos
FROM tracks_spoty
GROUP BY track_name, artist_name
HAVING COUNT(DISTINCT genero) > 1;

CREATE TABLE tracks_spoty_sin_duplicados AS
SELECT DISTINCT track_name, artist_name, MIN(genero) AS genero
FROM tracks_spoty
GROUP BY track_name, artist_name;

DELETE t1 FROM tracks_spoty t1
JOIN tracks_spoty t2
ON t1.track_name = t2.track_name 
AND t1.artist_name = t2.artist_name 
AND t1.id_track > t2.id_track;

-- Géneros que aumentaron/disminuyeron en popularidad

SELECT YEAR(release_date) AS year, genero, 
       ROUND (AVG(popularity),2) AS avg_popularity,
       MAX(popularity) AS max_popularity
FROM spotipy
GROUP BY YEAR(release_date), genero
ORDER BY YEAR, avg_popularity DESC;

-- ¿Artistas que se mantuvieron en el tiempo vs. artistas emergentes?
-- Artistas consolidados → Aquellos que han lanzado música en varios años diferentes.
-- Artistas emergentes → Aquellos que solo tienen música en un solo año.

SELECT artist_name, 
       COUNT(DISTINCT YEAR(release_date)) AS num_years,
       CASE 
           WHEN COUNT(DISTINCT YEAR(release_date)) > 2 THEN 'Consolidado'
           ELSE 'Emergente'
       END AS categoria,
       MIN(release_date) AS first_release_date,  -- Primera fecha de lanzamiento del artista
       genero  
FROM spotipy
GROUP BY artist_name,genero
ORDER BY num_years DESC;

SELECT s.artist_name, 
       COUNT(DISTINCT YEAR(s.release_date)) AS año,
       CASE 
           WHEN COUNT(DISTINCT YEAR(s.release_date)) > 1 THEN 'Consolidado'
           ELSE 'Emergente'
       END AS categoria
FROM spotipy s

JOIN (SELECT track_name
		FROM spotipy
		GROUP BY track_name
		HAVING COUNT(DISTINCT artist_name) = 1) AS cancion_artista

ON s.track_name = cancion_artista.track_name
GROUP BY s.artist_name
ORDER BY año DESC;

-- ¿Cuál género fue el más valorado durante la Pandemia?
-- Filtrar por los años de la pandemia: Limitar los datos a los años 2020 y 2021.
-- Obtener la popularidad por género: Podemos usar la media de popularidad (AVG(popularity))
-- Agrupar por género y ordenar por popularidad: Esto nos permitirá ver cuál fue el género más popular durante este periodo.

SELECT genero, YEAR(release_date), MAX(popularity) AS max_pop
FROM spotipy
WHERE YEAR (release_date) IN (2019, 2020, 2021)
GROUP BY genero, YEAR (release_date)
ORDER BY max_pop DESC;

-- ¿En qué año se han lanzado más canciones?

SELECT YEAR(release_date) AS año, 
       COUNT(*) AS canciones
FROM spotipy
GROUP BY año
ORDER BY canciones DESC -- Ordenamos los resultados en orden descendente, para que el año con más canciones aparezca primero.
LIMIT 5; --  Limitamos el resultado a los 5 años, para hacer la comparación.

-- ¿Cuál fue la canción más valorada durante la Pandemia? ¿Y en la actualidad?
SELECT track_name, artist_name, popularity, release_date, genero
FROM spotipy
WHERE YEAR (release_date) BETWEEN 2019 AND 2024
ORDER BY popularity DESC
LIMIT 50;

SELECT track_name, artist_name, popularity, release_date, genero
FROM spotipy
WHERE YEAR (release_date) BETWEEN 2019 AND 2020
ORDER BY popularity DESC
LIMIT 1;

SELECT track_name, artist_name, popularity, release_date, genero
FROM spotipy
WHERE YEAR (release_date) IN ('2024')
ORDER BY popularity DESC
LIMIT 1;

-- ¿Se consumió más música durante la Pandemia?

SELECT genero,YEAR(release_date) AS año, 
       COUNT(*) AS num_canciones, 
       AVG(popularity) AS popularidad_media
FROM spotipy
WHERE YEAR(release_date) BETWEEN 2019 AND 2021  
GROUP BY año, genero
ORDER BY año;

-- Artistas del 2019 que aún tienenoyentes en la actualidad: 521

SELECT DISTINCT s.artist_name
FROM spotipy s
JOIN artistas_sin_duplicados a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2019);

-- Quien de estos artistas es el más popular en la actualidad

-- Filtrar los artistas de 2019 que también existen en la tabla artistas_sin_duplicados, es decir, en los datos de last_fm.

SELECT s.artist_name, MAX(s.popularity) AS max_popularidad
FROM spotipy s

JOIN artistas_sin_duplicados a 
ON s.artist_name = a.artist
	WHERE YEAR(s.release_date) IN ('2019')
    
GROUP BY s.artist_name
ORDER BY max_popularidad DESC;

-- Comparativa de la popularidad de los artistas más escuchados en 2019 con su número de oyentes en la actualidad

SELECT s.popularity, s.artist_name, a.artist, a.oyentes
	FROM spotipy AS s
    
JOIN artistas_sin_duplicados AS a
ON s.artist_name = a.artist

	WHERE YEAR (s.release_date) = 2019
    AND s.popularity > 50 AND a.oyentes > 0

ORDER BY s.popularity DESC
LIMIT 50;


SELECT s.artist_name, MAX(s.popularity) AS max_popularidad
FROM spotipy s

JOIN artistas_sin_duplicados a 
ON s.artist_name = a.artist
	WHERE YEAR(s.release_date) IN ('2019')
    
GROUP BY s.artist_name
ORDER BY max_popularidad DESC;

-- Comparativa de la popularidad de los artistas más escuchados en 2019 con su número de oyentes en la actualidad

SELECT s.popularity, s.artist_name, a.artist, a.oyentes, s.genero
	FROM spotipy AS s
    
JOIN artistas_sin_duplicados AS a
ON s.artist_name = a.artist

	WHERE YEAR (s.release_date) BETWEEN 2019 AND 2022
    AND s.popularity > 50 AND a.oyentes > 0

ORDER BY s.popularity DESC, s.genero
LIMIT 50;

-- Comparativa del genero reggeateon

SELECT YEAR(release_date), ROUND(AVG(popularity),2), COUNT(track_name)
FROM spotipy
WHERE genero IN ('reggaeton') 
GROUP BY YEAR(release_date);

--  Consulta sobre el Consumo de Música y el Impacto de la Pandemia

-- Para estudiar el impacto en la música, puedes hacer comparaciones entre el consumo de música antes y durante la pandemia, 
-- especialmente entre los años 2019, 2020, y 2021.

-- Ejemplo de consulta para comparar el consumo (popularidad de canciones y géneros):

SELECT YEAR(s.release_date) AS year, 
       s.genero, 
       AVG(s.popularity) AS avg_popularity,
       COUNT(s.track_name) AS num_tracks,
       SUM(a.oyentes) AS total_listeners
FROM spotipy s
JOIN artistas_sin_duplicados a ON s.artist_name = a.artist
WHERE YEAR(s.release_date) IN (2019, 2020, 2021, 2022, 2024)
GROUP BY YEAR(s.release_date), s.genero
ORDER BY year, avg_popularity DESC;
