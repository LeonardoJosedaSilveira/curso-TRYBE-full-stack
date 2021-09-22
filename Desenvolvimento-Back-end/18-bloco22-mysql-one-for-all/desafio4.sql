create view top_3_artistas as
SELECT artista_nome as artista,
count(*) as seguidores
FROM SpotifyClone.seguindo
group by artista_nome
order by `seguidores` desc, `artista`
limit 3;
