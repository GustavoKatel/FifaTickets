toc.dat                                                                                             100600  004000  002000  00000022343 12307200441 007277  0                                                                                                    ustar00                                                                                                                                                                                                                                                        PGDMP       )            	        r            ufpbdb    9.1.12    9.1.12                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    1262    16384    ufpbdb    DATABASE     x   CREATE DATABASE ufpbdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE ufpbdb;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                    0    0    public    ACL     ’   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6         §            3079    11685    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                    0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    167         ‘            1259    16385    compra    TABLE        CREATE TABLE compra (
    id integer NOT NULL,
    data date DEFAULT ('now'::text)::date,
    forma_de_pagamento integer,
    comprador_id integer NOT NULL
);
    DROP TABLE public.compra;
       public         postgres    false    1811    6         ’            1259    16389 	   comprador    TABLE     Α  CREATE TABLE comprador (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf_cod character varying(15) NOT NULL,
    rua character varying(100) NOT NULL,
    cidade character varying(20),
    telefone character varying(20),
    estado character varying(20),
    complemento character varying(300),
    bairro character varying(20),
    senha character varying(32) DEFAULT 12345678901234567890123456789011::numeric NOT NULL
);
    DROP TABLE public.comprador;
       public         postgres    false    1812    6         £            1259    16396    ingresso    TABLE     ΰ   CREATE TABLE ingresso (
    id integer NOT NULL,
    data date NOT NULL,
    ingresso_classe_id integer NOT NULL,
    partida_id integer NOT NULL,
    ingressos_classes_id integer NOT NULL,
    compra_id integer NOT NULL
);
    DROP TABLE public.ingresso;
       public         postgres    false    6         €            1259    16399    ingressos_classes    TABLE     Ή   CREATE TABLE ingressos_classes (
    id integer NOT NULL,
    nome character varying(30) NOT NULL,
    total integer NOT NULL,
    vendidos integer NOT NULL,
    valor real NOT NULL
);
 %   DROP TABLE public.ingressos_classes;
       public         postgres    false    6         ₯            1259    16402    local    TABLE     λ   CREATE TABLE local (
    id integer NOT NULL,
    nome character varying(30) NOT NULL,
    rua character varying(50) NOT NULL,
    bairro character varying(50) NOT NULL,
    capacidade integer NOT NULL,
    cidade character varying
);
    DROP TABLE public.local;
       public         postgres    false    6         ¦            1259    16405    partida    TABLE     ³   CREATE TABLE partida (
    id integer NOT NULL,
    tipo character varying(10) NOT NULL,
    data date NOT NULL,
    local_id integer NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.partida;
       public         postgres    false    6                   0    16385    compra 
   TABLE DATA               E   COPY compra (id, data, forma_de_pagamento, comprador_id) FROM stdin;
    public       postgres    false    161    1939       1933.dat           0    16389 	   comprador 
   TABLE DATA               j   COPY comprador (id, nome, cpf_cod, rua, cidade, telefone, estado, complemento, bairro, senha) FROM stdin;
    public       postgres    false    162    1939       1934.dat           0    16396    ingresso 
   TABLE DATA               f   COPY ingresso (id, data, ingresso_classe_id, partida_id, ingressos_classes_id, compra_id) FROM stdin;
    public       postgres    false    163    1939       1935.dat           0    16399    ingressos_classes 
   TABLE DATA               F   COPY ingressos_classes (id, nome, total, vendidos, valor) FROM stdin;
    public       postgres    false    164    1939       1936.dat           0    16402    local 
   TABLE DATA               C   COPY local (id, nome, rua, bairro, capacidade, cidade) FROM stdin;
    public       postgres    false    165    1939       1937.dat           0    16405    partida 
   TABLE DATA               :   COPY partida (id, tipo, data, local_id, nome) FROM stdin;
    public       postgres    false    166    1939       1938.dat            2606    16409    compra_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public         postgres    false    161    161    1940                    2606    16411    comprador_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY comprador
    ADD CONSTRAINT comprador_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.comprador DROP CONSTRAINT comprador_pkey;
       public         postgres    false    162    162    1940                    2606    16413    ingresso_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_pkey PRIMARY KEY (id, partida_id, ingressos_classes_id, compra_id);
 @   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_pkey;
       public         postgres    false    163    163    163    163    163    1940                    2606    16415    ingressos_classes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY ingressos_classes
    ADD CONSTRAINT ingressos_classes_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ingressos_classes DROP CONSTRAINT ingressos_classes_pkey;
       public         postgres    false    164    164    1940                    2606    16417 
   local_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.local DROP CONSTRAINT local_pkey;
       public         postgres    false    165    165    1940                     2606    16419    partida_local_id_key 
   CONSTRAINT     T   ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_local_id_key UNIQUE (local_id);
 F   ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_local_id_key;
       public         postgres    false    166    166    1940         "           2606    16421    partida_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_pkey;
       public         postgres    false    166    166    1940         #           2606    16422    compra_comprador_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_comprador_id_fkey FOREIGN KEY (comprador_id) REFERENCES comprador(id);
 I   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_comprador_id_fkey;
       public       postgres    false    161    1815    162    1940         $           2606    16427    ingresso_compra_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES compra(id);
 J   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_compra_id_fkey;
       public       postgres    false    1813    163    161    1940         %           2606    16432 "   ingresso_ingressos_classes_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_ingressos_classes_id_fkey FOREIGN KEY (ingressos_classes_id) REFERENCES ingressos_classes(id);
 U   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_ingressos_classes_id_fkey;
       public       postgres    false    163    164    1819    1940         &           2606    16437    ingresso_partida_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES partida(id);
 K   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_partida_id_fkey;
       public       postgres    false    163    1825    166    1940         '           2606    16442    partida_local_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_local_id_fkey FOREIGN KEY (local_id) REFERENCES local(id);
 G   ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_local_id_fkey;
       public       postgres    false    1821    166    165    1940                                                                                                                                                                                                                                                                                                     1933.dat                                                                                            100600  004000  002000  00000000047 12307200441 007106  0                                                                                                    ustar00                                                                                                                                                                                                                                                        1	2014-03-09	1	1
2	2014-03-20	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         1934.dat                                                                                            100600  004000  002000  00000000170 12307200441 007104  0                                                                                                    ustar00                                                                                                                                                                                                                                                        1	ygor	123456789101	dos milagres	joao pessoa	123456789	paraΓ­ba	ao lado da minha vizinha	cristo redentor	123456678
\.


                                                                                                                                                                                                                                                                                                                                                                                                        1935.dat                                                                                            100600  004000  002000  00000000005 12307200441 007102  0                                                                                                    ustar00                                                                                                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           1936.dat                                                                                            100600  004000  002000  00000000005 12307200441 007103  0                                                                                                    ustar00                                                                                                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           1937.dat                                                                                            100600  004000  002000  00000000005 12307200441 007104  0                                                                                                    ustar00                                                                                                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           1938.dat                                                                                            100600  004000  002000  00000000005 12307200441 007105  0                                                                                                    ustar00                                                                                                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         100600  004000  002000  00000020555 12307200441 010227  0                                                                                                    ustar00                                                                                                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_local_id_fkey;
ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_partida_id_fkey;
ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_ingressos_classes_id_fkey;
ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_compra_id_fkey;
ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_comprador_id_fkey;
ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_pkey;
ALTER TABLE ONLY public.partida DROP CONSTRAINT partida_local_id_key;
ALTER TABLE ONLY public.local DROP CONSTRAINT local_pkey;
ALTER TABLE ONLY public.ingressos_classes DROP CONSTRAINT ingressos_classes_pkey;
ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_pkey;
ALTER TABLE ONLY public.comprador DROP CONSTRAINT comprador_pkey;
ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
DROP TABLE public.partida;
DROP TABLE public.local;
DROP TABLE public.ingressos_classes;
DROP TABLE public.ingresso;
DROP TABLE public.comprador;
DROP TABLE public.compra;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compra (
    id integer NOT NULL,
    data date DEFAULT ('now'::text)::date,
    forma_de_pagamento integer,
    comprador_id integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- Name: comprador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprador (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf_cod character varying(15) NOT NULL,
    rua character varying(100) NOT NULL,
    cidade character varying(20),
    telefone character varying(20),
    estado character varying(20),
    complemento character varying(300),
    bairro character varying(20),
    senha character varying(32) DEFAULT 12345678901234567890123456789011::numeric NOT NULL
);


ALTER TABLE public.comprador OWNER TO postgres;

--
-- Name: ingresso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingresso (
    id integer NOT NULL,
    data date NOT NULL,
    ingresso_classe_id integer NOT NULL,
    partida_id integer NOT NULL,
    ingressos_classes_id integer NOT NULL,
    compra_id integer NOT NULL
);


ALTER TABLE public.ingresso OWNER TO postgres;

--
-- Name: ingressos_classes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingressos_classes (
    id integer NOT NULL,
    nome character varying(30) NOT NULL,
    total integer NOT NULL,
    vendidos integer NOT NULL,
    valor real NOT NULL
);


ALTER TABLE public.ingressos_classes OWNER TO postgres;

--
-- Name: local; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE local (
    id integer NOT NULL,
    nome character varying(30) NOT NULL,
    rua character varying(50) NOT NULL,
    bairro character varying(50) NOT NULL,
    capacidade integer NOT NULL,
    cidade character varying
);


ALTER TABLE public.local OWNER TO postgres;

--
-- Name: partida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partida (
    id integer NOT NULL,
    tipo character varying(10) NOT NULL,
    data date NOT NULL,
    local_id integer NOT NULL,
    nome character varying(100)
);


ALTER TABLE public.partida OWNER TO postgres;

--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compra (id, data, forma_de_pagamento, comprador_id) FROM stdin;
\.
COPY compra (id, data, forma_de_pagamento, comprador_id) FROM '$$PATH$$/1933.dat';

--
-- Data for Name: comprador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprador (id, nome, cpf_cod, rua, cidade, telefone, estado, complemento, bairro, senha) FROM stdin;
\.
COPY comprador (id, nome, cpf_cod, rua, cidade, telefone, estado, complemento, bairro, senha) FROM '$$PATH$$/1934.dat';

--
-- Data for Name: ingresso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingresso (id, data, ingresso_classe_id, partida_id, ingressos_classes_id, compra_id) FROM stdin;
\.
COPY ingresso (id, data, ingresso_classe_id, partida_id, ingressos_classes_id, compra_id) FROM '$$PATH$$/1935.dat';

--
-- Data for Name: ingressos_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingressos_classes (id, nome, total, vendidos, valor) FROM stdin;
\.
COPY ingressos_classes (id, nome, total, vendidos, valor) FROM '$$PATH$$/1936.dat';

--
-- Data for Name: local; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY local (id, nome, rua, bairro, capacidade, cidade) FROM stdin;
\.
COPY local (id, nome, rua, bairro, capacidade, cidade) FROM '$$PATH$$/1937.dat';

--
-- Data for Name: partida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partida (id, tipo, data, local_id, nome) FROM stdin;
\.
COPY partida (id, tipo, data, local_id, nome) FROM '$$PATH$$/1938.dat';

--
-- Name: compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- Name: comprador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprador
    ADD CONSTRAINT comprador_pkey PRIMARY KEY (id);


--
-- Name: ingresso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_pkey PRIMARY KEY (id, partida_id, ingressos_classes_id, compra_id);


--
-- Name: ingressos_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingressos_classes
    ADD CONSTRAINT ingressos_classes_pkey PRIMARY KEY (id);


--
-- Name: local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);


--
-- Name: partida_local_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_local_id_key UNIQUE (local_id);


--
-- Name: partida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_pkey PRIMARY KEY (id);


--
-- Name: compra_comprador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_comprador_id_fkey FOREIGN KEY (comprador_id) REFERENCES comprador(id);


--
-- Name: ingresso_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES compra(id);


--
-- Name: ingresso_ingressos_classes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_ingressos_classes_id_fkey FOREIGN KEY (ingressos_classes_id) REFERENCES ingressos_classes(id);


--
-- Name: ingresso_partida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresso
    ADD CONSTRAINT ingresso_partida_id_fkey FOREIGN KEY (partida_id) REFERENCES partida(id);


--
-- Name: partida_local_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partida
    ADD CONSTRAINT partida_local_id_fkey FOREIGN KEY (local_id) REFERENCES local(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   