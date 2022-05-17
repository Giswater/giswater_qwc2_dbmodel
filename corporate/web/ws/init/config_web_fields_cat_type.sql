--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:17:12

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
-- TOC entry 2653 (class 1259 OID 232748)
-- Name: config_web_fields_cat_type; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_fields_cat_type (
    id text NOT NULL
);


ALTER TABLE SCHEMA_NAME.config_web_fields_cat_type OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232748)
-- Dependencies: 2653
-- Data for Name: config_web_fields_cat_type; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('text');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('combo');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('textarea');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('checkbox');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('datepickertime');
INSERT INTO SCHEMA_NAME.config_web_fields_cat_type (id) VALUES ('formDivider');


--
-- TOC entry 15624 (class 2606 OID 232755)
-- Name: config_web_fields_cat_type config_web_fields_cat_type_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields_cat_type
    ADD CONSTRAINT config_web_fields_cat_type_pkey PRIMARY KEY (id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2653
-- Name: TABLE config_web_fields_cat_type; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields_cat_type TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields_cat_type TO qgisserver;


-- Completed on 2022-05-17 11:17:16

--
-- PostgreSQL database dump complete
--

