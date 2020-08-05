--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº1
-------------
CREATE TABLE CLIENTE (CLIENTE_ID INT NOT NULL PRIMARY KEY,
                      NOME_CLIENTE VARCHAR2(50) NOT NULL,
                      ENDERECO VARCHAR2(50) NOT NULL,
                      NRO VARCHAR2(10) NOT NULL,
                      BAIRRO VARCHAR2(20) NOT NULL,
                      CEP VARCHAR2(8),
                      CPF VARCHAR2(15),                    
                      COD_PAGTO CHAR(1) CONSTRAINT CK_COND CHECK (COD_PAGTO IN ('T','F')),-- (PAGO: TRUE)/(ABERTO: FALSE) 
                      DATA_CADASTRO DATE NOT NULL
                      );

CREATE TABLE LOCACAO(ID_LOCACAO INT NOT NULL PRIMARY KEY,
                     DATA_HORA DATE NOT NULL,
                     DATA_DEVOLUCAO DATE NOT NULL,
                     MATRICULA_CLI INT NOT NULL,
                     CONSTRAINT FK_CLI FOREIGN KEY (MATRICULA_CLI) REFERENCES CLIENTE (CLIENTE_ID)
                     );
                                          
CREATE TABLE PRODUTO(ID_PRODUTO INT NOT NULL PRIMARY KEY,
                     MIDIA VARCHAR2(50) NOT NULL,
                     TITULO VARCHAR2(50) NOT NULL,
                     AUTOR VARCHAR2(50) NOT NULL,
                     CATEGORIA VARCHAR2(50) NOT NULL
                    );                        

CREATE TABLE LOCACAO_PRODUTO(ID_LOCACAO INT,
                             ID_PRODUTO INT,
                             CONSTRAINT FK_LOC FOREIGN KEY (ID_LOCACAO) REFERENCES LOCACAO (ID_LOCACAO),
                             CONSTRAINT FK_PRO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
                             );                      				  


--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº2
-------------
SELECT DISTINCT(C.NOME_CLIENTE), 
       COUNT(L.MATRICULA_CLI)AS QTDE, 
       L.DATA_HORA AS PRIM_LOCACAO, 
       L.DATA_DEVOLUCAO AS ULT_LOCACAO -- 16/07/2020
FROM CLIENTE C
INNER JOIN LOCACAO L
ON C.CLIENTE_ID = L.MATRICULA_CLI
INNER JOIN LOCACAO_PRODUTO LP
ON L.ID_LOCACAO = LP.ID_LOCACAO
INNER JOIN PRODUTO P
ON P.ID_PRODUTO = P.ID_PRODUTO
WHERE L.DATA_HORA IN (SELECT MIN(LL.DATA_HORA) FROM LOCACAO LL WHERE LL.DATA_HORA = L.DATA_HORA)
AND L.ID_LOCACAO IN (SELECT COUNT(*) FROM LOCACAO L1 WHERE L1.ID_LOCACAO = L.ID_LOCACAO)
AND REGEXP_LIKE (P.CATEGORIA,'COMEDIA') -- SUSPENSE
AND P.CATEGORIA NOT IN ('SUSPENSE')
GROUP BY C.NOME_CLIENTE, L.MATRICULA_CLI, L.DATA_HORA, L.DATA_DEVOLUCAO;
--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº3
-------------
SELECT C.NOME_CLIENTE, 
       P.TITULO,
       L.DATA_VENCIMENTO - L.DATA_PAGAMENTO AS DIAS_ATRASO
FROM CLIENTE C
INNER JOIN LOCACAO L
ON C.CLIENTE_ID = L.MATRICULA_CLI
INNER JOIN PRODUTO P
ON P.ID_PRODUTO = L.ID_LOCACAO
WHERE L.DATA_PAGAMENTO > L.DATA_VENCIMENTO
AND C.CLIENTE_ID NOT IN (SELECT LL.MATRICULA_CLI FROM LOCACAO LL WHERE LL.DATA_PAGAMENTO <> LL.DATA_VENCIMENTO AND LL.MATRICULA_CLI = C.CLIENTE_ID); 

--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº4
-------------
SELECT * 
FROM FUNCIONARIOS F
INNER JOIN DEPARTAMENTO D
ON F.COD_FUNC = D.ID_REF

--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº5
-------------

 Descreva a funcionalidade das funções abaixo:
 
 SUM() --> Retorna a soma de todos os valores ou somente os valores DISTINCT na expressão.
 AVG() --> Retorna a média dos valores em um grupo. Valores nulos são ignorados
 MIN() --> Retorna o valor mínimo na expressão.
 MAX() --> Retorna o valor máximo na expressão.
 DECODE() --> Substituir um valor específico por outro específio ou por um valor padrão
 ROUND()  --> Funcao Randomica, arredonda para mais ou para menos
 NVL()	  --> Semelhante ao if, se não tiver nada exibirá o campo ao colocar 0 na função
 
--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº6
------------- 

 -- FULL OUTER JOIN:
select PJ.CD_CNPJ, PJ.DS_RAZAO_SOCIAL, PEDIDOS.NR_PEDIDO, PEDIDOS.CD_CNPJ, PEDIDOS.DT_ORDEM_COMPRA
 from pessoa_juridica pj
  full outer join pedidos 
  ON PJ.CD_CNPJ = PEDIDOS.CD_CNPJ;
 
 -- DATA ATUAL DO SERVIDOR NO FORMATO DD/MM/YYYY:
 SELECT TRUNC(SYSDATE) FROM DUAL;
 
 
 GROUP BY --> Utilizado para agrupar um dado quando se usa ulgum tipo de função.
 HAVING -->  Filtrar o retorno do agrupamento. 
 UNION --> Junção entre tabelas, remove registros duplicados.
 UNION ALL --> Junção entre tableas, porém, não remove linhas duplicadas.
 
--------------------------------------------------------------------------------------------------
RESOLUÇÃO Nº7  S/R
-------------  

RESOLUÇÃO Nº8  S/R
-------------

RESOLUÇÃO Nº9  S/R 
-------------










