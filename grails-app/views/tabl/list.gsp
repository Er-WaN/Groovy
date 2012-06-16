
<%@ page import="restaurant.Tabl" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tabl.label', default: 'Tabl')}" />
		<title><g:message code="Liste des tables" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tabl" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Ajouter une nouvelle table" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tabl" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des tables du restaurant" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'tabl.id.label', default: 'Table numero')}" />
						<g:sortableColumn property="nb_places" title="${message(code: 'tabl.nb_places.label', default: 'Nombre de places')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tablInstanceList}" status="i" var="tablInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tablInstance.id}">${fieldValue(bean: tablInstance, field: "id")}</g:link></td>
                                                <td>${tablInstance.nb_places}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tablInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
