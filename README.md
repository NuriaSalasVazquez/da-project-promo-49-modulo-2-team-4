# Análisis del impacto de la pandemia en la música

## 1. Descripción del Proyecto
Este proyecto analiza el impacto de la pandemia en los hábitos de escucha de música a partir de datos extraídos de `Spotify` y `LastFM`. Se estudian los géneros más populares entre 2019 y 2022, los artistas más relevantes antes, durante y después de la pandemia, y se comparan con los artistas y canciones más escuchados en la actualidad (2024).

El objetivo principal es determinar si la pandemia generó cambios significativos en la popularidad de ciertos géneros musicales y en la permanencia de los artistas en la industria.


## 2. Metodología

Desarrollo del proyecto en 9 sesiones:

### 2.1. Planificación (sesión 1)
- Definición de hipótesis

- Selección de `APIs`: Spotify (Spotipy) y LastFM

- Estructura de los datos a extraer


### 2.2. Extracción de datos (sesiones 2, 3, 4, 5)
- Obtención de las 500 canciones más populares de cada género (`reggaetón, rap, pop e indie)` en Spotify (2019-2022).

- Extracción de `información de LastFM sobre los artistas` obtenidos en Spotify (número de oyentes, reproducciones y biografía).

- Obtención de las 200 canciones más escuchadas actualmente (2024) en LastFM.

- Obtención de las 500 canciones más populares de cada género (reggaetón, rap, pop e indie) en Spotify del año 2024.

### 2.3. Creación y almacenamiento de datos (sesiones 6, 7, 8) 
- Transformación de los datos en `DataFrames (Pandas)`.

- Almacenamiento en archivos `CSV`.

- Integración de los datos en una base de datos `MySQL` para facilitar el análisis.

### 2.4. Análisis de resultados (sesiones 7, 8, 9) 
- Identificación de cambios en la popularidad de géneros antes, durante y después de la pandemia.

- Comparación de artistas populares en 2019-2022 vs. artistas más escuchados en 2024.

- Visualización de tendencias de consumo musical en la pandemia.

- Documentación de hallazgos y elaboración de conclusiones.

## 3.Presentación final (tips)

- Visión general del proyecto, metodologías utilizadas y resultados clave.

## 4. Principales Resultados

*por determinar, dejo algo a modo de ejemplo*

- ¿Géneros que aumentaron/disminuyeron en popularidad?
-  ¿Artistas que se mantuvieron en el tiempo vs. artistas emergentes?
- ¿Relación entre pandemia y cambios en hábitos de escucha?
-  ¿Cuál género fue el más valorado durante la Pandemia?
- ¿En qué año se han lanzado más canciones?
- ¿Cuál fue la canción más valorada durante la Pandemia? ¿Y en la actualidad?
- ¿Se consumió más música durante la Pandemia?
- Durante el año 2020,¿Cuál fue el mes con mayor número de reproducciones?¿Y cuál el mes con menores escuchas?
- ¿?¿?¿?



## 5.Next steps:
- `Géneros`: La API de Spotify no es del todo precisa con los géneros musicales en las canciones. Hemos visto que en el json obtenido de búsqueda de datos sobre canciones en la API de Spotipy, no aparece el género, sino que esta información aparece en el artista. Nos gustaría en el futuro poder hacer una llamada a la API directamente con la información del artista y filtrar correctamente el género de cada canción.

- `Artistas similares`: Hacer una búsqueda de artistas similares para compararlos con los más escuchados y obtener conclusiones.

- `Búsqueda por países`: Ampliar a búsqueda a diferentes países.

