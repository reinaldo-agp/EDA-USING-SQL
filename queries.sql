-- =============================================
-- EDA con SQL - Instagram Reach Analysis
-- Autor: Reinaldo
-- Herramienta: MySQL 8.0
-- =============================================


-- =============================================
-- 1. CONFIGURACIÓN INICIAL
-- =============================================

CREATE DATABASE instagram_eda;
USE instagram_eda;

-- Nota: la tabla fue creada automáticamente
-- usando el Table Data Import Wizard de MySQL Workbench


-- =============================================
-- 2. RESUMEN GENERAL DEL DATASET
-- =============================================

-- Primeras 5 filas
SELECT * 
FROM `instagram-data` 
LIMIT 5;

-- Estadísticas generales
SELECT 
    COUNT(*) AS Total_Posts,
    AVG(Impressions) AS Avg_Impressions,
    MAX(Likes) AS Max_Likes,
    MIN(Likes) AS Min_Likes
FROM `instagram-data`;

-- Resultado:
-- Total_Posts: 176
-- Avg_Impressions: 19,685
-- Max_Likes: 2,091
-- Min_Likes: 72


-- =============================================
-- 3. ANÁLISIS DE FUENTES DE TRÁFICO
-- =============================================

-- ¿De dónde vienen las visitas?
SELECT 
    AVG(`From Home`) AS Avg_From_Home,
    AVG(`From Hashtags`) AS Avg_From_Hashtags,
    AVG(`From Explore`) AS Avg_From_Explore,
    AVG(`From Other`) AS Avg_From_Other
FROM `instagram-data`;

-- Resultado:
-- Avg_From_Home: 3,647
-- Avg_From_Hashtags: 2,592
-- Avg_From_Explore: 12,683  <-- canal dominante (64% del alcance)
-- Avg_From_Other: 451


-- =============================================
-- 4. DETECCIÓN DE OUTLIERS
-- =============================================

-- Posts con impresiones > 2 desviaciones estándar por encima del promedio
SELECT * 
FROM `instagram-data`
WHERE Impressions > (
    SELECT AVG(Impressions) + 2 * STDDEV(Impressions) 
    FROM `instagram-data`
);

-- Resultado: 8 posts virales identificados
-- Todos comparten alto tráfico desde Explore
-- y contenido tipo "listas de recursos"


-- =============================================
-- 5. MÉTRICAS DE ENGAGEMENT Y CONVERSIÓN
-- =============================================

-- Saves, follows y tasa de conversión promedio
SELECT 
    AVG(Saves) AS Avg_Saves,
    AVG(Follows) AS Avg_Follows,
    AVG(`Conversion Rate`) AS Avg_Conversion_Rate
FROM `instagram-data`;

-- Resultado:
-- Avg_Saves: 383
-- Avg_Follows: 111
-- Avg_Conversion_Rate: 51%


-- =============================================
-- 6. ANÁLISIS DE VALORES NULOS
-- =============================================

-- Verificar columnas con datos faltantes
SELECT
    SUM(CASE WHEN `Date` IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Impressions IS NULL THEN 1 ELSE 0 END) AS Missing_Impressions,
    SUM(CASE WHEN Likes IS NULL THEN 1 ELSE 0 END) AS Missing_Likes,
    SUM(CASE WHEN Saves IS NULL THEN 1 ELSE 0 END) AS Missing_Saves,
    SUM(CASE WHEN Follows IS NULL THEN 1 ELSE 0 END) AS Missing_Follows
FROM `instagram-data`;


-- =============================================
-- 7. TENDENCIA EN EL TIEMPO
-- =============================================

-- Impresiones y likes totales por fecha
SELECT 
    `Date`,
    SUM(Impressions) AS Total_Impressions,
    SUM(Likes) AS Total_Likes,
    SUM(Follows) AS Total_Follows
FROM `instagram-data`
GROUP BY `Date`
ORDER BY `Date` ASC;
