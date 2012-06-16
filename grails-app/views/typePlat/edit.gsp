<%@ page import="cuisine.TypePlat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
		<title><g:message code="Modifier: ${typePlatInstance?.libelle}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-typePlat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des types de plat" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau type de plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-typePlat" class="content scaffold-edit" role="main">
			<h1><g:message code="Modifier : ${typePlatInstance?.libelle}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${typePlatInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${typePlatInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${typePlatInstance?.id}" />
				<g:hiddenField name="version" value="${typePlatInstance?.version}" />
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
