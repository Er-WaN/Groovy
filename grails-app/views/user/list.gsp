
<%@ page import="grailsapplication2.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
       <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Nouvel utilisateur" args="[entityName]" /></g:link></li>
			</ul>
		</div>
        <div id="list-user" class="content scaffold-role" role="main">
            <h1 style="border-bottom:0px"><g:message code="Liste des utilisateurs" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                                                
                            <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Identifiant')}" />
                            <g:sortableColumn property="userRole" title="${message(code: 'user.userRole.label', default: 'Rôle')}" />
                            <g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Activer')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
                                                
                            <td>${userInstance.getAuthorities().authority[0]}</td>
                            
                            <td>${userInstance.enabled ? "oui" : "non"}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
