------- versao 00023 - 27/11/2019 - Atual
--------------------------------------------------------------------------------
-- versao 00001
ALTER TABLE EMPRESA ADD VERSAO VARCHAR(10);
--==
UPDATE EMPRESA SET VERSAO = '00001';
--==
ALTER TABLE TRANSPORTADOR ADD EMAIL VARCHAR(80);
--==
CREATE TABLE FORN_TIPO_EMPRESA (
    ID_TIPO    INTEGER NOT NULL,
    COD_EMPRESA  INTEGER NOT NULL,
    SIGLA        CHAR(1) NOT NULL,
    DESC_TIPO    VARCHAR(50) NOT NULL,
    USU_INC      VARCHAR(30),
    USU_ALT      VARCHAR(30)
);
--==
ALTER TABLE forn_tipo_empresa ADD CONSTRAINT PK_FORN_TIPO_EMPRESA PRIMARY KEY(ID_TIPO);
--==
ALTER TABLE FORN_TIPO_EMPRESA
ADD CONSTRAINT FK_FORN_TIPO_EMPRESA_EMP
FOREIGN KEY (COD_EMPRESA)
REFERENCES EMPRESA(COD_EMPRESA);
--==
INSERT INTO FORN_TIPO_EMPRESA(
    ID_TIPO,
    COD_EMPRESA,
    SIGLA,
    DESC_TIPO,
    USU_INC,
    USU_ALT
) VALUES(
    1,
    1,
    'M',
    'MATRIZ',
    '',
    ''
);
--==
CREATE GENERATOR GEN_FORN_TIPO_EMPRESA;
--==
ALTER SEQUENCE GEN_FORN_TIPO_EMPRESA RESTART WITH 1;
--==
ALTER TABLE CARGA ADD OBS2 VARCHAR(150);
--==
ALTER TABLE CARGA ADD NUM_NF INTEGER;
--==
ALTER TABLE FORNECEDOR ADD ID_TIPO_EMPRESA INTEGER;
--==
ALTER TABLE FORNECEDOR
ADD CONSTRAINT FK_FORNECEDOR_TIPO_EMP
FOREIGN KEY (ID_TIPO_EMPRESA)
REFERENCES FORN_TIPO_EMPRESA(ID_TIPO);
--==
create or alter procedure SP_COMISSAO_CALCULO_VENDA (
    IN_PERC_COMISSAO double precision,
    IN_QTDE_CARREGAR double precision,
    IN_PRECO_UNIT double precision)
returns (
    VALOR_COMISSAO double precision)
as
declare variable V_BASE_COMISSAO double precision;
begin
    v_base_comissao = ROUND((in_qtde_carregar * in_preco_unit),2);
    valor_comissao = ROUND((v_base_comissao * in_perc_comissao) / 100,2);
  suspend;
end;
--==
--------------------------------------------------------------------------------

-- versao 00002
UPDATE EMPRESA SET VERSAO = '00002';
--==
ALTER TABLE CARGA ADD DATA_NF DATE;
--==
--------------------------------------------------------------------------------
-- versao 00003
UPDATE EMPRESA SET VERSAO = '00003';
--==
ALTER TABLE transportador ADD CPF_TRANSP VARCHAR(11);
--==
ALTER TABLE CARGA ALTER NUM_NF TYPE VARCHAR(40);
--==
CREATE TABLE CONF_PEDIDO(
    NUM_PEDIDO INTEGER NOT NULL, 
    FRETE_PAGO_DESCARGA CHAR(1),
    COM_MANIFESTO CHAR(1),
    COM_DESCARGA CHAR(1),
    TEXTO VARCHAR(500),
    VENCIMENTO VARCHAR(100),
    PRAZO VARCHAR(30)
);
--==
ALTER TABLE CONF_PEDIDO ADD CONSTRAINT PK_CONF_PEDIDO
    PRIMARY KEY (NUM_PEDIDO);
--==
ALTER TABLE CONF_PEDIDO
    ADD CONSTRAINT FK_CONF_PEDIDO_PEDIDO FOREIGN KEY (NUM_PEDIDO)
    REFERENCES PEDIDO(NUM_PEDIDO) ON DELETE CASCADE;
--==
CREATE INDEX CARGA_IDX_DATA_NF ON CARGA (DATA_NF);
--==
ALTER TABLE PEDIDO
    ADD CONSTRAINT FK_PEDIDO_VENDEDOR FOREIGN KEY (COD_VENDEDOR)
    REFERENCES VENDEDOR(COD_VENDEDOR);
