# Oracle Application Express Snippets
Code snippets for use with Oracle Application Express (APEX).

## Plugins
### Dynamic Actions
#### Slide Up
Is an animation effect which slowly slides up a region or page item. The effect looks much nicer than the built-in *Hide* dynamic action which immediately hides the component.

#### Slide Down
Is an animation effect which slowly slides down a region or page item. The effect looks much nicer than the built-in *Show* dynamic action which immediately shows the component.

#### Slide Toggle
Is an animation effect which slowly slides up or down a region or page item. The effect looks much nicer than the built-in *show*/*hide* dynamic action which immediately shows or hides the component.

## SQL
### APEX collections in IDE
This short anonomous block can be used to query data from the apex\_collections view inside a PL/SQL IDE. After prompting you to define the workspace, application id and session it will allow you to access the apex\_collections view as if you were running the queriy inside your APEX session.

### APEX application pages
These queries can be used to access information about any given page in an application. They can prove particularly useful for components on global pages (i.e. page 0).