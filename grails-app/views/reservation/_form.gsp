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

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'table', 'error')} required">
	<label for="table">
		<g:message code="reservation.table.label" default="Table" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="table" optionValue="value" name="table.id" from="${liste.entrySet()}"  optionKey="key"  required="" value="${reservationInstance?.table?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dat', 'error')} required">
	<label for="dat">
		<g:message code="reservation.dat.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dat" precision="day"  value="${reservationInstance?.dat}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'heure', 'error')} required">
	<label for="heure">
		<g:message code="reservation.heure.label" default="Heure" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="heure" from="${reservationInstance.constraints.heure.inList}" required="" value="${fieldValue(bean: reservationInstance, field: 'heure')}" valueMessagePrefix="reservation.heure"/>
        <select name="minute">
          <option value="0" ${reservationInstance.minute == 0 ? 'selected="selected"' : '' }>00</option>
          <option value="15" ${reservationInstance.minute == 15 ? 'selected="selected"' : '' }>15</option>
          <option value="30" ${reservationInstance.minute == 30 ? 'selected="selected"' : '' }>30</option>
          <option value="45" ${reservationInstance.minute == 40 ? 'selected="selected"' : '' }>45</option>
        </select>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="reservation.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textArea name="commentaire" value="${reservationInstance?.commentaire}"/>
</div>



