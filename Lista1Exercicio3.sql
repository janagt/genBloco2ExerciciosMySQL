-- SEMANA 6 - BLOCO 2 - 18/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- ESTRUTURA E MODELAGEM

/*
Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos estudantes deste registro dessa escola.

Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos estudantes para se trabalhar com o serviço dessa escola.

Popule esta tabela com até 8 dados;

Faça um select que retorne o/as estudantes com a nota maior do que 7.
Faça um select que retorne o/as estudantes com a nota menor do que 7.

Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_escola;

use db_escola;

create table tb_estudantes(
	id bigint auto_increment,
    nome varchar(255),
    ano varchar(255),
    idade int,
    materia varchar(255),
    nota decimal(10,1),
    
    primary key(id)
);

insert into tb_estudantes(nome, ano, idade, materia, nota) values ("Maria","2° Ano", 8, "Portugês", 8.0);
insert into tb_estudantes(nome, ano, idade, materia, nota) values ("José","3° Ano", 9, "Matemática", 8.9);
insert into tb_estudantes(nome, ano, idade, materia, nota) values ("Helena","1° Ano",7, "Artes", 10);
insert into tb_estudantes(nome, ano, idade, materia, nota) values ("Ricardo","4° Ano",10, "História", 9.4);
insert into tb_estudantes(nome, ano, idade, materia, nota) values ("Jõao","1° Ano",7, "Educação Física", 5);

select * from tb_estudantes;
select * from tb_estudantes where nota > 7.0;
select * from tb_estudantes where nota < 7.0;

update tb_estudantes set estoque = 7.1 where id = 5;