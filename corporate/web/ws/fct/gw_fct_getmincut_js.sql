CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_getmincut"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_getmincut($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"x":"419534.15219828", "y":"4576491.4086902", "srid_arg":"25831", "mincut_id_arg":null, "device":3, "insert_data":"arc", 
"element_type":{}, "lang":"es"}}$$);
*/
DECLARE
    v_x double precision;
    v_y double precision;
    v_srid_arg integer;
	v_mincut_id_arg integer;
    v_device integer;
    v_element_type character varying;
    v_lang character varying;
	v_user_name text;

BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- getting input data 
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_x :=  ((p_data ->>'data')::json->>'x');
	v_y :=  ((p_data ->>'data')::json->>'y');
	v_srid_arg :=  ((p_data ->>'data')::json->>'srid_arg')::integer;
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_element_type :=  ((p_data ->>'data')::json->>'element_type');
	v_lang :=  ((p_data ->>'data')::json->>'lang');
	v_user_name := (p_data ->> 'client')::json->> 'user_name';
	
	IF v_device IN (1,2,3) THEN
		--  Return
   		RETURN  gw_fct_getmincut(v_x, v_y, v_srid_arg, v_mincut_id_arg, v_device, v_element_type, v_lang, v_user_name);
	END IF;

--  Exception handling
   /* 
   EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
*/

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

