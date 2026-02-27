-- Cria a tabela "Sales Data" unindo os dados de vendas de cada país.
CREATE TABLE public."Sales Data" as
SELECT * from public."Sales Canada"
UNION ALL
SELECT * from public."Sales China"
UNION ALL
SELECT * from public."Sales India"
UNION ALL
SELECT * from public."Sales Nigeria"
UNION ALL
SELECT * from public."Sales UK";
UNION ALL
SELECT * from public."Sales US";


---------Data Cleaning (DC)----------------


-- Verificar se Existem dados nulos
SELECT * 
FROM public."Sales Data"
WHERE 
	"Transaction ID" is null
	or "Date" is null
	or "Country" is null 
	or "Product ID" is null
	or "Product Name" is null
	or "Category" is null
	or "Price Per Unit" is null
	or "Quantity Purchased" is null
	or "Cost Price" is null
	or "Discount Applied" is null
	or "Payment Method" is null
	or "Customer Age Group" is null
	or "Customer Gender" is null
	or "Store Location" is null
	or "Sales Representative" is null
	
	-- Atualizando Dado nulo para um valor real

UPDATE public. "Sales Data"
SET "Quantity Purchased" = 3
WHERE "Transaction ID" = '00a30472-89a0-4688-9d33-67ea8ccf7aea';

-- Atualizando Dado nulo para um valor de Média Geral

UPDATE public. "Sales Data"
SET "Price Per Unit" = (
	SELECT AVG("Price Per Unit")
	FROM public. "Sales Data"
	WHERE "Price Per Unit" IS NOT NULL
)
WHERE "Transaction ID" = '001898f7-b696-4356-91dc-8f2b73d09c63';

-- Tratando para ver se existem dados duplicados

SELECT "Transaction ID", COUNT(*)
FROM public."Sales Data"
GROUP BY "Transaction ID"
HAVING COUNT(*)>1

--------------- Data Analysis (BI)--------------

-- Criando uma tabela de Valor Total que faz a conta do Preço * Quantidade e tira o desconto

ALTER TABLE public."Sales Data" 
ADD COLUMN"Total Amount" NUMERIC(10,2);

UPDATE public."Sales Data"
SET "Total Amount"=("Price Per Unit" * "Quantity Purchased") - "Discount Applied"


-- Cria uma tabela para visualizar o Lucro que faz a conta do Valor Total menos o Custo com a Quantidade

ALTER TABLE public."Sales Data" ADD
COLUMN "Profit" NUMERIC(10,2);


UPDATE public."Sales Data"
SET "Profit"="Total Amount" - ("Cost Price" * "Quantity Purchased")



-- Verificar quantos registros serão afetados antes de deletar
SELECT COUNT(*), "Product Name"
FROM public."Sales Data"
WHERE "Category" = 'Again'
GROUP BY "Product Name";

-- Deletar a categoria 'Again' 
DELETE FROM public."Sales Data"
WHERE "Category" = 'Again';


-- Mostra o Valor Total e o Custo por País na semana da Black Friday

SELECT
	"Country",
	SUM("Total Amount") AS "Total Revenue",
	SUM("Profit") AS "Total Profit"
FROM public."Sales Data"
GROUP BY "Country"
ORDER BY "Total Revenue" DESC
-- Mosta o top5 Produtos com mais unidades Vendidas na semana da Black Friday

SELECT 
	"Product Name",
	sum("Quantity Purchased") AS "Total Unit Sold"
FROM public."Sales Data"
WHERE "Date" BETWEEN '2025-11-28' AND '2025-12-04'
GROUP BY "Product Name"
ORDER BY "Total Unit Sold" DESC
LIMIT 5

-- Mostra os top1 Representantes de Vendas com menos Vendas


SELECT 
	"Sales Representative",
	"Country",
	"Store Location",
	SUM("Total Amount") as "Total Sales"
FROM public."Sales Data"
GROUP BY 
	"Sales Representative", 
    "Country", 
    "Store Location"
	 
ORDER BY "Total Sales"  
LIMIT 10;


-- Mostra o Top5 dos locais das lojas que menos vendem 

SELECT
	"Country",
	"Store Location",
	sum("Total Amount") as "Total Sales",
	sum("Profit") as "Total Profit"
FROM public."Sales Data"
GROUP BY 
	"Country", 
	"Store Location"
ORDER BY "Total Sales" 
limit 5
	
	
-- Mostra a Análise estatistica resumida das vendas e lucros

SELECT 
	min("Total Amount") as "Min Sales Value",
	max("Total Amount") as "Max Sales Value",
	avg("Total Amount") as "Avg Sales Value",
	sum("Total Amount") as "Total Sales",
	min("Profit") as "Min Profit",
	max("Profit") as "Max Profit",
	avg("Profit") as "Avg Profit",
	sum("Profit") as "Total Profit"
FROM public."Sales Data"



--identifica quais produtos trazem mais lucro por unidade vendida.

SELECT 
    "Product Name",
    "Category",
    ROUND(SUM("Profit") / SUM("Quantity Purchased"), 2) AS "Lucro Por Unidade",
    SUM("Quantity Purchased") AS "Total_Qty"
FROM public."Sales Data"
GROUP BY 1, 2
ORDER BY "Lucro Por Unidade" DESC
LIMIT 10;