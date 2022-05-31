-- Function: SCHEMA_NAME.gw_fct_getmincut(json)

-- DROP FUNCTION SCHEMA_NAME.gw_fct_getmincut(json);

CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_getmincut(p_data json)
  RETURNS json AS
$BODY$

/*
-- Button networkMincut on mincut dialog
SELECT gw_fct_getmincut('{"data":{"mincutId":"3"}}');

fid = 216

WEB

SELECT gw_fct_getmincut($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"x":"419534.15219828", "y":"4576491.4086902", "srid_arg":"25831", "mincut_id_arg":null, "device":3, "insert_data":"arc", 
"element_type":{}, "lang":"es"}}$$);


*/

DECLARE

v_mincut integer;
v_version text;
v_error_context text;
v_mincutrec record;
v_result json;
v_result_info json;

v_x double precision;
v_y double precision;
v_srid_arg integer;
v_mincut_id_arg integer;
v_device integer;
v_element_type character varying;
v_lang character varying;
v_cur_user text;


BEGIN

	-- Search path
	SET search_path = "SCHEMA_NAME", public;
	
	SELECT giswater INTO v_version FROM sys_version order by id desc limit 1;

	-- delete previous
	DELETE FROM audit_check_data WHERE fid = 216 and cur_user=current_user;

	-- get input parameters
	v_mincut := ((p_data ->>'data')::json->>'mincutId')::integer;	
	
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_x :=  ((p_data ->>'data')::json->>'x');
	v_y :=  ((p_data ->>'data')::json->>'y');
	v_srid_arg :=  ((p_data ->>'data')::json->>'srid_arg')::integer;
	v_mincut_id_arg :=  ((p_data ->>'data')::json->>'mincut_id_arg');
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_element_type :=  ((p_data ->>'data')::json->>'element_type');
	v_lang :=  ((p_data ->>'data')::json->>'lang');
	v_cur_user := (p_data ->> 'client')::json->> 'cur_user';
	
	IF v_device IN (1,2,3) THEN
		--  Return
   		RETURN  gw_fct_getmincut(v_x, v_y, v_srid_arg, v_mincut_id_arg, v_device, v_element_type, v_lang, v_cur_user);
	END IF;
	
	-- mincut details
	SELECT * INTO v_mincutrec FROM om_mincut WHERE id = v_mincut;
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, '');
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, 'Mincut stats');
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, '-----------------');
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Number of arcs: ', (v_mincutrec.output->>'arcs')::json->>'number'));
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Length of affected network: ', (v_mincutrec.output->>'arcs')::json->>'length', ' mts'));
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Total water volume: ', (v_mincutrec.output->>'arcs')::json->>'volume', ' m3'));
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Number of connecs affected: ', (v_mincutrec.output->>'connecs')::json->>'number'));
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Total of hydrometers affected: ', ((v_mincutrec.output->>'connecs')::json->>'hydrometers')::json->>'total'));
	INSERT INTO audit_check_data (fid, error_message) VALUES (216, concat('Hydrometers classification: ', ((v_mincutrec.output->>'connecs')::json->>'hydrometers')::json->>'classified'));

	-- info
	v_result = null;
	SELECT array_to_json(array_agg(row_to_json(row))) INTO v_result 
	FROM (SELECT id, error_message as message FROM audit_check_data WHERE cur_user="current_user"() AND fid=216 order by id) row;
	v_result := COALESCE(v_result, '{}'); 
	v_result_info = concat ('{"geometryType":"", "values":',v_result, '}');

	v_result_info := COALESCE(v_result_info, '{}'); 

	-- return
	RETURN ('{"status":"Accepted", "version":"'||v_version||'","body":{"form":{}'||
			',"data":{ "info":'||v_result_info||'}'||
			'}}')::json;

	--  Exception handling
	EXCEPTION WHEN OTHERS THEN
	GET STACKED DIAGNOSTICS v_error_context = pg_exception_context;  
	RETURN ('{"status":"Failed", "SQLERR":' || to_json(SQLERRM) || ',"SQLCONTEXT":' || to_json(v_error_context) || ',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION SCHEMA_NAME.gw_fct_getmincut(json)
  OWNER TO role_admin;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_getmincut(json) TO public;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_getmincut(json) TO role_admin;
GRANT EXECUTE ON FUNCTION SCHEMA_NAME.gw_fct_getmincut(json) TO role_basic;
