
<%@ page import="cuisine.Boisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boisson.label', default: 'Boisson')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-boisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des boissons" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouvelle boissons" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-boisson" class="content scaffold-show" role="main">
			<h1><g:message code="Boissons: ${boissonInstance?.libelle}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list boisson">
			
				<g:if test="${boissonInstance?.libelle}">
				<li class="fieldcontain">
					<span id="libelle-label" class="property-label"><g:message code="boisson.libelle.label" default="Libelle" /></span>
					
						<span class="property-value" aria-labelledby="libelle-label"><g:fieldValue bean="${boissonInstance}" field="libelle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${boissonInstance?.prix}">
				<li class="fieldcontain">
					<span id="prix-label" class="property-label"><g:message code="boisson.prix.label" default="Prix" /></span>
					
						<span class="property-value" aria-labelledby="prix-label"><g:fieldValue bean="${boissonInstance}" field="prix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${boissonInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="boisson.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="typeBoisson" action="show" id="${boissonInstance?.type?.id}">${boissonInstance?.type?.libelle}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${boissonInstance?.id}" />
					<g:link class="edit" action="edit" id="${boissonInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Suprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
