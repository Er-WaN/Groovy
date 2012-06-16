<%@ page import="cuisine.TypeBoisson" %>



<div class="fieldcontain ${hasErrors(bean: typeBoissonInstance, field: 'libelle', 'error')} ">
	<label for="libelle">
		<g:message code="typeBoisson.libelle.label" default="Libelle" />
		
	</label>
	<g:textField name="libelle" value="${typeBoissonInstance?.libelle}"/>
</div>

