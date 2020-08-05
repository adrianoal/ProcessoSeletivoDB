-- PROVA TEORICA:

Atividades

1. Com base no conceito de Foreign’s Keys selecione a alternativa correta

a. A Foreign’s Keys do banco de dados servem para garantir a integridade das tabelas
b. As Foreign Keys do banco de dados servem para garantir a integridade das tabelas e a 
performance do banco de dados.
c. As Foreign Keys do banco de dados servem para performance do banco de dados.
d. Todas as alternativas anteriores estão corretas

Resposta: d 
	Para criar uma Foreign Key ela precisa ser Primary Key em outra tabela, e quando se cria uma
	Primary Key, implicitamente é criado um índice para a tabela em questão, e o índice é um dos 
	recursos para se ter ganho e performance.
	
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
2. Analise as seguintes consultas.

i. SELECT V.ID_CLIENTE, V.ID_VENDA, V.VL_VENDA, C.NM_CLIENTE FROM
CLIENTE C JOIN VENDA V ON C.ID_CLIENTE = V.ID_CLIENTE
ii. SELECT V.ID_CLIENTE, V.ID_VENDA, V.VL_VENDA, C.NM_CLIENTE FROM
CLIENTE C, VENDA V
iii. SELECT V.ID_CLIENTE, V.ID_VENDA, V.VL_VENDA, C.NM_CLIENTE FROM
CLIENTE C, VENDA V WHERE C.ID_CLIENTE = V.ID_CLIENTE
iv. SELECT V.ID_CLIENTE, V.ID_VENDA, V.VL_VENDA, C.NM_CLIENTE FROM
CLIENTE C INNER JOIN VENDA V ON C.ID_CLIENTE = V.ID_CLIENTE	

Resposta: A
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
3. Com base na tabela abaixo, assinale qual dos INSERT está CORRETO.

CREATE TABLE CLIENTE(
ID_CLIENTE INT NOT NULL CONSTRAINT PK_CLIENTE PRIMARY KEY,
NM_CLIENTE VARCHAR(100),
DT_NASC DATETIME,
NM_SEXO VARCHAR(1)
);

Com base nesta analise pode-se concluir que:

