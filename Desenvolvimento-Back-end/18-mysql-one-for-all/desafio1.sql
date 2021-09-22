DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE `SpotifyClone`;

CREATE TABLE planos(
    plano_nome varchar(15) primary key,
    valor_plano decimal(5,2) not null
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id tinyint primary key auto_increment,
    usario_nome varchar(10) not null,
    idade tinyint not null,
	plano_nome varchar(15) not null,
    foreign key (plano_nome) references planos(plano_nome)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_nome varchar(20) primary key
) engine = InnoDB;

CREATE TABLE seguindo(
    usuario_id tinyint not null,
    artista_nome varchar(20) not null,
    constraint primary key(usuario_id, artista_nome),
    foreign key (usuario_id) references usuarios(usuario_id),
    foreign key (artista_nome) references artistas(artista_nome)    
) engine = InnoDB;

CREATE TABLE albums(
    album_id tinyint primary key auto_increment,
    album_nome varchar(20) not null,
    artista_nome varchar(20) not null,
    foreign key (artista_nome) references artistas(artista_nome)
) engine = InnoDB;

CREATE TABLE cancoes(
    musica_nome varchar(30) primary key,
    album_id tinyint not null,
    foreign key (album_id) references albums(album_id)
) engine = InnoDB;

CREATE TABLE historico_reproducao(
    usuario_id tinyint not null,
    musica_nome varchar(30) not null,
    constraint primary key(usuario_id, musica_nome),
    foreign key (usuario_id) references usuarios(usuario_id),
    foreign key (musica_nome) references cancoes(musica_nome)
) engine = InnoDB;

INSERT INTO planos (plano_nome, valor_plano)
VALUES
  ('gratuito', 0.00 ),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (usario_nome, idade, plano_nome)
VALUES
  ('Thati', 23, 'gratuito'),
  ('Cintia', 35, 'familiar'),
  ('Bill', 20, 'universitário'),
  ('Roger', 45, 'gratuito');
  
INSERT INTO artistas (artista_nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO seguindo (usuario_id, artista_nome)
VALUES
  (1, 'Walter Phoenix'),
  (1, 'Freedie Shannon'),
  (1, 'Lance Day'),
  (2, 'Walter Phoenix'),
  (2, 'Lance Day'),
  (3, 'Peter Strong'),
  (3, 'Walter Phoenix'),
  (4, 'Freedie Shannon');
  
INSERT INTO albums (album_nome, artista_nome)
VALUES
  ('Envious', 'Walter Phoenix'),
  ('Exuberant', 'Walter Phoenix'),
  ('Hallowed Steam', 'Peter Strong'),
  ('Incandescent', 'Lance Day'),
  ('Temporary Culture', 'Freedie Shannon');
  
INSERT INTO cancoes (musica_nome, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);
  
INSERT INTO historico_reproducao (usuario_id, musica_nome)
VALUES
  (1, 'Soul For Us'),
  (1, 'Magic Circus'),
  (1, 'Diamond Power'),
  (1, 'Thang Of Thunder'),
  (2, 'Home Forever'),
  (2, 'Words Of Her Life'),
  (2, 'Reflections Of Magic'),
  (2, "Honey, Let's Be Silly"),
  (3, 'Troubles Of My Inner Fire'),
  (3, 'Thang Of Thunder'),
  (3, 'Magic Circus'),
  (4, 'Dance With Her Own'),
  (4, 'Without My Streets'),
  (4, 'Celebration Of More');
