-- SEMANA 7 - BLOCO 2 - 21/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
    deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as 
    informações dos produtos desta empresa. 
    
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
		relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
	-	Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
		relevantes dos tb_produto para se trabalhar com o serviço deste farmacia
        (não esqueça de criar a foreign key de tb_categoria nesta tabela).
	
    -	Popule esta tabela Categoria com até 5 dados.
	-	Popule esta tabela Produto com até 8 dados.

	-	Faça um select que retorne os produtos com o  valor maior do que 50 reais.
	-	Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
	-	Faça um select  utilizando LIKE buscando os Produtos com a letra B.
	-	Faça um um select com Inner join entre tabela categoria e produto.
	-	Faça um select onde traga todos os Produtos de uma categoria específica
		(exemplo todos os produtos que são cosméticos).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL 
    ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

CREATE DATABASE db_farmacia_do_bem;

USE db_farmacia_do_bem;


-- Cria da primeira tabela, tabela de categoria
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
	categoria VARCHAR(255),
	tarja VARCHAR(255),
    classificacao VARCHAR(255),
    
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
INSERT INTO tb_categoria(categoria, tarja, classificacao)
VALUES("Remédios","Vermelha","18+");

INSERT INTO tb_categoria(categoria, tarja, classificacao)
VALUES("Com receita","Preta","6+");

INSERT INTO tb_categoria(categoria, tarja, classificacao)
VALUES("Cosmético","Verde","Livre");

INSERT INTO tb_categoria(categoria, tarja, classificacao)
VALUES("Dermocosmético","Vermelha","Livre");

INSERT INTO tb_categoria(categoria, tarja, classificacao)
VALUES("Naturais","Verde","Livre");


-- Inserção dos dados na tabela de produtos (8)
INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Seringa de Insulina",41.10,12,"A Seringa de insulina ultra-fine 8mm proporciona escala com graduação de 2 em 2 unidades, registra com precisão doses pares de insulina. Ideal para prescrições acima de 50 unidades por aplicação.",true, 1);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Zetia",88.48,60,"Zetia é indicado para reduzir a quantidade de colesterol e de triglicérides no seu sangue.",false, 1);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Ritalina",20.09,10,"Ritalina é utilizada para o tratamento do Transtorno de déficit de atenção/hiperatividade. O Transtorno de déficit de atenção/hiperatividade (TDAH) ou Transtorno hipercinético é um distúrbio de comportamento em crianças e adolescentes.",true, 2);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Rivotril",59.00,3,"Distúrbio epiléptico Rivotril é indicado para tratar crises epilépticas e espasmos infantis (Síndrome de West). Rivotril também é indicado para: Transtornos de ansiedade - Como ansiolítico em geral.",false, 2);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Protetor Labial Manteiga de Cacau",2.50,1,"Protetor Labial Manteiga Manteiga de Cacau Stick da Needs é utilizada nos lábios a fim de oferecer hidratação e maciez aos lábios com fissuras que foram obtidas no calor, no frio ou em qualquer outra ocasião.",true, 3);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Lápis de Olho Preto",32.31,3,"O Lápis de olho preto com esfumador Eclat apresenta uma fórmula segura para a região dos olhos, composta pela combinação de emolientes e um complexo de ceras que conduzem a um traço fino, preciso e uniforme.",true, 3);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Trok-N",13.10,6,"Trok-N (cetoconazol + dipropionato de betametasona + sulfato de neomicina) é indicado no tratamento de doenças de pele, onde se exigem ações anti-inflamatória, antibacteriana e antimicótica, causadas por germes sensíveis.",false, 4);

INSERT INTO tb_produto(nome, valor, quantidade, descricao, promocao, cat_ref_id)
VALUES("Besomed",43.79,60,"O Besomed aliado a atividades físicas e alimentação saudável promove uma significativa perda de peso. Uso adulto e de crianças acima de 2 anos.",false, 5);


-- selects e joins

-- Faça um select que retorne os produtos com o  valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE valor > 45.00;

-- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE valor BETWEEN 3.00 AND 60.00;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra B.
SELECT * FROM tb_produto WHERE nome LIKE "B%";

-- Faça um um select com Inner join entre tabela categoria e produto. (nao vai puxar as cat_ref_id repetidas)
SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.id;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).
SELECT * FROM tb_categoria INNER JOIN tb_produto on tb_produto.cat_ref_id = tb_categoria.id WHERE cat_ref_id = 3;

