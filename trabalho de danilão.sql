/* ===========================================================
   SCRIPT COMPLETO 
   CRIAÇÃO DAS TABELAS
===========================================================
*/

CREATE TABLE Livros (
    ISBN INT PRIMARY KEY,
    Titulo VARCHAR(50),
    Data_Publi DATE,
    Genero VARCHAR(50),
    Numero_Pags INT,
    Descricao VARCHAR(300),
    Preco_Base DECIMAL(10, 2),
    Area_ID INT
);

CREATE TABLE Autores (
    Autor_ID INT PRIMARY KEY,
    Nome_Completo VARCHAR(100),
    Bio VARCHAR(200),
    Data_Nasc DATE
);

CREATE TABLE Editoras (
    Editora_ID INT PRIMARY KEY,
    Nome_Fantasia VARCHAR(100),
    CNPJ VARCHAR(14),
    Endereco VARCHAR(100),
    Autor_ID INT
);

CREATE TABLE Exemplares (
    Exemplar_ID INT PRIMARY KEY,
    Estado VARCHAR(50),
    Loc_Fisica VARCHAR(100),
    ISBN INT
);

CREATE TABLE Areas_Conhecimento (
    Area_ID INT PRIMARY KEY,
    Descricao VARCHAR(300)
);

CREATE TABLE Funcionarios (
    ID_Funcionario INT PRIMARY KEY,
    Nome_Completo VARCHAR(100),
    CPF VARCHAR(14),
    Cargo VARCHAR(50),
    Email VARCHAR(100),
    Telefone INT,
    Endereco VARCHAR(300),
    Departamento_ID INT
);

CREATE TABLE Palavras_Chave (
    PChave_ID INT PRIMARY KEY,
    Descricao VARCHAR(50),
    ISBN INT
);

CREATE TABLE Itens_Pedido (
    Item_Pedido_ID INT PRIMARY KEY,
    Quantidade INT,
    Preco_Unitario_Venda DECIMAL(8, 2),
    Pedido_ID INT,
    ISBN INT
);

CREATE TABLE Clientes (
    Cliente_ID INT PRIMARY KEY,
    Nome_Completo VARCHAR(100),
    CPF_CNPJ VARCHAR(20),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    Data_Cadastro DATE
);

CREATE TABLE Pedidos (
    Pedido_ID INT PRIMARY KEY,
    Data_Pedido DATE,
    Valor_Total DECIMAL(10, 2),
    Status_Pedido VARCHAR(50),
    Cliente_ID INT
);

CREATE TABLE Departamentos (
    Nome_Departamento VARCHAR(100),
    Descricao_Atividades VARCHAR(200),
    Departamento_ID INT PRIMARY KEY,
    Autor_ID INT,
    Editora_ID INT
);

CREATE TABLE _Pertence_a_ (
    fk_Livros_ISBN INT,
    fk_Areas_Conhecimento_Area_ID INT
);

CREATE TABLE _Escrito_por (
    fk_Livros_ISBN INT,
    fk_Autores_Autor_ID INT
);
 /* Corrigindo bugs da Seção 1 */
ALTER TABLE Funcionarios MODIFY COLUMN Telefone VARCHAR(20);
ALTER TABLE Editoras MODIFY COLUMN CNPJ VARCHAR(18);

/* ===========================================================
    DEFINIÇÃO DAS CHAVES ESTRANGEIRAS (FOREIGN KEYS)
===========================================================
*/

ALTER TABLE Livros ADD CONSTRAINT FK_Livros_Areas
    FOREIGN KEY (Area_ID)
    REFERENCES Areas_Conhecimento (Area_ID);
 
ALTER TABLE Editoras ADD CONSTRAINT FK_Editoras_Autores
    FOREIGN KEY (Autor_ID)
    REFERENCES Autores (Autor_ID);
 
ALTER TABLE Exemplares ADD CONSTRAINT FK_Exemplares_Livros
    FOREIGN KEY (ISBN)
    REFERENCES Livros (ISBN);
 
