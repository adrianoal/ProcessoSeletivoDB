-- PROVA PRATICA:
-- REPLICANDO PROVA PRATICA APLICADA PELA EMPRESA CODE7


--SCHEMA HR:
1. Gerar uma consulta para cada situação a baixo:


A.Trazer a DATA da ULTIMA CONTRATACAO por DEPARTAMENTO:
-- Cardinalidade N:N

SELECT MAX(E.HIRE_DATE)AS ULTIMA_CONTRATACAO, 
       D.DEPARTMENT_NAME AS DEPARTAMENTO
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

B.Trazer todos os DEPARTAMENTOS que não são COMMISIONADOS:

SELECT NVL(E.COMMISSION_PCT,0)AS COMMISAL_ZERO, 
           D.DEPARTMENT_NAME --,E.*, D.*
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
WHERE NVL(E.COMMISSION_PCT,0) = 0 
GROUP BY E.COMMISSION_PCT, D.DEPARTMENT_NAME;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

C.Trazer todos os FUNCIONARIOS que tiveram no mínimo 2 PROMOCAO.

SELECT DISTINCT(E.FIRST_NAME) AS NOME,
       COUNT(J.EMPLOYEE_ID)AS PROMOCOES     
FROM JOB_HISTORY J
INNER JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
GROUP BY E.FIRST_NAME, J.EMPLOYEE_ID 
HAVING COUNT(J.EMPLOYEE_ID) >= 2;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

D.Trazer a quantidade de FUNCIONARIOS demitidos por DEPARTAMENTO.

SELECT COUNT(*) AS FIRED,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE DEMISSAL_DATE IS NOT NULL
GROUP BY D.DEPARTMENT_NAME;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

E.Trazer o maior e menor SALARIO do funcionário agrupado por DEPARTAMENTO de SALES

SELECT MIN(E.SALARY)AS MENOR_SALARIO,
       MAX(E.SALARY)AS MAIOR_SALARIO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE UPPER(D.DEPARTMENT_NAME) = 'SALES'
GROUP BY D.DEPARTMENT_NAME;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

2.Crie um view que traga todas as informações de EMPREGADO, DEPARTAMENTO e GERENTE.


--SELECT * FROM GERENTE_EMPREGADO_DEPTO;
CREATE OR REPLACE VIEW GERENTE_EMPREGADO_DEPTO AS
SELECT E.FIRST_NAME||' '||E.LAST_NAME "NOME FUNCIONARIO", 
       D.DEPARTMENT_NAME              "NOME DEPARTMENTO",
       G.FIRST_NAME||' '||G.LAST_NAME "NOME GENTE"     
FROM EMPLOYEES E
INNER JOIN EMPLOYEES G
ON (E.MANAGER_ID = G.MANAGER_ID)
INNER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

3. O arquivo de EMPREGADOS foi carregado no banco de dados de forma incorreta.
   Desenvolva uma consulta que liste os registros de PHONE_NUMBER que tenham tamanho maior ou 
   menor do que 11 caracteres, ou que estejam vazios.


SELECT  LENGTH(E.PHONE_NUMBER) "QTDE DIGITOS", 
        E.PHONE_NUMBER
FROM EMPLOYEES E
GROUP BY E.PHONE_NUMBER
HAVING LENGTH(E.PHONE_NUMBER) <> 12

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

4.O Responsável pela adminstração do sistema, solicitou que fosse feito uma melhoria no Banco de 
Dados, na tabela EMPREGADOS, para classificar os TELEFONES em duas categorias: 

O especialista da Ayty levantou os seguintes requisitos:


a. Criar na base uma TABELA de referência com os seguintes registros:
i.  FIXO.
ii. CELULAR.
b. Criar uma Foreignkey na TELEFONE para referenciar a tabela criada no item A.
c. Criar script que atualize o novo campo na tabela TELEFONE. 
   O cliente não passou a lógica para considerar se o telefone é FIXO ou CELULAR, 
   desse modo pode ser aplicado a que você achar melhor.

SELECT * FROM EMPLOYEES; 
SELECT * FROM DEPARTMENTS;
SELECT * FROM PHONE_TYPE;


