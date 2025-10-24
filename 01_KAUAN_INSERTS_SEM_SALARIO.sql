/* ===========================================================
   SCRIPT DE POVOAMENTO (DML) - Por: Kauan
   VERSÃO ATUALIZADA (SEM SALÁRIO)
   Obs: Este script assume que os ALTER TABLE da Seção 5 (exceto Salário) já foram executados.
===========================================================
*/

/* --- 1. Tabelas Independentes (sem FKs) --- */

INSERT INTO Areas_Conhecimento (Area_ID, Descricao) VALUES
(101, 'Tecnologia da Informação'),
(102, 'Ficção Científica'),
(103, 'História'),
(104, 'Negócios e Finanças'),
(105, 'Saúde e Bem-Estar');

INSERT INTO Autores (Autor_ID, Nome_Completo, Data_Nasc) VALUES
(201, 'Carlos Silva', '1980-05-15'),
(202, 'Ana Oliveira', '1975-11-20'),
(203, 'Rodrigo Souza', '1990-03-10'),
(204, 'Beatriz Lima', '1988-07-22'),
(205, 'Marcos Pereira', '1965-01-30'),
(206, 'Juliana Almeida', '1992-09-05'),
(207, 'Felipe Costa', '1983-02-18'),
(208, 'Larissa Mendes', '1979-12-12'),
(209, 'Gabriel Santos', '1995-06-25'),
(210, 'Fernanda Rocha', '1986-04-14'),
(211, 'Ricardo Neves', '1970-08-01'),
(212, 'Patrícia Borges', '1998-10-27'),
(213, 'Lucas Martins', '1982-05-19'),
(214, 'Camila Ferreira', '1991-11-03'),
(215, 'Thiago Azevedo', '1987-07-11'),
(216, 'Vanessa Dias', '1973-03-29'),
(217, 'Bruno Gomes', '1993-01-07'),
(218, 'Aline Barros', '1989-08-30'),
(219, 'Diego Fernandes', '1981-06-16'),
(220, 'Sofia Ribeiro', '1996-12-09');

INSERT INTO Clientes (Cliente_ID, Nome_Completo, CPF_CNPJ, Email, Telefone, Data_Cadastro) VALUES
(301, 'Empresa Alfa Ltda', '11.222.333/0001-44', 'contato@alfa.com', '11988887777', '2023-01-10'),
(302, 'Maria Joaquina', '123.456.789-10', 'maria.joaquina@email.com', '21977776666', '2023-02-15'),
(303, 'João Pedro', '987.654.321-20', 'joao.pedro@email.com', '31966665555', '2023-03-20'),
(304, 'Padaria Doce Sonho', '22.333.444/0001-55', 'compras@docesonho.com', '41955554444', '2023-04-05'),
(305, 'Carlos Eduardo', '111.222.333-44', 'carlos.edu@email.com', '51944443333', '2023-05-12'),
(306, 'Ana Beatriz', '555.666.777-88', 'ana.beatriz@email.com', '61933332222', '2023-06-18'),
(307, 'Escritório Contábil XYZ', '33.444.555/0001-66', 'fiscal@contabilxyz.com', '71922221111', '2023-07-21'),
(308, 'Rafaela Moreira', '999.888.777-66', 'rafaela.m@email.com', '81911110000', '2023-08-30'),
(309, 'Pedro Henrique', '444.555.666-77', 'pedro.henrique@email.com', '11987654321', '2023-09-05'),
(310, 'Restaurante Sabor Caseiro', '44.555.666/0001-77', 'adm@saborcaseiro.com', '21976543210', '2023-10-14'),
(311, 'Luiza Fernandes', '222.333.444-55', 'luiza.f@email.com', '31965432109', '2023-11-25'),
(312, 'Roberto Almeida', '777.888.999-00', 'roberto.a@email.com', '41954321098', '2023-12-01'),
(313, 'Clínica Veterinária PetCare', '55.666.777/0001-88', 'petcare@clinicavet.com', '51943210987', '2024-01-15'),
(314, 'Fernanda Costa', '666.777.888-99', 'fernanda.costa@email.com', '61932109876', '2024-02-20'),
(315, 'Guilherme Rocha', '888.999.000-11', 'guilherme.r@email.com', '71921098765', '2024-03-03'),
(316, 'Academia Corpo em Forma', '66.777.888/0001-99', 'contato@corpoemforma.com', '81910987654', '2024-04-10'),
(317, 'Isabela Martins', '333.444.555-66', 'isabela.m@email.com', '11987654321', '2024-05-17'),
(318, 'Lucas Gabriel', '000.111.222-33', 'lucas.g@email.com', '21976543210', '2024-06-22'),
(319, 'Loja de Roupas Estilo Único', '77.888.999/0001-00', 'estilounico@loja.com', '31965432109', '2024-07-28'),
(320, 'Beatriz Oliveira', '121.232.343-45', 'beatriz.o@email.com', '41954321098', '2024-08-11');

