-- Mostra os top5 Representantes de Vendas com menos Vendas

SELECT 
	"Sales Representative",
	SUM("Total Amount") as "Total Sales"
FROM public."Sales Data"
GROUP BY "Sales Representative"
ORDER BY "Total Sales"
LIMIT 5;