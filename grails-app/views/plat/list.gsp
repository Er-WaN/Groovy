
<%@ page import="cuisine.Plat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'plat.label', default: 'Plat')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'plat.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="libelle" title="${message(code: 'plat.libelle.label', default: 'Libelle')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'plat.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="typeplatid" title="${message(code: 'plat.typeplatid.label', default: 'Typeplatid')}" />
                        
                            <g:sortableColumn property="prix" title="${message(code: 'plat.prix.label', default: 'Prix')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${platInstanceList}" status="i" var="platInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${platInstance.id}">${fieldValue(bean: platInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: platInstance, field: "libelle")}</td>
                        
                            <td>${fieldValue(bean: platInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: platInstance, field: "typeplatid")}</td>
                        
                            <td>${fieldValue(bean: platInstance, field: "prix")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${platInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