--MODELAGEM DE DADOS:
-- CARDINALIDADE:
/*
EMPLOYEES           PHONE_TYPE               
PHONE_NUMBER 1:N      1:1 
*/

-- CRIACAO DE TABELA: 
/*
CREATE TABLE PHONE_TYPE(PHONE_ID INT NOT NULL PRIMARY KEY, --1 - CELULAR // 2 - COMERCIAL // 3 - RESIDENCIAL
                        NOME VARCHAR2(100)NOT NULL); 
*/

/*
INSERT INTO PHONE_TYPE VALUES (1,'CELULAR');
INSERT INTO PHONE_TYPE VALUES (2,'COMERCIAL');
INSERT INTO PHONE_TYPE VALUES (3,'RESIDENCIAL');
COMMIT;
*/

/*
--ALTER TABLE EMPLOYEES ADD(PHONE_ID INT);
ALTER TABLE EMPLOYEES
ADD CONSTRAINTS EMPLOYEES_PHONE_TYPE_FK FOREIGN KEY (PHONE_ID)
REFERENCES PHONE_TYPE (PHONE_ID);
*/



BEGIN

    FOR CUR1 IN (SELECT LENGTH(PHONE_NUMBER)"QTDE DIGITOS",
                               PHONE_NUMBER
                    FROM EMPLOYEES
                    GROUP BY PHONE_NUMBER
                    HAVING LENGTH(PHONE_NUMBER) = 12)LOOP
    
        UPDATE EMPLOYEES SET PHONE_ID = 1 
        WHERE  PHONE_NUMBER = CUR1.PHONE_NUMBER;
     --COMMIT;      
    END LOOP;

    FOR CUR2 IN (SELECT LENGTH(PHONE_NUMBER)"QTDE DIGITOS",
                               PHONE_NUMBER
                    FROM EMPLOYEES
                    GROUP BY PHONE_NUMBER
                    HAVING LENGTH(PHONE_NUMBER) <> 12)LOOP
                                      
        
        UPDATE EMPLOYEES SET PHONE_ID = 2 
        WHERE  PHONE_NUMBER = CUR2.PHONE_NUMBER;
    END LOOP;    
    --COMMIT;
  
END;       

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

6. Cliente informou que a consulta que retorna o STATUS do CLIENTE está duplicando registros.


Criar uma situação teste, e aplicar a correção...
Exemplo:

SELECT LDN2.ROWID, 
       LDN2.*
FROM DEF_4353_4351_ATUALIZA_ADRIANO LDN2
WHERE 1 = 1
AND LDN2.ROWID < (SELECT MAX (LDN3.ROWID)
                  FROM DEF_4353_4351_ATUALIZA_ADRIANO LDN3
                  WHERE 1 = 1
                  AND LDN2.MAIN_ITEM_ID_SUB = LDN3.MAIN_ITEM_ID_SUB
                  AND LDN2.SUBSCRIBER_NO = LDN3.SUBSCRIBER_NO
                  )

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

7. Criar uma função que retorne a IDADE do cliente com base na data de ANIVERSARIO.

a. Criar script da função.

CREATE OR REPLACE FUNCTION CALCULA_IDADE(P_DATA_ANIVERSARIO VARCHAR2)RETURN NUMBER 
   IS 
        V_IDADE NUMBER(11);
                
   BEGIN 
        
        SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, P_DATA_ANIVERSARIO))/12 
        INTO V_IDADE
        FROM DUAL;
      RETURN V_IDADE;
 
    END;

-- EXECUTANDO A FUNCAO:    
SELECT CALCULA_IDADE('07/03/1985') "IDADE" FROM DUAL;

b. Montar consulta retornando o NOME do CLIENTE, data de ANIVERSARIO e IDADE. 
OBS: Usar a função.


SELECT 'ADRIANO' AS NOME,
       '07/03/1985' AS DATA_ANIVERSARIO,
       CALCULA_IDADE('07/03/1985') AS IDADE
