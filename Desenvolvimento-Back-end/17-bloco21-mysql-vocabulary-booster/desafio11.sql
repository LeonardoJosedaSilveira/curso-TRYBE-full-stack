SELECT tc1.ContactName as "Nome",
tc1.Country as "País",
count(tc2.Country) -1 as "Número de compatriotas" 
FROM w3schools.customers as tc1
join w3schools.customers as tc2 on tc1.Country = tc2.Country
group by tc1.ContactName, tc1.Country
having `Número de compatriotas` > 0
order by `Nome`;
