<%@ page import="restaurant.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'nom_client', 'error')} ">
	<label for="nom_client">
		<g:message code="reservation.nom_client.label" default="Nom du client" />
		
	</label>
	<g:textField name="nom_client" value="${reservationInstance?.nom_client}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'nombre_personnes', 'error')} required">
	<label for="nombre_personnes">
		<g:message code="reservation.nombre_personnes.label" default="Nombre de personnes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="nombre_personnes" required="" value="${reservationInstance.nombre_personnes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dat', 'error')} required">
	<label for="dat">
		<g:message code="reservation.dat.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dat" precision="minute" years="[2012, 2013]" minute="[00, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]" hours="[11, 12, 13, 19, 20, 21, 22, 23]" value="${reservationInstance?.dat}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="reservation.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textArea name="commentaire" value="${reservationInstance?.commentaire}"/>
</div>



