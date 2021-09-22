SELECT product.ProductName as "Produto",
min(orde.Quantity) as "Mínima",
max(orde.Quantity) as "Máxima",
round(avg(orde.Quantity), 2) "Média"
FROM w3schools.order_details as orde
join w3schools.products as product on orde.ProductID = product.ProductID
group by `Produto`
having `Média` > 20
order by `Média`, `Produto`;
