--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:17:54

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
-- TOC entry 2660 (class 1259 OID 232798)
-- Name: config_web_fields; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_fields (
    id integer NOT NULL,
    table_id character varying(50),
    name character varying(30),
    is_mandatory boolean,
    "dataType" text,
    field_length integer,
    num_decimals integer,
    placeholder text,
    label text,
    type text,
    dv_table text,
    dv_id_column text,
    dv_name_column text,
    sql_text text,
    is_enabled boolean,
    orderby integer,
    is_navigation boolean
);


ALTER TABLE SCHEMA_NAME.config_web_fields OWNER TO role_admin;

--
-- TOC entry 2659 (class 1259 OID 232796)
-- Name: config_web_fields_id_seq; Type: SEQUENCE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE SEQUENCE SCHEMA_NAME.config_web_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE SCHEMA_NAME.config_web_fields_id_seq OWNER TO role_admin;

--
-- TOC entry 17118 (class 0 OID 0)
-- Dependencies: 2659
-- Name: config_web_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER SEQUENCE SCHEMA_NAME.config_web_fields_id_seq OWNED BY SCHEMA_NAME.config_web_fields.id;


--
-- TOC entry 15623 (class 2604 OID 232801)
-- Name: config_web_fields id; Type: DEFAULT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields ALTER COLUMN id SET DEFAULT nextval('SCHEMA_NAME.config_web_fields_id_seq'::regclass);