--==
--------------------------------------------------------------------------------
-- versao 00004
UPDATE EMPRESA SET VERSAO = '00004';
--==
ALTER TABLE transportador ADD CPF_TRANSP VARCHAR(11);
--==
ALTER TABLE CARGA ALTER NUM_NF TYPE VARCHAR(40);
--==
CREATE TABLE CONF_PEDIDO(
    NUM_PEDIDO INTEGER NOT NULL, 
    FRETE_PAGO_DESCARGA CHAR(1),
    COM_MANIFESTO CHAR(1),
    COM_DESCARGA CHAR(1),
    TEXTO VARCHAR(500),
    VENCIMENTO VARCHAR(100),
    PRAZO VARCHAR(30)
);
--==
ALTER TABLE CONF_PEDIDO ADD CONSTRAINT PK_CONF_PEDIDO
    PRIMARY KEY (NUM_PEDIDO);
--==
ALTER TABLE CONF_PEDIDO
    ADD CONSTRAINT FK_CONF_PEDIDO_PEDIDO FOREIGN KEY (NUM_PEDIDO)
    REFERENCES PEDIDO(NUM_PEDIDO) ON DELETE CASCADE;
--==
CREATE INDEX CARGA_IDX_DATA_NF ON CARGA (DATA_NF);
--==
ALTER TABLE PEDIDO
    ADD CONSTRAINT FK_PEDIDO_VENDEDOR FOREIGN KEY (COD_VENDEDOR)
    REFERENCES VENDEDOR(COD_VENDEDOR);
--==
--------------------------------------------------------------------------------

-- versao 00005 - 23/06/2014
UPDATE EMPRESA SET VERSAO = '00005';
--==
ALTER TABLE CARGA ADD COD_MANIFESTO INTEGER;
--==
ALTER TABLE CARGA
    ADD CONSTRAINT FK_CARGA_TRANSP_COD_MAN FOREIGN KEY (COD_MANIFESTO)
    REFERENCES TRANSPORTADOR(COD_TRANS);
--==
--------------------------------------------------------------------------------

-- versao 00006 - 04/07/2014

UPDATE EMPRESA SET VERSAO = '00006';
--==
CREATE TABLE PESSOA_CREDITO (
    COD_CLIENTE    INTEGER NOT NULL,
    DATA_CREDITO  DATE,
    QTDE_CREDITO  DOUBLE PRECISION,
    QTDE_USADO    DOUBLE PRECISION,
    QTDE_SALDO    COMPUTED BY (QTDE_CREDITO - QTDE_USADO)
);
--==
ALTER TABLE PESSOA_CREDITO
    ADD CONSTRAINT PK_PESSOA_CREDITO PRIMARY KEY(COD_CLIENTE);
--==
ALTER TABLE PESSOA_CREDITO
    ADD CONSTRAINT FK_PESSOACREDITO_PESSOA FOREIGN KEY (COD_CLIENTE)
    REFERENCES CLIENTE(COD_CLIENTE) ON DELETE CASCADE;
