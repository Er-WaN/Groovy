<%@ page import="restaurant.Commande" %>



<div class="fieldcontain ${hasErrors(bean: commandeInstance, field: 'table_id', 'error')} required">
	<label for="table_id">
		<g:message code="commande.table_id.label" default="Tableid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="table_id" required="" value="${commandeInstance.table_id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commandeInstance, field: 'dat', 'error')} required">
	<label for="dat">
		<g:message code="commande.dat.label" default="Dat" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dat" precision="day"  value="${commandeInstance?.dat}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: commandeInstance, field: 'etat', 'error')} required">
	<label for="etat">
		<g:message code="commande.etat.label" default="Etat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="etat" required="" value="${commandeInstance.etat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commandeInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="commande.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="prix" required="" value="${commandeInstance.prix}"/>
</div>

