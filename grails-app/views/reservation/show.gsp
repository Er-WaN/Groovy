
<%@ page import="restaurant.Reservation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des réservations" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouvelle réservation" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reservation" class="content scaffold-show" role="main">
			<h1><g:message code="Réservation de M/Mme : ${reservationInstance.nom_client}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.nom_client}">
				<li class="fieldcontain">
					<span id="nom_client-label" class="property-label"><g:message code="reservation.nom_client.label" default="Nom du client" /></span>
					
						<span class="property-value" aria-labelledby="nom_client-label"><g:fieldValue bean="${reservationInstance}" field="nom_client"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${reservationInstance?.nombre_personnes}">
				<li class="fieldcontain">
					<span id="nombre_personnes-label" class="property-label"><g:message code="reservation.nombre_personnes.label" default="Nombre de personnes" /></span>
					
						<span class="property-value" aria-labelledby="nombre_personnes-label"><g:fieldValue bean="${reservationInstance}" field="nombre_personnes"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${reservationInstance?.table}">
				<li class="fieldcontain">
					<span id="table-label" class="property-label"><g:message code="reservation.table.label" default="Table" /></span>
					
						<span class="property-value" aria-labelledby="table-label"><g:link controller="tabl" action="show" id="${reservationInstance?.table?.id}">${reservationInstance?.table?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${reservationInstance?.dat}">
				<li class="fieldcontain">
					<span id="dat-label" class="property-label"><g:message code="reservation.dat.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="dat-label"><g:formatDate format="dd-MM-yyyy HH:mm" date="${reservationInstance?.dat}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="reservation.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${reservationInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				
			
				
			
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservationInstance?.id}" />
					<g:link class="edit" action="edit" id="${reservationInstance?.id}"><g:message code="Modifier" default="Modifier" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
