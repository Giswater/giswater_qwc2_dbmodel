--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:22:08

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
-- TOC entry 2658 (class 1259 OID 232787)
-- Name: config_web_tableinfo_x_inforole; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_tableinfo_x_inforole (
    id integer NOT NULL,
    tableinfo_id character varying(50),
    inforole_id integer,
    tableinforole_id text
);


ALTER TABLE SCHEMA_NAME.config_web_tableinfo_x_inforole OWNER TO role_admin;

--
-- TOC entry 2657 (class 1259 OID 232785)
-- Name: config_web_tableinfo_x_inforole_id_seq; Type: SEQUENCE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE SEQUENCE SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq OWNER TO role_admin;

--
-- TOC entry 17116 (class 0 OID 0)
-- Dependencies: 2657
-- Name: config_web_tableinfo_x_inforole_id_seq; Type: SEQUENCE OWNED BY; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER SEQUENCE SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq OWNED BY SCHEMA_NAME.config_web_tableinfo_x_inforole.id;


--
-- TOC entry 15623 (class 2604 OID 232790)
-- Name: config_web_tableinfo_x_inforole id; Type: DEFAULT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_tableinfo_x_inforole ALTER COLUMN id SET DEFAULT nextval('SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq'::regclass);


--
-- TOC entry 17109 (class 0 OID 232787)
-- Dependencies: 2658
-- Data for Name: config_web_tableinfo_x_inforole; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (1, 'v_edit_plan_psector', 0, 'v_edit_plan_psector');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (2, 'v_ui_element', 0, 'v_ui_element');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (3, 'v_ui_workcat_polygon', 0, 'v_ui_workcat_polygon');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (4, 'v_ui_hydrometer', 0, 'v_ui_hydrometer');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (5, 've_node_pr_break_valve', 0, 've_node_pr_break_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (6, 've_node_pr_susta_valve', 0, 've_node_pr_susta_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (7, 've_node_control_register', 0, 've_node_control_register');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (8, 've_node_fl_contr_valve', 0, 've_node_fl_contr_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (9, 've_node_gen_purp_valve', 0, 've_node_gen_purp_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (10, 've_node_throttle_valve', 0, 've_node_throttle_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (11, 've_node_bypass_register', 0, 've_node_bypass_register');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (12, 've_node_valve_register', 0, 've_node_valve_register');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (13, 've_node_adaptation', 0, 've_node_adaptation');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (14, 've_node_clorinathor', 0, 've_node_clorinathor');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (15, 've_node_air_valve', 0, 've_node_air_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (16, 've_node_check_valve', 0, 've_node_check_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (17, 've_node_curve', 0, 've_node_curve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (18, 've_node_endline', 0, 've_node_endline');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (19, 've_node_expantank', 0, 've_node_expantank');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (20, 've_node_filter', 0, 've_node_filter');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (21, 've_node_flexunion', 0, 've_node_flexunion');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (22, 've_node_flowmeter', 0, 've_node_flowmeter');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (23, 've_connec_fountain', 0, 've_connec_fountain');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (24, 've_node_green_valve', 0, 've_node_green_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (25, 've_connec_greentap', 0, 've_connec_greentap');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (26, 've_node_hydrant', 0, 've_node_hydrant');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (27, 've_node_junction', 0, 've_node_junction');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (28, 've_node_manhole', 0, 've_node_manhole');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (29, 've_node_netelement', 0, 've_node_netelement');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (30, 've_node_netsamplepoint', 0, 've_node_netsamplepoint');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (31, 've_node_outfall_valve', 0, 've_node_outfall_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (32, 've_arc_pipe', 0, 've_arc_pipe');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (33, 've_node_pr_reduc_valve', 0, 've_node_pr_reduc_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (34, 've_node_pressure_meter', 0, 've_node_pressure_meter');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (35, 've_node_pump', 0, 've_node_pump');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (36, 've_node_reduction', 0, 've_node_reduction');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (37, 've_node_register', 0, 've_node_register');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (38, 've_node_shutoff_valve', 0, 've_node_shutoff_valve');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (39, 've_node_source', 0, 've_node_source');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (40, 've_node_t', 0, 've_node_t');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (41, 've_node_tank', 0, 've_node_tank');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (42, 've_connec_tap', 0, 've_connec_tap');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (43, 've_arc_varc', 0, 've_arc_varc');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (44, 've_connec_vconnec', 0, 've_connec_vconnec');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (45, 've_node_water_connection', 0, 've_node_water_connection');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (46, 've_node_waterwell', 0, 've_node_waterwell');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (47, 've_connec_wjoin', 0, 've_connec_wjoin');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (48, 've_node_wtp', 0, 've_node_wtp');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (49, 've_node_x', 0, 've_node_x');
INSERT INTO SCHEMA_NAME.config_web_tableinfo_x_inforole (id, tableinfo_id, inforole_id, tableinforole_id) VALUES (50, 'v_ui_visit_incident', 0, 'v_ui_visit_incident');


--
-- TOC entry 17118 (class 0 OID 0)
-- Dependencies: 2657
-- Name: config_web_tableinfo_x_inforole_id_seq; Type: SEQUENCE SET; Schema: SCHEMA_NAME; Owner: role_admin
--

SELECT pg_catalog.setval('SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq', 50, true);


--
-- TOC entry 15625 (class 2606 OID 232795)
-- Name: config_web_tableinfo_x_inforole config_web_tableinfo_x_inforole_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_tableinfo_x_inforole
    ADD CONSTRAINT config_web_tableinfo_x_inforole_pkey PRIMARY KEY (id);


--
-- TOC entry 17115 (class 0 OID 0)
-- Dependencies: 2658
-- Name: TABLE config_web_tableinfo_x_inforole; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_tableinfo_x_inforole TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_tableinfo_x_inforole TO qgisserver;


--
-- TOC entry 17117 (class 0 OID 0)
-- Dependencies: 2657
-- Name: SEQUENCE config_web_tableinfo_x_inforole_id_seq; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT ALL ON SEQUENCE SCHEMA_NAME.config_web_tableinfo_x_inforole_id_seq TO role_basic;


-- Completed on 2022-05-17 11:22:12

--
-- PostgreSQL database dump complete
--

