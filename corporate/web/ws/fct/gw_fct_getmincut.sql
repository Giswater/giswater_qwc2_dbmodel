/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_getmincut(
    x double precision,
    y double precision,
    srid_arg integer,
    mincut_id_arg integer,
    device integer,
    p_element_type character varying,
    lang character varying,
	p_cur_user text)
  RETURNS json AS
$BODY$
/*
SELECT SCHEMA_NAME.gw_fct_getmincut(431016.25975796,4648673.3445991,'25831',929,3,'arc','en') AS result
*/

DECLARE

--    Variables
    form_info json;
    formTabs text;
    v_version json;
    json_array json[];
    mincut_data record;
    point_geom public.geometry;
    SRID_var int;
    id_visit int;
    schemas_array name[];
    v_geometry json;
    address_array text[];
    aux_combo text[];
    aux_combo_id text[];
    aux_combo_name text[];
    aux_selected_id text;
    tabAux json;
    current_user_var character varying(30);
    v_mincut_id text=mincut_id_arg;
    
--      Value defaults
    v_mincut_new_state int2;
    v_mincut_new_type text;
    v_mincut_new_cause text;
    v_mincut_new_assigned text;
    v_publish_user text;
    v_mincut_class int2;
    v_mincut_class_name text;
    v_mincut_valve_layer text;
    v_mincut_valve_layer_json json;

    v_tab1 boolean;
    v_tab2 boolean=false;
    v_tab3 boolean;
    v_mincut_state int2;

    v_state0 boolean = FALSE;
    v_state1 boolean = TRUE;
    v_exec_geom public.geometry;
    v_anl_geom public.geometry;
    V_street_centroid public.geometry;
   	v_visible_layers text;
	
	v_prev_cur_user text;


    

BEGIN

--    Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;

	v_prev_cur_user = current_user;
	EXECUTE 'SET ROLE ' || p_cur_user || '';
  
--    Get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

--    Get valve layer name
    SELECT ((value::json)->>'mincut_valve_layer') INTO v_mincut_valve_layer FROM config_param_system WHERE parameter='api_mincut_parameters';
   
--     Get visible layers
       v_visible_layers := (SELECT value FROM config_param_system WHERE parameter='api_mincut_visible_layers');


--    Get current user
    EXECUTE 'SELECT current_user'
        INTO current_user_var;

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
    
    v_mincut_class_name := (SELECT idval FROM om_typevalue WHERE typevalue = 'mincut_class' AND id::text = v_mincut_class::text);

--    Enable / dissable widgets
    v_mincut_state := (SELECT mincut_state FROM om_mincut WHERE id= mincut_id_arg);
        
    IF v_mincut_state IS NULL OR v_mincut_state=0 THEN
        v_state1=TRUE;
        v_state0=FALSE; 
        v_tab1=TRUE;
        v_tab3=FALSE;
    ELSIF v_mincut_state=1 THEN
        v_state1=FALSE;
        v_state0=FALSE;
        v_tab1=FALSE;
        v_tab3=TRUE;        
    ELSIF v_mincut_state=2 THEN
        v_state1=TRUE;
        v_state0=TRUE;
        v_tab1=TRUE;
        v_tab3=FALSE;
    END IF;
 
--    New or existing mincut?
    IF mincut_id_arg IS NOT NULL THEN

--        Update the selector
        --current user
        DELETE FROM selector_mincut_result WHERE result_id = mincut_id_arg AND cur_user = current_user_var;
        IF (SELECT COUNT(*) FROM selector_mincut_result WHERE cur_user = current_user_var) > 0 THEN
            UPDATE selector_mincut_result SET result_id = mincut_id_arg WHERE cur_user = current_user_var
            AND NOT EXISTS (SELECT 1 FROM selector_mincut_result WHERE cur_user = current_user_var AND result_id= mincut_id_arg);
        ELSE
            INSERT INTO selector_mincut_result(cur_user, result_id) VALUES (current_user_var, mincut_id_arg)
            ON CONFLICT (cur_user, result_id) DO NOTHING;
        END IF;
        
        -- publish user
        SELECT value FROM config_param_system WHERE parameter='admin_publish_user' 
            INTO v_publish_user;
        IF (SELECT COUNT (*) FROM selector_mincut_result WHERE cur_user = v_publish_user AND result_id=mincut_id_arg) = 0 THEN
            INSERT INTO selector_mincut_result(cur_user, result_id) VALUES (v_publish_user, mincut_id_arg) 
            ON CONFLICT (cur_user, result_id) DO NOTHING;
        END IF;
        
