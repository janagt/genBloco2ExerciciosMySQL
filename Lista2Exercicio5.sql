-- SEMANA 7 - BLOCO 2 - 21/03/22 E 22/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome do banco deverá ter o seguinte 
    nome db_construindo_a_nossa_vida, onde o sistema trabalhará com as informações dos produtos desta empresa. 

	O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

    
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
		relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.
	-	Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
		relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos
        (não esqueça de criar a foreign key de tb_categoria nesta tabela).
	
    -	Popule esta tabela Categoria com até 5 dados.
	-	Popule esta tabela Produto com até 8 dados.

	-	Faça um select que retorne os Produtos com o valor maior do que 50 reais.
	-	Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
	-	Faça um select  utilizando LIKE buscando os Produtos com a letra C.
	-	Faça um select com Inner join entre  tabela categoria e produto.
	-	Faça um select onde traga todos os Produtos de uma categoria específica
		(exemplo todos os produtos que são da categoria hidráulica).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL 
    ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

CREATE DATABASE db_construindo_a_nossa_vida;

USE db_construindo_a_nossa_vida;


-- Cria da primeira tabela, tabela de categoria
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
	categoria VARCHAR(255),
	marca VARCHAR(255),
    entrega BOOLEAN,
    
    PRIMARY KEY(ID)
);


-- Inserção dos dados na segunda tabela, de pizza
CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255),
	valor DECIMAL(10,2),
    quantidade INT,
    descricao VARCHAR(255),
    promocao BOOLEAN,
    cat_ref_id BIGINT,
    
    PRIMARY KEY(id),
    FOREIGN KEY (cat_ref_id) REFERENCES tb_categoria(id)
);


-- Lista todas as informações da tabela de pizza e categoria
SELECT * FROM tb_produto;
SELECT * FROM tb_categoria;


-- Inserção dos dados na tabela de categoria (5)
INSERT INTO tb_categoria(categoria, marca, entrega)
VALUES("Material de Construção","Quartzolit",true);

INSERT INTO tb_categoria(categoria, marca, entrega)
VALUES("Elétrica","Lorenzetti",false);

INSERT INTO tb_categoria(categoria, marca, entrega)
VALUES("Pinturas","Coral",false);

INSERT INTO tb_categoria(categoria, marca, entrega)
VALUES("Hidráulica","Tigre",true);

INSERT INTO tb_categoria(categoria, marca, entrega)
VALUES("Equipamentos de Proteção","3M",false);


-- Inserção dos dados na tabela de produtos (8)
INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Cimento", 60.50, 2, "Cimento de alta qualidade, que atende aos requisitos técnicos das normas ABNT, sendo indicada para a preparação de diversos tipos de obras", false, 1);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Argamassa", 60.04, 4, "Argamassa na cor cinza, indicada para assentamento de peças cerâmicas em áreas internas, ideal para peças cerâmicas com medida até 80 x 80 cm.", false, 1);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Chuveiro Elétrico", 299.90, 1, "Com um espalhador amplo e com duas possibilidades de jato, o chuveiro Acqua Duo da Lorenzetti possui controle de temperatura gradual.", true, 2);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Tinta Fosca", 204.90, 1, "A tinta acrílica é recomendada para pintura de paredes, sendo uma exelente opção para quem precisa de secagem rápida.", true, 3);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Registro Pressao Base 3/4 1/2 Volta", 54.23, 1, "O Registro de Pressão Docol Cerâmico Base Meia Volta 3/4, tem alto desempenho em qualidade, funcionamento e vazão de água. ", true, 4);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Caixa De Água", 339.90, 1, "A Caixa De Água 1.000L Polietileno Tampa Encaixe Azul possui sistema exclusivo de encaixe das tampas, que garante mais vedação e conservação da água.", false, 4);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Capacete", 49.90, 1, "O Capacete 3M H-700 com Ajuste Fácil é usado para proteger a cabeça do usuário contra impactos de pequenos objetos e perfurações.", false, 5);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Máscara", 146.90, 1, "O respirador é composto basicamente por três camadas: parte interna de sustentação, composta de não-tecido em fibras sintéticas.", false, 5);


-- selects e joins

-- Faça um select que retorne os produtos com o  valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE valor > 45.00;

-- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE valor BETWEEN 3.00 AND 60.00;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_produto WHERE nome LIKE "C%";

-- Faça um um select com Inner join entre tabela categoria e produto. (nao vai puxar as cat_ref_id repetidas)
SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.id;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria hidráulica).
SELECT * FROM tb_categoria INNER JOIN tb_produto on tb_produto.cat_ref_id = tb_categoria.id WHERE cat_ref_id = 4;

