

<%@ page import="cuisine.Plat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'plat.label', default: 'Plat')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${platInstance}">
            <div class="errors">
                <g:renderErrors bean="${platInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="libelle"><g:message code="plat.libelle.label" default="Libelle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: platInstance, field: 'libelle', 'errors')}">
                                    <g:textField name="libelle" value="${platInstance?.libelle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="plat.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: platInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${platInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="typeplatid"><g:message code="plat.typeplatid.label" default="Typeplatid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: platInstance, field: 'typeplatid', 'errors')}">
                                    <g:textField name="typeplatid" value="${fieldValue(bean: platInstance, field: 'typeplatid')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prix"><g:message code="plat.prix.label" default="Prix" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: platInstance, field: 'prix', 'errors')}">
                                    <g:textField name="prix" value="${fieldValue(bean: platInstance, field: 'prix')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
