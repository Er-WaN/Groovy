<%@ page import="cuisine.Boisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boisson.label', default: 'Boisson')}" />
		<title><g:message code="Modifier: ${boissonInstance.libelle}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-boisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des boissons" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouvelle boisson" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-boisson" class="content scaffold-edit" role="main">
			<h1><g:message code="Modifier: ${boissonInstance.libelle}" args="[entityName]" /></h1>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${boissonInstance?.id}" />
				<g:hiddenField name="version" value="${boissonInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'Mettre à jour', default: 'Mettre à jour')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" formnovalidate="" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