FROM DUAL;      


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:
-- Resolução do problema feito com Schema HR, conforme abaixo:

8. Deve ser desenvolvido uma procedure que traga as seguintes informações:
a. Conceito:
i. Trazer todas as LIGAÇÕES para os telefones que estão classificados como Celular 
(Logica da questão 4)

b. Parâmetros:
i. Data INICIO e FIM filtrando DATA da LIGAÇÃO;

c. Trazer os seguintes campos:
i. Nome Cliente;
ii. CPF Cliente;
iii. Status;
iv. DDD;
v. Telefone;


SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PROC_CLIENTE(P_DT_INICIAL VARCHAR2,
                                         P_DT_FINAL VARCHAR2)
AS
BEGIN
    DECLARE
      
     CURSOR CUR_CLI IS
     
        SELECT P.NOME, E.FIRST_NAME, E.LAST_NAME, E.SALARY, TO_CHAR(E.HIRE_DATE,'DD/MM/YYYY')"HIRE_DATE"
        FROM EMPLOYEES E INNER JOIN PHONE_TYPE P
        ON (E.PHONE_ID = P.PHONE_ID)
        WHERE P.PHONE_ID = 1
        AND E.HIRE_DATE BETWEEN P_DT_INICIAL AND P_DT_FINAL;
    
     V_CUR_CLI CUR_CLI%ROWTYPE;
     
    BEGIN
        
        OPEN CUR_CLI;
            LOOP 
                FETCH CUR_CLI INTO V_CUR_CLI;
                EXIT WHEN CUR_CLI%NOTFOUND;
        
            DBMS_OUTPUT.PUT_LINE(V_CUR_CLI.FIRST_NAME||' '||
                                 V_CUR_CLI.LAST_NAME||' '||
                                 V_CUR_CLI.SALARY||' '||
                                 V_CUR_CLI.HIRE_DATE||' '||
                                 V_CUR_CLI.NOME);    
            END LOOP;
        CLOSE CUR_CLI;
    END;
END PROC_CLIENTE;

-- Execucao da PROC:
EXEC PROC_CLIENTE('17/06/2003','15/11/2006');
BEGIN
    PROC_CLIENTE('17/06/2003','15/11/2006');
END;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

9. Uma das consultas do cliente traz a quantidade de LIGAÇÕES. Ao utilizar o filtro de DATA o 
relatório demora muito para gerar a consulta. O especialista da Ayty sugeriu criar um índice na 
tabela de LIGAÇÕES com o campo utilizado no filtro. Criar o script do índice.

RESOLUCAO:
	CREATE INDEX "IX_LIGACAO_DATA" ON PROVA248.CALL(DT_START); -- Índice BTREE... (SQL Server)



--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
10. Deve ser desenvolvida uma procedure que traga as seguintes informações:

a. Conceito:
i. Trazer todos os CLIENTES, mesmo os que não possuem VENDAS.

ii. O Filtro de CPF não é obrigatório, se não for passado nada no parâmetro não deve ser 
    pesquisado por CPF vazio.
	
b. Parâmetros:
i. Filtro de CPF.

c. Trazer os seguintes campos:
i. Nome Cliente.
ii. CPF Cliente (formato: 000.XXX.XXX-00, mostrar somente os 4 primeiros dígitos e os 2 últimos).
iii. Produto.
iv. Houve venda? (Deve trazer preenchida como SIM quando o cliente tiver venda e NÃO quando não 
	tiver).

v. Valor Produto (formato: R$ 00,00).
vi. Status da venda.
vii. Data da venda (formato: DD/MM/AA).
viii. Hora última Ligação (formato: HH:MM:SS).

d. Regras:
i. Quando um CLIENTE não tiver STATUS deve aparecer “Erro de tabulação”. 
   Deve ser utilizado tabela temporária para ajuste dos status.
   
ii. É permitido passar uma lista de CPFs como filtro. 
    Utilizar vírgula (",") como separador. Ex: 12345678960,12345670;"


Resolucao Parcial:
------------------	

EXEC PROC_STATUS_FUNC
EXEC PROC_STATUS_FUNC('515.123.4567');





