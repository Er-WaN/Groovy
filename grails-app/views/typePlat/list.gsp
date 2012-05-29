
<%@ page import="cuisine.TypePlat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'typePlat.label', default: 'TypePlat')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Acceuil"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Nouveau Type de plat" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Liste des Types de plats" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'typePlat.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="libelle" title="${message(code: 'typePlat.libelle.label', default: 'Libelle')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${typePlatInstanceList}" status="i" var="typePlatInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${typePlatInstance.id}">${fieldValue(bean: typePlatInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: typePlatInstance, field: "libelle")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${typePlatInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
