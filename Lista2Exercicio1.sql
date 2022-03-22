-- SEMANA 7 - BLOCO 2 - 21/03/22
-- INTRODUÇÃO À BANCO DE DADOS COM MYSQL
-- FOREING KEY & JOINS

/*
	Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte 
	nome db_generation_game_online, onde, o sistema trabalhará com as informações dos personagens desse game. 

	O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
	Siga  exatamente esse passo a passo:
	-	Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos 
		relevantes da classe para se trabalhar com o serviço desse  game Online.
	-	Crie uma tabela tb_personagem e utilize a habilidade de abstração e determine 5 atributos 
		relevantes dos funcionários para se trabalhar com o serviço desse game Online
		(não esqueça de criar a foreign key de tb_classe nesta tabela).
        
	- 	Popule esta tabela classe com até 5 dados.
	-	Popule esta tabela personagem com até 8 dados.

	-	Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
	-	Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.
	-	Faça um select  utilizando LIKE buscando os personagens com a letra C.
	-	Faça um um select com Inner join entre  tabela classe e personagem.
	-	Faça um select onde traga todos os personagem de uma classe específica
		(exemplo todos os personagens que são arqueiros).

	Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL
	ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

-- Criação do Banco de dados
CREATE DATABASE db_generation_game_online;

-- Seleciona o Banco de dados para conseguirmos fazer as requisições
USE db_generation_game_online;

-- Criação da primeira tabela, tabela de classes
CREATE TABLE tb_classe(
	id BIGINT AUTO_INCREMENT,
    nivel INT,
    classe VARCHAR(255),
    habilidade VARCHAR(255),
    arma VARCHAR(255),
    
    PRIMARY KEY(id)
);

-- Cria da segunda tabela, tabela de personagens
CREATE TABLE tb_personagem(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    raca VARCHAR(255),
    atk INT,
    def INT,
    hp INT,
    classe_id bigint, -- podia ser o qqr nome, irá entrar na foreign key (é a referencia da "profissao" do personagem)
    
    PRIMARY KEY(id),
    -- na criação da foreign key, é importante colocar a chave estrangeira do mesmo tipo de dado da chave primaria da tabela que você quer relacionar, no caso, bigint
    FOREIGN KEY(classe_id) REFERENCES tb_classe(id) -- vai puxar para a classe_id a referencia a id da outra tabela (tb_classe).
);

 -- Inserção dos dados na tabela de classes, lembrando que cada valor corresponde a uma coluna da tabela
INSERT INTO tb_classe(nivel, classe, habilidade, arma)
VALUES(99,"Cavaleiro","Pericia em armas","Espada de duas mãos");

INSERT INTO tb_classe(nivel, classe, habilidade, arma)
VALUES(87,"Bruxo","Resistencia a Magia","Cajado");

INSERT INTO tb_classe(nivel, classe, habilidade, arma)
VALUES(74,"Mercenário","Mãos leves","Adaga");

INSERT INTO tb_classe(nivel, classe, habilidade, arma)
VALUES(43,"Caçador","Precisão","Arco e flecha");

INSERT INTO tb_classe(nivel, classe, habilidade, arma)
VALUES(38,"Bardo","Encoraja","Alaúde");

-- Inserção de dados da tabela personagem
INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Clebin","Anão", 2200, 3000, 5000, 1);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Mara","Dark Elf", 4400, 1900, 1600, 2);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Milena","Humana", 4500, 1500, 2000, 3);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Luana","Centauro", 3600, 2000, 3300, 4);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Serginho","Orc", 1300, 2100, 1000, 5);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Fanta","Anão", 2600, 2800, 4800, 4);

INSERT INTO tb_personagem(nome, raca, atk, def, hp, classe_id)
VALUES("Juju","Humana", 4300, 2200, 2000, 4);


-- Lista todas as informações da tabela de classes e personagens
SELECT * FROM tb_classe;
SELECT * FROM tb_personagem;


-- selects e joins

-- Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
SELECT * FROM tb_personagem WHERE atk > 2000;

-- Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.
SELECT * FROM tb_personagem WHERE def BETWEEN 1000 AND 2000;

-- Faça um select  utilizando LIKE buscando os personagens com a letra C.
SELECT * FROM tb_personagem WHERE nome LIKE "%C%";

-- Faça um um select com Inner join entre  tabela classe e personagem. (nao vai puxar as classe_id repetidas)
SELECT * FROM tb_personagem INNER JOIN tb_classe ON tb_classe.id = tb_personagem.id;

-- Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).
SELECT * FROM tb_classe INNER JOIN tb_personagem on tb_personagem.classe_id = tb_classe.id WHERE classe_id = 4;

