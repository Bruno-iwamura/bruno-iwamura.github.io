CREATE DATABASE youtube_db;

USE youtube_db;

SELECT TOP 10 * FROM dbo.top_uk_youtubers_2024;

/*remover colunas desnecessárias, renomear colunas, extrair nome do canal da primeira coluna
*/

SELECT
	NOMBRE,
	SEGUIDORES,
	total_subscribers,
	total_views,
	total_videos
FROM top_uk_youtubers_2024;

SELECT CHARINDEX('@',NOMBRE), NOMBRE FROM top_uk_youtubers_2024;

CREATE VIEW view_uk_youtubers_2024 AS

SELECT 
	CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@', NOMBRE) -1) AS VARCHAR(100)) AS Nome_Canal,
	total_subscribers,
	total_views,
	total_videos
FROM top_uk_youtubers_2024;

SELECT TOP 10 * FROM view_uk_youtubers_2024;

/*
Data quality check
*/

SELECT COUNT(*) AS numb_of_rows FROM view_uk_youtubers_2024;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_uk_youtubers_2024';

SELECT COUNT(*) AS numb_colunas FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_uk_youtubers_2024';

SELECT DISTINCT COUNT(Nome_Canal) FROM view_uk_youtubers_2024;