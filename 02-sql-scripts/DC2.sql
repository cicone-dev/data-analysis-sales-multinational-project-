-- Atualizando Dado nulo para um valor de Média Geral

UPDATE public. "Sales Data"
SET "Price Per Unit" = (
	SELECT AVG("Price Per Unit")
	FROM public. "Sales Data"
	WHERE "Price Per Unit" IS NOT NULL
)
WHERE "Transaction ID" = '001898f7-b696-4356-91dc-8f2b73d09c63';