
<%@ page import="cuisine.TypeBoisson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typeBoisson.label', default: 'TypeBoisson')}" />
		<title><g:message code="Liste des types de boissons" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-typeBoisson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau type de boisson" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-typeBoisson" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des types de boissons" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                                            <g:sortableColumn property="id" title="${message(code: 'Libelle', default: 'Libelle')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${typeBoissonInstanceList}" status="i" var="typeBoissonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td><g:link action="show" id="${typeBoissonInstance.id}">${fieldValue(bean: typeBoissonInstance, field: "libelle")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${typeBoissonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
