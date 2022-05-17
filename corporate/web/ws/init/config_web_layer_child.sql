--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:21:16

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
-- TOC entry 2655 (class 1259 OID 232764)
-- Name: config_web_layer_child; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_layer_child (
    featurecat_id character varying(30) NOT NULL,
    tableinfo_id text
);


ALTER TABLE SCHEMA_NAME.config_web_layer_child OWNER TO role_admin;

--
-- TOC entry 17107 (class 0 OID 232764)
-- Dependencies: 2655
-- Data for Name: config_web_layer_child; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PR_BREAK_VALVE', 've_node_pr_break_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PR_SUSTA_VALVE', 've_node_pr_susta_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('CONTROL_REGISTER', 've_node_control_register');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('FL_CONTR_VALVE', 've_node_fl_contr_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('GEN_PURP_VALVE', 've_node_gen_purp_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('THROTTLE_VALVE', 've_node_throttle_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('BYPASS_REGISTER', 've_node_bypass_register');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('VALVE_REGISTER', 've_node_valve_register');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('ADAPTATION', 've_node_adaptation');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('CLORINATHOR', 've_node_clorinathor');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('AIR_VALVE', 've_node_air_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('CHECK_VALVE', 've_node_check_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('CURVE', 've_node_curve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('ENDLINE', 've_node_endline');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('EXPANTANK', 've_node_expantank');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('FILTER', 've_node_filter');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('FLEXUNION', 've_node_flexunion');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('FLOWMETER', 've_node_flowmeter');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('FOUNTAIN', 've_connec_fountain');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('GREEN_VALVE', 've_node_green_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('GREENTAP', 've_connec_greentap');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('HYDRANT', 've_node_hydrant');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('JUNCTION', 've_node_junction');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('MANHOLE', 've_node_manhole');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('NETELEMENT', 've_node_netelement');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('NETSAMPLEPOINT', 've_node_netsamplepoint');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('OUTFALL_VALVE', 've_node_outfall_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PIPE', 've_arc_pipe');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PR_REDUC_VALVE', 've_node_pr_reduc_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PRESSURE_METER', 've_node_pressure_meter');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('PUMP', 've_node_pump');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('REDUCTION', 've_node_reduction');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('REGISTER', 've_node_register');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('SHUTOFF_VALVE', 've_node_shutoff_valve');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('SOURCE', 've_node_source');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('T', 've_node_t');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('TANK', 've_node_tank');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('TAP', 've_connec_tap');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('VARC', 've_arc_varc');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('VCONNEC', 've_connec_vconnec');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('WATER_CONNECTION', 've_node_water_connection');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('WATERWELL', 've_node_waterwell');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('WJOIN', 've_connec_wjoin');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('WTP', 've_node_wtp');
INSERT INTO SCHEMA_NAME.config_web_layer_child (featurecat_id, tableinfo_id) VALUES ('X', 've_node_x');


--
-- TOC entry 15624 (class 2606 OID 232771)
-- Name: config_web_layer_child config_web_layer_child_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_layer_child
    ADD CONSTRAINT config_web_layer_child_pkey PRIMARY KEY (featurecat_id);


--
-- TOC entry 17113 (class 0 OID 0)
-- Dependencies: 2655
-- Name: TABLE config_web_layer_child; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_child TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_layer_child TO qgisserver;


-- Completed on 2022-05-17 11:21:21

--
-- PostgreSQL database dump complete
--

