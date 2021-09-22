SELECT job.JOB_TITLE AS 'Cargo', ROUND(avg(employe.SALARY), 2) AS 'Média salarial',
CASE 
WHEN ROUND(avg(employe.SALARY), 2) < 5801 then 'Júnior'
WHEN ROUND(avg(employe.SALARY), 2) < 7501 then 'Pleno'
WHEN ROUND(avg(employe.SALARY), 2) < 10501 then 'Sênior'
else "CEO"
end as 'Senioridade'
FROM  hr.jobs AS job inner join hr.employees as employe on job.JOB_ID = employe.JOB_ID
GROUP BY `Cargo`
order by 2, 1 asc;