--        Get existing mincut data
        EXECUTE 'SELECT 
            om_mincut.id AS "mincut_id",
            work_order,
            mincut_state::TEXT,                        
            mincut_type::TEXT,            
            anl_cause::TEXT,            
            anl_tstamp,
            forecast_start::timestamp(0),
            forecast_end::timestamp(0),
            assigned_to::TEXT,
            anl_descript,
            exec_start::timestamp(0),
            exec_descript,
            exec_end::timestamp(0),
            anl_the_geom,
            ext_municipality.name AS "muni_id",
            v_ext_streetaxis.descript AS "streetname",
            postcode,
            streetaxis_id,
            postnumber,
            exec_user,
            exec_descript,
            exec_the_geom,
            exec_from_plot,
            exec_depth,
            exec_appropiate                
            FROM om_mincut LEFT JOIN ext_municipality USING (muni_id) LEFT JOIN v_ext_streetaxis ON v_ext_streetaxis.id=streetaxis_id WHERE om_mincut.id = $1'
        INTO mincut_data
        USING mincut_id_arg; 
        
        -- Return geometry
        EXECUTE 'SELECT row_to_json(row) FROM (SELECT St_AsText(St_simplify($1,0)))row'
            INTO v_geometry
            USING mincut_data.anl_the_geom;

