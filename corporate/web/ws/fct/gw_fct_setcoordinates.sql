CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_setcoordinates"(p_data json) RETURNS pg_catalog.json AS $BODY$

/*
SELECT gw_fct_setcoordinates($${
"client":{"device":4, "infoType":1, "lang":"ES"}, "form":{}, 
"feature":{}, 
"data":{"x":"419528.73597232", "y":"4576490.8982585", "epsg":"25831", "device":3, "zoom_ratio":"0.14912394710811", "id":"78", "form_id":"F41"}}$$);
*/
DECLARE
    v_x double precision;
    v_y double precision;
    v_epsg integer;
    v_device integer;
    v_zoom_ratio double precision;
    v_id text;
    v_form_id text;
	v_user_name text;

	
BEGIN

	
--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
	
	-- getting input data 
	v_x :=  ((p_data ->>'data')::json->>'x');
	v_y :=  ((p_data ->>'data')::json->>'y');
	v_epsg :=  ((p_data ->>'data')::json->>'epsg')::integer;
	v_device :=  ((p_data ->>'data')::json->>'device')::integer;
	v_zoom_ratio :=  ((p_data ->>'data')::json->>'zoom_ratio');
	v_id :=  ((p_data ->>'data')::json->>'id')::text;
	v_form_id = ((p_data ->>'data')::json->>'form_id')::text;
	v_user_name := (p_data ->> 'client')::json->> 'user_name';

	v_prev_user_name = current_user;
	EXECUTE 'SET ROLE ' || v_user_name || '';
	
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;
    
--   Database update
     IF v_x IS NOT NULL AND v_y IS NOT NULL AND v_form_id='F41' THEN
    SELECT st_closestpoint(arc.the_geom, ST_SetSRID(ST_MakePoint(v_x,v_y),v_epsg)) FROM arc ORDER BY ST_Distance(arc.the_geom, ST_SetSRID(ST_MakePoint(v_x,v_y),v_epsg)) LIMIT 1 INTO v_point;
    UPDATE om_mincut SET exec_the_geom=v_point WHERE id=v_id::integer;
     END IF;

	EXECUTE 'SET ROLE ' || v_prev_user_name || '';
	
-- Return
     RETURN  SCHEMA_NAME.gw_fct_getmincut(null, null, null, v_id::integer, v_device, 'arc', 'lang', v_user_name);
       
--    Exception handling
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

