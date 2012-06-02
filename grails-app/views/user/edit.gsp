<%@ page import="grailsapplication2.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'Users')}" />
		<title><g:message code="Modifier : ${userInstance.username}" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" user="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Liste des utilisateurs" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nouvel utilisateur" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-user" class="content scaffold-edit" user="main">
			<h1><g:message code="Modifier : ${userInstance.username}" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" user="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" user="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
                                  <div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'username', 'error')} ">
                                        <label for="username">
                                                <g:message code="User.authority.label" default="Identifiant" />

                                        </label>
                                        <g:textField name="username" value="${userInstance.username}"/>
                                  </div>


                                  <div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'enabled', 'error')} ">
                                        <label for="enabled">
                                                <g:message code="User.enabled.label" default="Activer" />

                                        </label>
                                        <g:checkBox id="enabled" name="enabled" value="${userInstance.enabled}"/>
                                  </div>
                                  
                                  <div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'enabled', 'error')} ">
	
                                  <div class="fieldcontain ${hasErrors(bean: UserInstance, field: 'role_id', 'error')} ">
                                        <label for="role_id">
                                                <g:message code="User.role_id.label" default="Rôle" />
		
                                        </label>
                                        <g:select optionValue="authority" name="role_id" from="${grailsapplication2.Role.list()}" optionKey="id" value="${userInstance.getAuthorities().id[0]}"  />
                                  </div>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'Mettre à jour', default: 'Mettre à jour')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" formnovalidate="" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur??')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