a. i e iv estão corretas.
b. Somente i está correta.
c. ii e iii estão corretas.
d. Todas as alternativas estão corretas.
e. Todas as alternativas estão incorretas.
3. Com base na tabela abaixo, assinale qual dos INSERT está CORRETO.
a. INSERT INTO CLIENTE VALUES ('JOÃO DA SILVA','1991-06-01','MASCULINO');
b. INSERT INTO CLIENTE (NM_CLIENTE,DT_NASC,NM_SEXO) VALUES ('JOÃO DA
SILVA','1991-06-01','MASCULINO');
c. INSERT INTO CLIENTE VALUES(1,'JOÃO DA SILVA','1991-06-01'','M');
d. INSERT INTO CLIENTE VALUES('JOÃO DA SILVA','1991-06-01','M');
e. INSERT INTO CLIENTE (ID_CLIENTE,NM_CL


Resposta: e

 INSERT INTO CLIENTE (ID_CLIENTE,NM_CLIENTE,DT_NASC,NM_SEXO) 
				VALUES
					(1,'JOÃO DA SILVA','1991-06-01','M');


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
4. Com base na função abaixo, responda as seguintes perguntas

CREATE FUNCTION dbo.FN_FUNCTION (
@P_NM_PATH_FILE_NAME VARCHAR(255),
@P_NU_START_POSITION VARCHAR(50),
@P_NU_LENGHT INT = 0
) RETURNS VARCHAR(MAX)
AS
BEGIN
DECLARE
@A VARCHAR(255);
SELECT @A = SUBSTRING(@P_NM_PATH_FILE_NAME, @P_NU_START_POSITION,
@P_NU_LENGHT)
RETURN @A
END;


Respostas:

a. Qual o objetivo da função dbo.FN_FUNCTION ?

Essa função vai retornar o conteúdo do parâmetro informado, a partir das posições informadas. 


b. Passando os valores abaixo para a função, qual é seu retorno?

 Vai retornar a partir da posição 10, 4 caracteres, portanto: AYTY


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
5. Analisando o código abaixo, responda as seguintes perguntas

DECLARE @V1 INT;
DECLARE @V2 INT;
DECLARE @V3 INT;

SET @V1 = 1
SET @V2 = 10

WHILE @V1 < 10

 BEGIN
  SET @V1 = @V1 + 1
   PRINT @V1;
 END;
 IF @V1 = @V2
   SELECT @V3 + @V1 + 100
  ELSE
 SELECT @V3 + @V1 + 200
 
Resposta: Resultado final NULL


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
6. O script abaixo está gerando erro, identifique e explique qual o motivo do erro.


A falha ocorre porque está tentando converter o valor varchar 'PROVA' para um tipo inteiro
ao usar a função de conversão CAST.

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
7. Com base no script abaixo, responda qual o comando de inserção que gera erro quando executado.


b. Porque viola a constraint de Primary Key da TABELA1, uma vez que já tem um registro com o ID 3
INSERT INTO TABELA1 VALUES (3,1) 

e. Porque também está violando a constraint de Primary Key, uma vez que já tem um registro contendo o ID 2
INSERT INTO TABELA1 VALUES (2,3)


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
8. Assinale a opção que indica o número de linhas retornadas pela consulta SQL a seguir.

Resposta: d

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
9. Monte um script onde atualize de uma só vez a coluna CLIENTE_PRIORITARIO com um X os
5 clientes mais velhos da tabela abaixo. 
Lembre-se que seu script tem que ser genérico, ou seja se a tabela possuir mais linhas não será 
necessário adicionar condição.


USE MASTER 

DECLARE 
 @DATA_NASC DATE,
 @NM_CLIENTE VARCHAR(100),
 @CLIENTE_PRIORITARIO CHAR(1)
 SET @CLIENTE_PRIORITARIO = 'X'

DECLARE CUR_TESTE CURSOR FOR 

 SELECT TOP 5 MIN(DATA_NASC), NM_CLIENTE, CLIENTE_PRIORITARIO  FROM TABELA5 GROUP BY NM_CLIENTE, CLIENTE_PRIORITARIO

OPEN CUR_TESTE

FETCH NEXT FROM CUR_TESTE INTO @DATA_NASC, @NM_CLIENTE, @CLIENTE_PRIORITARIO

WHILE @@FETCH_STATUS = 0
 BEGIN
 UPDATE TABELA5
  SET CLIENTE_PRIORITARIO =@CLIENTE_PRIORITARIO
  WHERE DATA_NASC		 =@NM_CLIENTE
  AND   NM_CLIENTE		 =@CLIENTE_PRIORITARIO

  FETCH NEXT FROM CUR_TESTE INTO @DATA_NASC, @NM_CLIENTE, @CLIENTE_PRIORITARIO
  END

CLOSE CUR_TESTE

DEALLOCATE CUR_TESTE


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- PROVA PRATICA:

1. Gerar uma consulta para cada situação a baixo:

a. Trazer o STATUS da ULTIMA LIGAÇÃO por CLIENTE.
b. Trazer todos os CLIENTES que não tiveram LIGAÇÃO.
c. Trazer todos os CLIENTES que tem no mínimo 3 LIGAÇÕES.
d. Trazer a quantidade de PRODUTOS vendidos por CLIENTE.
e. Trazer o maior e menor VALOR do PRODUTO agrupado por REGISTRO da VENDA.



2. Crie uma view que traga todas as informações de LIGAÇÃO, TELEFONE e STATUS.


3. O arquivo de CLIENTE foi carregado no banco de dados de forma incorreta. Por conta disso, 
alguns registros de CPF estão inválidos. Desenvolva uma consulta que liste os registros de CPF que 
tenham tamanho maior ou menor do que 11 caracteres, ou que estejam vazios.


4. O responsável por gerar a estratégia de discagem no Cliente solicitou que fosse feita uma 
melhoria no banco de dados para classificar os TELEFONES em duas categorias: 
FIXO/CELULAR. 
O especialista da Ayty levantou os seguintes requisitos:

a. Criar na base uma TABELA de referência com os seguintes registros:
i. FIXO.
ii. CELULAR.
b. Criar uma Foreignkey na TELEFONE para referenciar a tabela criada no item A.
c. Criar script que atualize o novo campo na tabela TELEFONE. O cliente não passou a lógica para considerar se o telefone é FIXO ou CELULAR, desse modo pode ser aplicado a que você achar melhor.



5. Cliente informou que a consulta de Vendas não está trazendo dados. Deve ser analisado e corrigido para que a consulta volte a retornar os dados.
a. Executar o comando: sp_helptext QUESTAO_05 na base de dados


-- Adriano_lima_05


exec sp_helptext'QUESTAO_05';



		CREATE PROCEDURE [prova248].[QUESTAO_05]

		AS

		BEGIN



		SET NOCOUNT ON;



			DECLARE

				@V_RESULT		VARCHAR(5000),

				@V_NM_REPORT	VARCHAR(1);



			SELECT @V_RESULT = @V_RESULT + '

				SELECT

					M.NM_MAILING AS "Nome do Cliente",

					M.NU_REGISTRATION AS "CPF do Cliente",

					OI.NM_PRODUCT AS "Produto Vendido",

					OI.VL_PRODUCT AS "Valor Produto",

					COUNT(*) AS "Quantidade de Vendas"

				FROM MAILING	M	WITH(NOLOCK)

				JOIN "ORDER"	O	WITH(NOLOCK) ON M.ID_MAILING = O.ID_MAILING

				JOIN ORDER_ITEM	OI	WITH(NOLOCK) ON O.ID_ORDER = OI.ID_ORDER

				GROUP BY

					M.NM_MAILING,

					M.NU_REGISTRATION,

					OI.NM_PRODUCT,

					OI.VL_PRODUCT '



			EXEC (@V_RESULT)

		

		SET NOCOUNT OFF;



		END

	



b. Corrigir a consulta.


c. Explicar o motivo do erro.

-------------------------------------------------------------------------------------------------
6. Cliente informou que a consulta que retorna o STATUS do CLIENTE está duplicando registros.
a. Executar o comando: sp_helptext QUESTAO_06 na base de dados

	exec sp_helptext QUESTAO_06;

b. Corrigir a consulta.

	exec QUESTAO_06;

c. Explicar o motivo do erro.



exec sp_helptext QUESTAO_06;
-------------------------------------------------------------------------------------------------
7. Criar uma função que retorne a IDADE do cliente com base na data de ANIVERSARIO.

a. Criar script da função.
b. Montar consulta retornando o NOME do CLIENTE, data de ANIVERSARIO e IDADE. 
OBS: Usar a função.



-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
8. Deve ser desenvolvido uma procedure que traga as seguintes informações:
a. Conceito:
i. Trazer todas as LIGAÇÕES para os telefones que estão classificados como Celular (Logica da questão 4)
b. Parâmetros:
i. Data INICIO e FIM filtrando DATA da LIGAÇÃO;
c. Trazer os seguintes campos:
i. Nome Cliente;
ii. CPF Cliente;
iii. Status;
iv. DDD;
v. Telefone;



-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
9. Uma das consultas do cliente traz a quantidade de LIGAÇÕES. Ao utilizar o filtro de DATA o 
relatório demora muito para gerar a consulta. O especialista da Ayty sugeriu criar um índice na 
tabela de LIGAÇÕES com o campo utilizado no filtro. Criar o script do índice.

RESOLUCAO:
	CREATE INDEX "IX_LIGACAO_DATA" ON PROVA248.CALL(DT_START);


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
10. Deve ser desenvolvida uma procedure que traga as seguintes informações:
a. Conceito:
i. Trazer todos os CLIENTES, mesmo os que não possuem VENDAS.
ii. O Filtro de CPF não é obrigatório, se não for passado nada no parâmetro não deve ser pesquisado por CPF vazio.
b. Parâmetros:
i. Filtro de CPF.
c. Trazer os seguintes campos:
i. Nome Cliente.
ii. CPF Cliente (formato: 000.XXX.XXX-00, mostrar somente os 4 primeiros dígitos e os 2 últimos).
iii. Produto.
iv. Houve venda? (Deve trazer preenchida como SIM quando o cliente tiver venda e NÃO quando não tiver).
v. Valor Produto (formato: R$ 00,00).
vi. Status da venda.
vii. Data da venda (formato: DD/MM/AA).
viii. Hora última Ligação (formato: HH:MM:SS).
d. Regras:
i. Quando um CLIENTE não tiver STATUS deve aparecer “Erro de tabulação”. Deve ser utilizado tabela temporária para ajuste dos status.
ii. É permitido passar uma lista de CPFs como filtro. Utilizar vírgula (",") como separador. Ex: 12345678960,12345670;"























