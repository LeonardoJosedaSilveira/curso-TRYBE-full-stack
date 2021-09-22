SELECT JOB_TITLE as 'Cargo',
MAX_SALARY - MIN_SALARY as "Variação Salarial",
ROUND(MIN_SALARY / 12, 2) AS "Média mínima mensal",
ROUND(MAX_SALARY / 12, 2) AS  "Média máxima mensal"
FROM hr.jobs
order by `Variação Salarial`, Cargo;
