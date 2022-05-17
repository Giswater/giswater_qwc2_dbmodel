/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_setcoordinates(
    p_x double precision,
    p_y double precision,
    p_epsg integer,
    p_device integer,
    p_zoom_ratio double precision,
    p_id text,
    p_form_id text,
	p_user_name text)
  RETURNS json AS
$BODY$

DECLARE
--    Variables
    v_point geometry;
    v_version text;
	v_prev_user_name text;
    
BEGIN

--  Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;

	v_prev_user_name = current_user;
	EXECUTE 'SET ROLE ' || p_user_name || '';
	
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;
    
--   Database update
     IF p_x IS NOT NULL AND p_y IS NOT NULL AND p_form_id='F41' THEN
    SELECT st_closestpoint(arc.the_geom, ST_SetSRID(ST_MakePoint(p_x,p_y),p_epsg)) FROM arc ORDER BY ST_Distance(arc.the_geom, ST_SetSRID(ST_MakePoint(p_x,p_y),p_epsg)) LIMIT 1 INTO v_point;
    UPDATE om_mincut SET exec_the_geom=v_point WHERE id=p_id::integer;
     END IF;

	EXECUTE 'SET ROLE ' || v_prev_user_name || '';
	
-- Return
     RETURN  SCHEMA_NAME.gw_fct_getmincut(null, null, null, p_id::integer, p_device, 'arc', 'lang', p_user_name);
       
--    Exception handling
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

