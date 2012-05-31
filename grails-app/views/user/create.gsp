<%@ page import="grailsapplication2.User" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="Créer utilisateur" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<div class="nav" user="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
			<li><g:link class="list" action="list"><g:message code="Listes des utilisateurs" args="[entityName]" /></g:link></li>
		</ul>
	</div>
        <div id="create-user" class="content scaffold-create" user="main">
            <h1><g:message code="Créer utilisateur" args="[entityName]" /></h1>
            <g:if test="${flash.message}" user="status">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <ul class="errors" user="alert">
                <g:eachError bean="${userInstance}" var="error">
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