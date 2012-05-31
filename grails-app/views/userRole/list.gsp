
<%@ page import="grailsapplication2.UserRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
            <li><g:link class="create" action="create"><g:message code="Assigner les rôles" args="[entityName]" /></g:link></li>
        </ul>
      </div>
        <div id="list-userRole" class="content scaffold-role" role="main">
          <h1 style="border-bottom:1px"><g:message code="Assignation des droits" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                                                
                            <g:sortableColumn property="user" title="${message(code: 'plat.user.label', default: 'Utilisateur')}" />
                            <g:sortableColumn property="role" title="${message(code: 'plat.role.label', default: 'Rôle')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${grailsapplication2.User.get(userRoleInstance.user.id).username}</td>                
                            <td>${grailsapplication2.Role.get(userRoleInstance.role.id).authority}</td> 
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <g:paginate total="${userRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
