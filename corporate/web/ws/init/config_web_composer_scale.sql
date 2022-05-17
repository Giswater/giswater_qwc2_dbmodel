--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:12:14

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
-- TOC entry 2663 (class 1259 OID 232818)
-- Name: config_web_composer_scale; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_composer_scale (
    id integer NOT NULL,
    idval text,
    descript text,
    orderby integer
);


ALTER TABLE SCHEMA_NAME.config_web_composer_scale OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232818)
-- Dependencies: 2663
-- Data for Name: config_web_composer_scale; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (100, '1:100', NULL, 1);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (200, '1:200', NULL, 2);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (500, '1:500', NULL, 3);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (1000, '1:1000', NULL, 4);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (2000, '1:2000', NULL, 5);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (10000, '1:10000', NULL, 6);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (50000, '1:50000', NULL, 7);
INSERT INTO SCHEMA_NAME.config_web_composer_scale (id, idval, descript, orderby) VALUES (5000, '1:5000', NULL, NULL);


--
-- TOC entry 15624 (class 2606 OID 232825)
-- Name: config_web_composer_scale config_web_composer_scale_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_composer_scale
    ADD CONSTRAINT config_web_composer_scale_pkey PRIMARY KEY (id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2663
-- Name: TABLE config_web_composer_scale; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_composer_scale TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_composer_scale TO qgisserver;


-- Completed on 2022-05-17 11:12:18

--
-- PostgreSQL database dump complete
--

