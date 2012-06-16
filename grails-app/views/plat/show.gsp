
<%@ page import="cuisine.Plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plat.label', default: 'Plats')}" />
		<title><g:message code="Plat: ${platInstance?.libelle}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des plats" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau Plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-plat" class="content scaffold-show" role="main">
			<h1><g:message code="Plat : ${platInstance.libelle}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plat">
			
				
			
				<g:if test="${platInstance?.libelle}">
				<li class="fieldcontain">
					<span id="libelle-label" class="property-label"><g:message code="plat.libelle.label" default="Libelle" /></span>
					
						<span class="property-value" aria-labelledby="libelle-label"><g:fieldValue bean="${platInstance}" field="libelle"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${platInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="plat.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${platInstance}" field="description"/></span>
					
				</li>
				</g:if>
                          
				<g:if test="${platInstance?.prix}">
				<li class="fieldcontain">
					<span id="prix-label" class="property-label"><g:message code="plat.prix.label" default="Prix" /></span>
					
						<span class="property-value" aria-labelledby="prix-label"><g:fieldValue bean="${platInstance}" field="prix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${platInstance?.typeplatid}">
				<li class="fieldcontain">
					<span id="typeplatid-label" class="property-label"><g:message code="plat.typeplatid.label" default="Type de plat" /></span>
					
						<span class="property-value" aria-labelledby="typeplatid-label"><g:fieldValue bean="${cuisine.TypePlat.get(platInstance.typeplatid)}" field="libelle"/></span>
					
				</li>
				</g:if>
                                
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${platInstance?.id}" />
					<g:link class="edit" action="edit" id="${platInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
