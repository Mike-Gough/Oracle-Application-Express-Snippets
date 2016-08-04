set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>38195628586034147930
,p_default_application_id=>39876
,p_default_owner=>'UNKNOWN'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_mike_gough_slide_toggle
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(38198050607418219189)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.MIKE.GOUGH.SLIDE.TOGGLE'
,p_display_name=>'Slide Toggle'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function slidetoggle (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin )',
'    return apex_plugin.t_dynamic_action_render_result',
'is',
'    l_duration varchar2(10) := nvl(p_dynamic_action.attribute_01, ''normal'');',
'    l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'    l_result.javascript_function :=',
'            ''function(){''||',
'            ''  if (this.browserEvent==="load"){''||',
'            ''    this.affectedElements.hide();''||',
'            ''  } else {''||',
'            ''    this.affectedElements.slideToggle(''||case when l_duration=''normal'' then ''400'' else ''"''||l_duration||''"'' end||'');''||',
'            ''  }''||',
'            ''}'';',
'    return l_result;',
'end slidetoggle;'))
,p_render_function=>'render_slidetoggle'
,p_standard_attributes=>'ITEM:REGION:JQUERY_SELECTOR:JAVASCRIPT_EXPRESSION:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'<p><strong>Slide Toggle</strong> is an animation effect which slowly slides up or down a region or page item. The effect looks much nicer than the built-in Hide/Show dynamic action which immediately hides or shows the component.</p>'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/Mike-Gough/Oracle-Application-Express-Snippets'
,p_plugin_comment=>'Based on a plugin provided by Oracle.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(38198050804020219192)
,p_plugin_id=>wwv_flow_api.id(38198050607418219189)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Duration'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'normal'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Specifies how long the animation will run.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(38198051278893219194)
,p_plugin_attribute_id=>wwv_flow_api.id(38198050804020219192)
,p_display_sequence=>10
,p_display_value=>'fast'
,p_return_value=>'fast'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(38198051777633219196)
,p_plugin_attribute_id=>wwv_flow_api.id(38198050804020219192)
,p_display_sequence=>20
,p_display_value=>'normal'
,p_return_value=>'normal'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(38198052259681219197)
,p_plugin_attribute_id=>wwv_flow_api.id(38198050804020219192)
,p_display_sequence=>30
,p_display_value=>'slow'
,p_return_value=>'slow'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
