
<%@ page import="restaurant.Commande_plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commande_plat.label', default: 'Commande_plat')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-commande_plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-commande_plat" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="commande_plat.commande.label" default="Commande" /></th>
					
						<g:sortableColumn property="plat_id" title="${message(code: 'commande_plat.plat_id.label', default: 'Platid')}" />
					
						<g:sortableColumn property="quantite" title="${message(code: 'commande_plat.quantite.label', default: 'Quantite')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'commande_plat.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commande_platInstanceList}" status="i" var="commande_platInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commande_platInstance.id}">${fieldValue(bean: commande_platInstance, field: "commande")}</g:link></td>
					
						<td>${fieldValue(bean: commande_platInstance, field: "plat_id")}</td>
					
						<td>${fieldValue(bean: commande_platInstance, field: "quantite")}</td>
					
						<td>${fieldValue(bean: commande_platInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commande_platInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