/* --- 2. Tabelas Dependentes (Nível 1) --- */

INSERT INTO Editoras (Editora_ID, Nome_Fantasia, CNPJ, Endereco, Autor_ID) VALUES
(401, 'Editora Saber Total', '12345678000190', 'Rua das Letras, 123', 201),
(402, 'Edições Futuro', '23456789000180', 'Avenida dos Livros, 456', 202),
(403, 'Editora Histórica', '34567890000170', 'Praça do Conhecimento, 789', 203),
(404, 'Foco Finanças Livros', '45678901000160', 'Rua da Moeda, 101', 204),
(405, 'Mente Sã Edições', '56789012000150', 'Avenida da Saúde, 202', 205);

INSERT INTO Livros (ISBN, Titulo, Data_Publicacao, Genero, Numero_Pags, Descricao, Preco_Base, Area_ID) VALUES
(1001, 'SQL para Iniciantes', '2023-01-15', 'Técnico', 350, 'Aprenda SQL do zero.', 89.90, 101),
(1002, 'O Planeta de Vidro', '2022-11-30', 'Ficção Científica', 420, 'Uma jornada a um novo mundo.', 59.90, 102),
(1003, 'A Revolução Francesa', '2023-03-20', 'História', 500, 'Análise detalhada dos eventos.', 79.90, 103),
(1004, 'Investindo na Bolsa', '2023-05-10', 'Finanças', 280, 'Guia prático para investir.', 69.90, 104),
(1005, 'Meditação e Mindfulness', '2023-02-25', 'Autoajuda', 210, 'Técnicas para uma vida calma.', 49.90, 105),
(1006, 'Python Avançado', '2023-06-01', 'Técnico', 450, 'Tópicos avançados em Python.', 110.00, 101),
(1007, 'Crônicas Marcianas', '2022-10-05', 'Ficção Científica', 300, 'Contos sobre a colonização de Marte.', 54.90, 102),
(1008, 'A Segunda Guerra Mundial', '2023-04-12', 'História', 800, 'Um panorama completo do conflito.', 129.90, 103),
(1009, 'Gestão de Pequenas Empresas', '2023-07-15', 'Negócios', 320, 'Como administrar seu negócio.', 75.00, 104),
(1010, 'Nutrição Esportiva', '2023-08-05', 'Saúde', 260, 'Alimentação para performance.', 65.50, 105),
(1011, 'Redes de Computadores', '2023-09-20', 'Técnico', 550, 'De A a Z em redes.', 130.00, 101),
(1012, 'O Fim da Eternidade', '2022-12-10', 'Ficção Científica', 290, 'Viagem no tempo e suas consequências.', 58.00, 102),
(1013, 'História do Brasil Colônia', '2023-10-01', 'História', 400, 'O período colonial brasileiro.', 72.00, 103),
(1014, 'Marketing Digital Essencial', '2023-11-10', 'Negócios', 310, 'Estratégias de marketing online.', 68.00, 104),
(1015, 'Yoga para Todos', '2023-12-15', 'Autoajuda', 190, 'Práticas de yoga para iniciantes.', 45.00, 105),
(1016, 'Inteligência Artificial', '2024-01-20', 'Técnico', 600, 'Fundamentos de IA e Machine Learning.', 149.90, 101),
(1017, 'Duna', '2022-09-01', 'Ficção Científica', 680, 'O clássico de Frank Herbert.', 89.90, 102),
(1018, 'A Era das Revoluções', '2024-02-10', 'História', 450, 'Europa 1789-1848.', 85.00, 103),
(1019, 'Contabilidade para Não-Contadores', '2024-03-05', 'Finanças', 240, 'Entenda os conceitos básicos.', 62.00, 104),
(1020, 'O Poder do Hábito', '2024-04-01', 'Autoajuda', 330, 'Por que fazemos o que fazemos.', 55.00, 105);

