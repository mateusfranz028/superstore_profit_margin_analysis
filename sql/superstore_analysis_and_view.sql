CREATE TABLE superstore 
(
	ship_mode VARCHAR,
	segment VARCHAR,
	country VARCHAR,
	city VARCHAR,
	state VARCHAR,
	postal_code VARCHAR,
	region VARCHAR,
	category VARCHAR,
	sub_category VARCHAR,
	sales NUMERIC,
	quantity INT,
	discount NUMERIC,
	profit NUMERIC
)



SELECT *
FROM
	superstore
LIMIT
	10

-- Somas e contagem com comandos individualizados.

SELECT COUNT (*) 
FROM
	superstore

SELECT SUM (sales)
FROM
	superstore

SELECT SUM (profit)
FROM
	superstore

-- Somas e contagem, da mesma forma que antes porém num único comando e usando aliases pra ficar melhor de ler.

SELECT
	COUNT (*) AS total_transactions,
	SUM (sales) AS total_revenue,
	SUM (profit) AS total_profit
FROM
	superstore


-- Margem de lucro, lucro e faturamento por categoria:


SELECT
	category,
	SUM (sales) AS total_revenue,
	SUM (profit) AS total_profit,
	ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin_pct
FROM
	superstore
GROUP BY
	category
ORDER BY
	total_revenue DESC


-- Qual sub-categoria está causando espremendo a margem de Furniture?
-- Quais subcategorias estão dando prejuízo?

SELECT
	category,
	sub_category,
	SUM (sales) AS total_revenue,
	SUM (profit) AS total_profit,
	ROUND ((SUM (profit) / SUM (sales))*100,2) AS profit_margin_pct
FROM
	superstore
GROUP BY
	category, 
	sub_category
HAVING
	SUM (profit) < 0
ORDER BY
	total_profit



-- Como vão os descontos nas subcategorias com prejuízo? 

SELECT
	discount,
	sub_category,
	COUNT (*) AS order_count,
	SUM (sales) AS total_revenue,
	SUM (profit) AS total_profit
FROM
	superstore
WHERE
	sub_category = 'Tables'
GROUP BY
	discount, sub_category
ORDER BY
	discount



-- Criação da view para power bi:

CREATE VIEW vw_superstore_clean AS
SELECT
	ship_mode,
	segment,
	country,
	city,
	state,
	postal_code,
	region,
	category,
	sub_category,
	sales,
	quantity,
	discount,
	profit,
	ROUND ((profit / sales *100),2) AS profit_margin_pct
FROM
	superstore


-- Validação da view:

SELECT *
FROM
	vw_superstore_clean
LIMIT
	10



