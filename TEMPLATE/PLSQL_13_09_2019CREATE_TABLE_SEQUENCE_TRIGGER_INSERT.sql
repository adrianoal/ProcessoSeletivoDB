SELECT * FROM CAD_ALUNOS ORDER BY ID_ALUNO; 
--SELECT * FROM ALUNOS;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO PK
ALTER TABLE CAD_ALUNOS 
ADD CONSTRAINT CAD_ALUNOS_PK 
PRIMARY KEY(ID_ALUNO)ENABLE;


-- EXEMPLO FK
ALTER TABLE HORARIO
ADD CONSTRAINT FK_HORARIO
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES COLABORADOR(ID_FUNCIONARIO);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

 CREATE SEQUENCE  SEQ_CAD_ALUNOS
	INCREMENT BY 1
	START WITH 1
	ORDER
	CACHE 10;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------    
CREATE OR REPLACE TRIGGER TRG_CAD_ALUNOS 
    BEFORE INSERT ON CAD_ALUNOS
    FOR EACH ROW
        BEGIN
        IF :NEW.ID_ALUNO IS NULL THEN
            SELECT SEQ_CAD_ALUNOS.NEXTVAL INTO :NEW.ID_ALUNO FROM DUAL;
        END IF;
    END;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN    
INSERT INTO CAD_ALUNOS VALUES(NULL,'LUCIANO');COMMIT;
INSERT INTO  CAD_ALUNOS VALUES(NULL,'PAULA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'ANDREIA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'MATEUS');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'RONALDO');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'PATRICA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'PAMELA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'RUBIA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'KATIA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'CELIA');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'SERGIO');COMMIT;
INSERT INTO CAD_ALUNOS VALUES(NULL,'CESAR');COMMIT;
END;