ALTER TABLE Funcionarios ADD CONSTRAINT FK_Funcionarios_Departamentos
    FOREIGN KEY (Departamento_ID)
    REFERENCES Departamentos (Departamento_ID);
 
ALTER TABLE Palavras_Chave ADD CONSTRAINT FK_Palavras_Chave_Livros
    FOREIGN KEY (ISBN)
    REFERENCES Livros (ISBN);

ALTER TABLE Itens_Pedido ADD CONSTRAINT FK_Itens_Pedido_Pedidos
    FOREIGN KEY (Pedido_ID) 
    REFERENCES Pedidos (Pedido_ID);

ALTER TABLE Itens_Pedido ADD CONSTRAINT FK_Itens_Pedido_Livros
    FOREIGN KEY (ISBN)
    REFERENCES Livros (ISBN);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_Clientes
    FOREIGN KEY (Cliente_ID)
    REFERENCES Clientes (Cliente_ID);
 
ALTER TABLE Departamentos ADD CONSTRAINT FK_Departamentos_Autores
    FOREIGN KEY (Autor_ID)
    REFERENCES Autores (Autor_ID);

ALTER TABLE Departamentos ADD CONSTRAINT FK_Departamentos_Editoras
    FOREIGN KEY (Editora_ID)
    REFERENCES Editoras (Editora_ID);
 
ALTER TABLE _Pertence_a_ ADD CONSTRAINT FK__Pertence_a__Livros
    FOREIGN KEY (fk_Livros_ISBN)
    REFERENCES Livros (ISBN);
 
ALTER TABLE _Pertence_a_ ADD CONSTRAINT FK__Pertence_a__Areas
    FOREIGN KEY (fk_Areas_Conhecimento_Area_ID)
    REFERENCES Areas_Conhecimento (Area_ID);
 
ALTER TABLE _Escrito_por ADD CONSTRAINT FK__Escrito_por_Livros
    FOREIGN KEY (fk_Livros_ISBN)
    REFERENCES Livros (ISBN);
 
ALTER TABLE _Escrito_por ADD CONSTRAINT FK__Escrito_por_Autores
    FOREIGN KEY (fk_Autores_Autor_ID)
    REFERENCES Autores (Autor_ID);

/* ===========================================================
   SEÇÃO 3: CRIAÇÃO DAS VIEWS (10 Relatórios)
===========================================================
*/

/* VW 1: Relatório dos 10 livros mais vendidos */
CREATE VIEW VW_Livros_Mais_Vendidos AS
SELECT L.Titulo, SUM(IP.Quantidade) AS Total_Vendido
FROM Itens_Pedido IP
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY L.Titulo
ORDER BY Total_Vendido DESC
LIMIT 10;

/* VW 2: Relatório de faturamento total por cliente */
CREATE VIEW VW_Faturamento_Por_Cliente AS
SELECT C.Nome_Completo, SUM(P.Valor_Total) AS Total_Gasto
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
GROUP BY C.Nome_Completo
ORDER BY Total_Gasto DESC;

/* VW 3: Relatório de pedidos com status 'Pendente' */
CREATE VIEW VW_Pedidos_Pendentes AS
SELECT P.Pedido_ID, P.Data_Pedido, C.Nome_Completo AS Cliente
FROM Pedidos P
JOIN Clientes C ON P.Cliente_ID = C.Cliente_ID
WHERE P.Status_Pedido = 'Pendente';

/* VW 4: Relatório de faturamento por gênero de livro */
CREATE VIEW VW_Faturamento_Por_Genero AS
SELECT L.Genero, SUM(IP.Quantidade * IP.Preco_Unitario_Venda) AS Faturamento
FROM Itens_Pedido IP
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY L.Genero;

/* VW 5: Relatório de clientes que nunca fizeram pedidos */
CREATE VIEW VW_Clientes_Sem_Pedidos AS
SELECT C.Nome_Completo, C.Email, C.Data_Cadastro
FROM Clientes C
LEFT JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
WHERE P.Pedido_ID IS NULL;