/* --- 3. Tabelas Dependentes (Nível 2) --- */

INSERT INTO Departamentos (Departamento_ID, Nome_Departamento, Descricao_Atividades, Autor_ID, Editora_ID) VALUES
(501, 'Editorial Técnico', 'Revisão e edição de livros técnicos.', 206, 401),
(502, 'Editorial Ficção', 'Seleção e edição de obras de ficção.', 207, 402),
(503, 'Marketing', 'Divulgação e promoção dos livros.', 208, 403),
(504, 'Financeiro', 'Gestão de contas e pagamentos.', 209, 404),
(505, 'Recursos Humanos', 'Gestão de pessoal e contratações.', 210, 405);

INSERT INTO Exemplares (Exemplar_ID, Estado, Loc_Fisica, ISBN) VALUES
(701, 'Novo', 'Estoque A - Prateleira 1', 1001),
(702, 'Novo', 'Estoque A - Prateleira 1', 1001),
(703, 'Usado', 'Estoque B - Prateleira 2', 1002),
(704, 'Novo', 'Estoque A - Prateleira 3', 1003),
(705, 'Disponível', 'Loja - Seção Finanças', 1004),
(706, 'Danificado', 'Estoque C - Reparo', 1005),
(707, 'Novo', 'Estoque A - Prateleira 1', 1006),
(708, 'Novo', 'Estoque A - Prateleira 1', 1006),
(709, 'Usado', 'Estoque B - Prateleira 2', 1007),
(710, 'Novo', 'Estoque A - Prateleira 3', 1008),
(711, 'Disponível', 'Loja - Seção Negócios', 1009),
(712, 'Disponível', 'Loja - Seção Saúde', 1010),
(713, 'Novo', 'Estoque A - Prateleira 1', 1011),
(714, 'Disponível', 'Loja - Seção Ficção', 1012),
(715, 'Novo', 'Estoque A - Prateleira 3', 1013),
(716, 'Usado', 'Estoque B - Prateleira 4', 1014),
(717, 'Disponível', 'Loja - Seção Saúde', 1015),
(718, 'Novo', 'Estoque A - Prateleira 1', 1016),
(719, 'Novo', 'Estoque A - Prateleira 1', 1016),
(720, 'Disponível', 'Loja - Seção Ficção', 1017),
(721, 'Novo', 'Estoque A - Prateleira 3', 1018),
(722, 'Novo', 'Estoque A - Prateleira 4', 1019),
(723, 'Disponível', 'Loja - Seção Autoajuda', 1020),
(724, 'Disponível', 'Loja - Seção Autoajuda', 1020),
(725, 'Emprestado', 'Biblioteca Interna', 1001),
(726, 'Novo', 'Estoque A - Prateleira 1', 1002),
(727, 'Usado', 'Estoque B - Prateleira 3', 1003),
(728, 'Disponível', 'Loja - Seção Finanças', 1004),
(729, 'Novo', 'Estoque A - Prateleira 5', 1005),
(730, 'Novo', 'Estoque A - Prateleira 1', 1006),
(731, 'Disponível', 'Loja - Seção Ficção', 1007),
(732, 'Danificado', 'Estoque C - Reparo', 1008),
(733, 'Novo', 'Estoque A - Prateleira 4', 1009),
(734, 'Novo', 'Estoque A - Prateleira 5', 1010),
(735, 'Usado', 'Estoque B - Prateleira 1', 1011),
(736, 'Disponível', 'Loja - Seção Ficção', 1012),
(737, 'Novo', 'Estoque A - Prateleira 3', 1013),
(738, 'Disponível', 'Loja - Seção Negócios', 1014),
(739, 'Novo', 'Estoque A - Prateleira 5', 1015),
(740, 'Novo', 'Estoque A - Prateleira 1', 1016);

