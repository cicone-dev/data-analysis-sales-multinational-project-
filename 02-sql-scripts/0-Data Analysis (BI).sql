-- Criando uma tabela de Valor Total que faz a conta do Preço * Quantidade e tira o desconto

ALTER TABLE public."Sales Data" 
ADD COLUMN"Total Amount" NUMERIC(10,2);

UPDATE public."Sales Data"
SET "Total Amount"=("Price Per Unit" * "Quantity Purchased") - "Discount Applied"