/* VW 6: Relatório de funcionários e seus departamentos */
CREATE VIEW VW_Funcionarios_Departamentos AS
SELECT F.Nome_Completo, F.Cargo, D.Nome_Departamento
FROM Funcionarios F
JOIN Departamentos D ON F.Departamento_ID = D.Departamento_ID;

/* VW 7: Contagem de funcionários por departamento */
CREATE VIEW VW_Contagem_Funcionarios_Por_Depto AS
SELECT D.Nome_Departamento, COUNT(F.ID_Funcionario) AS Qtd_Funcionarios
FROM Departamentos D
LEFT JOIN Funcionarios F ON D.Departamento_ID = F.Departamento_ID
GROUP BY D.Nome_Departamento;

/* VW 8: Catálogo completo de livros com autores e áreas */
CREATE VIEW VW_Catalogo_Completo_Livros AS
SELECT T.Titulo, A.Nome_Completo AS Autor, AC.Descricao AS Area
FROM Livros T
JOIN _Escrito_por EP ON T.ISBN = EP.fk_Livros_ISBN
JOIN Autores A ON EP.fk_Autores_Autor_ID = A.Autor_ID
JOIN Areas_Conhecimento AC ON T.Area_ID = AC.Area_ID;

/* VW 9: Livros que não possuem exemplares cadastrados */
CREATE VIEW VW_Livros_Sem_Exemplares AS
SELECT L.ISBN, L.Titulo
FROM Livros L
LEFT JOIN Exemplares E ON L.ISBN = E.ISBN
WHERE E.Exemplar_ID IS NULL;

/* VW 10: Clientes que compraram livros de mais de um gênero */
CREATE VIEW VW_Clientes_Generos_Diversos AS
SELECT C.Nome_Completo
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
JOIN Itens_Pedido IP ON P.Pedido_ID = IP.Pedido_ID
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY C.Cliente_ID, C.Nome_Completo
HAVING COUNT(DISTINCT L.Genero) > 1;


/* ===========================================================
  SCRIPTS DE CONSULTA (SELECT) (20 Consultas)
===========================================================
*/
SET SQL_SAFE_UPDATES = 0;

/* 1. Quais são os 10 livros mais vendidos (em quantidade)? */
SELECT L.Titulo, SUM(IP.Quantidade) AS Total_Vendido
FROM Itens_Pedido IP
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY L.Titulo
ORDER BY Total_Vendido DESC
LIMIT 10;

/* 2. Qual o valor total faturado por cliente, em ordem decrescente? */
SELECT C.Nome_Completo, SUM(P.Valor_Total) AS Total_Gasto
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
GROUP BY C.Nome_Completo
ORDER BY Total_Gasto DESC;

/* 3. Listar todos os funcionários e seus respectivos departamentos. */
SELECT F.Nome_Completo, F.Cargo, D.Nome_Departamento
FROM Funcionarios F
JOIN Departamentos D ON F.Departamento_ID = D.Departamento_ID;

/* 4. Quais pedidos ainda estão com status 'Pendente'? */
SELECT P.Pedido_ID, P.Data_Pedido, C.Nome_Completo
FROM Pedidos P
JOIN Clientes C ON P.Cliente_ID = C.Cliente_ID
WHERE P.Status_Pedido = 'Pendente';

/* 5. Listar todos os livros, seus autores e suas áreas de conhecimento. */
SELECT T.Titulo, A.Nome_Completo AS Autor, AC.Descricao AS Area
FROM Livros T
JOIN _Escrito_por EP ON T.ISBN = EP.fk_Livros_ISBN
JOIN Autores A ON EP.fk_Autores_Autor_ID = A.Autor_ID
JOIN Areas_Conhecimento AC ON T.Area_ID = AC.Area_ID;

/* 6. Quais clientes cadastrados nunca fizeram um pedido? */
SELECT C.Nome_Completo, C.Email
FROM Clientes C
LEFT JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
WHERE P.Pedido_ID IS NULL;

