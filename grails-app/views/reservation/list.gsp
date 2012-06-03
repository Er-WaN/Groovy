
<%@ page import="restaurant.Reservation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'reservation.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="dat" title="${message(code: 'reservation.dat.label', default: 'Dat')}" />
					
						<g:sortableColumn property="heure" title="${message(code: 'reservation.heure.label', default: 'Heure')}" />
					
						<g:sortableColumn property="nom_client" title="${message(code: 'reservation.nom_client.label', default: 'Nomclient')}" />
					
						<g:sortableColumn property="nombre_personnes" title="${message(code: 'reservation.nombre_personnes.label', default: 'Nombrepersonnes')}" />
					
						<g:sortableColumn property="table_id" title="${message(code: 'reservation.table_id.label', default: 'Tableid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${reservationInstance.dat}" /></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "heure")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "nom_client")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "nombre_personnes")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "table_id")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
