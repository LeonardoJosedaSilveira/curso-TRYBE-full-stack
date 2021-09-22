SELECT concat(employe.FirstName, " ", employe.LastName) as  "Nome completo",
count(orde.EmployeeID) as "Total de pedidos"
FROM w3schools.orders as orde
join w3schools.employees as employe on orde.EmployeeID = employe.EmployeeID
group by orde.EmployeeID
order by `Total de pedidos`;
