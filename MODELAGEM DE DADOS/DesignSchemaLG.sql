-- Gerado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   em:        2020-08-20 13:51:00 BRT
--   site:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE astro (
    nome           VARCHAR2(50) NOT NULL,
    nome_autor     VARCHAR2(100) NOT NULL,
    dt_nascimento  DATE,
    ast_id         NUMBER NOT NULL
);

ALTER TABLE astro ADD CONSTRAINT ast_pk PRIMARY KEY ( ast_id );

CREATE TABLE cliente (
    nome                 VARCHAR2(100) NOT NULL,
    cpf                  VARCHAR2(60) NOT NULL,
    dt_nascimento        DATE NOT NULL,
    email                VARCHAR2(60) NOT NULL,
    cli_id               NUMBER NOT NULL,
    logradouro_log_id    NUMBER NOT NULL,
    video_clube_vidc_id  NUMBER
);

ALTER TABLE cliente ADD CONSTRAINT cli_pk PRIMARY KEY ( cli_id );

CREATE TABLE cliente_fone (
    cliente_cli_id  NUMBER NOT NULL,
    fone_fone_id    NUMBER NOT NULL
);

CREATE TABLE devolucao (
    dev_id          NUMBER NOT NULL,
    loc_id          NUMBER(18) NOT NULL,
    cliente_cli_id  NUMBER(18) NOT NULL,
    func_func_id    NUMBER(18) NOT NULL,
    data_devolucao  DATE NOT NULL,
    cod_produto     NUMBER(18) NOT NULL,
    quantidade      NUMBER(18) NOT NULL
);

ALTER TABLE devolucao ADD CONSTRAINT dev_pk PRIMARY KEY ( dev_id );

CREATE TABLE entrega (
    prazo   VARCHAR2(100) NOT NULL,
    ent_id  NUMBER NOT NULL
);

ALTER TABLE entrega ADD CONSTRAINT ent_pk PRIMARY KEY ( ent_id );

CREATE TABLE estoque (
    titulo           VARCHAR2(100) NOT NULL,
    autor            VARCHAR2(50) NOT NULL,
    dt_cadastro      DATE NOT NULL,
    preco            NUMBER(10, 2) NOT NULL,
    qtde             NUMBER NOT NULL,
    usuario          NUMBER(18) NOT NULL,
    acao             VARCHAR2(30),
    est_cod          NUMBER(18) NOT NULL,
    est_id           NUMBER NOT NULL,
    astro_ast_id     NUMBER,
    formato_form_id  NUMBER NOT NULL,
    genero_gen_id    NUMBER NOT NULL
);

ALTER TABLE estoque ADD CONSTRAINT est_pk PRIMARY KEY ( est_id );

CREATE TABLE fone (
    numero             VARCHAR2(60) NOT NULL,
    fone_id            NUMBER NOT NULL,
    tipo_fone_tpfo_id  NUMBER NOT NULL
);

ALTER TABLE fone ADD CONSTRAINT fone_pk PRIMARY KEY ( fone_id );

CREATE TABLE formato (
    tipo          VARCHAR2(20) NOT NULL,
    desc_formato  VARCHAR2(60) NOT NULL,
    form_id       NUMBER NOT NULL
);

ALTER TABLE formato ADD CONSTRAINT form_pk PRIMARY KEY ( form_id );

CREATE TABLE func (
    nome               VARCHAR2(60) NOT NULL,
    cpf                VARCHAR2(40) NOT NULL,
    dt_nascimento      DATE NOT NULL,
    func_id            NUMBER NOT NULL,
    logradouro_log_id  NUMBER NOT NULL
);

ALTER TABLE func ADD CONSTRAINT func_pk PRIMARY KEY ( func_id );

CREATE TABLE funcionario_fone (
    func_func_id  NUMBER NOT NULL,
    fone_fone_id  NUMBER NOT NULL
);

CREATE TABLE genero (
    desc_genero  VARCHAR2(60) NOT NULL,
    gen_id       NUMBER NOT NULL
);

ALTER TABLE genero ADD CONSTRAINT gen_pk PRIMARY KEY ( gen_id );

CREATE TABLE locacao (
    dt_locacao        DATE NOT NULL,
    dt_venc           DATE,
    cod_produto       NUMBER(18) NOT NULL,
    quantidade        NUMBER(18) NOT NULL,
    preco             NUMBER(10, 2) NOT NULL,
    loc_id            NUMBER NOT NULL,
    cliente_cli_id    NUMBER NOT NULL,
    devolucao_dev_id  NUMBER NOT NULL,
    func_func_id      NUMBER NOT NULL
);

