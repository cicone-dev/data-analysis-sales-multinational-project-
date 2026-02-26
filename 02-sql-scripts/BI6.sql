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