/* 7. Quais livros têm preço acima da média de todos os livros? */
SELECT Titulo, Preco_Base
FROM Livros
WHERE Preco_Base > (SELECT AVG(Preco_Base) FROM Livros);

/* 8. Listar todos os itens (livros, qtd, preço) de um pedido específico (ex: Pedido_ID = 101). */
SELECT L.Titulo, IP.Quantidade, IP.Preco_Unitario_Venda
FROM Itens_Pedido IP
JOIN Livros L ON IP.ISBN = L.ISBN
WHERE IP.Pedido_ID = 101;

/* 9. Quais funcionários trabalham no departamento de 'Vendas'? (Usando subselect) */
SELECT F.Nome_Completo, F.Email
FROM Funcionarios F
WHERE F.Departamento_ID = (SELECT Departamento_ID FROM Departamentos WHERE Nome_Departamento = 'Vendas');

/* 10. Quantos funcionários existem por departamento? */
SELECT D.Nome_Departamento, COUNT(F.ID_Funcionario) AS Qtd_Funcionarios
FROM Departamentos D
LEFT JOIN Funcionarios F ON D.Departamento_ID = F.Departamento_ID
GROUP BY D.Nome_Departamento;

/* 11. Quais livros do gênero 'Suspense' têm palavras-chave associadas? */
SELECT DISTINCT L.Titulo, PC.Descricao AS Palavra_Chave
FROM Livros L
JOIN Palavras_Chave PC ON L.ISBN = PC.ISBN
WHERE L.Genero = 'Suspense';

/* 12. Quais livros não possuem exemplares cadastrados? */
SELECT L.ISBN, L.Titulo
FROM Livros L
LEFT JOIN Exemplares E ON L.ISBN = E.ISBN
WHERE E.Exemplar_ID IS NULL;

/* 13. Quais clientes compraram o livro com ISBN '9780316769488'? */
SELECT DISTINCT C.Nome_Completo, C.Email
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
JOIN Itens_Pedido IP ON P.Pedido_ID = IP.Pedido_ID
WHERE IP.ISBN = 9780316769488;

/* 14. Listar todos os exemplares de um livro específico (ex: Título 'O Iluminado') e sua localização. */
SELECT E.Exemplar_ID, E.Estado, E.Loc_Fisica
FROM Exemplares E
JOIN Livros L ON E.ISBN = L.ISBN
WHERE L.Titulo = 'O Iluminado';

/* 15. Qual o faturamento total por gênero de livro? */
SELECT L.Genero, SUM(IP.Quantidade * IP.Preco_Unitario_Venda) AS Faturamento
FROM Itens_Pedido IP
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY L.Genero;

/* 16. Quais autores são publicados pela editora 'Editora Fantasia' (ex: Editora_ID = 3)? */
SELECT A.Nome_Completo, A.Data_Nasc
FROM Autores A
JOIN Editoras E ON A.Autor_ID = E.Autor_ID
WHERE E.Editora_ID = 3;

/* 17. Quais clientes fizeram pedidos nos últimos 30 dias? */
SELECT C.Nome_Completo, P.Data_Pedido
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
WHERE P.Data_Pedido >= (CURRENT_DATE - INTERVAL '30' DAY);

/* 18. Listar livros com mais de 500 páginas da área de 'Tecnologia'. */
SELECT L.Titulo, L.Numero_Pags
FROM Livros L
JOIN Areas_Conhecimento AC ON L.Area_ID = AC.Area_ID
WHERE L.Numero_Pags > 500 AND AC.Descricao = 'Tecnologia';

/* 19. Quais clientes compraram livros de mais de um gênero diferente no total? */
SELECT C.Nome_Completo
FROM Clientes C
JOIN Pedidos P ON C.Cliente_ID = P.Cliente_ID
JOIN Itens_Pedido IP ON P.Pedido_ID = IP.Pedido_ID
JOIN Livros L ON IP.ISBN = L.ISBN
GROUP BY C.Cliente_ID, C.Nome_Completo
HAVING COUNT(DISTINCT L.Genero) > 1;

