
<%@ page import="cuisine.TypePlat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
		<title><g:message code="Liste des types de plats" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-typePlat" class="skip" tabindex="-1"><g:message code="Accueil" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau type de plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-typePlat" class="content scaffold-list" role="main">
			<h1><g:message code="Type de plat" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="libelle" title="${message(code: 'typePlat.libelle.label', default: 'Libelle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${typePlatInstanceList}" status="i" var="typePlatInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${typePlatInstance.id}">${fieldValue(bean: typePlatInstance, field: "libelle")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${typePlatInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
