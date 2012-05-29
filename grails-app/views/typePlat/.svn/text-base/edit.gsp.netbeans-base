

<%@ page import="cuisine.TypePlat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Liste des types de plats" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Nouveau type de plat" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Modifier: ${cuisine.TypePlat.get(params.id).libelle}" gs="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${typePlatInstance}">
            <div class="errors">
                <g:renderErrors bean="${typePlatInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${typePlatInstance?.id}" />
                <g:hiddenField name="version" value="${typePlatInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plat"><g:message code="typePlat.plat.label" default="Plat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: typePlatInstance, field: 'plat', 'errors')}">
                                    <g:select name="plat" from="${cuisine.Plat.list()}" multiple="yes" optionKey="id" size="5" value="${typePlatInstance?.plat*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="edit" value="${message(code: 'Modifier', default: 'Modifier')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Supprimer', default: 'Supprimer')}" onclick="return confirm('${message(code: 'Etes-vous sur?', default: 'Etes-vous sur??')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
