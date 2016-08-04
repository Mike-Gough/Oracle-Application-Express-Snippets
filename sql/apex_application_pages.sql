/*
These queries ustalise a set of views created by Oracle allow us access the inner workings of APEX.
*/

-- get the name of the current page
select page_name
  from apex_application_pages
 where     application_id = :APP_ID
       and page_id = :APP_PAGE_ID;

-- get the mode of the current page (NORMAL, MODAL DIALOG, etc)
select page_mode
  from apex_application_pages
 where     application_id = :APP_ID
       and page_id = :APP_PAGE_ID;

-- can be used in a 'rows returned' condition on a global page (i.e. page 0) to display a component only on a spesific type of page
select 1
  from apex_application_pages
 where     application_id = :APP_ID
       and page_id = :APP_PAGE_ID
       and page_mode = 'Normal';