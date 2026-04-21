Exploratory Data Analysis using SQL
Análisis Exploratorio de Datos (EDA) completo utilizando SQL puro como herramienta principal de exploración, limpieza y análisis estadístico de un dataset real.
🎯 Objetivo del proyecto
Demostrar que SQL no es solo una herramienta de consulta, sino un lenguaje poderoso para realizar análisis exploratorio completo: desde la limpieza de datos hasta el cálculo de métricas estadísticas y detección de patrones.
🛠️ Stack Tecnológico
CapaTecnologíaBase de datosMySQLEntornoMySQL WorkbenchLenguajeSQLAnálisis complementarioPython · Pandas (post-extracción)
📋 Flujo del análisis
1. Carga e inspección inicial del dataset
        ↓
2. Limpieza de datos (nulos, duplicados, tipos)
        ↓
3. Análisis univariado (distribuciones, estadísticos básicos)
        ↓
4. Análisis bivariado (correlaciones, agrupaciones)
        ↓
5. Detección de outliers y patrones
        ↓
6. Extracción de insights accionables
🔍 Técnicas SQL aplicadas

GROUP BY + funciones de agregación (COUNT, AVG, SUM, MIN, MAX)
CASE WHEN para segmentación condicional
Subconsultas y CTEs (WITH) para análisis multi-paso
HAVING para filtrado post-agregación
Window functions (ROW_NUMBER, RANK, LAG, LEAD) para análisis temporal y ranking
Detección de valores nulos y duplicados con IS NULL, COUNT DISTINCT
Joins para cruzar múltiples tablas

💡 Hallazgos principales

Ver el notebook / script SQL en el repositorio para el análisis completo y los resultados.

🧠 Conceptos clave demostrados

EDA sin salir del entorno SQL
Análisis estadístico descriptivo con SQL puro
Limpieza y transformación de datos en base de datos
Uso de Window Functions para análisis avanzado

🔭 Posibles extensiones

Conectar resultados a Power BI o Tableau para visualización
Automatizar el pipeline con Python + SQLAlchemy
Ampliar el análisis con modelos predictivos en Scikit-learn

👤 Autor
Reinaldo Guerrero — Data Scientist Jr.
LinkedIn · GitHub
📄 Licencia
Licencia MIT — siéntete libre de usar y adaptar este proyecto.
