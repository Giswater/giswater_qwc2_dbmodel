CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut_end"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_setmincut_end($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"mincut_id":78, "insert_data":{"mincut_state":"1","mincut_type":"Real","anl_cause":"1","assigned_to":"abofill","anl_descript":"test2","anl_tstamp":"2022-05-13 10:32:45",
"forecast_start":null,"forecast_end":null,"muni_id":"Sant Boi del Llobregat","postcode":"08830","streetaxis_id":"1-11000C","exec_start":"2022-05-13 10:45:42",
"exec_user":"test","exec_appropiate":"false","exec_end":null}, "element_type":"arc", "id":"2095", "device":3}}$$);
*/
DECLARE
    v_mincut_id integer;
	v_insert_data json;
	v_element_type varchar;
	v_id varchar;
	v_device int;
	v_user_name text;
	v_prev_user_name text;
	
BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	
	-- getting input data 
	v_mincut_id :=  ((p_data ->>'data')::json->>'mincut_id')::integer;
	v_insert_data :=  ((p_data ->>'data')::json->>'insert_data')::json;
	v_element_type :=  ((p_data ->>'data')::json->>'element_type')::varchar;
	v_id :=  ((p_data ->>'data')::json->>'id')::varchar;
	v_device :=  ((p_data ->>'data')::json->>'device')::int;
	v_user_name := (p_data ->> 'client')::json->> 'user_name';
	
	IF v_device IN (1,2,3) THEN
		--  Return
   		RETURN  gw_fct_setmincut_end(v_mincut_id, v_insert_data, v_element_type, v_id, v_device, v_user_name);
	END IF;
	
	
	
--  Exception handling
/*
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
*/

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

