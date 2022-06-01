/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_getfilters(p_data json)
  RETURNS json AS
$BODY$

/*example

SELECT gw_fct_getfilters($${
"client":{"device":4, "infoType":1, "lang":"ES", "cur_user":"test_user"}, "form":{}, 
"feature":{}, 
"data":{"istilemap":True}}$$);	

SELECT gw_fct_getfilters($${
"client":{"device":4, "infoType":1, "lang":"ES", "cur_user":"test"}, "form":{}, 
"feature":{}, 
"data":{"istilemap":False}}$$);	

*/

DECLARE


--	Variables
	selected_json json;	
	form_json json;
	formTabs_explotations json;
	formTabs_networkStates json;
	formTabs_networkSpecies json;
	formTabs_hydroStates json;
	formTabs_lotSelector json;
	formTabs_marcaStates json;
	formTabs_adaptedStates json;
	formTabs_statusStates json;
	formTabs text;
	json_array json[];
	v_version json;
	rec_tab record;
	v_active boolean=true;
	v_firsttab boolean=false;
	v_istiled_filterstate varchar;
	formtabs_networkcampaign text;
	v_reset_expl boolean = false;
	v_pluginlot text;
	
	v_device integer;
	v_istilemap boolean;
	v_lang character varying;
	v_cur_user text;
	
	v_prev_cur_user text;

BEGIN


-- Set search path to local schema
	SET search_path = "SCHEMA_NAME", public;

--  get api version
	EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
		INTO v_version;
	
	-- get input parameters
	v_device :=  ((p_data ->>'client')::json->>'device');
	v_lang :=  ((p_data ->>'client')::json->>'lang');
	v_cur_user := (p_data ->> 'client')::json->> 'cur_user';
	v_istilemap :=  ((p_data ->>'data')::json->>'istilemap');
	
	v_prev_cur_user = current_user;
	IF v_cur_user THEN
		EXECUTE 'SET ROLE ' || v_cur_user || '';
	END IF;

	--check plugin lotes
	select upper(value::json->>'lotManage'::text) INTO v_pluginlot from config_param_system where parameter = 'plugin_lotmanage';

-- Start the construction of the tabs array
	formTabs := '[';

