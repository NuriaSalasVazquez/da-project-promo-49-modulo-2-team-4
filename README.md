#  🎶 Evolución de la Música en la Pandemia
**Proyecto realizado por `Brave Data`.**

## 1. 📍 Descripción del Proyecto

`Music Stream` en colaboración con la `Fundación Armonía Social` nos solicitó un estudio sobre tendencias musicales durante la pandemia. El objetivo del proyecto es obtener resultados concluyentes para la implementación de recursos musicales en servicios de atención domiciliaria.


## 2. 📊 Metodología

### 2.1. Planificación (sesión 1)
- Definición de hipótesis
- Selección de `APIs`: Spotify (Spotipy) y LastFM
- Estructura de los datos a extraer

### 2.2. Extracción de datos (sesiones 2, 3, 4, 5)
- Obtención de las 500 canciones más populares de cada género (`reggaetón, rap, pop e indie)` en Spotify (2019-2022).
- Extracción de `información de LastFM sobre los artistas` obtenidos en Spotify (número de oyentes, reproducciones y biografía).
- Obtención de las 500 canciones más populares de cada género (reggaetón, rap, pop e indie) en Spotify del año 2024.

### 2.3. Creación y almacenamiento de datos (sesiones 6, 7, 8) 
- Transformación de los datos con Pandas `DataFrames`.
- Exportación a archivos `CSV`.
- Integración de los datos en una base de datos `MySQL` para facilitar el análisis.

### 2.4. Análisis de resultados (sesiones 7, 8, 9) 
- Identificación de cambios en la popularidad de géneros antes, durante y después de la pandemia.
- Comparación de artistas populares en 2019-2022 vs. artistas más escuchados en 2024.
- Visualización de tendencias de consumo musical en la pandemia.
- Documentación de hallazgos y elaboración de conclusiones.


## 3.  📌 Principales Resultados

### 🎼  ¿Hay géneros que aumentaron/disminuyeron en popularidad?:

Leve bajada de popularidad en 2020 de todos los géneros, condicionado quizás por el estado anímico de la sociedad.

### 🎤¿Qué género fue el más valorado durante la Pandemia?

El género `pop` fue el género más valorado durante la pandemia y continuó ganando popularidad tras la pandemia.

### 📆 ¿Cómo evolucionó el lanzamiento de canciones?

Se encuentran relaciones de lanzamientos de canciones con momentos clave durante la pandemia (`marzo` y `julio`).

### 🚀 Otros Hallazgos :
- 21 artistas se han consolidado desde 2018 como `Billie Eilish` o `Karol G`.
- 191 artistas aumentaron su popularidad en 2020, como `Bad Bunny`.
- 521 artistas escuchados en 2020 tienen todavía oyentes en la actualidad.
- 41 artistas tuvieron un pico de popularidad en 2020 como por ejemplo, `Sebastian Yatra` (en reggaeton).


## 4.Next steps:
### Mejorar la precisión de los Géneros: 
La API de Spotify `no proporciona el género a nivel de canción`, solo a nivel de artista. En el futuro, podríamos hacer llamadas adicionales a la API para clasificar correctamente cada canción en un determinado género.  

### Ampliar el proceso de investigación con datos poblacionales:
Incluir información `demográfica` para analizar situaciones de Soledad No Deseada en la población y aplicar las recomendaciones en base a datos reales de cada persona en su domicilio.

### Proponer rutinas musicales para el bienestar:
Usar los insights obtenidos para `diseñar playlists o estrategias musicales` enfocadas a una intervención preventiva en el domicilio y, a su vez, generando espacios de inclusión social virtuales.
 
## 📎 Recursos y Contacto  
📂 **Repositorio:** https://github.com/NuriaSalasVazquez/da-project-promo-49-modulo-2-team-4.git

🔗 **Acceso a la Presentación:** http://bit.ly/4iabUmZ
