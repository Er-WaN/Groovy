
<%@ page import="cuisine.Boisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boisson.label', default: 'Boisson')}" />
		<title><g:message code="Liste des boissons" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-boisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouvelle boisson" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-boisson" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des boissons" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="libelle" title="${message(code: 'boisson.libelle.label', default: 'Libelle')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'boisson.prix.label', default: 'Prix')}" />
					
						<th><g:message code="boisson.type.label" default="Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${boissonInstanceList}" status="i" var="boissonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${boissonInstance.id}">${fieldValue(bean: boissonInstance, field: "libelle")}</g:link></td>
					
						<td>${fieldValue(bean: boissonInstance, field: "prix")}€</td>
					
						<td>${boissonInstance?.type?.libelle}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${boissonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
