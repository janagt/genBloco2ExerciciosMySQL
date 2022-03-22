-- SEMANA 7 - BLOCO 2 - 21/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco deverá ter o seguinte 
    nome db_pizzaria_legal, onde o sistema trabalhará com as informações dos produtos desta empresa. 
	O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.
    
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
		relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
	-	Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos 
		relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria
        (não esqueça de criar a foreign key de tb_categoria nesta tabela).
	
    -	Popule esta tabela Categoria com até 5 dados.
	-	Popule esta tabela pizza com até 8 dados.

	-	Faça um select que retorne os produtos com o valor maior do que 45 reais.
	-	Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.
	-	Faça um select  utilizando LIKE buscando os Produtos com a letra C.
	-	Faça um um select com Inner join entre  tabela categoria e pizza.
	-	Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL 
    ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;


-- Cria da primeira tabela, tabela de categoria
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
	valor DECIMAL(10,2),
    promocao BOOLEAN,
    entrega BOOLEAN,
    
    PRIMARY KEY(ID)
);


-- Inserção dos dados na segunda tabela, de pizza
CREATE TABLE tb_pizza(
	id BIGINT AUTO_INCREMENT,
	sabor VARCHAR(255),
	borda VARCHAR(255),
	ingredientes VARCHAR(255),
    fatias INT,
    tamanho VARCHAR(255),
    cat_ref_id BIGINT,
    
    PRIMARY KEY(id),
    FOREIGN KEY (cat_ref_id) REFERENCES tb_categoria(id)
);


-- Lista todas as informações da tabela de pizza e categoria
SELECT * FROM tb_pizza;
SELECT * FROM tb_categoria;


-- Inserção dos dados na tabela de categoria
INSERT INTO tb_categoria(valor, promocao, entrega)
VALUES(29,true,false);

INSERT INTO tb_categoria(valor, promocao, entrega)
VALUES(45,true,true);

INSERT INTO tb_categoria(valor, promocao, entrega)
VALUES(83,false,true);

INSERT INTO tb_categoria(valor, promocao, entrega)
VALUES(60,false,true);

INSERT INTO tb_categoria(valor, promocao, entrega)
VALUES(13,true,false);


-- Inserção dos dados na tabela de pizza
INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Muçarela","Sem Borda","Molho de Tomate, Queijo e Azeitona",6,"P",2);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Calabresa","Borda de Cheddar","Molho de Tomate, Calabresa e Azeitona",12,"G",2);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Brócolis","Borda de Catupiry","Molho de Tomate, Queijo e Brócolis",8,"M",1);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Caprese","Sem Borda","Molho de Tomate, Tomate, Queijo e Azeitona",16,"GG",3);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Portuguesa","Borda de Catupiry","Molho de Tomate, Queijo, Presunto, Milho e Azeitona",12,"G",3);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Napolitana","Sem Borda","Molho de Tomate, Muçarela, Manjericão e Azeite",8,"M",4);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Brigadeiro","Borda Doce","Chocolate Meio-amargo",4,"P",5);

INSERT INTO tb_pizza(sabor, borda, ingredientes, fatias, tamanho, cat_ref_id)
VALUES("Nutella","Borda Doce","Nutella e M&M",4,"P",5);


-- selects e joins

-- Faça um select que retorne os produtos com o valor maior do que 45 reais.
SELECT * FROM tb_categoria WHERE valor > 45.00;

-- Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.
SELECT * FROM tb_categoria WHERE valor BETWEEN 29.00 AND 60.00;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_pizza WHERE sabor LIKE "C%";

-- Faça um um select com Inner join entre  tabela categoria e pizza. (nao vai puxar as classe_id repetidas)
SELECT * FROM tb_pizza INNER JOIN tb_categoria ON tb_categoria.id = tb_pizza.id;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).
-- SELECT * FROM tb_categoria INNER JOIN tb_pizza on tb_pizza.cat_ref_id = tb_categoria.id WHERE cat_ref_id = 4;
SELECT * FROM tb_categoria INNER JOIN tb_pizza on tb_pizza.cat_ref_id = tb_categoria.id WHERE borda LIKE "%Doce%";