INSERT INTO Palavras_Chave (PChave_ID, Descricao, ISBN) VALUES
(801, 'SQL', 1001),
(802, 'Banco de Dados', 1001),
(803, 'Alienígenas', 1002),
(804, 'Espaço', 1002),
(805, 'Revolução', 1003),
(806, 'História da França', 1003),
(807, 'Ações', 1004),
(808, 'Renda Variável', 1004),
(809, 'Ansiedade', 1005),
(810, 'Paz Interior', 1005),
(811, 'Programação', 1006),
(812, 'Desenvolvimento', 1006),
(813, 'Marte', 1007),
(814, 'Ray Bradbury', 1007),
(815, 'Guerra', 1008),
(816, 'Nazismo', 1008),
(817, 'Empreendedorismo', 1009),
(818, 'Administração', 1009),
(819, 'Dieta', 1010),
(820, 'Exercício', 1010),
(821, 'Protocolos', 1011),
(822, 'TCP/IP', 1011),
(823, 'Asimov', 1012),
(824, 'Viagem no Tempo', 1012),
(825, 'Brasil', 1013),
(826, 'Escravidão', 1013),
(827, 'SEO', 1014),
(828, 'Mídias Sociais', 1014),
(829, 'Flexibilidade', 1015),
(830, 'Postura', 1015),
(831, 'Machine Learning', 1016),
(832, 'Deep Learning', 1016),
(833, 'Arrakis', 1017),
(834, 'Especiaria', 1017),
(835, 'Hobsbawm', 1018),
(836, 'Século XIX', 1018),
(837, 'Balanço Patrimonial', 1019),
(838, 'DRE', 1019),
(839, 'Neurociência', 1020),
(840, 'Produtividade', 1020);

INSERT INTO _Escrito_por (fk_Livros_ISBN, fk_Autores_Autor_ID) VALUES
(1001, 201),
(1002, 202),
(1003, 203),
(1004, 204),
(1005, 205),
(1006, 201),
(1006, 206), /* Livro com 2 autores */
(1007, 207),
(1008, 208),
(1009, 209),
(1010, 210),
(1011, 211),
(1012, 212),
(1013, 203), /* Autor com 2 livros */
(1014, 213),
(1015, 214),
(1016, 211), /* Autor com 2 livros */
(1016, 215), /* Livro com 2 autores */
(1017, 216),
(1018, 217),
(1019, 204), /* Autor com 2 livros */
(1019, 218), /* Livro com 2 autores */
(1020, 219),
(1001, 220), /* Livro com 2 autores */
(1002, 219); /* Livro com 2 autores */


INSERT INTO _Pertence_a_ (fk_Livros_ISBN, fk_Areas_Conhecimento_Area_ID) VALUES
/* Livros com áreas secundárias */
(1001, 104), /* SQL para Iniciantes (Tec) também é de Negócios */
(1004, 101), /* Investindo na Bolsa (Finanças) também é de Tec (apps) */
(1005, 101), /* Meditação (Saúde) também é de Tec (apps) */
(1006, 104), /* Python Avançado (Tec) também é de Negócios */
(1009, 101), /* Gestão (Negócios) também é de Tec */
(1010, 102), /* Nutrição (Saúde) pode ter ficção (??) - apenas para popular */
(1011, 104), /* Redes (Tec) também é de Negócios */
(1014, 101), /* Mkt Digital (Negócios) também é de Tec */
(1016, 104), /* IA (Tec) também é de Negócios */
(1016, 105), /* IA (Tec) também é de Saúde (IA na medicina) */
(1019, 101), /* Contabilidade (Finanças) também é de Tec (software) */
(1020, 104), /* Hábito (Autoajuda) também é de Negócios (produtividade) */
/* Relações 1:1 para o resto */
(1002, 102),
(1003, 103),
(1007, 102),
(1008, 103),
(1012, 102),
(1013, 103),
(1015, 105),
(1017, 102),
(1018, 103);


