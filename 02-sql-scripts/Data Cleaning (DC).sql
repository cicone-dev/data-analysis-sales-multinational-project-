-- Verificar se Existem dados nulos
SELECT * 
FROM public."Sales Data"
WHERE 
	"Transaction ID" is null
	or "Date" is null
	or "Country" is null 
	or "Product ID" is null
	or "Product Name" is null
	or "Category" is null
	or "Price Per Unit" is null
	or "Quantity Purchased" is null
	or "Cost Price" is null
	or "Discount Applied" is null
	or "Payment Method" is null
	or "Customer Age Group" is null
	or "Customer Gender" is null
	or "Store Location" is null
	or "Sales Representative" is null
	
	