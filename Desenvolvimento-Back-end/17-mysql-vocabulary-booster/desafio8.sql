SELECT customer.ContactName as  "Nome de contato",
shipper.ShipperName as "Empresa que fez o envio",
orde.OrderDate as "Data do pedido"
FROM w3schools.orders as orde
join w3schools.customers as customer on orde.CustomerID = customer.CustomerID
join w3schools.shippers as shipper on orde.ShipperID = shipper.ShipperID
where shipper.ShipperName = "Speedy Express" or shipper.ShipperName = "United Package"
order by `Nome de contato`, `Empresa que fez o envio`, `Data do pedido`;
