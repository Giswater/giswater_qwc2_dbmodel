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
	v_prev_user_name text;

	
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
	
	IF v_device IN (1,2,3) THEN
		--  Return
   		RETURN  gw_fct_setcoordinates(v_x, v_y, v_epsg, v_device, v_zoom_ratio, v_id, v_form_id, v_user_name);
	END IF;

--  Exception handling
/*
    EXCEPTION WHEN OTHERS THEN 
        RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
*/

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