--==
CREATE OR ALTER TRIGGER trg_itens_pedido_credito_aiud0 FOR itens_pedido
ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0
AS
declare variable V_COD_CLIENTE integer;
begin
    if (COALESCE(OLD.qtde,0) <> COALESCE(NEW.qtde,0)) then
    BEGIN
        SELECT PED.cod_cliente FROM PEDIDO PED
            WHERE PED.num_pedido = NEW.num_pedido INTO :v_cod_cliente;

        if (INSERTING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = :v_cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END

        if (UPDATING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
            WHERE PCRED.cod_cliente = :v_cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;

            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = :v_cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END
    END

    if (DELETING) then
    BEGIN
        SELECT PED.cod_cliente FROM PEDIDO PED
            WHERE PED.num_pedido = OLD.num_pedido INTO :v_cod_cliente;

        UPDATE pessoa_credito PCRED
            SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
        WHERE PCRED.cod_cliente = :v_cod_cliente
        AND COALESCE(PCRED.qtde_credito , 0) > 0;
    END
end;
--==
CREATE OR ALTER TRIGGER trg_pessoa_credito_bu0 FOR pessoa_credito
ACTIVE BEFORE UPDATE POSITION 0
AS
begin
    if (NEW.qtde_usado <> OLD.qtde_usado) then
    BEGIN
        if (NEW.qtde_usado >= NEW.qtde_credito) then
            NEW.qtde_usado = 0;

        if (NEW.qtde_usado < 0) then
            NEW.qtde_usado = 0;
    END
end;
--==
--------------------------------------------------------------------------------
-- versao 00007 - 21/07/2014
UPDATE EMPRESA SET VERSAO = '00007';
--==
ALTER TABLE CARGA ADD QTDE_CADA NUMERIC(15,3);
--==
UPDATE CARGA SET QTDE_CADA = 50 WHERE UNIDADE = 'SACAS';
--==
UPDATE CARGA SET QTDE_CADA = 30 WHERE UNIDADE IS NULL;
--==
create table parametros(
    par_id integer not null,
    codigo integer not NULL, 
    nome varchar(200) not null,
    valor varchar(200) not null,
    observacao varchar(200)
);
--==
ALTER TABLE PARAMETROS
    ADD CONSTRAINT PK_PARAMETRO PRIMARY KEY(PAR_ID);
--==
ALTER TABLE PARAMETROS
    ADD CONSTRAINT UK_PARAMETROS_CODIGO UNIQUE (CODIGO);
--==
CREATE SEQUENCE GEN_PARAMETROS;
--==
CREATE TRIGGER trg_parametros_bi0 FOR parametros
ACTIVE BEFORE INSERT POSITION 0
AS
begin
    if (NEW.par_id IS NULL) then
        NEW.par_id = GEN_ID(gen_parametros, 1);
end;
--==
INSERT INTO parametros(
    codigo,
    nome,
    valor,
    observacao
)
values(
1,
'Caminho do PDF para arquivos do Pedido',
'C:\Sistema',
'');
--==
--------------------------------------------------------------------------------
-- versao 00008 - 12/11/2014
UPDATE EMPRESA SET VERSAO = '00008';
--==
ALTER TABLE PEDIDO ADD COD_USINA INTEGER;
--==
ALTER TABLE PEDIDO
    ADD CONSTRAINT FK_PEDIDO_FORNEC_COD_USINA FOREIGN KEY (COD_USINA)
    REFERENCES FORNECEDOR(COD_FOR);
--==
--------------------------------------------------------------------------------
-- versao 00009 - 28/11/2014
UPDATE EMPRESA SET VERSAO = '00009';
--==
ALTER TABLE MOTORISTA ADD CNH VARCHAR(30);
--==
--------------------------------------------------------------------------------
-- versao 00010 - 26/02/2015
UPDATE EMPRESA SET VERSAO = '00010';
--==
ALTER TABLE CLIENTE ADD COD_VENDEDOR INTEGER;
--==
ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_VENDEDOR FOREIGN KEY (COD_VENDEDOR) REFERENCES VENDEDOR(COD_VENDEDOR);
--==
--------------------------------------------------------------------------------
-- versao 00011 - 06/03/2015
UPDATE EMPRESA SET VERSAO = '00011';
--==

CREATE TABLE UNIDADE_TEXTO(
    ID INTEGER NOT NULL,
    OBSERVACAO VARCHAR(30) NOT NULL,
    TEXTO VARCHAR(500),
    ADD USU_INC VARCHAR(30),
    ADD USU_ALT VARCHAR(30);
);
--==
ALTER TABLE UNIDADE_TEXTO ADD CONSTRAINT PK_UNIDADE_TEXTO PRIMARY KEY(ID);
--==
ALTER TABLE UNIDADE
    ADD COMPL_UNIDADE VARCHAR(30),
    ADD FATOR_CONVERSAO NUMERIC(15,6),
    ADD ID_TEXTO INTEGER;
--==
ALTER TABLE UNIDADE
ADD CONSTRAINT FK_UNIDADE_TEXTO FOREIGN KEY (ID_TEXTO) REFERENCES UNIDADE_TEXTO(ID);
--==
UPDATE UNIDADE SET FATOR_CONVERSAO = 1, COMPL_UNIDADE = '50 KG CADA' WHERE FATOR_CONVERSAO IS NULL;
--==
ALTER TABLE CARGA ADD ID_UNIDADE INTEGER;
--==
ALTER TABLE CARGA
ADD CONSTRAINT FK_CARGA_UNIDADE FOREIGN KEY (ID_UNIDADE) REFERENCES UNIDADE(ID_UNIDADE);
--==
CREATE SEQUENCE GEN_UNIDADE_TEXTO;
--==
INSERT INTO UNIDADE_TEXTO(ID, OBSERVACAO, TEXTO, USU_INC, USU_ALT)
VALUES(gen_id(GEN_UNIDADE_TEXTO,1),
       'TEXTO DA UNIDADE',
       '   AUTORIZAMOS O SR. <$SR$>, CPF <$CPF$> CNH <$CNH$> MOTORISTA DO CAMINHÃO PLACA(S) <$PLACA1$> <$PLACA2$> <$PLACA3$>, A RETIRAR PARA A NOSSA EMPRESA A TONELAGEM DE <$TONELAGEM$> KG CORRESPONDENTE A QUANTIDADE DE <$QTDE$> <$UNIDADE$> DE AÇÚCAR DE <$KG_COMPL$>.',
       'SUPERVISOR','SUPERVISOR');
--==
INSERT INTO parametros(CODIGO, NOME, VALOR, OBSERVACAO) VALUES
(2, 'MODELO RELATORIO DE AUTORIZACAO', '2', 'MODELO 1-ANTIGO, 2-NOVO');
--==
--------------------------------------------------------------------------------
-- versao 00012 - 16/11/2015
UPDATE EMPRESA SET VERSAO = '00012';
--==

ALTER TABLE transportador
  ADD ANTT VARCHAR(50),
  ADD RENAVAN VARCHAR(50);
--==
CREATE TABLE END_ENTREGA(
 COD_CLIENTE INTEGER NOT NULL,
 ENDERECO VARCHAR(100),
 NUMERO VARCHAR(10),
 COMPLEMENTO VARCHAR(50),
 BAIRRO VARCHAR(50),
 COD_CIDADE INTEGER,
 CEP VARCHAR(8));
--==
 ALTER TABLE END_ENTREGA ADD CONSTRAINT PK_END_ENTREGA PRIMARY KEY(COD_CLIENTE);
--==
 ALTER TABLE END_ENTREGA 
 ADD CONSTRAINT FK_ENDENTREGA_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE(COD_CLIENTE) ON DELETE CASCADE;
--==
 ALTER TABLE END_ENTREGA 
 ADD CONSTRAINT FK_ENDENTREGA_CIDADE FOREIGN KEY (COD_CIDADE) REFERENCES CIDADE(COD_CIDADE);
--==
--------------------------------------------------------------------------------
-- versao 00013 - 25/11/2015
UPDATE EMPRESA SET VERSAO = '00013';
--==
ALTER TABLE CARGA ALTER ARMAZEM TYPE VARCHAR(100);
--==
--------------------------------------------------------------------------------
-- versao 00015 - 27/01/2017
UPDATE EMPRESA SET VERSAO = '00015';
--==
INSERT INTO parametros(CODIGO, NOME, VALOR, OBSERVACAO)
VALUES(3,'Caminho do PDF para Ordem de Carregamento','C:\Carga','');
--==
--ALTER TABLE motorista ADD RENAVAN VARCHAR(50);
--------------------------------------------------------------------------------
-- versao 00016 - 07/02/2017
UPDATE EMPRESA SET VERSAO = '00016';
--==
ALTER TABLE Cliente ALTER EMAIL TYPE VARCHAR(500);
--==
--------------------------------------------------------------------------------
-- versao 00017 - 23/03/2018
UPDATE EMPRESA SET VERSAO = '00017';
--==
ALTER TABLE CARGA ADD ID_CONTABANCO INTEGER, ADD CNPJ_CPF VARCHAR(25), ADD CREDITO_NF VARCHAR(50);
--==
ALTER TABLE CARGA ADD CONSTRAINT FK_CARGA_CONTABANCO FOREIGN KEY (ID_CONTABANCO) REFERENCES CONTABANCO(ID_CONTABANCO);
 --==
--------------------------------------------------------------------------------
-- versao 00018 - 07/04/2018
UPDATE EMPRESA SET VERSAO = '00018';
--==
ALTER TABLE CONTABANCO ADD ATIVO CHAR(1), ADD CNPJ_CPF VARCHAR(25)
--==
update CONTABANCO SET ATIVO = 'S'
--==
--------------------------------------------------------------------------------
-- versao 00019 - 14/09/2018
UPDATE EMPRESA SET VERSAO = '00019';
--==
ALTER TABLE CARGA ADD NUM_NOTA2 VARCHAR(25), add IR DOUBLE precision, add VALOR_NOTA2 double precision;
--==
--------------------------------------------------------------------------------
-- versao 00020 - 24/11/2018
UPDATE EMPRESA SET VERSAO = '00020';
--==
CREATE TABLE CARGA_VENCTO
(
    ID INTEGER NOT NULL,
    CARGA_ID INT NOT null, 
    DIAS integer,
    VENCTO timestamp,
    VALOR DOUBLE precision,
    FORMAPAGTO_ID integer
);
--==
 ALTER TABLE CARGA_VENCTO ADD CONSTRAINT PK_CARGA_VENCTO PRIMARY KEY(ID);
--==
 ALTER TABLE CARGA_VENCTO
 ADD CONSTRAINT FK_CARGA_VENCTO_CARGA FOREIGN KEY (CARGA_ID) REFERENCES CARGA(ID_CARGA) ON DELETE CASCADE;
--==
 ALTER TABLE CARGA_VENCTO
 ADD CONSTRAINT FK_CARGA_VENCTO_FORMAPAGTO FOREIGN KEY (FORMAPAGTO_ID) REFERENCES forma_pagto(COD_PAGTO);
--==
CREATE SEQUENCE GEN_CARGA_VENCTO;
--==
CREATE TRIGGER trg_CARGA_VENCTO_bi0 FOR CARGA_VENCTO
ACTIVE BEFORE INSERT POSITION 0
AS
begin
    if (NEW.id IS NULL) then
        NEW.id = GEN_ID(gen_CARGA_VENCTO, 1);
end;
--==
--------------------------------------------------------------------------------
-- versao 00021 - 19/03/2019
UPDATE EMPRESA SET VERSAO = '00021';
--==
 ALTER TABLE CARGA ADD COD_USINA integer;
--==
 ALTER TABLE CARGA
 ADD CONSTRAINT FK_CARGA_FORNECEDOR_USINA FOREIGN KEY (COD_USINA) REFERENCES FORNECEDOR(COD_FOR);
--==

--------------------------------------------------------------------------------
-- versao 00022 - 30/08/2019
UPDATE EMPRESA SET VERSAO = '00022';
--==
DROP TRIGGER TRG_PESSOA_CREDITO_BU0;
--==
DROP TRIGGER trg_itens_pedido_credito_aiud0;
--==
CREATE OR ALTER TRIGGER TRG_CARGA_BIUD0 FOR CARGA
ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0
AS
begin
    if (COALESCE(OLD.qtde,0) <> COALESCE(NEW.qtde,0)) then
    BEGIN
        if (INSERTING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = NEW.cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END

        if (UPDATING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
            WHERE PCRED.cod_cliente = OLD.cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;

            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = NEW.cod_cliente
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END
    END

    if (DELETING) then
    BEGIN
        UPDATE pessoa_credito PCRED
            SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
        WHERE PCRED.cod_cliente = OLD.cod_cliente
        AND COALESCE(PCRED.qtde_credito , 0) > 0;
    END    
end
--==
--------------------------------------------------------------------------------
-- versao 00023 - 27/11/2019
UPDATE EMPRESA SET VERSAO = '00023';
--==
CREATE OR ALTER trigger trg_carga_biud0 for carga
active before insert or update or delete position 0
AS
begin
    if (COALESCE(OLD.qtde,0) <> COALESCE(NEW.qtde,0)) then
    BEGIN
        if (INSERTING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = NEW.cod_cliente
            AND PCRED.data_credito <= NEW.data
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END
        if (UPDATING) then
        BEGIN
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
            WHERE PCRED.cod_cliente = OLD.cod_cliente
            AND PCRED.data_credito <= NEW.data
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
            UPDATE pessoa_credito PCRED
                SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) + COALESCE(NEW.qtde, 0)
            WHERE PCRED.cod_cliente = NEW.cod_cliente
            AND PCRED.data_credito <= NEW.data
            AND COALESCE(PCRED.qtde_credito , 0) > 0;
        END
    END
    if (DELETING) then
    BEGIN
        UPDATE pessoa_credito PCRED
            SET PCRED.qtde_usado = COALESCE(PCRED.qtde_usado, 0) - COALESCE(OLD.qtde, 0)
        WHERE PCRED.cod_cliente = OLD.cod_cliente
        AND PCRED.data_credito <= OLD.data
        AND COALESCE(PCRED.qtde_credito , 0) > 0;
    END    
end
--==
--------------------------------------------------------------------------------
-- versao 00024 - 14/12/2020
UPDATE EMPRESA SET VERSAO = '00024';
--==
ALTER TABLE TRANSPORTADOR ADD EXPORTAR_NET CHAR(1)
--==
ALTER TABLE CLIENTE ADD EXPORTAR_NET CHAR(1)
--==
ALTER TABLE PEDIDO ADD EXPORTAR_NET CHAR(1)
--==
CREATE OR ALTER trigger trg_pedido_bi0 for pedido
active before insert position 0
AS
begin
    NEW.exportar_net = 'S';
end
--==
CREATE OR ALTER trigger trg_transportador_bi0 for transportador
active before insert position 0
AS
begin
    NEW.exportar_net = 'S';
end
--==
CREATE trigger trg_cliente_bi0 for cliente
active before insert position 0
AS
begin
    NEW.exportar_net = 'S';
end
--==