ALTER TABLE locacao ADD CONSTRAINT loc_pk PRIMARY KEY ( loc_id );

CREATE TABLE locacao_entrega (
    entrega_ent_id  NUMBER NOT NULL,
    locacao_loc_id  NUMBER NOT NULL
);

CREATE TABLE locacao_produto (
    locacao_loc_id  NUMBER NOT NULL,
    estoque_est_id  NUMBER NOT NULL
);

CREATE TABLE logradouro (
    endereco     VARCHAR2(100) NOT NULL,
    cidade       VARCHAR2(60) NOT NULL,
    bairro       VARCHAR2(100) NOT NULL,
    numero       NUMBER(8) NOT NULL,
    complemento  VARCHAR2(60),
    cep          VARCHAR2(100) NOT NULL,
    log_id       NUMBER NOT NULL
);

ALTER TABLE logradouro ADD CONSTRAINT log_pk PRIMARY KEY ( log_id );

CREATE TABLE tipo_fone (
    tipo     VARCHAR2(40) NOT NULL,
    tpfo_id  NUMBER NOT NULL
);

ALTER TABLE tipo_fone ADD CONSTRAINT tpfo_pk PRIMARY KEY ( tpfo_id );

CREATE TABLE video_clube (
    nome            VARCHAR2(60) NOT NULL,
    sobrenome       VARCHAR2(60) NOT NULL,
    data_cadastro   DATE NOT NULL,
    id_usuario      NUMBER(18) NOT NULL,
    credito         NUMBER(10, 2) NOT NULL,
    dt_credito      DATE NOT NULL,
    cliente_cli_id  NUMBER(18) NOT NULL,
    vidc_id         NUMBER NOT NULL
);

ALTER TABLE video_clube ADD CONSTRAINT vidc_pk PRIMARY KEY ( vidc_id );

ALTER TABLE cliente_fone
    ADD CONSTRAINT cliente_fone_cliente_fk FOREIGN KEY ( cliente_cli_id )
        REFERENCES cliente ( cli_id );

