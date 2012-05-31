<%@ page import="grailsapplication2.Role" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
		<li><g:link class="create" action="create"><g:message code="Nouveau rôle" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-role" class="content scaffold-role" role="main">
            <h1 style="border-bottom:0px"><g:message code="Rôles:" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
                <table>
                    <thead>
                        <tr>                                                
                            <g:sortableColumn property="authority" title="${message(code: 'role.authority.label', default: 'Authority')}" />                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${roleInstanceList}" status="i" var="roleInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">                                                
                          <td><g:link action="show" id="${roleInstance.id}">${fieldValue(bean: roleInstance, field: "authority")}</g:link></td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
				<g:paginate total="${roleInstanceTotal}" />
			</div>
            </div>
            
    </body>
</html>
