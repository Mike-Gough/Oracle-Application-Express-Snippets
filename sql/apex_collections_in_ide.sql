/* 
To query data from the apex_collections view from a PL/SQL IDE you can run a 
short anonymous PL/SQL block and define the workspace, application and session.
*/

declare
  l_workspace_id apex_workspaces.workspace_id%type;
  
begin
  select workspace_id
    into l_workspace_id
    from apex_workspaces
   where upper(workspace) = upper('&WORKSPACE_NAME');
   
   -- Set workspace id
   apex_util.set_security_group_id (l_workspace_id);

   -- Set application id
   apex_application.g_flow_id  := &APP_ID;     
   
   -- Set session id
   apex_application.g_instance := &APP_SESSION;  
end;

select c.*
  from apex_collections c;