ALTER TABLE cliente_fone
    ADD CONSTRAINT cliente_fone_fone_fk FOREIGN KEY ( fone_fone_id )
        REFERENCES fone ( fone_id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_logradouro_fk FOREIGN KEY ( logradouro_log_id )
        REFERENCES logradouro ( log_id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_video_clube_fk FOREIGN KEY ( video_clube_vidc_id )
        REFERENCES video_clube ( vidc_id );

ALTER TABLE estoque
    ADD CONSTRAINT estoque_astro_fk FOREIGN KEY ( astro_ast_id )
        REFERENCES astro ( ast_id );

ALTER TABLE estoque
    ADD CONSTRAINT estoque_formato_fk FOREIGN KEY ( formato_form_id )
        REFERENCES formato ( form_id );

ALTER TABLE estoque
    ADD CONSTRAINT estoque_genero_fk FOREIGN KEY ( genero_gen_id )
        REFERENCES genero ( gen_id );

ALTER TABLE fone
    ADD CONSTRAINT fone_tipo_fone_fk FOREIGN KEY ( tipo_fone_tpfo_id )
        REFERENCES tipo_fone ( tpfo_id );

ALTER TABLE func
    ADD CONSTRAINT func_logradouro_fk FOREIGN KEY ( logradouro_log_id )
        REFERENCES logradouro ( log_id );

ALTER TABLE funcionario_fone
    ADD CONSTRAINT funcionario_fone_fone_fk FOREIGN KEY ( fone_fone_id )
        REFERENCES fone ( fone_id );

ALTER TABLE funcionario_fone
    ADD CONSTRAINT funcionario_fone_func_fk FOREIGN KEY ( func_func_id )
        REFERENCES func ( func_id );

ALTER TABLE locacao
    ADD CONSTRAINT locacao_cliente_fk FOREIGN KEY ( cliente_cli_id )
        REFERENCES cliente ( cli_id );

ALTER TABLE locacao
    ADD CONSTRAINT locacao_devolucao_fk FOREIGN KEY ( devolucao_dev_id )
        REFERENCES devolucao ( dev_id );

ALTER TABLE locacao_entrega
    ADD CONSTRAINT locacao_entrega_entrega_fk FOREIGN KEY ( entrega_ent_id )
        REFERENCES entrega ( ent_id );

ALTER TABLE locacao_entrega
    ADD CONSTRAINT locacao_entrega_locacao_fk FOREIGN KEY ( locacao_loc_id )
        REFERENCES locacao ( loc_id );

ALTER TABLE locacao
    ADD CONSTRAINT locacao_func_fk FOREIGN KEY ( func_func_id )
        REFERENCES func ( func_id );

ALTER TABLE locacao_produto
    ADD CONSTRAINT locacao_produto_estoque_fk FOREIGN KEY ( estoque_est_id )
        REFERENCES estoque ( est_id );

ALTER TABLE locacao_produto
    ADD CONSTRAINT locacao_produto_locacao_fk FOREIGN KEY ( locacao_loc_id )
        REFERENCES locacao ( loc_id );

CREATE SEQUENCE ast_ast_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ast_ast_id_trg BEFORE
    INSERT ON astro
    FOR EACH ROW
    WHEN ( new.ast_id IS NULL )
BEGIN
    :new.ast_id := ast_ast_id_seq.nextval;
END;
/

CREATE SEQUENCE cli_cli_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cli_cli_id_trg BEFORE
    INSERT ON cliente
    FOR EACH ROW
    WHEN ( new.cli_id IS NULL )
BEGIN
    :new.cli_id := cli_cli_id_seq.nextval;
END;
/

CREATE SEQUENCE dev_dev_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dev_dev_id_trg BEFORE
    INSERT ON devolucao
    FOR EACH ROW
    WHEN ( new.dev_id IS NULL )
BEGIN
    :new.dev_id := dev_dev_id_seq.nextval;
END;
/

CREATE SEQUENCE ent_ent_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ent_ent_id_trg BEFORE
    INSERT ON entrega
    FOR EACH ROW
    WHEN ( new.ent_id IS NULL )
BEGIN
    :new.ent_id := ent_ent_id_seq.nextval;
END;
/

CREATE SEQUENCE est_est_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER est_est_id_trg BEFORE
    INSERT ON estoque
    FOR EACH ROW
    WHEN ( new.est_id IS NULL )
BEGIN
    :new.est_id := est_est_id_seq.nextval;
END;
/

CREATE SEQUENCE fone_fone_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fone_fone_id_trg BEFORE
    INSERT ON fone
    FOR EACH ROW
    WHEN ( new.fone_id IS NULL )
BEGIN
    :new.fone_id := fone_fone_id_seq.nextval;
END;
/

CREATE SEQUENCE form_form_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER form_form_id_trg BEFORE
    INSERT ON formato
    FOR EACH ROW
    WHEN ( new.form_id IS NULL )
BEGIN
    :new.form_id := form_form_id_seq.nextval;
END;
/

CREATE SEQUENCE func_func_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER func_func_id_trg BEFORE
    INSERT ON func
    FOR EACH ROW
    WHEN ( new.func_id IS NULL )
BEGIN
    :new.func_id := func_func_id_seq.nextval;
END;
/

CREATE SEQUENCE gen_gen_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER gen_gen_id_trg BEFORE
    INSERT ON genero
    FOR EACH ROW
    WHEN ( new.gen_id IS NULL )
BEGIN
    :new.gen_id := gen_gen_id_seq.nextval;
END;
/

CREATE SEQUENCE loc_loc_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER loc_loc_id_trg BEFORE
    INSERT ON locacao
    FOR EACH ROW
    WHEN ( new.loc_id IS NULL )
BEGIN
    :new.loc_id := loc_loc_id_seq.nextval;
END;
/

CREATE SEQUENCE log_log_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER log_log_id_trg BEFORE
    INSERT ON logradouro
    FOR EACH ROW
    WHEN ( new.log_id IS NULL )
BEGIN
    :new.log_id := log_log_id_seq.nextval;
END;
/

CREATE SEQUENCE tpfo_tpfo_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tpfo_tpfo_id_trg BEFORE
    INSERT ON tipo_fone
    FOR EACH ROW
    WHEN ( new.tpfo_id IS NULL )
BEGIN
    :new.tpfo_id := tpfo_tpfo_id_seq.nextval;
END;
/

CREATE SEQUENCE vidc_vidc_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER vidc_vidc_id_trg BEFORE
    INSERT ON video_clube
    FOR EACH ROW
    WHEN ( new.vidc_id IS NULL )
BEGIN
    :new.vidc_id := vidc_vidc_id_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             31
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          13
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         13
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
