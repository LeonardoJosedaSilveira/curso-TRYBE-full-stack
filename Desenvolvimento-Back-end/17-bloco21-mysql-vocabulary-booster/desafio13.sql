SELECT product.ProductName as "Produto",
product.Price as "Preço"
FROM w3schools.order_details as orde
join w3schools.products as product
on orde.ProductID = product.ProductID
where orde.Quantity > 80
order by `Produto` asc;
