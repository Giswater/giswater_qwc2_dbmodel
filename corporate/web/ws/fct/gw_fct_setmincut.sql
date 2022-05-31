-- Function: SCHEMA_NAME.gw_fct_setmincut(json)

-- DROP FUNCTION SCHEMA_NAME.gw_fct_setmincut(json);

CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_setmincut(p_data json)
  RETURNS json AS
$BODY$

/*
-- Button networkMincut on mincut dialog
SELECT gw_fct_setmincut('{"data":{"action":"mincutNetwork", "arcId":"2001", "mincutId":"3", "usePsectors":false}}');

-- Button valveUnaccess on mincut dialog
SELECT gw_fct_setmincut('{"data":{"action":"mincutValveUnaccess", "nodeId":1001, "mincutId":"3", "usePsectors":false}}');

-- Button Accept on mincut dialog
SELECT gw_fct_setmincut('{"data":{"action":"mincutAccept", "mincutClass":1, "mincutId":"3", "status":"check", "usePsectors":false}}');

-- Button Accept on mincut conflict dialog
SELECT gw_fct_setmincut('{"data":{"action":"mincutAccept", "mincutClass":1, "mincutId":"3", "status":"continue"}}');

-- Button Accept when is mincutClass = 2
SELECT gw_fct_setmincut('{"data":{"action":"mincutAccept", "mincutClass":2, "mincutId":"3"}}');

-- Button Accept when is mincutClass = 3
SELECT gw_fct_setmincut('{"data":{"action":"mincutAccept", "mincutClass":3, "mincutId":"3"}}');

fid = 216

WEB

SELECT gw_fct_setmincut($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"mincut_id_arg":null, "x":"419544.39398676", "y":"4576488.2140275", "srid_arg":25831, "device":3, 
"insert_data":{"mincut_state":"0","mincut_type":"Real","anl_cause":"1","assigned_to":"abofill","anl_descript":"test","anl_tstamp":"2022-05-13 10:32:45",
"forecast_start":null,"forecast_end":null,"muni_id":"1","postcode":"08830","streetaxis_id":"1-11000C","exec_start":null,"exec_appropiate":"false",
"exec_end":null}, "element_type":"arc", "id_arg":"2095"}}$$);  

*/

DECLARE

v_arc integer;
v_id integer;
v_node integer;
v_mincut integer;
v_status boolean;
v_valveunaccess json;
v_action text;
v_mincut_class integer;
v_version text;
v_error_context text;
v_usepsectors boolean;

v_mincut_id_arg integer;
v_x double precision;
v_y double precision;
v_srid_arg integer;
v_device integer;
v_insert_data json;
v_element_type character varying;
v_id_arg character varying;
v_cur_user text;
v_prev_cur_user text;
	
BEGIN

	-- Search path
	SET search_path = "SCHEMA_NAME", public;
	SELECT giswater INTO v_version FROM sys_version order by id desc limit 1;

	-- get input parameters
	v_action := (p_data ->>'data')::json->>'action';
	v_mincut := ((p_data ->>'data')::json->>'mincutId')::integer;
	v_mincut_class := ((p_data ->>'data')::json->>'mincutClass')::integer;
	v_node := ((p_data ->>'data')::json->>'nodeId')::integer;
	v_arc := ((p_data ->>'data')::json->>'arcId')::integer;
	v_usepsectors := ((p_data ->>'data')::json->>'usePsectors')::boolean;
	
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_x :=  ((p_data ->>'data')::json->>'x');
	v_y :=  ((p_data ->>'data')::json->>'y');
	v_srid_arg :=  ((p_data ->>'data')::json->>'srid_arg')::integer;
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_insert_data :=  ((p_data ->>'data')::json->>'insert_data');
	v_element_type :=  ((p_data ->>'data')::json->>'element_type');
	v_id_arg :=  ((p_data ->>'data')::json->>'id_arg');
	v_cur_user := (p_data ->> 'client')::json->> 'cur_user';
	
	IF v_device IN (1,2,3) THEN
		--  Return
   		RETURN  gw_fct_upsertmincut(v_mincut_id_arg, v_x, v_y, v_srid_arg, v_device, v_insert_data, v_element_type, v_id_arg, v_cur_user);
	END IF;
	
	-- delete previous
	DELETE FROM audit_check_data WHERE fid = 216 and cur_user=current_user;
	
	IF v_action = 'mincutNetwork' THEN

		RETURN gw_fct_mincut(v_arc::text, 'arc'::text, v_mincut, v_usepsectors);
		
	ELSIF v_action = 'mincutValveUnaccess' THEN

		RETURN gw_fct_json_create_return(gw_fct_mincut_valve_unaccess(p_data), 2980, null, null, null);
		
	ELSIF v_action = 'mincutAccept' THEN

		IF v_mincut_class = 1 THEN

			UPDATE config_param_user SET value = v_mincut::text WHERE parameter = 'inp_options_valve_mode_mincut_result' AND cur_user = current_user;
		
			RETURN gw_fct_mincut_result_overlap(p_data);

		ELSIF v_mincut_class IN (2, 3) THEN
		
			RETURN gw_fct_mincut_connec(p_data);
		
		END IF;

	END IF;
	
	--  Exception handling
	EXCEPTION WHEN OTHERS THEN
	GET STACKED DIAGNOSTICS v_error_context = pg_exception_context;  
	RETURN ('{"status":"Failed", "SQLERR":' || to_json(SQLERRM) || ',"SQLCONTEXT":' || to_json(v_error_context) || ',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION SCHEMA_NAME.gw_fct_setmincut(json)
  OWNER TO role_admin;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_setmincut(json) TO public;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_setmincut(json) TO role_admin;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_setmincut(json) TO role_basic;
