<%@ page import="cuisine.Menu" %>





<div class="fieldcontain ${hasErrors(bean: MenuInstance, field: 'libelle', 'error')} ">
	<label for="libelle">
		<g:message code="Menu.libelle.label" default="Libelle" />
		
	</label>
	<g:textField name="libelle" value="${menuInstance.libelle}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: MenuInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="Menu.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${menuInstance.description}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: MenuInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="Menu.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="prix" step="any" required="" value="${menuInstance.prix}"/>
</div>