--
-- TOC entry 17111 (class 0 OID 232798)
-- Dependencies: 2660
-- Data for Name: config_web_fields; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (1, 'F22', 'parameter_id', NULL, 'string', 30, NULL, 'parameter', 'parameter_id', 'text', NULL, NULL, NULL, NULL, true, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (2, 'F22', 'value', NULL, 'string', NULL, NULL, '0.00', 'value', 'text', NULL, NULL, NULL, NULL, true, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (3, 'F22', 'text', NULL, 'string', NULL, NULL, '', 'text', 'text', NULL, NULL, NULL, NULL, true, 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (4, 'F23', 'parameter_id', NULL, 'string', NULL, NULL, 'parameter', 'parameter_id', 'text', NULL, NULL, NULL, NULL, true, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (5, 'F23', 'position_id', NULL, 'string', NULL, NULL, '', 'position_id', 'text', NULL, NULL, NULL, NULL, true, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (6, 'F23', 'position_value', NULL, 'string', NULL, NULL, '', 'position_value', 'text', NULL, NULL, NULL, NULL, true, 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (7, 'F23', 'value', NULL, 'string', NULL, NULL, '0.00', 'value', 'text', NULL, NULL, NULL, NULL, true, 4, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (8, 'F23', 'text', NULL, 'string', NULL, NULL, '', 'text', 'text', NULL, NULL, NULL, NULL, true, 5, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (10, 'F24', 'parameter_id', NULL, 'string', 30, NULL, 'parameter', 'id', 'text', NULL, NULL, NULL, NULL, false, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (11, 'F24', 'position_id', NULL, 'string', 30, NULL, '', 'position_id', 'text', NULL, NULL, NULL, NULL, true, 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (12, 'F24', 'position_value', NULL, 'string', 12, NULL, '0.00', 'position_value', 'text', NULL, NULL, NULL, NULL, true, 4, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (13, 'F24', 'value1', NULL, 'string', NULL, NULL, '0.00', 'value1', 'text', NULL, NULL, NULL, NULL, true, 6, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (14, 'F24', 'value2', NULL, 'string', NULL, NULL, '0.00', 'value2', 'text', NULL, NULL, NULL, NULL, true, 7, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (15, 'F24', 'geom1', NULL, 'string', NULL, NULL, '0.00', 'geom1', 'text', NULL, NULL, NULL, NULL, true, 8, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (16, 'F24', 'geom2', NULL, 'string', NULL, NULL, '0.00', 'geom2', 'text', NULL, NULL, NULL, NULL, true, 9, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (17, 'F24', 'geom3', NULL, 'string', NULL, NULL, '0.00', 'geom3', 'text', NULL, NULL, NULL, NULL, true, 10, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (18, 'F24', 'value', NULL, 'string', 12, NULL, '0.00', 'value', 'text', NULL, NULL, NULL, NULL, true, 5, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (24, 'F31', 'hydro_expl', NULL, NULL, NULL, NULL, NULL, 'Explotació:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (25, 'F31', 'hydro_search', NULL, NULL, NULL, NULL, NULL, 'Abonat:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (26, 'F31', 'workcat_search', NULL, NULL, NULL, NULL, NULL, 'Expedient:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (27, 'F31', 'psector_expl', NULL, NULL, NULL, NULL, NULL, 'Explotació:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (28, 'F31', 'psector_search', NULL, NULL, NULL, NULL, NULL, 'Psector:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (29, 'F31', 'add_postnumber', NULL, NULL, NULL, NULL, NULL, 'Núm.:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (30, 'F31', 'generic_search', NULL, NULL, NULL, NULL, NULL, 'Cerca:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (31, 'F31', 'net_type', NULL, NULL, NULL, NULL, NULL, 'Tipus:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (32, 'F31', 'net_code', NULL, NULL, NULL, NULL, NULL, 'Codi:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (33, 'F31', 'add_muni', NULL, NULL, NULL, NULL, NULL, 'Municipi:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (34, 'F31', 'add_street', NULL, NULL, NULL, NULL, NULL, 'Carrer:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (38, 'F31', 'visit_search', NULL, NULL, NULL, NULL, NULL, 'Visita:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (290, 'F45', 'mincut_muni', NULL, NULL, NULL, NULL, NULL, 'Municipi:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (291, 'F45', 'mincut_class', NULL, NULL, NULL, NULL, NULL, 'Classe:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (292, 'F45', 'mincut_workorder', NULL, NULL, NULL, NULL, NULL, 'Expedient:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (297, 'F32', 'composer', true, 'string', NULL, NULL, NULL, 'Composer:', 'combo', 'config_web_composer', 'id', 'id', NULL, true, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (295, 'F32', 'descript', true, 'string', NULL, NULL, 'descript', 'Descripcio:', 'textarea', NULL, NULL, NULL, NULL, true, 5, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (300, 'F32', 'scale', true, 'string', NULL, NULL, NULL, 'Escala:', 'combo', 'config_web_composer_scale', 'id', 'idval', NULL, true, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (294, 'F32', 'title', true, 'string', NULL, NULL, 'title', 'Titol:', 'text', NULL, NULL, NULL, NULL, true, 4, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (296, 'F32_', 'date', true, 'date', NULL, NULL, NULL, 'Data:', 'datepickertime', NULL, NULL, NULL, NULL, true, 6, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (304, 'F32', 'divider', false, 'string', NULL, NULL, NULL, NULL, 'formDivider', NULL, NULL, NULL, NULL, true, 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (280, 'v_anl_mincut_result_valve', 'id', false, 'string', NULL, NULL, NULL, 'Id:', 'text', NULL, NULL, NULL, NULL, false, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (281, 'v_anl_mincut_result_valve', 'result_id', false, 'double', 32, 0, NULL, 'Result id:', 'text', NULL, NULL, NULL, NULL, false, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (282, 'v_anl_mincut_result_valve', 'work_order', false, 'string', NULL, NULL, NULL, 'Work order:', 'text', NULL, NULL, NULL, NULL, true, 3, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (283, 'v_anl_mincut_result_valve', 'node_id', false, 'string', NULL, NULL, NULL, 'Node_id:', 'text', NULL, NULL, NULL, NULL, false, 4, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (284, 'v_anl_mincut_result_valve', 'closed', false, 'boolean', NULL, NULL, NULL, 'Closed:', 'text', NULL, NULL, NULL, NULL, false, 5, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (285, 'v_anl_mincut_result_valve', 'broken', false, 'boolean', NULL, NULL, NULL, 'Broken:', 'text', NULL, NULL, NULL, NULL, false, 6, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (286, 'v_anl_mincut_result_valve', 'unaccess', false, 'boolean', NULL, NULL, NULL, 'Unaccess:', 'checkbox', NULL, NULL, NULL, NULL, true, 8, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (287, 'v_anl_mincut_result_valve', 'proposed', false, 'boolean', NULL, NULL, NULL, 'Proposed:', 'text', NULL, NULL, NULL, NULL, false, 7, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (306, 'imaqua', 'date_to', false, 'date', NULL, NULL, NULL, 'Date to:', 'datepickertime', NULL, NULL, NULL, NULL, false, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (305, 'imaqua', 'date_from', false, 'date', NULL, NULL, NULL, 'Date from:', 'datepickertime', NULL, NULL, NULL, NULL, false, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (313, 'v_edit_node', 'species_id', NULL, 'string', 150, NULL, NULL, 'Especie', 'combo', 'cat_node', 'id', 'nodetype_id', 'select id, id as idval from cat_node WHERE active IS TRUE', false, 2, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (310, 'filter_date', 'date_from', false, 'date', NULL, NULL, NULL, 'Date from:', 'datepickertime', 'selector_date', 'from_date', 'from_date', NULL, false, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (312, 'v_edit_node', 'location_id', NULL, 'string', 150, NULL, NULL, 'Ubicació', 'combo', 'cat_owner', 'id', 'id', 'select id, id as idval from cat_owner where id is not null ', true, 6, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (311, 'filter_date', 'date_to', false, 'date', NULL, NULL, NULL, 'Date to:', 'datepickertime', 'selector_date', 'from_date', 'to_date', NULL, false, 1, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (314, 'v_edit_node', 'plant_date', NULL, 'date', NULL, NULL, NULL, 'Data plantació', 'datepickertime', NULL, NULL, NULL, NULL, false, 8, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (315, 'v_edit_node', 'observ', NULL, 'string', NULL, NULL, NULL, 'Observació', 'text', NULL, NULL, NULL, NULL, false, 10, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (317, 'v_edit_node', 'state', NULL, 'string', 30, NULL, NULL, 'Estat:', 'text', NULL, NULL, NULL, NULL, true, 9, NULL);
INSERT INTO SCHEMA_NAME.config_web_fields (id, table_id, name, is_mandatory, "dataType", field_length, num_decimals, placeholder, label, type, dv_table, dv_id_column, dv_name_column, sql_text, is_enabled, orderby, is_navigation) VALUES (316, 'v_edit_node', 'condition_id', NULL, 'string', 30, NULL, NULL, 'Condició:', 'text', NULL, NULL, NULL, NULL, true, 8, NULL);


--
-- TOC entry 17120 (class 0 OID 0)
-- Dependencies: 2659
-- Name: config_web_fields_id_seq; Type: SEQUENCE SET; Schema: SCHEMA_NAME; Owner: role_admin
--

SELECT pg_catalog.setval('SCHEMA_NAME.config_web_fields_id_seq', 1, true);


--
-- TOC entry 15625 (class 2606 OID 232806)
-- Name: config_web_fields config_web_fields_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields
    ADD CONSTRAINT config_web_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 15626 (class 2606 OID 232834)
-- Name: config_web_fields config_web_fields_datatype_fkey; Type: FK CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields
    ADD CONSTRAINT config_web_fields_datatype_fkey FOREIGN KEY ("dataType") REFERENCES SCHEMA_NAME.config_web_fields_cat_datatype(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 15627 (class 2606 OID 232839)
-- Name: config_web_fields config_web_fields_type_fkey; Type: FK CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_fields
    ADD CONSTRAINT config_web_fields_type_fkey FOREIGN KEY (type) REFERENCES SCHEMA_NAME.config_web_fields_cat_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 17117 (class 0 OID 0)
-- Dependencies: 2660
-- Name: TABLE config_web_fields; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_fields TO qgisserver;


--
-- TOC entry 17119 (class 0 OID 0)
-- Dependencies: 2659
-- Name: SEQUENCE config_web_fields_id_seq; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT ALL ON SEQUENCE SCHEMA_NAME.config_web_fields_id_seq TO role_basic;


-- Completed on 2022-05-17 11:17:59

--
-- PostgreSQL database dump complete
--

