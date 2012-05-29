

<%@ page import="cuisine.TypePlat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Acceuil"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Liste des types de plats" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Nouveau type de plat" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${typePlatInstance}">
            <div class="errors">
                <g:renderErrors bean="${typePlatInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="libelle"><g:message code="typePlat.libelle.label" default="Libelle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: typePlatInstance, field: 'libelle', 'errors')}">
                                    <g:textField name="libelle" value="${typePlatInstance?.libelle}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Créer', default: 'Créer')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
