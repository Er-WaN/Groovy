

<%@ page import="cuisine.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${menuInstance}">
            <div class="errors">
                <g:renderErrors bean="${menuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${menuInstance?.id}" />
                <g:hiddenField name="version" value="${menuInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="libelle"><g:message code="menu.libelle.label" default="Libelle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'libelle', 'errors')}">
                                    <g:textField name="libelle" value="${menuInstance?.libelle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="menu.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${menuInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="prix"><g:message code="menu.prix.label" default="Prix" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'prix', 'errors')}">
                                    <g:textField name="prix" value="${fieldValue(bean: menuInstance, field: 'prix')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plats"><g:message code="menu.plats.label" default="Plats" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'plats', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
