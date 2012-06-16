<%@ page import="cuisine.Menu" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menus')}" />
		<title><g:message code="Liste des menus" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-menu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau Menu" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-menu" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des menus" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>    <g:sortableColumn property="libelle" title="${message(code: 'menu.libelle.label', default: 'Libelle')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'menu.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'menu.prix.label', default: 'Prix')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${menuInstanceList}" status="i" var="menuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "libelle")}</g:link></td>
					
						<td>${fieldValue(bean: menuInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: menuInstance, field: "prix")}€</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${menuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
