--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:19:49

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
-- TOC entry 2654 (class 1259 OID 232756)
-- Name: config_web_layer; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_layer (
    layer_id text NOT NULL,
    is_parent boolean,
    tableparent_id text,
    is_editable boolean,
    tableinfo_id text,
    formid text,
    formname text,
    orderby integer,
    link_id text,
    is_tiled boolean
);


ALTER TABLE SCHEMA_NAME.config_web_layer OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232756)
-- Dependencies: 2654
-- Data for Name: config_web_layer; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_plan_psector', false, NULL, false, 'v_edit_plan_psector', 'F11', 'Psector', 5, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_node', true, 'v_web_parent_node', false, NULL, 'F11', 'Node', 2, 'link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_ui_element', false, NULL, false, 'v_ui_element', 'F11', 'Element', 99, 'link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_ui_workcat_polygon', false, NULL, false, 'v_ui_workcat_polygon', 'F14', 'Workcat', 6, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_man_junction', false, NULL, true, NULL, 'F11', 'Node', NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_man_pipe', false, NULL, true, NULL, 'F13', 'Pipe', NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_man_wjoin', false, NULL, true, NULL, 'F14', 'Wjoin', NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_arc', true, 'v_web_parent_arc', false, NULL, 'F13', 'Arc', 3, 'link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_ui_hydrometer', false, NULL, false, 'v_ui_hydrometer', 'F11', 'Hydrometer', 99, 'hydrometer_link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_edit_connec', true, 'v_web_parent_connec', false, NULL, 'F14', 'Connec', 4, 'link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('v_anl_mincut_result_valve', false, NULL, true, NULL, 'F11', 'Mincut Valve', 1, 'link', NULL);
INSERT INTO SCHEMA_NAME.config_web_layer (layer_id, is_parent, tableparent_id, is_editable, tableinfo_id, formid, formname, orderby, link_id, is_tiled) VALUES ('ve_visit_incident', false, NULL, false, 'v_ui_visit_incident', NULL, 'Incident generic', 1, NULL, NULL);


--
-- TOC entry 15624 (class 2606 OID 232763)
-- Name: config_web_layer config_web_layer_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_layer
    ADD CONSTRAINT config_web_layer_pkey PRIMARY KEY (layer_id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2654
-- Name: TABLE config_web_layer; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer TO qgisserver;


-- Completed on 2022-05-17 11:19:53

--
-- PostgreSQL database dump complete
--

