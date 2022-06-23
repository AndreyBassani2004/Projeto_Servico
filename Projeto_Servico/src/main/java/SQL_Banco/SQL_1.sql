-- Criar sequencia tabela usuario 

CREATE SEQUENCE usuario_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- Criar tabela usuario

CREATE TABLE usuario(
	id integer NOT NULL DEFAULT nextval('usuario_id_seq'::regclass),
	nome character varying(300) NOT NULL,
	email character varying(300) NOT NULL,
	perfil character varying(60) NOT NULL,
	senha character varying(300) NOT NULL,
	estado character varying(300) NOT NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (id)
);



