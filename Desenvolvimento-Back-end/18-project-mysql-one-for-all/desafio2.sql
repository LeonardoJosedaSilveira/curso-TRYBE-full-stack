create view estatisticas_musicais as 
select count(*) as cancoes,
(select count(*) from SpotifyClone.artistas) as artistas,
(select count(*) from SpotifyClone.albums) as albuns
from SpotifyClone.cancoes;
