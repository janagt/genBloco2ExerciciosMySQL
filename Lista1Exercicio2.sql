-- SEMANA 6 - BLOCO 2 - 18/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- ESTRUTURA E MODELAGEM

/*
Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.

Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.

Popule esta tabela com até 8 dados;

Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.

Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_loja;

use db_loja;

create table tb_produtos(
	id bigint auto_increment,
    titulo varchar(255),
    marca varchar(255),
    cor varchar(255),
    valor decimal(10,2),
    estoque boolean,
    
    primary key(id)
);

insert into tb_produtos(titulo, marca, cor, valor, estoque) values ("Calça","Adidas","Preto", 199.90, true);
insert into tb_produtos(titulo, marca, cor, valor, estoque) values ("Calça","Nike","Rosa", 189.90, false);
insert into tb_produtos(titulo, marca, cor, valor, estoque) values ("Tenis","Adidas","Preto", 699.90, true);
insert into tb_produtos(titulo, marca, cor, valor, estoque) values ("Meia","Lupo","Branco", 29.90, false);
insert into tb_produtos(titulo, marca, cor, valor, estoque) values ("Tênis","Nike","Vermelho", 859.90, true);

select * from tb_produtos;
select * from tb_produtos where valor > 500;
select * from tb_produtos where valor < 500;

update tb_produtos set estoque = false where id = 5;