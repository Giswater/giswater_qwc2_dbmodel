CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setmincut_start"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_setmincut_start($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"mincut_id":78, "device":3}}$$);
*/
DECLARE
	
	v_version json;
	v_mincut_class int2;
	v_mincut_feature text;

    v_mincut_id int4;
	v_device int4;
	v_cur_user text;
	v_prev_cur_user text;

BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- getting input data 
	v_mincut_id :=  ((p_data ->>'data')::json->>'mincut_id');
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_cur_user := (p_data ->> 'client')::json->> 'cur_user';
	
	v_prev_cur_user = current_user;
	IF v_cur_user THEN
		EXECUTE 'SET ROLE ' || v_cur_user || '';
	END IF;
	
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

--  Update values
    UPDATE om_mincut SET mincut_state=1, exec_start=now(), exec_user=current_user WHERE id=v_mincut_id;

-- Get mincut class and mincut feature
    SELECT mincut_class INTO v_mincut_class FROM om_mincut WHERE id=v_mincut_id;

    IF v_mincut_class=1 THEN
    v_mincut_feature = 'arc';
    ELSIF v_mincut_class=2 THEN
    v_mincut_feature = 'connec';
    ELSIF v_mincut_class=3 THEN
    v_mincut_feature = 'hydrometer';
    END IF;
	
	EXECUTE 'SET ROLE ' || v_prev_cur_user || '';
	
--    Return
     RETURN  SCHEMA_NAME.gw_fct_getmincut(null, null, null, v_mincut_id::integer, v_device, v_mincut_feature, 'lang', v_cur_user);


--    Exception handling
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

