-- Mostra os top10 Representantes de Vendas com menos Vendas

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