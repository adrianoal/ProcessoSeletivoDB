--LOCACAO  -- COD_PRODUTO, QUANTIDADE
-- ESTOQUE -- EST_COD, QTDE


CREATE OR REPLACE TRIGGER BAIXA_ESTOQUE
 AFTER INSERT OR UPDATE OR DELETE OF QUANTIDADE ON LOCACAO
 FOR EACH ROW

  BEGIN
        IF INSERTING THEN     
            UPDATE ESTOQUE SET QTDE = QTDE - :NEW.QUANTIDADE WHERE EST_COD = :NEW.COD_PRODUTO;
        
        ELSIF DELETING THEN        
            UPDATE ESTOQUE SET QTDE = QTDE + :OLD.QUANTIDADE WHERE EST_COD = :OLD.COD_PRODUTO;
        
        ELSIF UPDATING THEN        
            UPDATE ESTOQUE SET QTDE = QTDE + :OLD.QUANTIDADE -- 1º ATUALIZA O VALOR ORIGINAL P/ ANTIGO
            WHERE EST_COD = :OLD.COD_PRODUTO;
           ------------------------------------------------------------------------------------------------ 
            UPDATE ESTOQUE SET QTDE = QTDE - :NEW.QUANTIDADE -- 2º SEGUNDO, ATUALIZA COM O VALOR NOVO...
            WHERE EST_COD = :NEW.COD_PRODUTO;    
        END IF;
  END BAIXA_ESTOQUE;
  
------------------------------------------------------------------------------------------------------------------------------------------------  
------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIAR UM PROCESSO PARA DESCONTAR DO CREDITO DA TAB VIDEO_CLUBE QUANDO HOUVER LOCACAO:

CREATE OR REPLACE TRIGGER BAIXA_VIDEOCLUB
 AFTER INSERT OR UPDATE OR DELETE OF PRECO ON LOCACAO
 FOR EACH ROW

  BEGIN
        IF INSERTING THEN     
            UPDATE VIDEO_CLUBE SET CREDITO = CREDITO - :NEW.PRECO WHERE CLIENTE_CLI_ID = :NEW.CLIENTE_CLI_ID;
        
        ELSIF DELETING THEN        
            UPDATE VIDEO_CLUBE SET CREDITO = CREDITO + :OLD.PRECO WHERE CLIENTE_CLI_ID = :OLD.CLIENTE_CLI_ID;
        
        ELSIF UPDATING THEN        
            UPDATE VIDEO_CLUBE SET CREDITO = CREDITO + :OLD.PRECO WHERE CLIENTE_CLI_ID = :OLD.CLIENTE_CLI_ID;
           ------------------------------------------------------------------------------------------------ 
            UPDATE VIDEO_CLUBE SET CREDITO = CREDITO - :NEW.PRECO WHERE CLIENTE_CLI_ID = :NEW.CLIENTE_CLI_ID;    
        END IF;
  END BAIXA_VIDEOCLUB;


------------------------------------------------------------------------------------------------------------------------------------------------  
------------------------------------------------------------------------------------------------------------------------------------------------
-- Processo de devolução - Trigger que devolve para o estoque ao realizar a devolução do produto:


CREATE OR REPLACE TRIGGER DEVOLUCAO_ESTOQUE
 AFTER INSERT OR UPDATE OR DELETE OF COD_PRODUTO ON DEVOLUCAO
 FOR EACH ROW

  BEGIN
        IF INSERTING THEN     
            UPDATE ESTOQUE SET QTDE = QTDE + :NEW.QUANTIDADE WHERE EST_COD = :NEW.COD_PRODUTO;
        
        ELSIF DELETING THEN        
            UPDATE ESTOQUE SET QTDE = QTDE - :OLD.QUANTIDADE WHERE EST_COD = :OLD.COD_PRODUTO;
        
        ELSIF UPDATING THEN        
            UPDATE ESTOQUE SET QTDE = QTDE - :OLD.QUANTIDADE WHERE EST_COD = :OLD.COD_PRODUTO;
           ------------------------------------------------------------------------------------------------ 
            UPDATE ESTOQUE SET QTDE = QTDE + :NEW.QUANTIDADE WHERE EST_COD = :NEW.COD_PRODUTO;    
        END IF;
  END BAIXA_VIDEOCLUB;

------------------------------------------------------------------------------------------------------------------------------------------------  
------------------------------------------------------------------------------------------------------------------------------------------------