--        Mincut fields
        json_array[0] := gw_fct_createwidgetjson('ID tancament', 'mincut_id', 'text', 'text', '', TRUE, mincut_data.mincut_id::TEXT);
        json_array[1] := gw_fct_createwidgetjson('Ordre treball', 'work_order', 'text', 'text', '', v_state0, mincut_data.work_order);
        json_array[2] := gw_fct_createcombojson('Estat', 'mincut_state', 'combo', 'string', '', TRUE, '(SELECT * FROM om_typevalue WHERE typevalue = ''mincut_state'' AND id<>''4'')b','id','idval',mincut_data.mincut_state);
        json_array[3] := gw_fct_createcombojson('Tipus', 'mincut_type', 'combo', 'string', '', v_state0, 'om_mincut_cat_type','id','descript',mincut_data.mincut_type);
        json_array[4] := gw_fct_createcombojson('Causa', 'anl_cause', 'combo', 'string', '', v_state0, '(SELECT * FROM om_typevalue WHERE typevalue = ''mincut_cause'')b','id','idval',mincut_data.anl_cause);
        json_array[5] := gw_fct_createcombojson('Assignat a', 'assigned_to', 'combo', 'string', '', v_state0, '(SELECT * FROM cat_users WHERE active IS TRUE)b','id','name',mincut_data.assigned_to);
        json_array[6] := gw_fct_createwidgetjson('Descripció', 'anl_descript', 'textarea', 'text', '', v_state0, mincut_data.anl_descript);
        json_array[7] := gw_fct_createwidgetjson('Dates', 'divider', 'formDivider', 'text', NULL, TRUE, NULL);
        json_array[8] := gw_fct_createwidgetjson('Rebut', 'anl_tstamp', 'datepickertime', 'date', '', v_state0, mincut_data.anl_tstamp::TEXT);
        json_array[9] := gw_fct_createwidgetjson('Inici previst', 'forecast_start', 'datepickertime', 'date', '', v_state0, mincut_data.forecast_start::TEXT);
        json_array[10] := gw_fct_createwidgetjson('Final previst', 'forecast_end', 'datepickertime', 'date', '', v_state0, mincut_data.forecast_end::TEXT);

        json_array[11] := gw_fct_createwidgetjson('Iniciar procediment de tall', 'gw_fct_setmincut_start', 'button', 'string', '', v_state0,'mincutStartMincut');
        json_array[12] := gw_fct_createwidgetjson('Data inici', 'exec_start', 'datepickertime', 'date', '', v_state1, mincut_data.exec_start::TEXT);
        json_array[13] := gw_fct_createwidgetjson(NULL, 'divider', 'formDivider', 'text', NULL, v_state1, NULL);
        json_array[14] := gw_fct_createwidgetjson('Descripció', 'exec_descript', 'textarea', 'text', '', v_state1, mincut_data.exec_descript);
        json_array[15] := gw_fct_createwidgetjson('Localització real del tall', 'gw_fct_setcoordinates', 'button', 'text', '', v_state1,'');        
        json_array[16] := gw_fct_createwidgetjson('Distància', 'exec_from_plot', 'text', 'text', '', v_state1, mincut_data.exec_from_plot::TEXT);
        json_array[17] := gw_fct_createwidgetjson('Profunditat', 'exec_depth', 'text', 'text', '', v_state1, mincut_data.exec_depth::TEXT);
        json_array[18] := gw_fct_createwidgetjson('Operari', 'exec_user', 'text', 'text', '', v_state1, mincut_data.exec_user::TEXT);
        json_array[19] := gw_fct_createwidgetjson('Apropiat', 'exec_appropiate', 'check', 'text', '', v_state1, mincut_data.exec_appropiate::TEXT);
        json_array[20] := gw_fct_createwidgetjson(NULL, 'divider', 'formDivider', 'text', NULL, FALSE, NULL);
        json_array[21] := gw_fct_createwidgetjson('Data Final', 'exec_end', 'datepickertime', 'date', '', v_state1, mincut_data.exec_end::TEXT);
        json_array[22] := gw_fct_createwidgetjson('Finalitzar procediment de tall', 'gw_fct_setmincut_end', 'button', 'text', '', v_state1,'');

        json_array[25] := gw_fct_createwidgetjson('Municipi', 'muni_id', 'text', 'text', '', v_state0, mincut_data.muni_id);
        json_array[26] := gw_fct_createwidgetjson('Codi postal', 'postcode', 'text', 'text', '', v_state0, mincut_data.postcode);
        
        --        Construct geom in device coordinates
        point_geom := ST_SetSRID(ST_Point(X, Y),SRID_arg);

        --        Get location combos searching the address
        EXECUTE 'SELECT array_agg(row.id) FROM (SELECT id FROM ext_address WHERE ST_DWithin(the_geom, $1, 200) ORDER BY ST_distance (the_geom,$1) ASC LIMIT 5) row'
        INTO address_array
        USING point_geom;

        IF address_array IS NULL THEN
            EXECUTE 'SELECT array_agg(row.id) FROM (SELECT id FROM ext_address) row'
                INTO address_array
                USING point_geom;
        END IF;

        select ARRAY[v_ext_streetaxis.descript] INTO aux_combo_name from v_ext_streetaxis WHERE id = mincut_data.streetaxis_id;
        EXECUTE 'SELECT array_agg(row.id) FROM (SELECT DISTINCT ON (v_ext_streetaxis.id) v_ext_streetaxis.id FROM ext_address JOIN v_ext_streetaxis ON 
            (streetaxis_id = v_ext_streetaxis.id) WHERE ext_address.id = ANY($1) ORDER BY v_ext_streetaxis.id) row'
            INTO aux_combo_id
            USING address_array;        

        EXECUTE 'SELECT array_agg(row.descript) FROM (SELECT DISTINCT ON (v_ext_streetaxis.id) v_ext_streetaxis.descript FROM ext_address JOIN v_ext_streetaxis ON 
            (streetaxis_id = v_ext_streetaxis.id) WHERE ext_address.id = ANY($1) ORDER BY v_ext_streetaxis.id) row'
            INTO aux_combo_name
            USING address_array;

        select mincut_data.streetaxis_id INTO aux_selected_id;

        --Construc the JSON
        json_array[27] := json_build_object('label', 'Carrer', 'name', 'streetaxis_id', 'type', 'combo', 'dataType', 'string', 
                        'disabled', v_state0, 'tab', 'location', 
                        'comboNames', array_to_json(aux_combo_name),
                        'comboIds', array_to_json(aux_combo_id), 
                        'selectedId', aux_selected_id
                        );
        json_array[28] := gw_fct_createwidgetjson('Número portal', 'postnumber', 'text', 'text', '', v_state0, mincut_data.postnumber);
