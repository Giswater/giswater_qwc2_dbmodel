--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:18:56

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
-- TOC entry 2650 (class 1259 OID 232724)
-- Name: config_web_fields_cat_datatype; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_fields_cat_datatype (
    id text NOT NULL
);


ALTER TABLE SCHEMA_NAME.config_web_fields_cat_datatype OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232724)
-- Dependencies: 2650
-- Data for Name: config_web_fields_cat_datatype; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_fields_cat_datatype (id) VALUES ('string');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_datatype (id) VALUES ('boolean');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_datatype (id) VALUES ('double');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_datatype (id) VALUES ('date');


--
-- TOC entry 15624 (class 2606 OID 232731)
-- Name: config_web_fields_cat_datatype config_web_fields_cat_datatype_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields_cat_datatype
    ADD CONSTRAINT config_web_fields_cat_datatype_pkey PRIMARY KEY (id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2650
-- Name: TABLE config_web_fields_cat_datatype; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields_cat_datatype TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields_cat_datatype TO qgisserver;


-- Completed on 2022-05-17 11:19:01

--
-- PostgreSQL database dump complete
--

