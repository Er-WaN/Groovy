<%@ page import="grailsapplication2.User" %>

<div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="User.authority.label" default="Identifiant" />
		
	</label>
	<g:textField name="username" value="${userInstance.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="User.password.label" default="Mot de passe" />
		
	</label>
	<g:textField name="password" value="${userInstance.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="User.enabled.label" default="Activer" />
		
	</label>
	<g:checkBox id="enabled" name="enabled" value="${userInstance.enabled}" checked="${true}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'role_id', 'error')} ">
	<label for="role_id">
		<g:message code="User.role_id.label" default="Rôle" />
		
	</label>
	<g:select optionValue="authority" name="role_id" from="${grailsapplication2.Role.list(sort:"authority")}" optionKey="id" value="${userRoleInstance?.role?.id}"  />
</div>
                      
