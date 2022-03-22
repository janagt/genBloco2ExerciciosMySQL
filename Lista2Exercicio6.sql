-- SEMANA 7 - BLOCO 2 - 21/03/22 E 22/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá ter o 
    seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as informações dos produtos desta empresa. 

	O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.
    
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
		relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.
	-	Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos 
		relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos onlines
        (não esqueça de criar a foreign key de tb_categoria nesta tabela).

    -	Popule esta tabela Categoria com até 5 dados.
	-	Popule esta tabela Produto com até 8 dados.

	-	Faça um select que retorne os Produtos com o valor maior do que 50 reais.
	-	Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
	-	Faça um select  utilizando LIKE buscando os Produtos com a letra J.
	-	Faça um select com Inner join entre  tabela categoria e produto.
	-	Faça um select onde traga todos os Produtos de uma categoria específica
		(exemplo todos os produtos que são da categoria Java).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL 
    ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

CREATE DATABASE db_cursoDaMinhaVida;

USE db_cursoDaMinhaVida;


-- Cria da primeira tabela, tabela de categoria
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
	categoria VARCHAR(255),
	diploma BOOLEAN,
    idade INT,
    
    PRIMARY KEY(ID)
);


-- Inserção dos dados na segunda tabela, de pizza
CREATE TABLE tb_curso(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255),
	valor DECIMAL(10,2),
    materias VARCHAR(255),
    horas INT,
    promocao BOOLEAN,
    cat_ref_id BIGINT,
    
    PRIMARY KEY(id),
    FOREIGN KEY (cat_ref_id) REFERENCES tb_categoria(id)
);


-- Lista todas as informações da tabela de pizza e categoria
SELECT * FROM tb_curso;
SELECT * FROM tb_categoria;


-- Inserção dos dados na tabela de categoria (5)
INSERT INTO tb_categoria(categoria, diploma, idade)
VALUES("Tecnologia da Informação",true,18);
INSERT INTO tb_categoria(categoria, diploma, idade)
VALUES("Tecnologia da Informação",false,11);
INSERT INTO tb_categoria(categoria, diploma, idade)
VALUES("Design e Propaganda",true,18);
INSERT INTO tb_categoria(categoria, diploma, idade)
VALUES("Meio Ambiente",true,18);
INSERT INTO tb_categoria(categoria, diploma, idade)
VALUES("Idioma",false,11);


-- Inserção dos dados na tabela de produtos (8)
INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Desenvolvedor(a) Java", 99.90, "POO", 420, true, 2);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Análise e Desenvolvimento de Sistemas", 299.99, "Python", 600, false, 1);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Tecnólogo em Design Gráfico", 299.90, "Teoria das Cores", 600, true, 3);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Publicidade e Propaganda", 299.90, "Marketing Digital", 1200, false, 3);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Gestão Ambiental", 99.90, "Direito Ambiental", 360, true, 4);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Inglês", 59.90, "Revisão", 60, true, 5);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Português", 59.90, "Revisão", 60, true, 5);

INSERT INTO tb_curso(nome, valor, materias, horas, promocao, cat_ref_id)
VALUES("Espanhol", 59.90, "Revisão", 60, true, 5);

-- selects e joins

-- Faça um select que retorne os produtos com o  valor maior do que 50 reais.
SELECT * FROM tb_curso WHERE valor > 45.00;

-- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_curso WHERE valor BETWEEN 3.00 AND 60.00;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra B.
SELECT * FROM tb_curso WHERE nome LIKE "J%";

-- Faça um um select com Inner join entre tabela categoria e produto. (nao vai puxar as cat_ref_id repetidas)
SELECT * FROM tb_curso INNER JOIN tb_categoria ON tb_categoria.id = tb_curso.id;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria Java).
SELECT * FROM tb_categoria INNER JOIN tb_curso on tb_curso.cat_ref_id = tb_categoria.id WHERE cat_ref_id = 5; -- categoria de idioma

