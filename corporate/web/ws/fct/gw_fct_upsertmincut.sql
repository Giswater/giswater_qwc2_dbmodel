/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

DROP FUNCTION SCHEMA_NAME.gw_fct_upsertmincut(integer,  double precision, double precision, integer,  integer,  json,  character varying,  character varying, text);

CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_upsertmincut(
    mincut_id_arg integer,
    x double precision,
    y double precision,
    srid_arg integer,
    device integer,
    insert_data json,
    p_element_type character varying,
    id_arg character varying,
	p_cur_user text)
  RETURNS json AS
$BODY$


/*
SELECT SCHEMA_NAME.gw_fct_upsertmincut(477,419203.72254917,4576479.7842369,25831,3,$${"work_order":null,"mincut_state":"0","mincut_type":"Real",
"anl_cause":"Accidental","assigned_to":"1","anl_descript":null,"anl_tstamp":"2019-01-08 11:50:41",
"forecast_start":null,"forecast_end":null,"muni_id":"Sant Boi del Llobregat","postcode":"08830","streetaxis_id":"1-10240C","postnumber":33,"exec_start":null,"exec_descript":null,"exec_from_plot":null,"exec_depth":null,
"exec_user":null,"exec_appropiate":"false","exec_end":null}$$,'arc','2021')
*/


DECLARE

--    Variables
    point_geom public.geometry;
    v_geometry public.geometry;
    SRID_var int;
    id_visit int;
    schemas_array name[];
    is_done boolean;
    v_version json;
    p_parameter_type text;
    record_aux record;
    v_mincut_id integer;
    inputstring text;
    muni_id_var integer;
    streetaxis_id_var character varying(16);
    mincut_class integer;
    current_user_var character varying(30);
    column_name_var varchar;
    column_type_var varchar;
    v_mincut_return json;
    v_publish_user text;
    v_mincut_class int2;
    v_old_planified_interval date;
    v_new_planified_interval date;
    v_old_values record;
    v_message text;
    v_visible_layers text;
    v_rectgeometry json;
    v_rectgeometry_geom public.geometry;
    v_geometry_return text;
    xid_arg  character varying;
    id_arg_arr character varying[];
	v_prev_cur_user text;
    
BEGIN

--    Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;   
    schemas_array := current_schemas(FALSE);
	
	v_prev_cur_user = current_user;
	EXECUTE 'SET ROLE ' || p_cur_user || '';
	
--    Get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
		INTO v_version;
		
-- fix client null mistakes
	insert_data = REPLACE (insert_data::text, '"NULL"', 'null');
	insert_data = REPLACE (insert_data::text, '"null"', 'null');
	insert_data = REPLACE (insert_data::text, '""', 'null');
    insert_data = REPLACE (insert_data::text, '''''', 'null');

--    Check if array or single value
    IF POSITION('[' IN id_arg) = 0 THEN
        id_arg_arr := ARRAY[id_arg];
    ELSE
    --    Convert text into array
        id_arg_arr := (SELECT ARRAY(SELECT json_array_elements_text(id_arg::JSON)));
    END IF;

--    Get visible layers
    v_visible_layers := (SELECT value FROM config_param_system WHERE parameter='api_mincut_visible_layers');
		
--    Mincut id is an argument
    v_mincut_id := mincut_id_arg;

--    Get current user
    EXECUTE 'SELECT current_user'
        INTO current_user_var;

--    Harmonize p_element_type
    p_element_type := lower (p_element_type);
    IF RIGHT (p_element_type,1)=':' THEN
        p_element_type := reverse(substring(reverse(p_element_type) from 2 for 99));
    END IF;

--    Perform INSERT in case of new mincut
    IF v_mincut_id ISNULL THEN


        --    Get mincut class
        IF p_element_type='arc' THEN 
            v_mincut_class=1;
        ELSIF p_element_type='node' 
            THEN v_mincut_class=1;
        ELSIF p_element_type='connec' 
            THEN v_mincut_class=2;
        ELSIF p_element_type='hydrometer' 
            THEN v_mincut_class=3;
        END IF;

        -- Construct geom in device coordinates
        point_geom := ST_SetSRID(ST_Point(x, y),SRID_arg);

        -- Get table coordinates
        SRID_var := Find_SRID(schemas_array[1]::TEXT, 'om_visit', 'the_geom');

        -- Transform from device EPSG to database EPSG
        point_geom := ST_Transform(point_geom, SRID_var);

--        Calculate geometry
        IF v_mincut_class=1 THEN
            EXECUTE 'SELECT St_closestPoint(arc.the_geom,$1) FROM arc ORDER BY ST_Distance(arc.the_geom, $1) LIMIT 1'
                INTO v_geometry
                USING point_geom;
        ELSE
                v_geometry:= point_geom;
        END IF;     

	-- setting sequence of mincut (as profilactic issue)
	PERFORM setval ('om_mincut_seq', (SELECT max(id) FROM om_mincut), true);
     
        -- Insert mincut
        EXECUTE 'INSERT INTO om_mincut (anl_the_geom) VALUES ($1) RETURNING id'
        USING v_geometry
        INTO v_mincut_id;
        
        -- Update state
        insert_data := gw_fct_json_object_set_key(insert_data, 'mincut_state', 0);
		
		
		-- insert into selector publish user
        IF v_mincut_class=1 THEN
			SELECT value FROM config_param_system WHERE parameter='admin_publish_user' INTO v_publish_user;
			INSERT INTO selector_mincut_result(cur_user, result_id) VALUES (v_publish_user, v_mincut_id);	
	END IF;

	DELETE FROM selector_mincut_result WHERE  cur_user = current_user;
	INSERT INTO selector_mincut_result(cur_user, result_id) VALUES (current_user, v_mincut_id);

    ELSE

        --getting old values
        SELECT * INTO v_old_values FROM om_mincut where id=v_mincut_id;
        
        -- Location data is not combo components, the ID's are computed from values

        -- Find municipality ID
        SELECT muni_id INTO muni_id_var FROM ext_municipality WHERE name = insert_data->>'muni_id';

        -- Update municipality value in the JSON
        insert_data := gw_fct_json_object_set_key(insert_data, 'muni_id', muni_id_var);

    END IF;

