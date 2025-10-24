/* ===========================================================
   SCRIPT DE MANIPULAÇÃO (DML) - Por: Kauan
   Projeto Lógico_TRIO
   SEÇÃO: Scripts de UPDATE e DELETE (Mínimo 20)
   VERSÃO ATUALIZADA (SEM SALÁRIO)
===========================================================
*/

/* --- SCRIPTS DE ATUALIZAÇÃO (UPDATE) --- */

/* 1. Corrigir o nome de um cliente que foi digitado errado. */
UPDATE Clientes 
SET Nome_Completo = 'Maria Joaquina de Almeida'
WHERE Cliente_ID = 302;

/* 2. Promover um funcionário, atualizando seu cargo. */
UPDATE Funcionarios
SET Cargo = 'Editor Sênior'
WHERE ID_Funcionario = 601; /* Amanda Nunes */

/* 3. Mudar um funcionário de departamento. */
UPDATE Funcionarios
SET Departamento_ID = 502 /* Depto Editorial Ficção */
WHERE ID_Funcionario = 603; /* Carla Dias */

/* 4. Atualizar o preço base de um livro específico. */
UPDATE Livros
SET Preco_Base = 95.00
WHERE ISBN = 1001; /* 'SQL para Iniciantes' */

/* 5. Dar um aumento de 10% em todos os livros da área de 'Tecnologia da Informação'. */
UPDATE Livros
SET Preco_Base = Preco_Base * 1.10
WHERE Area_ID = 101;

/* 6. Atualizar o status de um pedido que estava 'Processando' para 'Enviado'. */
UPDATE Pedidos
SET Status_Pedido = 'Enviado'
WHERE Pedido_ID = 913;

/* 7. Atualizar o status de um pedido que estava 'Pendente' para 'Processando'. */
UPDATE Pedidos
SET Status_Pedido = 'Processando'
WHERE Pedido_ID = 919;

/* 8. Atualizar em lote todos os pedidos 'Pendentes' restantes para 'Processando' 
      e definir 'PIX' como método de pagamento padrão para eles. */
UPDATE Pedidos
SET Status_Pedido = 'Processando',
    Metodo_Pagamento = 'PIX'
WHERE Status_Pedido = 'Pendente';

/* 9. Corrigir a descrição de uma Área de Conhecimento. */
UPDATE Areas_Conhecimento
SET Descricao = 'Ficção Científica e Fantasia'
WHERE Area_ID = 102;

/* 10. Mudar a localização física de um exemplar específico. */
UPDATE Exemplares
SET Loc_Fisica = 'Loja - Seção Destaques'
WHERE Exemplar_ID = 705;

/* 11. Transferir o estagiário do depto 'Editorial Técnico' para 'Marketing' (Script novo). */
UPDATE Funcionarios
SET Departamento_ID = 503
WHERE ID_Funcionario = 604; /* Daniel Moreira */

/* 12. Corrigir o CNPJ de uma editora. */
UPDATE Editoras
SET CNPJ = '12.345.678/0001-90'
WHERE Editora_ID = 401; /* Editora Saber Total */

/* 13. Reajustar preços de livros com base no Gênero (Usando CASE). */
UPDATE Livros
SET Preco_Base = CASE
    WHEN Genero = 'Técnico' THEN Preco_Base * 1.05
    WHEN Genero = 'História' THEN Preco_Base * 1.07
    ELSE Preco_Base * 1.02
END;

/* 14. Atualizar o e-mail de um cliente que solicitou a troca. */
UPDATE Clientes
SET Email = 'c.eduardo@novoemail.com'
WHERE Cliente_ID = 305;


/* --- SCRIPTS DE DESTRUIÇÃO (DELETE) --- */

/* 15. Remover uma palavra-chave que foi considerada irrelevante para um livro. */
DELETE FROM Palavras_Chave
WHERE PChave_ID = 801; /* Remove 'SQL' do livro 1001 */

/* 16. Remover um exemplar específico que estava danificado e foi descartado. */
DELETE FROM Exemplares
WHERE Exemplar_ID = 706; /* Exemplar danificado do livro 1005 */

/* 17. Remover todos os exemplares de um livro que saiu de linha (ISBN 1007). */
DELETE FROM Exemplares
WHERE ISBN = 1007; /* 'Crônicas Marcianas' */

/* 18. Remover em lote todos os exemplares marcados como 'Danificado'. */
DELETE FROM Exemplares
WHERE Estado = 'Danificado';

/* 19. Remover um co-autor de um livro (Remover da tabela de ligação N-N). */
DELETE FROM _Escrito_por
WHERE fk_Livros_ISBN = 1001 AND fk_Autores_Autor_ID = 220; /* Remove Sofia Ribeiro do livro 'SQL p/ Iniciantes' */

/* 20. Remover os itens de um pedido que foi cancelado (Pedido 906). 
      (Necessário antes de deletar o pedido, devido à Foreign Key). */
DELETE FROM Itens_Pedido
WHERE Pedido_ID = 906;

/* 21. Remover o pedido cancelado (Pedido 906) do sistema. */
DELETE FROM Pedidos
WHERE Pedido_ID = 906;