
<%@ page import="restaurant.Tabl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tabl.label', default: 'Tabl')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tabl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des tables" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Ajouter table" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tabl" class="content scaffold-show" role="main">
			<h1><g:message code="Table ${tablInstance.id}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tabl">
			
				<g:if test="${tablInstance?.nb_places}">
				<li class="fieldcontain">
					<span id="nb_places-label" class="property-label"><g:message code="tabl.nb_places.label" default="Nombre de places" /></span>
					
						<span class="property-value" aria-labelledby="nb_places-label"><g:fieldValue bean="${tablInstance}" field="nb_places"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tablInstance?.id}" />
					<g:link class="edit" action="edit" id="${tablInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
