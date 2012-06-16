<%@ page import="cuisine.Boisson" %>



<div class="fieldcontain ${hasErrors(bean: boissonInstance, field: 'libelle', 'error')} ">
	<label for="libelle">
		<g:message code="boisson.libelle.label" default="Libelle" />
		
	</label>
	<g:textField name="libelle" value="${boissonInstance?.libelle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: boissonInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="boisson.prix.label" default="Prix" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="prix" required="" value="${boissonInstance.prix}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: boissonInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="boisson.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${cuisine.TypeBoisson.list()}" optionKey="id" optionValue="libelle" required="" value="${boissonInstance?.type?.id}" class="many-to-one"/>
</div>

