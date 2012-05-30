
<%@ page import="cuisine.Plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plat.label', default: 'Plats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouveau Plat" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plat" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des plats" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                                                <g:sortableColumn property="libelle" title="${message(code: 'plat.libelle.label', default: 'Libelle')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'plat.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'plat.prix.label', default: 'Prix')}" />
					
						<g:sortableColumn property="typeplatid" title="${message(code: 'plat.typeplatid.label', default: 'Type de plat')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${platInstanceList}" status="i" var="platInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${platInstance.id}">${fieldValue(bean: platInstance, field: "libelle")}</g:link></td>
					
						<td>${fieldValue(bean: platInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: platInstance, field: "prix")}</td>
					
						<td>${cuisine.TypePlat.get(platInstance.typeplatid).libelle}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${platInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
