
<%@ page import="grailsapplication2.User" %>
<!doctype html>

<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="Utilisateur : ${userInstance.username}" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des utilisateurs" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouvel utilisateur" args="[entityName]" /></g:link></li>
			</ul>
		</div>
                <div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="Utilisateur : ${userInstance.username}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Identifiant" /></span>
					
						<span class="property-value" aria-labelledby="identifiant-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="accountExpired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:fieldValue bean="${userInstance}" field="accountExpired"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${userInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="accountLocked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:fieldValue bean="${userInstance}" field="accountLocked"/></span>
					
				</li>
				</g:if>
                          
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Activer" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label">${userInstance.enabled ? "oui" : "non"}</span>
					
				</li>
                                
                                <li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="user.role.label" default="Rôle" /></span>
					
						<span class="property-value" aria-labelledby="role-label">${userInstance.getAuthorities() ? userInstance.getAuthorities().authority[0] : "aucun"}</span>
					
				</li>
                          
                                <g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="passwordExpired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:fieldValue bean="${userInstance}" field="passwordExpired"/></span>
					
				</li>
				</g:if>
                          
                          			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
       
        
        
        