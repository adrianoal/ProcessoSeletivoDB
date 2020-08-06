-- PROVA PRATICA:
-- REPLICANDO PROVA PRATICA APLICADA PELA EMPRESA CODE7


--SCHEMA HR:
--1.Trazer a DATA da ULTIMA CONTRATACAO por DEPARTAMENTO:
-- Cardinalidade N:N

SELECT MAX(E.HIRE_DATE)AS ULTIMA_CONTRATACAO, 
       D.DEPARTMENT_NAME AS DEPARTAMENTO
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

2.Trazer todos os DEPARTAMENTOS que não são COMMISIONADO:

SELECT NVL(E.COMMISSION_PCT,0)AS COMMISAL_ZERO, 
           D.DEPARTMENT_NAME --,E.*, D.*
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
WHERE NVL(E.COMMISSION_PCT,0) = 0 
GROUP BY E.COMMISSION_PCT, D.DEPARTMENT_NAME;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--SCHEMA HR:

3.Trazer todos os FUNCIONARIOS que tiveram no mínimo 2 PROMOCAO.

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





