/* 20. Listar todos os livros e seus autores, incluindo autores que não têm livros cadastrados. */
SELECT A.Nome_Completo, L.Titulo
FROM Autores A
LEFT JOIN _Escrito_por EP ON A.Autor_ID = EP.fk_Autores_Autor_ID
LEFT JOIN Livros L ON EP.fk_Livros_ISBN = L.ISBN;


/* ===========================================================
   SEÇÃO 5: SCRIPTS DE ALTERAÇÃO (CORRIGIDO PARA MYSQL)
   (Pular os comandos de Salário)
===========================================================
*/
ALTER TABLE Editoras MODIFY COLUMN CNPJ VARCHAR(18);
/* SEÇÃO 5 CORRIGIDA PARA MYSQL (SEM SALÁRIO) */

/* 3. Adicionar uma coluna para 'Método de Pagamento' na tabela Pedidos */
ALTER TABLE Pedidos
ADD COLUMN Metodo_Pagamento VARCHAR(30);

/* 4. Adicionar uma restrição de unicidade (UNIQUE) para o email do Cliente */
ALTER TABLE Clientes
ADD CONSTRAINT UQ_Email UNIQUE (Email);

/* 5. Mudar o tipo de dado da Descrição do Livro para suportar textos maiores */
ALTER TABLE Livros
MODIFY COLUMN Descricao VARCHAR(1000);

/* 6. Remover a coluna 'Bio' da tabela Autores */
ALTER TABLE Autores
DROP COLUMN Bio;

/* 7. Adicionar uma coluna 'Data de Admissão' para Funcionários */
ALTER TABLE Funcionarios
ADD COLUMN Data_Admissao DATE;

/* 8. Adicionar um valor padrão (DEFAULT) para o Status do Pedido */
ALTER TABLE Pedidos
ALTER COLUMN Status_Pedido SET DEFAULT 'Pendente';

/* 9. Adicionar restrição (CHECK) para o Estado do Exemplar */
ALTER TABLE Exemplares
ADD CONSTRAINT CHK_Estado CHECK (Estado IN ('Novo', 'Usado', 'Danificado', 'Emprestado', 'Disponível'));

/* 10. Renomear a coluna 'Data_Publi' em Livros para 'Data_Publicacao' */
ALTER TABLE Livros
CHANGE COLUMN Data_Publi Data_Publicacao DATE;

/* ===========================================================
   SCRIPT DE DESTRUIÇÃO (DROP)
===========================================================
*/

/* --- 1. Removendo as VIEWS --- */
DROP VIEW IF EXISTS VW_Livros_Mais_Vendidos;
DROP VIEW IF EXISTS VW_Faturamento_Por_Cliente;
DROP VIEW IF EXISTS VW_Pedidos_Pendentes;
DROP VIEW IF EXISTS VW_Faturamento_Por_Genero;
DROP VIEW IF EXISTS VW_Clientes_Sem_Pedidos;
DROP VIEW IF EXISTS VW_Funcionarios_Departamentos;
DROP VIEW IF EXISTS VW_Contagem_Funcionarios_Por_Depto;
DROP VIEW IF EXISTS VW_Catalogo_Completo_Livros;
DROP VIEW IF EXISTS VW_Livros_Sem_Exemplares;
DROP VIEW IF EXISTS VW_Clientes_Generos_Diversos;
DROP TABLE IF EXISTS _Pertence_a_;
DROP TABLE IF EXISTS _Escrito_por;
DROP TABLE IF EXISTS Itens_Pedido;
DROP TABLE IF EXISTS Palavras_Chave;
DROP TABLE IF EXISTS Exemplares;
DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Departamentos;
DROP TABLE IF EXISTS Editoras;
DROP TABLE IF EXISTS Livros;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Autores;
DROP TABLE IF EXISTS Areas_Conhecimento;


create database trabalho_de_danilo;
