CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_setmincut($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"mincut_id_arg":null, "x":"419544.39398676", "y":"4576488.2140275", "srid_arg":25831, "device":3, 
"insert_data":{"mincut_state":"0","mincut_type":"Real","anl_cause":"1","assigned_to":"abofill","anl_descript":"test","anl_tstamp":"2022-05-13 10:32:45",
"forecast_start":null,"forecast_end":null,"muni_id":"1","postcode":"08830","streetaxis_id":"1-11000C","exec_start":null,"exec_appropiate":"false",
"exec_end":null}, "element_type":"arc", "id_arg":"2095"}}$$);  
*/
DECLARE
    v_mincut_id_arg integer;
    v_x double precision;
    v_y double precision;
    v_srid_arg integer;
    v_device integer;
    v_insert_data json;
    v_element_type character varying;
    v_id_arg character varying;
	v_user_name text;
	v_prev_user_name text;

BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- getting input data 
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_x :=  ((p_data ->>'data')::json->>'x');
	v_y :=  ((p_data ->>'data')::json->>'y');
	v_srid_arg :=  ((p_data ->>'data')::json->>'srid_arg')::integer;
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_insert_data :=  ((p_data ->>'data')::json->>'insert_data');
	v_element_type :=  ((p_data ->>'data')::json->>'element_type');
	v_id_arg :=  ((p_data ->>'data')::json->>'id_arg');
	v_user_name := (p_data ->> 'client')::json->> 'user_name';
	
	IF v_device IN (1,2,3) THEN
		v_prev_user_name = current_user;
		v_user_name := (p_data ->> 'client')::json->> 'user_name';
		EXECUTE 'SET ROLE ' || v_user_name || '';
		--  Return
   		RETURN  gw_fct_upsertmincut(v_mincut_id_arg, v_x, v_y, v_srid_arg, v_device, v_insert_data, v_element_type, v_id_arg, v_user_name);
		
		EXECUTE 'SET ROLE ' || v_prev_user_name || '';
		raise notice 'FINISH -> %',current_user;
	END IF;

--  Exception handling
/*
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
*/

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

