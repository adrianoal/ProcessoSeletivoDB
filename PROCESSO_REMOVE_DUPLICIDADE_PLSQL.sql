--CREATE TABLE CLIENTE_HIST AS(SELECT * FROM CLIENTES);

--SELECT * FROM CLIENTES; 
--SELECT COUNT(*) FROM CLIENTES;

--SELECT * FROM CLIENTE_HIST; 
--SELECT COUNT(*) FROM CLIENTE_HIST;
--SET SERVEROUTPUT ON;

-- CRIANDO UM CENARIO PARA TRATAR REGISTROS DUPLICADOS - TABELAS CLIENTES/CLIENTE_HIST
--SELECT * FROM CLIENTES; 

-- PROCESSO PARA INSERIR DUPLICIDADE
DECLARE 
    V_COUNT NUMBER;
    
    CURSOR CLIENTE IS
    
    SELECT * FROM CLIENTES;
    
    C_CLIENTE CLIENTES%ROWTYPE;

BEGIN
    V_COUNT := 0;
    
    OPEN CLIENTE;
        LOOP 
        FETCH CLIENTE INTO C_CLIENTE;
        EXIT WHEN CLIENTE%NOTFOUND;
        INSERT INTO CLIENTE_HIST 
                VALUES 
                    (C_CLIENTE.COD_EMPRESA,
                     C_CLIENTE.ID_CLIENTE,
                     C_CLIENTE.RAZAO_CLIENTE,
                     C_CLIENTE.FANTASIA,
                     C_CLIENTE.ENDERECO,
                     C_CLIENTE.NRO,
                     C_CLIENTE.BAIRRO,
                     C_CLIENTE.COD_CIDADE,
                     C_CLIENTE.CEP,
                     C_CLIENTE.CNPJ_CPF,
                     C_CLIENTE.TIPO_CLIENTE,
                     C_CLIENTE.DATA_CADASTRO,
                     C_CLIENTE.COD_PAGTO);
        
        V_COUNT := V_COUNT +1;
       
        END LOOP;
    COMMIT;
        DBMS_OUTPUT.PUT_LINE(V_COUNT);
    CLOSE CLIENTE;
    
    
END;
--------------------------------------------------------------------
SELECT COUNT(C.COD_EMPRESA)AS COD_EMPRESA, C.ID_CLIENTE
FROM CLIENTE_HIST C
WHERE COD_EMPRESA = 1 
GROUP BY C.ID_CLIENTE
HAVING COUNT (COD_EMPRESA) >1;


--------------------------------------------------------------------
SELECT * FROM CLIENTES;
SELECT * FROM CLIENTE_HIST WHERE COD_EMPRESA = 1 AND ID_CLIENTE IN (1);
SELECT COUNT (*) FROM CLIENTE_HIST; --WHERE COD_EMPRESA = 1 AND ID_CLIENTE IN (1);
/
-- PROCESSO PARA REMOVER DUPLICIDADE --
--SELECT * FROM CLIENTES;
--SELECT * FROM CLIENTE_HIST;

SELECT * FROM CLIENTE_HIST;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE

BEGIN
	DELETE FROM CLIENTE_HIST HH
			WHERE EXISTS (SELECT MAX(H.ROWID), H.COD_EMPRESA, H.ID_CLIENTE 
						  FROM CLIENTE_HIST H
						  WHERE H.ID_CLIENTE = HH.ID_CLIENTE
						  GROUP BY H.COD_EMPRESA, H.ID_CLIENTE
						  HAVING COUNT (*)> 1
						  AND HH.ROWID <> MAX(H.ROWID)
						  );
					  
END;
             
              
         

--ROLLBACK
------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table clientes 
(cod int,
 nome varchar(50)
 )
 
 insert into clientes values ('1','Andre');
 insert into clientes values ('1','Andre');
 insert into clientes values ('1','Andre');
 insert into clientes values ('2','Pedro');
 insert into clientes values ('2','Pedro');
 insert into clientes values ('3','Mary');
    
segue exemplo de delete,

verificando os registros através com uma subquery, onde com as restrições do where e tambem do having



delete  from clientes b
 
 where exists(
 select max(a.rowid),a.cod,a.nome from clientes a
 where a.cod=b.cod 
 group by a.cod,a.nome having count(*)>1 and b.rowid<>max(a.rowid))




------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MAX(H.ROWID)AS SEQUENCIA, H.COD_EMPRESA, H.ID_CLIENTE FROM CLIENTE_HIST H GROUP BY H.COD_EMPRESA, H.ID_CLIENTE;
DECLARE 
select * from cliente_hist 
BEGIN 
    
    BEGIN 
        
        ALTER TABLE CLIENTE_HIST ADD (DEFEITO VARCHAR2(20)) DEFAULT ('DEFEITO7575');
    END;



END;
--ALTER TABLE CLIENTE_HIST DROP COLUMN DEFEITO; 
ALTER TABLE CLIENTE_HIST ADD DEFEITO INTEGER DEFAULT 757575;

EXECUTE IMMEDIATE 'ALTER TABLE CLIENTES ADD (TESTE VARCHAR2(20)) DEFAULT ('DEF_2525');

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
								-- ADD CAMPO NA TEBELA - BLOCO ANONIMO --

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM CLIENTES;
SELECT * FROM CLIENTE_HIST;


SET SERVEROUTPUT ON;

DECLARE 
    COL_COUNT INTEGER;
    DEF_COUNT VARCHAR2(20);

BEGIN

    SELECT COUNT(*) 
    INTO COL_COUNT
    FROM USER_TAB_COLUMNS
    WHERE TABLE_NAME = 'CLIENTE_HIST'
    AND COLUMN_NAME = 'DEFEITO';
    
        IF COL_COUNT = 0 THEN
           
              EXECUTE IMMEDIATE 'ALTER TABLE CLIENTE_HIST ADD DEFEITO VARCHAR2(20)';
            COMMIT;
        END IF;
        
            
            SELECT COUNT (*) 
	    INTO DEF_COUNT
            FROM CLIENTE_HIST WHERE DEFEITO IS NULL;
            
                IF (DEF_COUNT > 0) THEN
                
            	ALTER TABLE CLIENTE_HIST ADD (DEFEITO VARCHAR2(20) DEFAULT 'DEF_2525');
				--COMMIT;
            ELSE
                DBMS_OUTPUT.PUT_LINE('The column effective_date already exists');
                            
                END IF;
        
        
    
END;

--ALTER TABLE CLIENTE_HIST DROP COLUMN DEFEITO; COMMIT;

--ALTER TABLE CLIENTE_HIST DROP COLUMN DEFEITO; COMMIT;








