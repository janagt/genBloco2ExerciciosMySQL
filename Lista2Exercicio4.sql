-- SEMANA 7 - BLOCO 2 - 21/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do banco deverá ter o seguinte 
    nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o sistema trabalhará com as informações dos produtos desta empresa. 

	O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
    
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
		relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
	-	Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
		relevantes dos tb_produto para se trabalhar com o serviço desse açougue
        (não esqueça de criar a foreign key de tb_categoria nesta tabela).
	
    -	Popule esta tabela Categoria com até 5 dados.
	-	Popule esta tabela Produto com até 8 dados.

	-	Faça um select que retorne os Produtos com o valor maior do que 50 reais.
	-	Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
	-	Faça um select  utilizando LIKE buscando os Produtos com a letra C.
	-	Faça um select com Inner join entre  tabela categoria e produto.
	-	Faça um select onde traga todos os Produtos de uma categoria específica
		(exemplo todos os produtos que são aves ou legumes).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL 
    ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

CREATE DATABASE db_cidade_das_frutas;

USE db_cidade_das_frutas;


-- Cria da primeira tabela, tabela de categoria
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
	acida BOOLEAN,
	doce BOOLEAN,
    monofagica BOOLEAN,
    
    PRIMARY KEY(ID)
);


-- Inserção dos dados na segunda tabela, de fruta
CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255),
	peso DECIMAL(10,2),
    valor DECIMAL(10,2),
    cor VARCHAR(255),
    quantidade INT,
    cat_ref_id BIGINT,
    
    PRIMARY KEY(id),
    FOREIGN KEY (cat_ref_id) REFERENCES tb_categoria(id)
);


-- Lista todas as informações da tabela de fruta e categoria
SELECT * FROM tb_produto;
SELECT * FROM tb_categoria;


-- Inserção dos dados na tabela de categoria (5)
INSERT INTO tb_categoria(acida, doce, monofagica)	-- melao
VALUES(false,true,true);

INSERT INTO tb_categoria(acida, doce, monofagica)	-- motango, bergamota
VALUES(true,true,false);

INSERT INTO tb_categoria(acida, doce, monofagica)	-- acerola
VALUES(true,false,false);

INSERT INTO tb_categoria(acida, doce, monofagica)	-- melancia
VALUES(false,false,true);

INSERT INTO tb_categoria(acida, doce, monofagica)	-- manga, banana
VALUES(false,true,false);



-- Inserção dos dados na tabela de produtos (8)
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Melão", 34.10, 22.40, "Amarelo", 2, 1);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Morango", 3.50, 2.20, "Vermelho", 6, 2);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Bergamota", 10.10, 15.20, "Amarelo", 4, 2);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Acerola", 20.10, 27.20, "Vermelho", 12, 3);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Melancia", 50.10, 50.70, "Verde", 1, 4);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Manga", 20.10, 43.20, "Laranja", 2, 5);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Banana", 30.10, 34.20, "Amarelo", 6,5);
INSERT INTO tb_produto(nome, peso, valor, cor, quantidade, cat_ref_id)
VALUES("Maçã", 15.10, 33.20, "Vermelho", 4,5);

-- selects e joins

-- Faça um select que retorne os produtos com o  valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE valor > 45.00;

-- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE valor BETWEEN 3.00 AND 60.00;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra B.
SELECT * FROM tb_produto WHERE nome LIKE "B%";

-- Faça um um select com Inner join entre tabela categoria e produto. (nao vai puxar as cat_ref_id repetidas)
SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.id;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são aves ou legumes).
SELECT * FROM tb_categoria INNER JOIN tb_produto on tb_produto.cat_ref_id = tb_categoria.id WHERE cat_ref_id = 5; -- todos que são ácidos

