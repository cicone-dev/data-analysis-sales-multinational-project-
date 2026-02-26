-- Mosta o top5 Produtos com mais unidades Vendidas na semana da Black Friday

SELECT 
	"Product Name",
	sum("Quantity Purchased") AS "Total Unit Sold"
FROM public."Sales Data"
WHERE "Date" BETWEEN '2025-11-28' AND '2025-12-04'
GROUP BY "Product Name"
ORDER BY "Total Unit Sold" DESC
LIMIT 5