<%@ page import="grailsapplication2.Role" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="Créer rôle" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
			<li><g:link class="list" action="list"><g:message code="Listes des rôles" args="[entityName]" /></g:link></li>
		</ul>
	</div>
        <div id="create-role" class="content scaffold-create" role="main">
            <h1><g:message code="Créer rôle" args="[entityName]" /></h1>
            <g:if test="${flash.message}" role="status">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${roleInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${roleInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'Créer', default: 'Créer')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>