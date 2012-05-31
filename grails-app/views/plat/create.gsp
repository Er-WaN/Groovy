<%@ page import="cuisine.Plat" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plat.label', default: 'plat')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-plat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Créer"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des plats" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-plat" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${platInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${platInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
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
                                          <g:field type="number" name="prix" step="any" required="" value="${platInstance?.prix}"/>
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
                                            <g:checkBox id="${menu.libelle}" name="menus" value="${menu.id}" checked="${false}"/>
                                            <label for="${menu.libelle}">
                                              <g:message code="plats.typeplatid.label" default="${menu.libelle}" />
                                            </label>
                                            <br />
                                        </g:each>
                                    </fieldset>
                                  </div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
