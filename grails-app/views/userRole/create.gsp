<%@ page import="grailsapplication2.UserRole" %>
<!doctype html>

<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<div class="nav" user="navigation">
            <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
                    <li><g:link class="list" action="list"><g:message code="Listes des assignations" args="[entityName]" /></g:link></li>
            </ul>
	</div>
        <div id="create-userRole" class="content scaffold-create" user="main">
            <h1><g:message code="Créer ou modifier une assignation" args="[entityName]" /></h1>
            <g:if test="${flash.message}" user="status">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <ul class="errors" user="alert">
                <g:eachError bean="${userRoleInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save" >
                <fieldset class="form">
                  <div class="fieldcontain ${hasErrors(bean: UserRoleInstance, field: 'usel', 'error')} ">
                      <label for="role">
                              <g:message code="UserRole.user.label" default="Utilisateur" />
                      </label>
                      <g:select optionValue="username" name="user.id" from="${grailsapplication2.User.list()}" optionKey="id" value="${userRoleInstance?.user?.id}"  />
                  </div>
                  
                  <div class="fieldcontain ${hasErrors(bean: UserRoleInstance, field: 'role', 'error')} ">
                      <label for="role">
                              <g:message code="UserRole.role.label" default="Rôle" />
                      </label>
                      <g:select optionValue="authority" name="role.id" from="${grailsapplication2.Role.list()}" optionKey="id" value="${userRoleInstance?.role?.id}"  />
                  </div>
                </fieldset>                  
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'Créer', default: 'Créer')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
