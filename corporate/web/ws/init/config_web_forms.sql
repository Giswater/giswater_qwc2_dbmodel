--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:19:18

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
-- TOC entry 2662 (class 1259 OID 232809)
-- Name: config_web_forms; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_forms (
    id integer NOT NULL,
    table_id character varying(50),
    query_text text,
    device integer,
    order_by character varying(30)
);


ALTER TABLE SCHEMA_NAME.config_web_forms OWNER TO role_admin;

--
-- TOC entry 2661 (class 1259 OID 232807)
-- Name: config_web_forms_id_seq; Type: SEQUENCE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE SEQUENCE SCHEMA_NAME.config_web_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE SCHEMA_NAME.config_web_forms_id_seq OWNER TO role_admin;

--
-- TOC entry 17116 (class 0 OID 0)
-- Dependencies: 2661
-- Name: config_web_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER SEQUENCE SCHEMA_NAME.config_web_forms_id_seq OWNED BY SCHEMA_NAME.config_web_forms.id;


--
-- TOC entry 15623 (class 2604 OID 232812)
-- Name: config_web_forms id; Type: DEFAULT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_forms ALTER COLUMN id SET DEFAULT nextval('SCHEMA_NAME.config_web_forms_id_seq'::regclass);


--
-- TOC entry 17109 (class 0 OID 232809)
-- Dependencies: 2662
-- Data for Name: config_web_forms; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (211, 'arc_x_element', 'SELECT arc.workcat_id AS sys_id, ''v_ui_workcat_polygon'' AS sys_table_id, ''workcat_id'' AS sys_idname, code, workcat_id_end, arc.descript, arc.dma_id, arc.workcat_id  FROM v_ui_workcat_polygon JOIN arc ON v_ui_workcat_polygon.workcat_id=arc.workcat_id', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (212, 'arc_x_element', 'SELECT arc.workcat_id AS sys_id, ''v_ui_workcat_polygon'' AS sys_table_id, ''workcat_id'' AS sys_idname, code, workcat_id_end, arc.descript, arc.dma_id, arc.workcat_id  FROM v_ui_workcat_polygon JOIN arc ON v_ui_workcat_polygon.workcat_id=arc.workcat_id', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (213, 'arc_x_element', 'SELECT arc.workcat_id AS sys_id, ''v_ui_workcat_polygon'' AS sys_table_id, ''workcat_id'' AS sys_idname, code, workcat_id_end, arc.descript, arc.dma_id, arc.workcat_id  FROM v_ui_workcat_polygon JOIN arc ON v_ui_workcat_polygon.workcat_id=arc.workcat_id', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (142, 'node_x_connect_downstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_downstream', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (143, 'node_x_connect_downstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_downstream', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (511, 'workcat_x_element', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (512, 'workcat_x_element', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (513, 'workcat_x_element', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (532, 'workcat_x_hydro', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature_end', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (531, 'workcat_x_hydro', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature_end', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (533, 'workcat_x_hydro', 'SELECT feature_id as sys_id, concat (''v_edit_'', lower(feature_type)) as sys_table_id, concat(lower(feature_type),''_id'') AS sys_idname, feature_id, feature_type FROM v_ui_workcat_x_feature_end', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (161, 'node_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_node', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (162, 'node_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_node', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (163, 'node_x_doc', 'SELECT doc_id as sys_id, doc_id, doc_type, path as sys_link FROM v_ui_doc_x_node', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (231, 'arc_x_hydro', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_arc', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (232, 'arc_x_hydro', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_arc', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (261, 'arc_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (233, 'arc_x_hydro', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_arc', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (262, 'arc_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (311, 'connec_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_connec', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (263, 'arc_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (361, 'connec_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (312, 'connec_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_connec', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (362, 'connec_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (363, 'connec_x_doc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (313, 'connec_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_connec', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (141, 'node_x_connect_downstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_downstream', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (352, 'connec_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_connec', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (251, 'arc_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_arc', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (252, 'arc_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_arc', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (253, 'arc_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_arc', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (351, 'connec_x_visit', 'SELECT visit_id AS sys_visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor, descript, visit_start::date::text  as date FROM v_ui_om_visit_x_connec', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (154, 'node_x_visit_manager', 'SELECT visit_id AS sys_id, visit_start AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_node
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_node.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (354, 'connec_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_connec
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_connec.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (353, 'connec_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_connec', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (111, 'node_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_node', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (112, 'node_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_node', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (113, 'node_x_element', 'SELECT element_id as sys_id, ''v_ui_element'' as sys_table_id, ''element_id'' AS sys_idname, element_id, elementcat_id FROM v_ui_element_x_node', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (333, 'connec_x_hydro', 'SELECT hydrometer_id as sys_id, hydrometer_id as sys_idname, ''v_ui_hydrometer'' AS sys_table_id,  hydrometer_customer_code as "Codi abonat"  FROM v_rtc_hydrometer', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (242, 'arc_x_connect', 'SELECT feature_id as sys_id, catalog AS "ESCOMESA", ''connec_id'' AS sys_idname, ''v_edit_connec'' AS  sys_table_id  FROM v_ui_arc_x_relations', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (144, 'node_x_connect_upstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_upstream', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (243, 'arc_x_connect', 'SELECT feature_id as sys_id, catalog AS "ESCOMESA", ''connec_id'' AS sys_idname, ''v_edit_connec'' AS  sys_table_id  FROM v_ui_arc_x_relations', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (145, 'node_x_connect_upstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_upstream', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (146, 'node_x_connect_upstream', 'SELECT feature_id as sys_id, arccat_id AS "CANONADA", ''arc_id'' AS sys_idname, ''v_edit_arc'' AS  sys_table_id  FROM v_ui_node_x_connection_upstream', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (332, 'connec_x_hydro', 'SELECT hydrometer_id as sys_id, hydrometer_id as sys_idname, ''v_ui_hydrometer'' AS sys_table_id,  hydrometer_customer_code as "Codi abonat"  FROM v_rtc_hydrometer', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (153, 'node_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_id, visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_node', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (152, 'node_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_node', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (151, 'node_x_visit', 'SELECT event_id AS sys_id,  descript AS "Event", descript AS "sys_parameter_name", parameter_type AS sys_parameter_type, value as "Valor", visit_start::date::text  as "Data", visit_start::date AS sys_date, parameter_id AS sys_parameter_id  FROM v_ui_om_visit_x_node', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (241, 'arc_x_connect', 'SELECT feature_id as sys_id, catalog AS "ESCOMESA", ''connec_id'' AS sys_idname, ''v_edit_connec'' AS  sys_table_id  FROM v_ui_arc_x_relations', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (331, 'connec_x_hydro', 'SELECT hydrometer_id as sys_id, hydrometer_id as sys_idname, ''v_ui_hydrometer'' AS sys_table_id,  hydrometer_customer_code as "Codi abonat"  FROM v_rtc_hydrometer', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (171, 'node_x_mincut', 'SELECT node_id AS sys_node_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_node LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (172, 'node_x_mincut', 'SELECT node_id AS sys_node_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_node LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (173, 'node_x_mincut', 'SELECT node_id AS sys_node_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_node LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (271, 'arc_x_mincut', 'SELECT arc_id AS sys_arc_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_arc LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (272, 'arc_x_mincut', 'SELECT arc_id AS sys_arc_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_arc LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (273, 'arc_x_mincut', 'SELECT arc_id AS sys_arc_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_arc LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (371, 'connec_x_mincut', 'SELECT connec_id AS sys_connec_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_connec LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (372, 'connec_x_mincut', 'SELECT connec_id AS sys_connec_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_connec LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (373, 'connec_x_mincut', 'SELECT connec_id AS sys_connec_id, result_id AS "sys_id", result_id AS "Mincut Id", work_order AS "Work order", mincut_state AS "State", mincut_type AS "Type", received_date AS "Date", anl_cause AS "Cause", anl_descript AS "Descript" FROM anl_mincut_result_connec LEFT JOIN anl_mincut_result_cat ON (result_id = anl_mincut_result_cat.id)', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (155, 'node_x_visit_manager', 'SELECT visit_id AS sys_id, visit_start AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_node
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_node.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (356, 'connec_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_connec
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_connec.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (256, 'arc_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_arc
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_arc.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (255, 'arc_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_arc
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_arc.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (254, 'arc_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_arc
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_arc.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (355, 'connec_x_visit_manager', 'SELECT visit_id AS sys_id, date(visit_start) AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_connec
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_connec.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_forms (id, table_id, query_text, device, order_by) VALUES (156, 'node_x_visit_manager', 'SELECT visit_id AS sys_id, visit_start AS "Date", config_visit_class.idval AS "Visit class", om_visit.user_name AS "Visit user"
FROM v_ui_om_visitman_x_node
JOIN om_visit ON om_visit.id=v_ui_om_visitman_x_node.visit_id
LEFT JOIN config_visit_class ON config_visit_class.id=om_visit.class_id', 3, NULL);


--
-- TOC entry 17118 (class 0 OID 0)
-- Dependencies: 2661
-- Name: config_web_forms_id_seq; Type: SEQUENCE SET; Schema: SCHEMA_NAME; Owner: role_admin
--

SELECT pg_catalog.setval('SCHEMA_NAME.config_web_forms_id_seq', 1, false);


--
-- TOC entry 15625 (class 2606 OID 232817)
-- Name: config_web_forms config_client_forms_web_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_forms
    ADD CONSTRAINT config_client_forms_web_pkey PRIMARY KEY (id);


--
-- TOC entry 17115 (class 0 OID 0)
-- Dependencies: 2662
-- Name: TABLE config_web_forms; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_forms TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_forms TO qgisserver;


--
-- TOC entry 17117 (class 0 OID 0)
-- Dependencies: 2661
-- Name: SEQUENCE config_web_forms_id_seq; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT ALL ON SEQUENCE SCHEMA_NAME.config_web_forms_id_seq TO role_basic;


-- Completed on 2022-05-17 11:19:22

--
-- PostgreSQL database dump complete
--