--        Returning geometry
        IF v_mincut_class=1 THEN
            v_exec_geom := (SELECT exec_the_geom FROM om_mincut WHERE id= v_mincut_id::integer);
            v_anl_geom := (SELECT anl_the_geom FROM om_mincut WHERE id= v_mincut_id::integer);

            IF  v_exec_geom IS NOT NULL THEN 
                EXECUTE 'SELECT row_to_json(row) FROM (SELECT St_AsText($1))row'
                INTO v_geometry
                USING v_exec_geom;
            ELSIF v_anl_geom IS NOT NULL THEN
                EXECUTE 'SELECT row_to_json(row) FROM (SELECT St_AsText($1))row'
                    INTO v_geometry
                    USING v_anl_geom;
            END IF;    
        END IF;    

        IF v_exec_geom is null and v_anl_geom is null and mincut_data.streetaxis_id IS NOT NULL THEN
            RAISE NOTICE 'geom_street';
            EXECUTE 'SELECT ST_Centroid(the_geom) FROM v_ext_streetaxis where id = $1'
            INTO v_street_centroid
            USING mincut_data.streetaxis_id;

            EXECUTE 'SELECT row_to_json(row) FROM (SELECT St_AsText($1))row'
            INTO v_geometry
            USING v_street_centroid;
        END IF;

    ELSE    -- NEW MINCUT

--        Construct geom in device coordinates
        point_geom := ST_SetSRID(ST_Point(X, Y),SRID_arg);

--        Get table coordinates
        schemas_array := current_schemas(FALSE);
        SRID_var := Find_SRID(schemas_array[1]::TEXT, 'om_visit', 'the_geom');

--        Transform from device EPSG to database EPSG
        point_geom := ST_Transform(point_geom, SRID_var);


--        Return geometry
        IF v_mincut_class=1 THEN
            EXECUTE 'SELECT row_to_json(row) 
                FROM (SELECT St_AsText(St_simplify(St_closestPoint(arc.the_geom,$1),0)) FROM arc ORDER BY ST_Distance(arc.the_geom, $1) LIMIT 1)row'
                INTO v_geometry
                USING point_geom;
        ELSE
                v_geometry:= to_json(point_geom);
        END IF;        


--        Get default values
        SELECT ((value::json)->>'mincut_state') INTO v_mincut_new_state FROM config_param_system WHERE parameter='api_mincut_new_vdef';
        SELECT ((value::json)->>'mincut_type') INTO v_mincut_new_type FROM config_param_system WHERE parameter='api_mincut_new_vdef';
        SELECT ((value::json)->>'anl_cause') INTO v_mincut_new_cause FROM config_param_system WHERE parameter='api_mincut_new_vdef';
        SELECT ((value::json)->>'assigned_to') INTO v_mincut_new_assigned FROM config_param_system WHERE parameter='api_mincut_new_vdef';


	
