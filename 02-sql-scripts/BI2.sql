-- Mostra o Valor Total e o Custo por País na semana da Black Friday

SELECT
	"Country",
	SUM("Total Amount") AS "Total Revenue",
	SUM("Profit") AS "Total Profit"
FROM public."Sales Data"
GROUP BY "Country"
ORDER BY "Total Revenue" DESC
