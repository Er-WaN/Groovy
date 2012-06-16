<%@ page import="restaurant.Commande_plat" %>



<div class="fieldcontain ${hasErrors(bean: commande_platInstance, field: 'commande', 'error')} required">
	<label for="commande">
		<g:message code="commande_plat.commande.label" default="Commande" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commande" name="commande.id" from="${restaurant.Commande.list()}" optionKey="id" required="" value="${commande_platInstance?.commande?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commande_platInstance, field: 'plat_id', 'error')} required">
	<label for="plat_id">
		<g:message code="commande_plat.plat_id.label" default="Platid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="plat_id" required="" value="${commande_platInstance.plat_id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commande_platInstance, field: 'quantite', 'error')} required">
	<label for="quantite">
		<g:message code="commande_plat.quantite.label" default="Quantite" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="quantite" required="" value="${commande_platInstance.quantite}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commande_platInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="commande_plat.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="type" required="" value="${commande_platInstance.type}"/>
</div>

