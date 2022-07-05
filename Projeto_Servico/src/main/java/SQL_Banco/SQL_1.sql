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

-- Criar sequencia tabela dados_prestador 

CREATE SEQUENCE prestador_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- Criar tabela dados_prestador

CREATE TABLE dados_prestador(
	id integer NOT NULL DEFAULT nextval('prestador_id_seq'::regclass),
	email_user character varying(300) NOT NULL,
	telefone_contato character varying(300) NOT NULL,
	estado character varying(300) NOT NULL,
	cidade character varying(300) NOT NULL,
	cep character varying(300) NOT NULL,
	CONSTRAINT dados_prestador_pkey PRIMARY KEY (id),
	CONSTRAINT email_fk FOREIGN KEY (email) REFERENCES usuario(id)
);

-- Criar sequencia tabela dados_administrador

CREATE SEQUENCE dados_administrador_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- Criar tabela dados_administrador

CREATE TABLE dados_administrador(
	id integer NOT NULL DEFAULT nextval('dados_administrador_id_seq'::regclass),
	email_user character varying(300) NOT NULL,
	telefone_contato character varying(300) NOT NULL,
	estado character varying(300) NOT NULL,
	cidade character varying(300) NOT NULL,
	cep character varying(300) NOT NULL,
	CONSTRAINT dados_prestador_pkey PRIMARY KEY (id),
	CONSTRAINT email_fk FOREIGN KEY (email) REFERENCES usuario(id)
);
    
-- Criar sequencia tabela anuncio

CREATE SEQUENCE anuncio_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;   
    
-- Criar tabela anuncio

CREATE TABLE anuncio(
	id integer NOT NULL DEFAULT nextval('anuncio_id_seq'::regclass),
    email character varying(300) NOT NULL,
    regiao character varying(300) NOT NULL,
    estado character varying(300) NOT NULL,
    titulo character varying(300) NOT NULL,
    descricao character varying(300) NOT NULL,
    estado boolean NOT NULL DEFAULT true,
    CONSTRAINT anuncio_pkey PRIMARY KEY (id)
);    
    