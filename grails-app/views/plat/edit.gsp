<%@ page import="cuisine.Plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plat.label', default: 'Plats')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des plats" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-plat" class="content scaffold-edit" role="main">
			<h1><g:message code="Modifier : ${platInstance.libelle}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${platInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${platInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${platInstance?.id}" />
				<g:hiddenField name="version" value="${platInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'Mettre à jour', default: 'Mettre à jour')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" formnovalidate="" onclick="return confirm('${message(code: 'Etes-vous sur', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
