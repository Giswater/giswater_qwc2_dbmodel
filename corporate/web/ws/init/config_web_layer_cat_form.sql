--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:20:29

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
-- TOC entry 2652 (class 1259 OID 232740)
-- Name: config_web_layer_cat_form; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_layer_cat_form (
    id text NOT NULL,
    name text
);


ALTER TABLE SCHEMA_NAME.config_web_layer_cat_form OWNER TO role_admin;

--
-- TOC entry 17109 (class 0 OID 232740)
-- Dependencies: 2652
-- Data for Name: config_web_layer_cat_form; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F11', 'INFO_UD_NODE');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F12', 'INFO_WS_NODE');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F13', 'INFO_UTILS_ARC');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F14', 'INFO_UTILS_CONNEC');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F15', 'INFO_UD_GULLY');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F16', 'GENERIC');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F21', 'VISIT');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F22', 'VISIT_EVENT_STANDARD');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F23', 'VISIT_EVENT_UD_ARC_STANDARD');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F24', 'VISIT_EVENT_UD_ARC_REHABIT');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F25', 'VISIT_MANAGER');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F26', 'ADD_MULTIPLE_VISIT');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F27', 'GALLERY');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F31', 'SEARCH');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F32', 'PRINT');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F33', 'FILTER');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F41', 'MINCUT_NEW');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F42', 'MINCUT_ADD_CONNEC');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F43', 'MINCUT_ADD_HYDROMETER');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F44', 'MINCUT_END');
INSERT INTO SCHEMA_NAME.config_web_layer_cat_form (id, name) VALUES ('F45', 'MINCUT_MANAGEMENT');


--
-- TOC entry 15624 (class 2606 OID 232845)
-- Name: config_web_layer_cat_form config_web_layer_cat_form_name_unique; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_layer_cat_form
    ADD CONSTRAINT config_web_layer_cat_form_name_unique UNIQUE (name);


--
-- TOC entry 15626 (class 2606 OID 232747)
-- Name: config_web_layer_cat_form config_web_layer_cat_form_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_layer_cat_form
    ADD CONSTRAINT config_web_layer_cat_form_pkey PRIMARY KEY (id);


--
-- TOC entry 17115 (class 0 OID 0)
-- Dependencies: 2652
-- Name: TABLE config_web_layer_cat_form; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_cat_form TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_cat_form TO qgisserver;


-- Completed on 2022-05-17 11:20:33

--
-- PostgreSQL database dump complete
--

