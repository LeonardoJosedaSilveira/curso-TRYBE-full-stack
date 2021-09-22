USE hr
DELIMITER $$
CREATE PROCEDURE buscar_media_por_cargo(in cargo varchar(40))
BEGIN
SELECT ROUND(avg(employe.SALARY), 2) AS 'Média salarial'
FROM  hr.jobs AS job inner join hr.employees as employe
on job.JOB_ID = employe.JOB_ID
where JOB_TITLE = cargo
GROUP BY JOB_TITLE;
END $$
DELIMITER ;
