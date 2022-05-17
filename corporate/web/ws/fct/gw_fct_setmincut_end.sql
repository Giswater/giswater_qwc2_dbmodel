CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut_end"(
	p_mincut_id int4, 
	p_insert_data json, 
	p_element_type varchar, 
	p_id varchar, 
	p_device int4,
	p_user_name text) RETURNS pg_catalog.json AS $BODY$

DECLARE
v_version json;
v_prev_user_name text;

    
BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;

	v_prev_user_name = current_user;
	EXECUTE 'SET ROLE ' || p_user_name || '';
	
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

--  Update values
    UPDATE om_mincut SET mincut_state=2 WHERE id=p_mincut_id;
    UPDATE om_mincut SET exec_end=now() WHERE id=p_mincut_id;

--  Update the value of the state
    p_insert_data := gw_fct_json_object_set_key(p_insert_data, 'mincut_state',2);
	
	EXECUTE 'SET ROLE ' || v_prev_user_name || '';
		
--  Call for update values (in case of exists)
    PERFORM SCHEMA_NAME.gw_fct_upsertmincut(p_mincut_id, null::float, null::float, null::integer, p_device, p_insert_data, p_element_type, p_id, p_user_name);

--  Return
    RETURN  SCHEMA_NAME.gw_fct_getmincut(null, null, null, p_mincut_id::integer, p_device, p_element_type, 'lang', p_user_name);



--  Exception handling

    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

