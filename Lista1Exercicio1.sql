-- SEMANA 6 - BLOCO 2 - 18/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- ESTRUTURA E MODELAGEM

/*
Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.
	
Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.

Popule esta tabela com até 5 dados;

Faça um select que retorne os funcionaries com o salário maior do que 2000.

Faça um select que retorne os funcionaries com o salário menor do que 2000.

Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_empresa;
use db_empresa;

create table tb_funcionarios(
	id bigint auto_increment,
    nome varchar(255),
    genero varchar (255),
    idade int,
    salario decimal (10,2),
    cargo varchar(255),
    
    primary key(id)
);

select * from tb_funcionarios;

insert into tb_funcionarios(nome, genero, idade, salario, cargo) values ("André", "Masculino", 50, 1900.00, "Caixa");
insert into tb_funcionarios(nome, genero, idade, salario, cargo) values ("Lucas", "Masculino", 34, 4000.00, "Gerente");
insert into tb_funcionarios(nome, genero, idade, salario, cargo) values ("Janaina", "Feminino", 26, 2500.00, "Motorista");
insert into tb_funcionarios(nome, genero, idade, salario, cargo) values ("Cristina", "Feminino", 44, 1900.00, "Empacotadora");
insert into tb_funcionarios(nome, genero, idade, salario, cargo) values ("Sandra", "Feminino", 19, 1200.00, "Assistente");

select * from tb_funcionarios where  salario > 2000.00;
select * from tb_funcionarios where salario < 2000.00;

update tb_funcionarios set salario = 1500.00 where id = 5;
