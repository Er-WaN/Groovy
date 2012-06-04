<%@ page import="restaurant.Tabl" %>



<div class="fieldcontain ${hasErrors(bean: tablInstance, field: 'nb_places', 'error')} required">
	<label for="nb_places">
		<g:message code="Nombre de places" default="Nombre de places" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="nb_places" required="" value="${tablInstance.nb_places}"/>
</div>