--        Return defaults
        json_array[0] := gw_fct_createwidgetjson('ID tancament', 'mincut_id', 'text', 'string', '', TRUE, '');
        json_array[1] := gw_fct_createwidgetjson('Ordre treball', 'work_order', 'text', 'string', '', v_state0, '');
        json_array[2] := gw_fct_createcombojson('Estat', 'mincut_state', 'combo', 'string', '', TRUE, '(SELECT * FROM om_typevalue WHERE typevalue = ''mincut_state'' AND id<>''4'')b','id','idval',v_mincut_new_state::TEXT);
        json_array[3] := gw_fct_createcombojson('Tipus', 'mincut_type', 'combo', 'string', '', v_state0, 'om_mincut_cat_type','id','descript',v_mincut_new_type::TEXT);
        json_array[4] := gw_fct_createcombojson('Causa', 'anl_cause', 'combo', 'string', '', v_state0, '(SELECT * FROM om_typevalue WHERE typevalue = ''mincut_cause'')b','id','idval',v_mincut_new_cause);
        json_array[5] := gw_fct_createcombojson('Assignat a', 'assigned_to', 'combo', 'string', '', v_state0, '(SELECT * FROM cat_users WHERE active IS TRUE)b','id','name',v_mincut_new_assigned);
        json_array[6] := gw_fct_createwidgetjson('Descripció', 'anl_descript', 'textarea', 'string', '', v_state0, '');        
        json_array[7] := gw_fct_createwidgetjson('Dates', 'divider', 'formDivider', 'string', NULL, TRUE, NULL);
        json_array[8] := gw_fct_createwidgetjson('Rebut', 'anl_tstamp', 'datepickertime', 'date', '', v_state0, now()::timestamp(0)::TEXT);
        json_array[9] := gw_fct_createwidgetjson('Inici previst', 'forecast_start', 'datepickertime', 'date', '', v_state0, NULL);
        json_array[10] := gw_fct_createwidgetjson('Final previst', 'forecast_end', 'datepickertime', 'date', '', v_state0, NULL);

        json_array[11] := gw_fct_createwidgetjson('Iniciar procediment de tall', 'gw_fct_setmincut_start', 'button', 'string', '', v_state0,'mincutStartMincut');
        json_array[12] := gw_fct_createwidgetjson('Data inici', 'exec_start', 'datepickertime', 'date', '', v_state1, NULL);
        json_array[13] := gw_fct_createwidgetjson(NULL, 'divider', 'formDivider', 'string', NULL, FALSE, NULL);
        json_array[14] := gw_fct_createwidgetjson('Descripció', 'exec_descript', 'textarea', 'string', '', v_state1, '');
        json_array[15] := gw_fct_createwidgetjson('Localització real del tall', 'gw_fct_setcoordinates', 'button', 'string', '', v_state1,'');
        json_array[16] := gw_fct_createwidgetjson('Distància', 'exec_from_plot', 'text', 'string', '', v_state1, '');
        json_array[17] := gw_fct_createwidgetjson('Profunditat', 'exec_depth', 'text', 'string', '', v_state1, '');
        json_array[18] := gw_fct_createwidgetjson('Operari', 'exec_user', 'text', 'string', '', v_state1, '');
        json_array[19] := gw_fct_createwidgetjson('Apropiat', 'exec_appropiate', 'check', 'string', '', v_state1, '');
        json_array[20] := gw_fct_createwidgetjson(NULL, 'divider', 'formDivider', 'string', NULL, FALSE, NULL);
        json_array[21] := gw_fct_createwidgetjson('Data Final', 'exec_end', 'datepickertime', 'date', '', v_state1, NULL);
        json_array[22] := gw_fct_createwidgetjson('Finalitzar procediment de tall', 'gw_fct_setmincut_end', 'button', 'string', '', v_state1,'');


--        Get location combos searching the address
        EXECUTE 'SELECT array_agg(row.id) FROM (SELECT id FROM ext_address WHERE ST_DWithin(the_geom, $1, 200) ORDER BY ST_distance (the_geom,$1) ASC LIMIT 5) row'
        INTO address_array
        USING point_geom;

        IF address_array IS NULL THEN
            EXECUTE 'SELECT array_agg(row.id) FROM (SELECT id FROM ext_address) row'
                INTO address_array
                USING point_geom;
        END IF;

--        Get municipality
        EXECUTE 'SELECT array_agg(row.name) FROM (SELECT DISTINCT ext_municipality.name FROM ext_address JOIN ext_municipality USING (muni_id) WHERE id = ANY($1)) row'
        INTO aux_combo_name
        USING address_array;
        EXECUTE 'SELECT array_agg(row.muni_id) FROM (SELECT DISTINCT ext_municipality.muni_id FROM ext_address JOIN ext_municipality USING (muni_id) WHERE id = ANY($1)) row'
        INTO aux_combo_id
        USING address_array;

--        Construc the JSON
        json_array[25] := json_build_object('label', 'Municipi', 'name', 'muni_id', 'type', 'combo', 'dataType', 'string', 
                        'disabled', FALSE, 'tab', 'location', 
                        'comboNames', array_to_json(aux_combo_name),
                        'comboIds', array_to_json(aux_combo_id), 
                        'selectedId', aux_combo_id[1]::TEXT);


--        Get postcode
        EXECUTE 'SELECT array_agg(row.postcode) FROM (SELECT DISTINCT postcode FROM ext_address WHERE id = ANY($1)) row'
        INTO aux_combo_name
        USING address_array;

--        Construc the JSON
        json_array[26] := json_build_object('label', 'Codi postal', 'name', 'postcode', 'type', 'combo', 'dataType', 'string', 
                        'disabled', FALSE, 'tab', 'location', 
                        'comboNames', array_to_json(aux_combo_name),
                        'comboIds', array_to_json(aux_combo_name), 
                        'selectedId', aux_combo_name[1]::TEXT
                        );                        
