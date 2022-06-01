/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_setfilters(p_data json)
  RETURNS json AS
$BODY$

/*example

SELECT gw_fct_setfilters($${
"client":{"device":4, "infoType":1, "lang":"ES", "cur_user":"test_user"}, "form":{}, 
"feature":{}, 
"data":{"id_arg":0, "status":"1", "tabname":"selector_expl", "tabidname":"expl_id"}}$$);	
*/

DECLARE

--    Variables
    event_id integer;
    existing_record integer;
    v_version text;
	
	v_id_arg integer;
	v_status boolean;
	v_tabname character varying;
	v_tabidname character varying;
	v_cur_user text;
	v_prev_cur_user text;

BEGIN


--    Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- get input parameters
	v_id_arg := ((p_data ->>'data')::json->>'id_arg ');
	v_status := ((p_data ->>'data')::json->>'status');
	v_tabname := ((p_data ->>'data')::json->>'tabname');
	v_tabidname := ((p_data ->>'data')::json->>'tabidname');
	v_cur_user :=  ((p_data ->>'client')::json->>'cur_user');
	
	v_prev_cur_user = current_user;
	IF v_cur_user THEN
		EXECUTE 'SET ROLE ' || v_cur_user || '';
	END IF;
	
    IF v_tabidname = 'state' THEN
        v_tabidname = v_tabidname || '_id';
    END IF;

    --  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

--      Check exists and set
    EXECUTE ('SELECT COUNT(*) FROM ' || quote_ident(v_tabname) || ' WHERE ' || quote_ident(v_tabidname) || ' = $1 AND cur_user = current_user')
    USING v_id_arg
    INTO existing_record;

    IF v_status = FALSE THEN
        EXECUTE ('DELETE FROM ' || quote_ident(v_tabname) || ' WHERE ' || quote_ident(v_tabidname) || ' = $1 AND cur_user = current_user') USING v_id_arg;
    ELSIF (existing_record) = 0 THEN
        EXECUTE ('INSERT INTO  ' || quote_ident(v_tabname) || ' (' || quote_ident(v_tabidname) || ', cur_user) VALUES ($1, current_user);') USING v_id_arg;
    END IF;
	
	EXECUTE 'SET ROLE ' || v_prev_cur_user || '';
  --Return
    RETURN ('{"status":"Accepted", "apiVersion":'|| v_version ||'}')::json;    


--    Exception handling
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;    


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

