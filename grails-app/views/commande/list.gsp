
<%@ page import="restaurant.Commande" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commande.label', default: 'Commande')}" />
		<title><g:message code="Liste des commandes" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-commande" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
			</ul>
		</div>
		<div id="list-commande" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des commandes" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                                                <g:sortableColumn property="id" title="${message(code: 'commande.id.label', default: 'ID')}" />
                                          
						<g:sortableColumn property="table_id" title="${message(code: 'commande.table_id.label', default: 'Table')}" />
					
						<g:sortableColumn property="dat" title="${message(code: 'commande.dat.label', default: 'Date')}" />
					
						<g:sortableColumn property="etat" title="${message(code: 'commande.etat.label', default: 'Etat')}" />
					
						<g:sortableColumn property="prix" title="${message(code: 'commande.prix.label', default: 'Prix')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commandeInstanceList}" status="i" var="commandeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commandeInstance.id}">${fieldValue(bean: commandeInstance, field: "id")}</g:link></td>
                                          
                                                <td>${fieldValue(bean: commandeInstance, field: "table_id")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy HH:mm" date="${commandeInstance.dat}" /></td>
					
						<td>
                                                <g:if test="${commandeInstance.etat == 1}">
                                                  en cours
                                                </g:if>
                                                <g:else>
                                                  terminée
                                                </g:else>
                                                </td>
					
						<td>${fieldValue(bean: commandeInstance, field: "prix")}€</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commandeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
