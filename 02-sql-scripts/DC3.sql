-- Tratando para ver se existem dados duplicados

SELECT "Transaction ID", COUNT(*)
FROM public."Sales Data"
GROUP BY "Transaction ID"
HAVING COUNT(*)>1