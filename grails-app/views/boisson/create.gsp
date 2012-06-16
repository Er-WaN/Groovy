<%@ page import="cuisine.Boisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boisson.label', default: 'Boisson')}" />
		<title><g:message code="Nouvelle boisson" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-boisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des boissons" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-boisson" class="content scaffold-create" role="main">
			<h1><g:message code="Nouvelle boisson" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${boissonInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${boissonInstance}" var="error">
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