--        Get street
        EXECUTE 'SELECT array_agg(row.id) FROM (SELECT DISTINCT ON (v_ext_streetaxis.id) v_ext_streetaxis.id FROM ext_address JOIN v_ext_streetaxis ON 
            (streetaxis_id = v_ext_streetaxis.id) WHERE ext_address.id = ANY($1) ORDER BY v_ext_streetaxis.id) row'
            INTO aux_combo_id
            USING address_array;        

        EXECUTE 'SELECT array_agg(row.descript) FROM (SELECT DISTINCT ON (v_ext_streetaxis.id) v_ext_streetaxis.descript FROM ext_address JOIN v_ext_streetaxis ON 
            (streetaxis_id = v_ext_streetaxis.id) WHERE ext_address.id = ANY($1) ORDER BY v_ext_streetaxis.id) row'
            INTO aux_combo_name
            USING address_array;

--        Construc the JSON
        json_array[27] := json_build_object('label', 'Carrer', 'name', 'streetaxis_id', 'type', 'combo', 'dataType', 'string', 
                        'disabled', FALSE, 'tab', 'location', 
                        'comboNames', array_to_json(aux_combo_name),
                        'comboIds', array_to_json(aux_combo_id), 
                        'selectedId', aux_combo_id[1]
                        );

--        Get postnumber
        EXECUTE 'SELECT array_agg(row.postnumber) FROM (SELECT DISTINCT postnumber FROM ext_address WHERE id = ANY($1)) row'
        INTO aux_combo_name
        USING address_array;

        json_array[28] := gw_fct_createwidgetjson('Número portal', 'postnumber', 'text', 'string', '', FALSE, '');



    END IF;
    
--    Create tabs array
    formTabs := '[';

--    General tab
    tabAux := json_build_object('tabName','Type', 'tabLabel','General','tabText','Type','active',v_tab1);
    tabAux := gw_fct_json_object_set_key(tabAux, 'fields', array_to_json(json_array[0:10]));
    formTabs := formTabs || tabAux::text;

--    Location tab
    tabAux := json_build_object('tabName','Location','tabLabel','Adreça','tabText','Location','active',v_tab2);
    tabAux := gw_fct_json_object_set_key(tabAux, 'fields', array_to_json(json_array[25:28]));
    formTabs := formTabs || ',' || tabAux::text;

--    Exec tab
    tabAux := json_build_object('tabName','Dates', 'tabLabel','Execució','tabText','Dates','active',v_tab3);
    tabAux := gw_fct_json_object_set_key(tabAux, 'fields', array_to_json(json_array[11:22]));
    formTabs := formTabs || ',' || tabAux::text;

--    Finish the construction of formtabs
    formTabs := formtabs ||']';

--    Create new form for mincut
        form_info := json_build_object('formId','F41','formName',upper(v_mincut_class_name));    
        
--    Convert mincut_valve_layer
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT $1 as layer_table_name) row'
        INTO v_mincut_valve_layer_json
        USING v_mincut_valve_layer;

    IF v_mincut_id IS NULL THEN
        v_mincut_id='FALSE';
    END IF;
    
--    Control NULL's
    formTabs := COALESCE(formTabs, '[]');
    v_version := COALESCE(v_version, '{}');
    form_info := COALESCE(form_info, '{}');
     v_geometry := COALESCE(v_geometry, '{}');
    v_visible_layers := COALESCE(v_visible_layers, '{}');
     v_mincut_valve_layer_json := COALESCE(v_mincut_valve_layer_json, '{}');
  
  	EXECUTE 'SET ROLE ' || v_prev_cur_user || '';
	
--    Return
    RETURN ('{"status":"Accepted"' ||
        ', "apiVersion":'|| v_version ||
        ', "formInfo":' || form_info ||
        ', "formTabs":' || formTabs ||
        ', "geometry":' || v_geometry ||
        ', "mincut_id":"' || v_mincut_id ||'"'||
        ', "visibleLayers":' || v_visible_layers ||
        ', "mincutValveLayer": ' ||v_mincut_valve_layer_json ||
        '}')::json;

--    Exception handling
    EXCEPTION WHEN OTHERS THEN 
    RETURN ('{"status":"Failed","message":' || to_json(SQLERRM) || ', "apiVersion":'|| v_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

