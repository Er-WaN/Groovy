<%@ page import="grailsapplication2.Role" %>

<div class="fieldcontain ${hasErrors(bean: RoleInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="Role.authority.label" default="Authority" />
		
	</label>
	<g:textField name="authority" value="${roleInstance.authority}"/>
</div>