-- cria o banco de dados
create database db_pokemon;

-- informa em qual db irá as tabelas
use db_pokemon;

-- cria a tabela com as informações
create table tb_kanto(
id bigint auto_increment, -- id é o nome, boa pratica - big int == long - auto_increment preenche as ids em 1,2,3,4... automaticamente
nome varchar(255), -- até 255 caractere, 256 dá erro
tipo varchar(255),
ataque int,

primary key(id) -- referencia que a  linha ID BIGINT... é a primária
);

-- seleciona tudo da tb_kanto - exibe o que está na tabela
select * from tb_kanto;

-- insere dentro tb_kanto - forma de adicionar valores respeitando a ordem escrita
insert into tb_kanto(nome, tipo, ataque) values ("Bulbasaur","Plant",21);

-- alterar tabela tb_kanto adicionando defesa int - inserindo uma nova coluna do tipo int
alter table tb_kanto ADD defesa int;