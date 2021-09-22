create view perfil_artistas as
SELECT art.artista_nome as artista,
alb.album_nome as "album",
count(*) as seguidores
FROM SpotifyClone.artistas as art
join SpotifyClone.seguindo as folw on art.artista_nome = folw.artista_nome
join SpotifyClone.albums as alb on art.artista_nome = alb.artista_nome
group by alb.album_id
order by `seguidores` desc, `artista`, `album`;
