SELECT JOB_TITLE as 'Cargo',
CASE
WHEN MAX_SALARY < 10001 THEN 'Baixo'
WHEN MAX_SALARY < 20001 THEN 'Médio'
WHEN MAX_SALARY < 30001 THEN 'Alto'
else 'Altíssimo'
end as 'Nível'
FROM hr.jobs
order by Cargo;
