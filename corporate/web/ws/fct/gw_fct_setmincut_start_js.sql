CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut_start"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_setmincut_start($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"mincut_id":78, "device":3}}$$);
*/
DECLARE
    v_mincut_id int4;
	v_device int4;
	v_user_name text;
	v_prev_user_name text;

BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- getting input data 
	v_mincut_id :=  ((p_data ->>'data')::json->>'mincut_id');
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_user_name := (p_data ->> 'client')::json->> 'user_name';
	
	IF v_device IN (1,2,3) THEN
		v_prev_user_name = current_user;
		v_user_name := (p_data ->> 'client')::json->> 'user_name';
		EXECUTE 'SET ROLE ' || v_user_name || '';
		--  Return
   		RETURN  gw_fct_setmincut_start(v_mincut_id, v_device, v_user_name);
		
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

