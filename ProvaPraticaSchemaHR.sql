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




























