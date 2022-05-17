--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-17 11:22:37

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
-- TOC entry 2656 (class 1259 OID 232772)
-- Name: config_web_tabs; Type: TABLE; Schema: SCHEMA_NAME; Owner: role_admin
--

CREATE TABLE SCHEMA_NAME.config_web_tabs (
    id integer NOT NULL,
    layer_id character varying(50),
    formtab text,
    tablabel text,
    tabtext text
);


ALTER TABLE SCHEMA_NAME.config_web_tabs OWNER TO role_admin;

--
-- TOC entry 17109 (class 0 OID 232772)
-- Dependencies: 2656
-- Data for Name: config_web_tabs; Type: TABLE DATA; Schema: SCHEMA_NAME; Owner: role_admin
--

INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (242, 'v_edit_connec', 'tabElement', 'Element', 'Llistat d''elements');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (245, 'v_edit_connec', 'tabVisit', 'Visit', 'Històric d''events');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (246, 'v_edit_connec', 'tabDoc', 'Doc', 'Documents associats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (212, 'v_edit_node', 'tabElement', 'Element', 'Llistat d''elements');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (214, 'v_edit_node', 'tabConnect', 'Connect', '{"node", "Trams aigües amunt", "Trams aigües avall"}');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (215, 'v_edit_node', 'tabVisit', 'Visit', 'Històric d''events');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (252, 'sector', 'tabElement', 'Elements', 'Llistat de elements que pertanyen al sector');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (234, 'v_edit_connec', 'tabHydro', 'Abonat', 'Llista abonats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (106, 'F31', 'tabPsector', 'Psector', 'Sectors de planejament');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (105, 'F31', 'tabWorkcat', 'Expedient', 'Expedients');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (104, 'F31', 'tabHydro', 'Abonat', 'Abonat');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (103, 'F31', 'tabSearch', 'Cercador', 'Cercador generic');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (272, 'v_ui_workcat_polygon', 'tabElement', 'Servei', 'Elements en servei');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (244, 'v_ui_workcat_polygon', 'tabHydro', 'Baixa', 'Elements donats de baixa');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (114, 'F33', 'tabNetworkState', 'Elements xarxa', 'Elements de xarxa');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (111, 'F33', 'tabExploitation', 'Explotacions', 'Explotacions actives');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (118, 'F33', 'tabHydroState', 'Abonats', 'Abonats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (206, 'v_edit_node', 'tabDoc', 'Doc', 'Documents associats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (232, 'v_edit_connec', 'tabElement', 'Element', 'Llistat d''elements');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (235, 'v_edit_connec', 'tabVisit', 'Visit', 'Històric d''events');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (236, 'v_edit_connec', 'tabDoc', 'Doc', 'Documents associats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (222, 'v_edit_arc', 'tabElement', 'Obra', 'Obra relacionada');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (223, 'v_edit_arc', 'tabHydro', 'Elements', 'Elements relacionats');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (224, 'v_edit_arc', 'tabConnect', 'Connect', 'Connect');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (225, 'v_edit_arc', 'tabVisit', 'Visit', 'Històric d''events');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (101, 'F31', 'tabNetwork', 'Xarxa', 'Elements de xarxa');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (102, 'F31', 'tabAddress', 'Carrerer', 'Carrerer dades PG');
INSERT INTO SCHEMA_NAME.config_web_tabs (id, layer_id, formtab, tablabel, tabtext) VALUES (119, 'F33', 'tabLotSelector', 'Lots', 'Lots');


--
-- TOC entry 15624 (class 2606 OID 232779)
-- Name: config_web_tabs config_web_tabs_pkey; Type: CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_tabs
    ADD CONSTRAINT config_web_tabs_pkey PRIMARY KEY (id);


--
-- TOC entry 15626 (class 2606 OID 232846)
-- Name: config_web_tabs config_web_layer_formtab_fkey; Type: FK CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_tabs
    ADD CONSTRAINT config_web_layer_formtab_fkey FOREIGN KEY (formtab) REFERENCES SCHEMA_NAME.config_web_layer_cat_formtab(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 15625 (class 2606 OID 232780)
-- Name: config_web_tabs config_web_layer_tab_fkey; Type: FK CONSTRAINT; Schema: SCHEMA_NAME; Owner: role_admin
--

ALTER TABLE ONLY SCHEMA_NAME.config_web_tabs
    ADD CONSTRAINT config_web_layer_tab_fkey FOREIGN KEY (formtab) REFERENCES SCHEMA_NAME.config_web_layer_cat_formtab(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 17115 (class 0 OID 0)
-- Dependencies: 2656
-- Name: TABLE config_web_tabs; Type: ACL; Schema: SCHEMA_NAME; Owner: role_admin
--

GRANT SELECT ON TABLE SCHEMA_NAME.config_web_tabs TO role_basic;
GRANT SELECT ON TABLE SCHEMA_NAME.config_web_tabs TO qgisserver;


-- Completed on 2022-05-17 11:22:41

--
-- PostgreSQL database dump complete
--

