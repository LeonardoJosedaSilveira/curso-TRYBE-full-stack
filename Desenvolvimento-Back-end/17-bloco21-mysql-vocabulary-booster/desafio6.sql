select concat(employe.FIRST_NAME, " ", employe.LAST_NAME) AS "Nome completo",
job.JOB_TITLE as "Cargo",
hist.START_DATE as "Data de início do cargo",
depart.DEPARTMENT_NAME as "Departamento"
from hr.job_history as hist
JOIN hr.jobs as job
ON hist.JOB_ID = job.JOB_ID
join hr.departments AS depart
ON hist.DEPARTMENT_ID = depart.DEPARTMENT_ID
join hr.employees as employe
on employe.EMPLOYEE_ID = hist.EMPLOYEE_ID
order by `Nome completo` desc, `Cargo` asc;
