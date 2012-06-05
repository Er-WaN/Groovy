
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
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouvelle réservation" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1><g:message code="Liste des réservations" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="heure" title="${message(code: 'reservation.heure.label', default: 'Nom du client')}" />
					
						<g:sortableColumn property="minute" title="${message(code: 'reservation.minute.label', default: 'Nombre de personnes')}" />
					
						<g:sortableColumn property="commentaire" title="${message(code: 'reservation.commentaire.label', default: 'Date')}" />
										
						<g:sortableColumn property="nom_client" title="${message(code: 'reservation.nom_client.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="nombre_personnes" title="${message(code: 'reservation.nombre_personnes.label', default: 'Table')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "nom_client")}</g:link></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "nombre_personnes")}</td>
                                                
                                                <td><g:formatDate format="dd-MM-yyyy HH:mm" date="${reservationInstance.dat}" /></td>
					                                                
						<td>${fieldValue(bean: reservationInstance, field: "commentaire")}</td>
					
						<td>${reservationInstance?.table?.id}</td>					
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
