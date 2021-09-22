create view cancoes_premium as
SELECT hist.musica_nome as nome,
count(*) as reproducoes
FROM SpotifyClone.historico_reproducao as hist
join SpotifyClone.usuarios as usuario on hist.usuario_id = usuario.usuario_id
where usuario.plano_nome <> 'gratuito'
group by hist.musica_nome
order by `nome`;