--    Update feature id
    insert_data := gw_fct_json_object_set_key(insert_data, 'anl_feature_id', id_arg_arr[1]);

--    Update feature type
    IF p_element_type = 'hydrometer' THEN
        insert_data := gw_fct_json_object_set_key(insert_data, 'anl_feature_type', 'NODE');
    ELSE
        insert_data := gw_fct_json_object_set_key(insert_data, 'anl_feature_type', upper(p_element_type));
    END IF;


--    Update class
    IF p_element_type = 'connec' THEN
        mincut_class = 2;
    ELSIF p_element_type = 'hydrometer' THEN
        mincut_class = 3;
    ELSE
        mincut_class = 1;
    END IF;
 
    insert_data := gw_fct_json_object_set_key(insert_data, 'mincut_class', mincut_class);


--    Update user
    insert_data := gw_fct_json_object_set_key(insert_data, 'anl_user', current_user_var);

--    Update element type to catalog
    insert_data := gw_fct_json_object_set_key(insert_data, 'p_element_type', current_user_var);
	
--    Update reception date
    insert_data := gw_fct_json_object_set_key(insert_data, 'received_date',(insert_data->>'anl_tstamp'));
	
--    Get columns names
    SELECT string_agg(quote_ident(key),',') INTO inputstring FROM json_object_keys(insert_data) AS X (key);


--    specific tasks
    IF mincut_id_arg ISNULL THEN

    
        IF v_mincut_class = 2 THEN

            FOREACH xid_arg IN ARRAY id_arg_arr
            LOOP
                INSERT INTO om_mincut_connec(result_id, connec_id, the_geom) VALUES (v_mincut_id, xid_arg, point_geom);
                INSERT INTO om_mincut_hydrometer(result_id, hydrometer_id) 
                SELECT v_mincut_id, hydrometer_id FROM rtc_hydrometer_x_connec WHERE connec_id=xid_arg;
            END LOOP;

            EXECUTE 'SELECT gw_fct_setmincut(''{"data":{"action":"mincutAccept", "mincutClass":2, "mincutId":'||v_mincut_id||'}}'');';
            
        ELSIF v_mincut_class = 3 THEN
        
            FOREACH xid_arg IN ARRAY id_arg_arr
            LOOP
                INSERT INTO om_mincut_hydrometer(result_id, hydrometer_id) VALUES (v_mincut_id, xid_arg);
            END LOOP;

            EXECUTE 'SELECT gw_fct_setmincut(''{"data":{"action":"mincutAccept", "mincutClass":3, "mincutId":'||v_mincut_id||'}}'');';
            
        ELSE
            RAISE NOTICE 'Call to gw_fct_mincut: %, %, %, %', id_arg_arr[1], p_element_type, v_mincut_id, FALSE;
            v_mincut_return := gw_fct_mincut(id_arg_arr[1], p_element_type, v_mincut_id, FALSE);
        END IF;

        v_message := 'Mincut have been done succesfully' ;
        
    ELSE 

	v_message := 'Mincut have been done succesfully' ;
    
    END IF;
    SET datestyle = dmy;
	--    Perform UPDATE
    FOR column_name_var, column_type_var IN SELECT column_name, data_type FROM information_schema.Columns WHERE table_schema = schemas_array[1]::TEXT AND table_name = 'om_mincut' LOOP
	
        IF (insert_data->>column_name_var) IS NOT NULL THEN
            EXECUTE 'UPDATE om_mincut SET ' || quote_ident(column_name_var) || ' = $1::' || (column_type_var) || ' WHERE om_mincut.id = $2'
            USING insert_data->>column_name_var, v_mincut_id;
        END IF;
    END LOOP;

    v_geometry_return = ((v_mincut_return->>'data')::json->>'geometry')::text;
    
--    Control NULL's
    v_version := COALESCE(v_version, '{}');
    v_message := COALESCE(v_message, '{}');
    v_visible_layers := COALESCE(v_visible_layers, '{}');
    v_geometry_return := COALESCE(v_geometry_return, '{}');
    v_mincut_id := COALESCE(v_mincut_id, 0);

    raise notice ' v_mincut_return %', v_mincut_return;
		
	EXECUTE 'SET ROLE ' || v_prev_cur_user || '';
	
--    Return
    RETURN ('{"status":"Accepted"' ||
        ', "apiVersion":'|| v_version ||
        ', "infoMessage":"' || v_message ||'"'||
        ', "visibleLayers":' || v_visible_layers ||
        ', "geometry":{"st_astext":"' || v_geometry_return ||'"}'
        ', "mincut_id":' || v_mincut_id ||
        '}')::json;

    --Exception handling
    EXCEPTION WHEN OTHERS THEN 
    RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

