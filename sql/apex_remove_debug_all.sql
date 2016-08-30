/* 
To delete debug data from apex you can run a short anonymous PL/SQL block 
to define the workspace, application and session before looping through
all of your applications and removing debug data.
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
   
   -- remove debug
   for i in (select application_id
               from apex_applications)
   loop
     apex_debug.remove_debug_by_app (p_application_id => i.application_id);
   end loop;
end;
