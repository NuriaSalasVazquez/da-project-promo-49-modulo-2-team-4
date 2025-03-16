# Análisis del impacto de la pandemia en la música
*Proyecto realizado por `Brave Data`.*

## 1. Descripción del Proyecto

Music Stream en colaboración con la Fundación Armonía Social nos ha solicitado la realización de un estudio de tendencias musicales relevantes durante la pandemia. El objetivo del proyecto es obtener resultados concluyentes para la implementación de recursos musicales en servicios de atención domiciliaria.


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


## 3. Principales Resultados

- ¿Hay géneros que aumentaron/disminuyeron en popularidad?:

Leve bajada de popularidad en 2020 de todos los géneros, condicionado quizás por el estado anímico de la sociedad.

-  ¿Cuál género fue el más valorado durante la Pandemia?

El género `pop` fue el género más valorado durante la pandemia y asimismo, aumenta su popularidad tras la pandemia.


- ¿Cuál ha sido la tendencia de lanzamiento de canciones?

Se encuentran relaciones de lanzamientos de canciones con momentos clave durante la pandemia (`marzo` y `julio`).

- Otros hallazgos:
    - 21 artistas se han consolidado desde 2028 como `Billie Eilish` o `Karol G`.
    - 191 artistas aumentaron su popularidad en 2020, como `Bad Bunny`.
    - 521 artistas escuchados en 2020 tienen todavía oyentes en la actualidad.
    - 41 artistas tuvieron un pico de popularidad en 2020 como por ejemplo, `Sebastian Yatra` (en reggaeton).


## 4.Next steps:
- `Géneros`: La API de Spotify no es del todo precisa con los géneros musicales en las canciones. Hemos visto que en el json obtenido de búsqueda de datos sobre canciones en la API de Spotipy, no aparece el género, sino que esta información aparece en el artista. Nos gustaría en el futuro poder hacer una llamada a la API directamente con la información del artista y filtrar correctamente el género de cada canción.

- Por otro lado, este proyecto sienta las bases para futuras investigaciones y algunas mejoras podrían ser:

    - `Ampliar los géneros musicales`: obtener el género de cada artista para filtrar y clasificar mejor las canciones.

    - `Cruzar estos datos con datos poblacionales.`

    - `Proponer rutinas musicales para el bienestar`.
    
     

