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
	