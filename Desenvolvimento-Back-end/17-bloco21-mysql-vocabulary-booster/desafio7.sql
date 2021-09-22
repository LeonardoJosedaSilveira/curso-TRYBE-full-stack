SELECT ucase(concat(employe.FIRST_NAME, " ", employe.LAST_NAME)) AS "Nome completo",
hist.START_DATE as "Data de início" ,
employe.SALARY as "Salário"
from hr.job_history as hist
join hr.employees as employe
on employe.EMPLOYEE_ID = hist.EMPLOYEE_ID
WHERE month(hist.START_DATE) in (1, 2, 3)
order by `Nome completo` asc, `Data de início` asc;
