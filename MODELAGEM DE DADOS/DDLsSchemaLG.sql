SELECT * FROM LOGRADOURO;

/*
INSERT INTO LOGRADOURO (ENDERECO,CIDADE,BAIRRO,NUMERO,COMPLEMENTO,CEP)
        VALUES ('Rua Brasiília Roschel Gottzfritz','São Paulo','Terceira Divisão de Interlagos',146,'Casa','04809-090');       
INSERT INTO LOGRADOURO (ENDERECO,CIDADE,BAIRRO,NUMERO,COMPLEMENTO,CEP)
        VALUES ('Rua Paulo Eiro','São Paulo','Santo Amaro',417,'Apartamento','04805-000');
*/
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM TIPO_FONE;

/*
INSERT INTO TIPO_FONE (TIPO) VALUES ('Celular');
INSERT INTO TIPO_FONE (TIPO) VALUES ('Residêncial');
INSERT INTO TIPO_FONE (TIPO) VALUES ('Comercial');
COMMIT;
*/

------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM FONE;

/*
INSERT INTO FONE (NUMERO,TIPO_FONE_TPFO_ID) VALUES ('(011) 96512-6457','1');
INSERT INTO FONE (NUMERO,TIPO_FONE_TPFO_ID) VALUES ('(011) 98648-0151','1');
COMMIT;
*/
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM FUNC;

/*
INSERT INTO FUNC (NOME,CPF,DT_NASCIMENTO,LOGRADOURO_LOG_ID) VALUES ('Adriano Lima','32174739810','07/03/1985',1);
INSERT INTO FUNC (NOME,CPF,DT_NASCIMENTO,LOGRADOURO_LOG_ID) VALUES ('Paula Niedzelski','32174739811','26/04/1994',2);
COMMIT;
*/

------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ASTRO;

/*
INSERT INTO ASTRO (NOME,NOME_AUTOR,DT_NASCIMENTO) VALUES ('Meryl Streep','Mary Louise Streep','22/06/1978');
INSERT INTO ASTRO (NOME,NOME_AUTOR,DT_NASCIMENTO) VALUES ('Morgan Freeman','Morgan Porterfield Freeman Jr.','01/06/1937');
COMMIT;
*/

------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM  FORMATO;

/*
INSERT INTO FORMATO (TIPO,DESC_FORMATO) VALUES ('DVD','Digital Versatile Disc');
INSERT INTO FORMATO (TIPO,DESC_FORMATO) VALUES ('BD','Blu-ray Disc');
COMMIT;
*/
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM GENERO;

/*
INSERT INTO GENERO (DESC_GENERO) VALUES ('comédia');
INSERT INTO GENERO (DESC_GENERO) VALUES ('suspense');
INSERT INTO GENERO (DESC_GENERO) VALUES ('terror');
COMMIT;
*/
ROLLBACK;
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ESTOQUE;


-- SET DEFINE OFF;
-- SET DEFINE ON;
/*
INSERT INTO ESTOQUE (TITULO,AUTOR,DT_CADASTRO,PRECO,QTDE,ULTIMA_ATUALIZACAO,ACAO,ASTRO_AST_ID,FORMATO_FORM_ID,GENERO_GEN_ID) 
    VALUES ('Hard Rain',' Morgan Freeman','18/08/2020',15.00,20,123123,'Insert',1,1,1);

INSERT INTO ESTOQUE (TITULO,AUTOR,DT_CADASTRO,PRECO,QTDE,ULTIMA_ATUALIZACAO,ACAO,ASTRO_AST_ID,FORMATO_FORM_ID,GENERO_GEN_ID) 
    VALUES ('Hard Rain',' Morgan Freeman','18/08/2020',15.00,20,123123,'Insert',1,2,1);
COMMIT;
*/    
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ENTREGA;

/*
INSERT INTO ENTREGA (PRAZO) VALUES ('lancamento 24h');
INSERT INTO ENTREGA (PRAZO) VALUES ('especial 48h');
COMMIT;
*/
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM CLIENTE;
/*
INSERT INTO CLIENTE (NOME,CPF,DT_NASCIMENTO,EMAIL,LOGRADOURO_LOG_ID) VALUES ('Maria Lima','111.222.333/10','05/01/1940','maria@maria.com.br',3);
INSERT INTO CLIENTE (NOME,CPF,DT_NASCIMENTO,EMAIL,LOGRADOURO_LOG_ID) VALUES ('Lucas','111.222.444/12','05/12/1980','lucas@lucas.com.br',4);commit;
*/


SELECT * FROM VIDEO_CLUBE;

/*
INSERT INTO VIDEO_CLUBE (FIRST_NAME,LAST_NAME,DATA_CADASTRO,ID_USUARIO,CREDITO,DT_CREDITO) VALUES ('Maria','Lima',sysdate,1,50,SYSDATE);
INSERT INTO VIDEO_CLUBE (FIRST_NAME,LAST_NAME,DATA_CADASTRO,ID_USUARIO,CREDITO,DT_CREDITO) VALUES ('Lucas','sem sobrenome',sysdate,1,50,SYSDATE);
COMMIT;
*/



------------------------------------------------------------------------------------------------------------------------------------------------
--ALTER TABLE ESTOQUE ADD UNIQUE (EST_COD);
SELECT * FROM LOCACAO ORDER BY 1 DESC;


/*
INSERT INTO LOCACAO (DT_LOCACAO,DT_VENC,COD_PRODUTO,QUANTIDADE,CLIENTE_CLI_ID,FUNC_FUNC_ID,PRECO) 
            VALUES (SYSDATE,SYSDATE+2,5,1,1,1,15.00);COMMIT;
            
INSERT INTO LOCACAO (DT_LOCACAO,DT_VENC,COD_PRODUTO,QUANTIDADE,CLIENTE_CLI_ID,FUNC_FUNC_ID) 
            VALUES (SYSDATE,SYSDATE+2,3,1,1,1);COMMIT;

*/


------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM DEVOLUCAO;

/*
INSERT INTO DEVOLUCAO (LOC_ID,CLIENTE_CLI_ID,FUNC_FUNC_ID,DATA_DEVOLUCAO,COD_PRODUTO,QUANTIDADE,LOC_LOC_ID) 
VALUES (6,1,1,SYSDATE,5,1,5);
*/

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
                                            -- CONCLUÍDO O PROJETO DA LG - LOCACO DE VIDEO --

-- Efetuado a análise de dados - modelo Lógico, Conceitual Projeto e modelo Físico.
-- Aplicado as regras de normalização de dados.
-- E criado os processos do sistema, atraves de objetos de banco de dados Oracle - TRIGGERS
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------                                    























