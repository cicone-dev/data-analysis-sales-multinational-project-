-- Cria uma tabela para visualizar o Lucro que faz a conta do Valor Total menos o Custo com a Quantidade

ALTER TABLE public."Sales Data" ADD
COLUMN "Profit" NUMERIC(10,2);


UPDATE public."Sales Data"
SET "Profit"="Total Amount" - ("Cost Price" + "Quantity Purchased")



