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