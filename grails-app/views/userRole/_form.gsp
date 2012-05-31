<%@ page import="grailsapplication2.UserRole" %>

<div class="fieldcontain ${hasErrors(bean: RoleUserInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="UserRole.authority.label" default="Authority" />
		
	</label>
	<g:textField name="authority" value="${userRoleInstance.authority}"/>
</div>