INSERT INTO Pedidos (Pedido_ID, Data_Pedido, Valor_Total, Status_Pedido, Cliente_ID, Metodo_Pagamento) VALUES
(901, '2024-01-20', 149.80, 'Entregue', 301, 'Boleto'),
(902, '2024-02-10', 59.90, 'Entregue', 302, 'Cartão de Crédito'),
(903, '2024-03-05', 79.90, 'Entregue', 303, 'PIX'),
(904, '2024-04-15', 139.80, 'Entregue', 304, 'Cartão de Débito'),
(905, '2024-05-01', 49.90, 'Entregue', 305, 'PIX'),
(906, '2024-05-20', 110.00, 'Cancelado', 306, 'Cartão de Crédito'),
(907, '2024-06-10', 109.80, 'Entregue', 307, 'Boleto'),
(908, '2024-06-15', 129.90, 'Entregue', 308, 'PIX'),
(909, '2024-07-01', 75.00, 'Entregue', 309, 'Cartão de Crédito'),
(910, '2024-07-10', 65.50, 'Entregue', 310, 'Cartão de Débito'),
(911, '2024-07-20', 260.00, 'Entregue', 311, 'PIX'),
(912, '2024-08-01', 58.00, 'Entregue', 312, 'Boleto'),
(913, '2024-08-05', 72.00, 'Processando', 313, 'Cartão de Crédito'),
(914, '2024-08-10', 136.00, 'Entregue', 314, 'PIX'),
(915, '2024-08-15', 45.00, 'Entregue', 315, 'Cartão de Débito'),
(916, '2024-08-20', 299.80, 'Processando', 316, 'Boleto'),
(917, '2024-08-25', 89.90, 'Entregue', 317, 'PIX'),
(918, '2024-09-01', 85.00, 'Entregue', 318, 'Cartão de Crédito'),
(919, '2024-09-05', 124.00, 'Pendente', 319, 'PIX'),
(920, '2024-09-10', 55.00, 'Pendente', 320, 'Cartão de Débito'),
(921, '2024-09-11', 89.90, 'Pendente', 301, 'Boleto'),
(922, '2024-09-12', 119.80, 'Processando', 302, 'Cartão de Crédito'),
(923, '2024-09-13', 129.90, 'Pendente', 304, 'PIX'),
(924, '2024-09-14', 69.90, 'Pendente', 308, 'Cartão de Débito'),
(925, '2024-09-15', 49.90, 'Pendente', 315, 'PIX');


/* --- 4. Tabelas Dependentes (Nível 3) --- */

/* ATENÇÃO: Coluna SALARIO foi REMOVIDA desta tabela */
INSERT INTO Funcionarios (ID_Funcionario, Nome_Completo, CPF, Cargo, Email, Telefone, Endereco, Departamento_ID, Data_Admissao) VALUES
(601, 'Amanda Nunes', '111.111.111-11', 'Editor Chefe', 'amanda.n@email.com', 11999990001, 'Rua A, 1', 501, '2020-01-15'),
(602, 'Bruno Viana', '222.222.222-22', 'Editor Assistente', 'bruno.v@email.com', 11999990002, 'Rua B, 2', 501, '2021-03-10'),
(603, 'Carla Dias', '333.333.333-33', 'Revisor', 'carla.d@email.com', 11999990003, 'Rua C, 3', 501, '2021-05-20'),
(604, 'Daniel Moreira', '444.444.444-44', 'Estagiário Editorial', 'daniel.m@email.com', 11999990004, 'Rua D, 4', 501, '2023-02-01'),
(605, 'Elisa Fernandes', '555.555.555-55', 'Editora de Ficção', 'elisa.f@email.com', 21999990005, 'Rua E, 5', 502, '2019-11-05'),
(606, 'Fábio Lima', '666.666.666-66', 'Assistente de Ficção', 'fabio.l@email.com', 21999990006, 'Rua F, 6', 502, '2022-04-12'),
(607, 'Gabriela Pinto', '777.777.777-77', 'Revisora de Ficção', 'gabriela.p@email.com', 21999990007, 'Rua G, 7', 502, '2022-06-30'),
(608, 'Heitor Alves', '888.888.888-88', 'Estagiário de Ficção', 'heitor.a@email.com', 21999990008, 'Rua H, 8', 502, '2023-04-15'),
(609, 'Igor Bastos', '999.999.999-99', 'Gerente de Marketing', 'igor.b@email.com', 31999990009, 'Rua I, 9', 503, '2018-07-20'),
(610, 'Julia Queiroz', '000.000.000-00', 'Analista de Mkt Digital', 'julia.q@email.com', 31999990010, 'Rua J, 10', 503, '2021-08-18'),
(611, 'Karen Souza', '121.121.121-21', 'Assistente de Marketing', 'karen.s@email.com', 31999990011, 'Rua K, 11', 503, '2022-01-25'),
(612, 'Leandro Matos', '131.131.131-31', 'Designer Gráfico', 'leandro.m@email.com', 31999990012, 'Rua L, 12', 503, '2020-09-01'),
(613, 'Marcos Vinicius', '141.141.141-41', 'Diretor Financeiro (CFO)', 'marcos.v@email.com', 41999990013, 'Rua M, 13', 504, '2017-02-10'),
(614, 'Natália Oliveira', '151.151.151-51', 'Analista Financeiro', 'natalia.o@email.com', 41999990014, 'Rua N, 14', 504, '2020-05-05'),
(615, 'Otávio Pereira', '161.161.161-61', 'Assistente Financeiro', 'otavio.p@email.com', 41999990015, 'Rua O, 15', 504, '2022-10-10'),
(616, 'Paula Costa', '171.171.171-71', 'Estagiária Financeiro', 'paula.c@email.com', 41999990016, 'Rua P, 16', 504, '2023-07-01'),
(617, 'Quintino Ramos', '181.181.181-81', 'Diretor de RH', 'quintino.r@email.com', 51999990017, 'Rua Q, 17', 505, '2019-03-15'),
(618, 'Raquel Farias', '191.191.191-91', 'Analista de RH', 'raquel.f@email.com', 51999990018, 'Rua R, 18', 505, '2021-11-20'),
(619, 'Sérgio Tavares', '202.202.202-02', 'Assistente de RH', 'sergio.t@email.com', 51999990019, 'Rua S, 19', 505, '2022-09-01'),
(620, 'Tatiana Vasconcelos', '212.212.212-12', 'Estagiária de RH', 'tatiana.v@email.com', 51999990020, 'Rua T, 20', 505, '2023-08-10');

