create view faturamento_atual as
SELECT 
min(valor_plano) as faturamento_minimo,
max(valor_plano) as faturamento_maximo,
round(avg(plan.valor_plano), 2) as faturamento_medio,
sum(plan.valor_plano) as faturamento_total
FROM SpotifyClone.usuarios as usuario
join SpotifyClone.planos as plan on plan.plano_nome = usuario.plano_nome;