-- Tab Exploitation
        SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabExploitation' ;
	IF rec_tab.id IS NOT NULL THEN

		-- Get exploitations, selected and unselected
		IF v_istilemap AND v_reset_expl THEN	

			-- setting whole exploitations for user when is tilemap acoording admin_exploitation_x_user variable			
			IF (SELECT value FROM config_param_system WHERE parameter ='admin_exploitation_x_user')::boolean THEN
				DELETE FROM selector_expl WHERE cur_user = current_user;
				INSERT INTO selector_expl (expl_id, cur_user) SELECT expl_id,current_user FROM config_user_x_expl WHERE user_id=current_user;

				-- getting json
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name as label, exploitation.expl_id as name, ''check'' as type, ''boolean'' as "dataType", true as "value" , true AS disabled
				FROM exploitation JOIN config_user_x_expl ON config_user_x_expl.expl_id=exploitation.expl_id
				WHERE exploitation.expl_id IN (SELECT expl_id FROM selector_expl WHERE cur_user=' || quote_literal('qgisserver') || ')
				AND username=current_user and active is true
				UNION
				SELECT name as label, exploitation.expl_id as name, ''check'' as type, ''boolean'' as "dataType", false as "value" , true AS disabled
				FROM exploitation JOIN config_user_x_expl ON config_user_x_expl.expl_id=exploitation.expl_id
				WHERE exploitation.expl_id NOT IN (SELECT expl_id FROM selector_expl WHERE active is true and cur_user=' || quote_literal('qgisserver') || '
				AND username=current_user) 
				ORDER BY label) a'
					INTO formTabs_explotations;
			ELSE
				DELETE FROM selector_expl WHERE cur_user = current_user;
				INSERT INTO selector_expl (expl_id, cur_user) SELECT expl_id,current_user FROM exploitation;		
				
				-- getting json
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name as label, expl_id as name, ''check'' as type, ''boolean'' as "dataType", true as "value" , true AS disabled
				FROM exploitation WHERE expl_id IN (SELECT expl_id FROM selector_expl WHERE cur_user=' || quote_literal('qgisserver') || ' ) 
				and active is true
				UNION
				SELECT name as label, expl_id as name, ''check'' as type, ''boolean'' as "dataType", false as "value" , true AS disabled
				FROM exploitation WHERE active is true AND expl_id NOT IN (SELECT expl_id FROM selector_expl WHERE cur_user=' || quote_literal('qgisserver') || ') ORDER BY label) a'
				INTO formTabs_explotations;
			END IF;
			

		ELSE
			-- setting whole exploitations for user acoording admin_exploitation_x_user variable			
			IF (SELECT value FROM config_param_system WHERE parameter ='admin_exploitation_x_user')::boolean THEN
			
				-- getting json
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name as label, exploitation.expl_id as name, ''check'' as type, ''boolean'' as "dataType", true as "value" , false AS disabled
				FROM exploitation JOIN config_user_x_expl ON config_user_x_expl.expl_id=exploitation.expl_id
				WHERE exploitation.expl_id IN (SELECT expl_id FROM selector_expl WHERE cur_user=current_user) AND username=current_user and active is true
				UNION
				SELECT name as label, exploitation.expl_id as name, ''check'' as type, ''boolean'' as "dataType", false as "value" , false AS disabled
				FROM exploitation JOIN config_user_x_expl ON config_user_x_expl.expl_id=exploitation.expl_id
				WHERE exploitation.expl_id NOT IN (SELECT expl_id FROM selector_expl WHERE cur_user=current_user) AND username=current_user and active is true
				ORDER BY label) a'
					INTO formTabs_explotations;
			ELSE 		
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name as label, expl_id as name, ''check'' as type, ''boolean'' as "dataType", true as "value" , false AS disabled
				FROM exploitation WHERE active is true AND exploitation.expl_id IN (SELECT expl_id FROM selector_expl WHERE cur_user=current_user)
				UNION
				SELECT name as label, expl_id as name, ''check'' as type, ''boolean'' as "dataType", false as "value" , false AS disabled
				FROM exploitation WHERE active is true AND exploitation.expl_id NOT IN (SELECT expl_id FROM selector_expl WHERE cur_user=current_user) ORDER BY label) a'
					INTO formTabs_explotations;
			END IF;
		END IF;	
		-- Add tab name to json
		formTabs_explotations := ('{"fields":' || formTabs_explotations || '}')::json;
		formTabs_explotations := gw_fct_json_object_set_key(formTabs_explotations, 'tabName', 'selector_expl'::TEXT);
		formTabs_explotations := gw_fct_json_object_set_key(formTabs_explotations, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_explotations := gw_fct_json_object_set_key(formTabs_explotations, 'tabIdName', 'expl_id'::TEXT);
		formTabs_explotations := gw_fct_json_object_set_key(formTabs_explotations, 'active', v_active);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_explotations::text;
		ELSE 
			formTabs := formTabs || formTabs_explotations::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;

-- Tab network state
	SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabNetworkState' ;
	IF rec_tab.id IS NOT NULL THEN
		
		-- Get states, selected and unselected
		IF v_istilemap THEN
			SELECT ((value::json)->>'istiled_filterstate') as id FROM config_param_system WHERE parameter='api_config_parameters' INTO v_istiled_filterstate;

			-- setting state = 1  for user when is tilemap
			DELETE FROM selector_state WHERE cur_user = current_user AND state_id=1;
			INSERT INTO selector_state (state_id, cur_user) VALUES (1,current_user);
			
			IF v_istiled_filterstate = 'publish_user' THEN
				
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , true AS disabled
				FROM value_state WHERE id IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal('qgisserver') || ')
				UNION
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , true AS disabled
				FROM value_state WHERE id NOT IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal('qgisserver') || ') ORDER BY name) a'
				INTO formTabs_networkStates;	
				RAISE NOTICE 'TEST10 -> %',formTabs_networkStates;
				
			ELSIF v_istiled_filterstate = 'current_user' THEN
				
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , CASE WHEN id=1 THEN true ELSE false END AS disabled
				FROM value_state WHERE id IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal(current_user) || ')
				UNION
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , CASE WHEN id=1 THEN true ELSE false END AS disabled
				FROM value_state WHERE id NOT IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
				INTO formTabs_networkStates;	
				
				RAISE NOTICE 'TEST20 -> %',formTabs_networkStates;
				
			ELSIF v_istiled_filterstate = 'disabled' THEN
			
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , true AS disabled
				FROM value_state WHERE id IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal('qgisserver') || ')
				UNION
				SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , true AS disabled
				FROM value_state WHERE id NOT IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal('qgisserver') || ') ORDER BY name) a'
				INTO formTabs_networkStates;	
				RAISE NOTICE 'TEST30 ->%',formTabs_networkStates;
				
			END IF;
			
			
		ELSE
			EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
			SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
			FROM value_state WHERE id IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal(current_user) || ')
			UNION
			SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
			FROM value_state WHERE id NOT IN (SELECT state_id FROM selector_state WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
			INTO formTabs_networkStates;	
		END IF;	
		
		-- Add tab name to json
		formTabs_networkStates := ('{"fields":' || formTabs_networkStates || '}')::json;
		formTabs_networkStates := gw_fct_json_object_set_key(formTabs_networkStates, 'tabName', 'selector_state'::TEXT);
		formTabs_networkStates := gw_fct_json_object_set_key(formTabs_networkStates, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_networkStates := gw_fct_json_object_set_key(formTabs_networkStates, 'tabIdName', 'state'::TEXT);
		formTabs_networkStates := gw_fct_json_object_set_key(formTabs_networkStates, 'active', v_active);

		raise notice 'formTabs_networkStates %', formTabs_networkStates;

		IF v_istilemap=TRUE AND v_istiled_filterstate = 'disabled' THEN
		
			-- If istiled_filterstate is disable, dont create tab Network States
		ELSE
			-- Create tabs array
			IF v_firsttab THEN 
				formTabs := formTabs || ',' || formTabs_networkStates::text;
			ELSE 
				formTabs := formTabs || formTabs_networkStates::text;
			END IF;

			v_firsttab := TRUE;
			v_active :=FALSE;
			
		END IF;
	END IF;

-- Tab Species
        SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabSpecies' ;
	IF rec_tab.id IS NOT NULL THEN

		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
			SELECT replace(species, '''''''', '''''''''''') AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
			FROM SCHEMA_NAME.cat_species WHERE id IN (SELECT species_id FROM selector_species WHERE cur_user=' || quote_literal(current_user) || ')
			UNION
			SELECT replace(species, '''''''', '''''''''''') AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
			FROM SCHEMA_NAME.cat_species WHERE id NOT IN (SELECT species_id FROM selector_species WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY label)a'
			INTO formTabs_networkSpecies;	

		-- Add tab name to json
		formTabs_networkSpecies := ('{"fields":' || formTabs_networkSpecies || '}')::json;
		formTabs_networkSpecies := gw_fct_json_object_set_key(formTabs_networkSpecies, 'tabName', 'selector_species'::TEXT);
		formTabs_networkSpecies := gw_fct_json_object_set_key(formTabs_networkSpecies, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_networkSpecies := gw_fct_json_object_set_key(formTabs_networkSpecies, 'tabIdName', 'species_id'::TEXT);
		formTabs_networkSpecies := gw_fct_json_object_set_key(formTabs_networkSpecies, 'active', v_active);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_networkSpecies::text;
		ELSE 
			formTabs := formTabs || formTabs_networkSpecies::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;

	-- Tab Campaign
        SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabCampaign' ;
	IF rec_tab.id IS NOT NULL THEN

		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
			SELECT replace(name, ''_'','' '' ) AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
			FROM cat_campaign WHERE active is TRUE AND id IN (SELECT campaign_id FROM selector_campaign WHERE cur_user=' || quote_literal(current_user) || ')
			UNION
			SELECT replace(name, ''_'','' '' ) AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
			FROM cat_campaign WHERE active is TRUE AND id NOT IN (SELECT campaign_id FROM selector_campaign WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY label)a'
			INTO formTabs_networkCampaign;	

		-- Add tab name to json
		formTabs_networkCampaign := ('{"fields":' || formTabs_networkCampaign || '}')::json;
		formTabs_networkCampaign := gw_fct_json_object_set_key(formTabs_networkCampaign, 'tabName', 'selector_campaign'::TEXT);
		formTabs_networkCampaign := gw_fct_json_object_set_key(formTabs_networkCampaign, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_networkCampaign := gw_fct_json_object_set_key(formTabs_networkCampaign, 'tabIdName', 'campaign_id'::TEXT);
		formTabs_networkCampaign := gw_fct_json_object_set_key(formTabs_networkCampaign, 'active', v_active);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_networkCampaign::text;
		ELSE 
			formTabs := formTabs || formTabs_networkCampaign::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;
	
-- Tab hydrometer state
	SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabHydroState' ;
	IF rec_tab.id IS NOT NULL THEN
	
		-- Get hydrometer states, selected and unselected
		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
		SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
		FROM ext_rtc_hydrometer_state WHERE id IN (SELECT state_id FROM selector_hydrometer WHERE cur_user=' || quote_literal(current_user) || ')
		UNION
		SELECT name AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
		FROM ext_rtc_hydrometer_state WHERE id NOT IN (SELECT state_id FROM selector_hydrometer WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
		INTO formTabs_hydroStates;

	
		-- Add tab name to json
		formTabs_hydroStates := ('{"fields":' || formTabs_hydroStates || '}')::json;
		formTabs_hydroStates := gw_fct_json_object_set_key(formTabs_hydroStates, 'tabName', 'selector_hydrometer'::TEXT);
		formTabs_hydroStates := gw_fct_json_object_set_key(formTabs_hydroStates, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_hydroStates := gw_fct_json_object_set_key(formTabs_hydroStates, 'tabIdName', 'state_id'::TEXT);
		formTabs_hydroStates := gw_fct_json_object_set_key(formTabs_hydroStates, 'active', false);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_hydroStates::text;
		ELSE 
			formTabs := formTabs || formTabs_hydroStates::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;

-- Tab lot selector
	IF v_pluginlot = 'TRUE' THEN
		SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabLotSelector' ;
		IF rec_tab.id IS NOT NULL THEN

			-- control if user has permisions
			 IF 'role_om' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN

				-- Get lots, selected and unselected
				EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
					SELECT id AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
					FROM om_visit_lot WHERE id IN (SELECT lot_id FROM selector_lot WHERE cur_user=' || quote_literal(current_user) || ')
					UNION
					SELECT id AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
					FROM om_visit_lot WHERE id NOT IN (SELECT lot_id FROM selector_lot WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
					INTO formTabs_lotSelector;

				-- Add tab name to json
				formTabs_lotSelector := ('{"fields":' || formTabs_lotSelector || '}')::json;
				formTabs_lotSelector := gw_fct_json_object_set_key(formTabs_lotSelector, 'tabName', 'selector_lot'::TEXT);
				formTabs_lotSelector := gw_fct_json_object_set_key(formTabs_lotSelector, 'tabLabel', rec_tab.tablabel::TEXT);
				formTabs_lotSelector := gw_fct_json_object_set_key(formTabs_lotSelector, 'tabIdName', 'lot_id'::TEXT);
				formTabs_lotSelector := gw_fct_json_object_set_key(formTabs_lotSelector, 'active', false);

				-- Create tabs array
				IF v_firsttab THEN 
					formTabs := formTabs || ',' || formTabs_lotSelector::text;
				ELSE 
					formTabs := formTabs || formTabs_lotSelector::text;
				END IF;
				v_firsttab := TRUE;
				v_active :=FALSE;
			END IF;
		END IF;
	END IF;


-- Tab marca selector
	SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabMarcaSelector' ;
	IF rec_tab.id IS NOT NULL THEN
	
		-- Get marca states, selected and unselected
		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
		SELECT idval AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
		FROM cat_addfields_typevalue WHERE typevalue = 4 AND id IN (SELECT marca FROM selector_marca WHERE cur_user=' || quote_literal(current_user) || ')
		UNION
		SELECT idval AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
		FROM cat_addfields_typevalue WHERE typevalue = 4 AND  id NOT IN (SELECT marca FROM selector_marca WHERE  cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
		INTO formTabs_marcaStates;

	
		-- Add tab name to json
		formTabs_marcaStates := ('{"fields":' || formTabs_marcaStates || '}')::json;
		formTabs_marcaStates := gw_fct_json_object_set_key(formTabs_marcaStates, 'tabName', 'selector_marca'::TEXT);
		formTabs_marcaStates := gw_fct_json_object_set_key(formTabs_marcaStates, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_marcaStates := gw_fct_json_object_set_key(formTabs_marcaStates, 'tabIdName', 'marca'::TEXT);
		formTabs_marcaStates := gw_fct_json_object_set_key(formTabs_marcaStates, 'active', false);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_marcaStates::text;
		ELSE 
			formTabs := formTabs || formTabs_marcaStates::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;


-- Tab adapted selector
	SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabAdaptedSelector' ;
	IF rec_tab.id IS NOT NULL THEN
	
		-- Get adapted states, selected and unselected
		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
		SELECT descript AS label, idval AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
		FROM sys_combo_values WHERE sys_combo_cat_id = 1 AND idval IN (SELECT is_disabled_adapted::text FROM selector_adapted WHERE cur_user=' || quote_literal(current_user) || ')
		UNION
		SELECT descript AS label, idval AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
		FROM sys_combo_values WHERE sys_combo_cat_id = 1 AND  idval NOT IN (SELECT is_disabled_adapted::text FROM selector_adapted WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
		INTO formTabs_adaptedStates;

	
		-- Add tab name to json
		formTabs_adaptedStates := ('{"fields":' || formTabs_adaptedStates || '}')::json;
		formTabs_adaptedStates := gw_fct_json_object_set_key(formTabs_adaptedStates, 'tabName', 'selector_adapted'::TEXT);
		formTabs_adaptedStates := gw_fct_json_object_set_key(formTabs_adaptedStates, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_adaptedStates := gw_fct_json_object_set_key(formTabs_adaptedStates, 'tabIdName', 'is_disabled_adapted'::TEXT);
		formTabs_adaptedStates := gw_fct_json_object_set_key(formTabs_adaptedStates, 'active', false);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_adaptedStates::text;
		ELSE 
			formTabs := formTabs || formTabs_adaptedStates::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;


-- Tab status selector
	SELECT * INTO rec_tab FROM config_web_tabs WHERE layer_id='F33' AND formtab='tabStatusSelector' ;
	IF rec_tab.id IS NOT NULL THEN
	
		-- Get status states, selected and unselected
		EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM (
		SELECT idval AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", true AS "value" , false AS disabled
		FROM sys_combo_values WHERE sys_combo_cat_id = 3 AND id IN (SELECT status FROM selector_status WHERE cur_user=' || quote_literal(current_user) || ')
		UNION
		SELECT idval AS label, id AS name, ''check'' AS type, ''boolean'' AS "dataType", false AS "value" , false AS disabled
		FROM sys_combo_values WHERE sys_combo_cat_id = 3 AND  id NOT IN (SELECT status FROM selector_status WHERE cur_user=' || quote_literal(current_user) || ') ORDER BY name) a'
		INTO formTabs_statusStates;

	
		-- Add tab name to json
		formTabs_statusStates := ('{"fields":' || formTabs_statusStates || '}')::json;
		formTabs_statusStates := gw_fct_json_object_set_key(formTabs_statusStates, 'tabName', 'selector_adapted'::TEXT);
		formTabs_statusStates := gw_fct_json_object_set_key(formTabs_statusStates, 'tabLabel', rec_tab.tablabel::TEXT);
		formTabs_statusStates := gw_fct_json_object_set_key(formTabs_statusStates, 'tabIdName', 'is_disabled_adapted'::TEXT);
		formTabs_statusStates := gw_fct_json_object_set_key(formTabs_statusStates, 'active', false);

		-- Create tabs array
		IF v_firsttab THEN 
			formTabs := formTabs || ',' || formTabs_statusStates::text;
		ELSE 
			formTabs := formTabs || formTabs_statusStates::text;
		END IF;

		v_firsttab := TRUE;
		v_active :=FALSE;
	END IF;


-- Finish the construction of the tabs array
	formTabs := formTabs ||']';


-- Check null
	formTabs := COALESCE(formTabs, '[]');	
	
	EXECUTE 'SET ROLE ' || v_prev_cur_user || '';
	
-- Return
	IF v_firsttab IS FALSE THEN
		-- Return not implemented
		RETURN ('{"status":"Accepted"' ||
		', "apiVersion":'|| v_version ||
		', "message":"Not implemented"'||
		'}')::json;
	ELSE 
		-- Return formtabs
		RETURN ('{"status":"Accepted"' ||
			', "apiVersion":'|| v_version ||
			', "formTabs":' || formTabs ||
			'}')::json;
	END IF;

-- Exception handling
--	EXCEPTION WHEN OTHERS THEN 
		--RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version || ',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;