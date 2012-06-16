
<%@ page import="cuisine.TypePlat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
		<title><g:message code="Type de plat: ${typePlatInstance?.libelle}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-typePlat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des types de plat" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau type de plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-typePlat" class="content scaffold-show" role="main">
			<h1><g:message code="Types de plat" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list typePlat">
			
				<g:if test="${typePlatInstance?.libelle}">
				<li class="fieldcontain">
					<span id="libelle-label" class="property-label"><g:message code="typePlat.libelle.label" default="Libelle" /></span>
					
						<span class="property-value" aria-labelledby="libelle-label"><g:fieldValue bean="${typePlatInstance}" field="libelle"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${typePlatInstance?.id}" />
					<g:link class="edit" action="edit" id="${typePlatInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
