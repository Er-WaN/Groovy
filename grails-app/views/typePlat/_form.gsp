<%@ page import="cuisine.TypePlat" %>



<div class="fieldcontain ${hasErrors(bean: typePlatInstance, field: 'libelle', 'error')} ">
	<label for="libelle">
		<g:message code="typePlat.libelle.label" default="Libelle" />
		
	</label>
	<g:textField name="libelle" value="${typePlatInstance?.libelle}"/>
</div>

