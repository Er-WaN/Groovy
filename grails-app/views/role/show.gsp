
<%@ page import="grailsapplication2.Role" %>
<!doctype html>

<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="Rôle : ${roleInstance.authority}" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des rôles" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau rôle" args="[entityName]" /></g:link></li>
			</ul>
		</div>
                <div id="show-role" class="content scaffold-show" role="main">
			<h1><g:message code="Rôle : ${roleInstance.authority}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list role">
			
				<g:if test="${roleInstance?.id}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="role.id.label" default="ID" /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${roleInstance}" field="id"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${roleInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="role.authority.label" default="authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${roleInstance}" field="authority"/></span>
					
				</li>
				</g:if>
                          
                                
                          			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${roleInstance?.id}" />
					<g:link class="edit" action="edit" id="${roleInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
       
        
        
        