INSERT INTO Itens_Pedido (Item_Pedido_ID, Quantidade, Preco_Unitario_Venda, Pedido_ID, ISBN) VALUES
(10001, 1, 89.90, 901, 1001),
(10002, 1, 59.90, 901, 1002),
(10003, 1, 59.90, 902, 1002),
(10004, 1, 79.90, 903, 1003),
(10005, 2, 69.90, 904, 1004),
(10006, 1, 49.90, 905, 1005),
(10007, 1, 110.00, 906, 1006), /* Pedido Cancelado */
(10008, 2, 54.90, 907, 1007),
(10009, 1, 129.90, 908, 1008),
(10010, 1, 75.00, 909, 1009),
(10011, 1, 65.50, 910, 1010),
(10012, 2, 130.00, 911, 1011),
(10013, 1, 58.00, 912, 1012),
(10014, 1, 72.00, 913, 1013),
(10015, 2, 68.00, 914, 1014),
(10016, 1, 45.00, 915, 1015),
(10017, 2, 149.90, 916, 1016),
(10018, 1, 89.90, 917, 1017),
(10019, 1, 85.00, 918, 1018),
(10020, 2, 62.00, 919, 1019),
(10021, 1, 55.00, 920, 1020),
(10022, 1, 89.90, 921, 1017),
(10023, 2, 59.90, 922, 1002),
(10024, 1, 129.90, 923, 1008),
(10025, 1, 69.90, 924, 1004),
(10026, 1, 49.90, 925, 1005),
(10027, 1, 89.90, 901, 1001), /* Segundo item no pedido 901 */
(10028, 1, 110.00, 907, 1006), /* Segundo item no pedido 907 */
(10029, 1, 79.90, 911, 1003), /* Segundo item no pedido 911 */
(10030, 1, 68.00, 914, 1014), /* Segundo item no pedido 914 */
(10031, 1, 149.90, 916, 1016), /* Segundo item no pedido 916 */
(10032, 1, 55.00, 919, 1020), /* Segundo item no pedido 919 */
(10033, 1, 89.90, 922, 1001), /* Segundo item no pedido 922 */
(10034, 1, 65.50, 923, 1010), /* Segundo item no pedido 923 */
(10035, 1, 45.00, 925, 1015); /* Segundo item no pedido 925 */