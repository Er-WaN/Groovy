
<%@ page import="cuisine.TypeBoisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typeBoisson.label', default: 'TypeBoisson')}" />
		<title><g:message code="Type de boisson: ${typeBoissonInstance.libelle}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-typeBoisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des types de boissons" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau type de boissons" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-typeBoisson" class="content scaffold-show" role="main">
			<h1><g:message code="Type de boisson: ${typeBoissonInstance.libelle}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list typeBoisson">
				<g:if test="${typeBoissonInstance?.libelle}">
				<li class="fieldcontain">
					<span id="libelle-label" class="property-label"><g:message code="typePlat.libelle.label" default="Libelle" /></span>
					
						<span class="property-value" aria-labelledby="libelle-label"><g:fieldValue bean="${typeBoissonInstance}" field="libelle"/></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${typeBoissonInstance?.id}" />
					<g:link class="edit" action="edit" id="${typeBoissonInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
