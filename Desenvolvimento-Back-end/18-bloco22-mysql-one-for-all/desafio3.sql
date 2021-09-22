create view historico_reproducao_usuarios as
select usuario.usario_nome as usuario,
hist.musica_nome as nome
from SpotifyClone.historico_reproducao as hist
join SpotifyClone.usuarios as usuario on hist.usuario_id = usuario.usuario_id
order by `usuario`, `nome`;
