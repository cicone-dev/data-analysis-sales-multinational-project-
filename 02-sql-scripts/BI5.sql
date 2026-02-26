-- Mostra o Top5 dos locais das lojas que mais vendem 

SELECT
	"Store Location",
	sum("Total Amount") as "Total Sales",
	sum("Profit") as "Total Profit"
FROM public."Sales Data"
GROUP BY "Store Location"
ORDER BY "Total Sales" DESC
limit 5
	