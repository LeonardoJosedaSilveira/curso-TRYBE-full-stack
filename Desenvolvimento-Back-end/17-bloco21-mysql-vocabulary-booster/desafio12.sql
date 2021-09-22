SELECT CONCAT(tabemp1.FIRST_NAME, " ", tabemp1.LAST_NAME) as `Nome completo funcionário 1`,
tabemp1.SALARY as `Salário funcionário 1`,
tabemp1.PHONE_NUMBER as `Telefone funcionário 1`,
CONCAT(tabemp2.FIRST_NAME, ' ', tabemp2.LAST_NAME) as `Nome completo funcionário 2`,
tabemp2.SALARY AS `Salário funcionário 2`,
tabemp2.PHONE_NUMBER AS `Telefone funcionário 2`
FROM hr.employees as tabemp1, hr.employees as tabemp2
WHERE tabemp1.JOB_ID = tabemp2.JOB_ID and tabemp1.EMPLOYEE_ID <> tabemp2.EMPLOYEE_ID
ORDER BY `Nome completo funcionário 1` asc, `Nome completo funcionário 2` asc;
