
<%@ page import="restaurant.Commande_plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commande_plat.label', default: 'Commande_plat')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-commande_plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-commande_plat" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list commande_plat">
			
				<g:if test="${commande_platInstance?.commande}">
				<li class="fieldcontain">
					<span id="commande-label" class="property-label"><g:message code="commande_plat.commande.label" default="Commande" /></span>
					
						<span class="property-value" aria-labelledby="commande-label"><g:link controller="commande" action="show" id="${commande_platInstance?.commande?.id}">${commande_platInstance?.commande?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${commande_platInstance?.plat_id}">
				<li class="fieldcontain">
					<span id="plat_id-label" class="property-label"><g:message code="commande_plat.plat_id.label" default="Platid" /></span>
					
						<span class="property-value" aria-labelledby="plat_id-label"><g:fieldValue bean="${commande_platInstance}" field="plat_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commande_platInstance?.quantite}">
				<li class="fieldcontain">
					<span id="quantite-label" class="property-label"><g:message code="commande_plat.quantite.label" default="Quantite" /></span>
					
						<span class="property-value" aria-labelledby="quantite-label"><g:fieldValue bean="${commande_platInstance}" field="quantite"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commande_platInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="commande_plat.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${commande_platInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${commande_platInstance?.id}" />
					<g:link class="edit" action="edit" id="${commande_platInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
