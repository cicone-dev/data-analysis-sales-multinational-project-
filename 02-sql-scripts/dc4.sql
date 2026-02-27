

-- Verificar quantos registros serão afetados antes de deletar
SELECT COUNT(*), "Product Name"
FROM public."Sales Data"
WHERE "Category" = 'Again'
GROUP BY "Product Name";

-- Deletar a categoria 'Again' 
DELETE FROM public."Sales Data"
WHERE "Category" = 'Again';
