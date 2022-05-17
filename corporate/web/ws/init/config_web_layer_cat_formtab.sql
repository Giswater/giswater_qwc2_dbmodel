--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:20:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2651 (class 1259 OID 232732)
-- Name: config_web_layer_cat_formtab; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_layer_cat_formtab (
    id text NOT NULL
);


ALTER TABLE SCHEMA_NAME.config_web_layer_cat_formtab OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232732)
-- Dependencies: 2651
-- Data for Name: config_web_layer_cat_formtab; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabConnect');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabDoc');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabElement');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabVisit');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabHydro');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabMincut');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabNetwork');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabSearch');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabWorkcat');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabPsector');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabState');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabExpl');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabExploitation');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabNetworkState');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabHydroState');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabAddress');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_formtab (id) VALUES ('tabLotSelector');


--
-- TOC entry 15624 (class 2606 OID 232739)
-- Name: config_web_layer_cat_formtab config_web_layer_cat_formtab_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_layer_cat_formtab
    ADD CONSTRAINT config_web_layer_cat_formtab_pkey PRIMARY KEY (id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2651
-- Name: TABLE config_web_layer_cat_formtab; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_cat_formtab TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_cat_formtab TO qgisserver;


-- Completed on 2022-05-17 11:20:55

--
-- PostgreSQL database dump complete
--

