create view top_2_hits_do_momento as
SELECT musica_nome as cancao,
count(*) as reproducoes
FROM SpotifyClone.historico_reproducao
group by musica_nome
order by `reproducoes` desc, `cancao`
limit 2;
