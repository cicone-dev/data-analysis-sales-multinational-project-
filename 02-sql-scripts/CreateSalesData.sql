-- Cria a tabela "Sales Data" unindo os dados de vendas de cada país.


CREATE TABLE public."Sales Data" as
SELECT * from public."Sales Canada"
UNION ALL
SELECT * from public."Sales China"
UNION ALL
SELECT * from public."Sales India"
UNION ALL
SELECT * from public."Sales Nigeria"
UNION ALL
SELECT * from public."Sales UK";
UNION ALL
SELECT * from public."Sales US";
