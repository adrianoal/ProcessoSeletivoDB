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















