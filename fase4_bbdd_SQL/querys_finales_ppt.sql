-- QUERYS PARA PROYECTO MÚSICA

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
    
/*Aqui obtenemos la tabla de lanzamientos por mes para un año
eso pasado  EXCEL para sacar la gráfica*/



