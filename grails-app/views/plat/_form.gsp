<%@ page import="cuisine.Plat" %>


<div class="fieldcontain ${hasErrors(bean: platInstance, field: 'libelle', 'error')} ">
	<label for="libelle">
		<g:message code="plat.libelle.label" default="Libelle : " />
		
	</label>
	<g:textField name="libelle" value="${platInstance?.libelle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: platInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="plat.description.label" default="Description : " />
		
	</label>
	<g:textField name="description" value="${platInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: platInstance, field: 'prix', 'error')} required">
	<label for="prix">
		<g:message code="plat.prix.label" default="Prix : " />
		<span class="required-indicator">* </span>
	</label>
	<g:field type="number" name="prix" step="any" required="" value="${platInstance?.prix}"/>€
</div>



<div class="fieldcontain ${hasErrors(bean: platInstance, field: 'typeplatid', 'error')} required">
        <label for="typeplatid" style="padding-left:63px">
                <g:message code="plat.typeplatid.label" default="Type de plat : " />
                <span class="required-indicator">*</span>
        <label>
        <g:select name="typeplatid" optionValue="libelle" from="${cuisine.TypePlat.list()}" value="${platInstance.typeplatid}" optionKey="id" />
</div>

<div style="padding-left:96px; width:350px">
  <fieldset style=" border:1px solid #666">
  <legend style=" color:#666">Menus : </legend>
      <g:each var="menu" in="${cuisine.Menu.list()}">
        <g:if test="${menu.id in cuisine.Plat.get(params.id).menus.id}">
          <g:checkBox id="${menu.libelle}" name="menus" value="${menu.id}"  checked="${true}"/>
        </g:if>
        <g:else>
          <g:checkBox id="${menu.libelle}" name="menus" value="${menu.id}"  checked="${false}"/>
        </g:else>
        <label for="${menu.libelle}">
          <g:message code="plats.typeplatid.label" default="${menu.libelle}" />
        </label>
        <br />
      </g:each>
  </fieldset>
</div>