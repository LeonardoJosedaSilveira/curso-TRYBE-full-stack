SELECT JOB_TITLE as "Cargo",
MAX_SALARY - MIN_SALARY as "Diferença entre salários máximo e mínimo"
FROM hr.jobs order by `Diferença entre salários máximo e mínimo`, Cargo;
