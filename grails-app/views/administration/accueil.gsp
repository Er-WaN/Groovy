<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="Accueil"/></title>
	<style type='text/css' media='screen'>
          
          
          
	</style>
</head>

<body>
  <div class="nav" role="navigation">
      <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="Accueil"/></a></li>
            <li class="logout"><g:link class="logout" controller="logout"><g:message code="Déconnection" args="[entityName]" /></g:link></li>
      </ul>
  </div>
  <div class="content scaffold-list">
    <h1>Tableau de bord</h1>
    <g:if test="${userInstance.getAuthorities().authority[0] == "ROLE_DIRECTOR"}">
      <table>
        <tr>
          <table>
            <tr>
              <th>Nombre de plats : ${cuisine.Plat.list().size()}</th>
            </tr>
            <g:each in="${cuisine.TypePlat.list()}">
              <tr>
                <td style="text-indent: 20px">
                  ${it.libelle}(s) : ${cuisine.Plat.findAll("from Plat as p where p.typeplatid = ?", [it.id]).size()}
                <td>
              </tr>
            </g:each>
          </table>
        </tr>
        <tr>
          <table>
            <tr>
              <th>Nombre d'utilisateurs : ${grailsapplication2.User.list().size()}</th>
            </tr>
            <g:each in="${grailsapplication2.User.list()}">
              <tr>
                <td style="text-indent: 20px">
                  ${it.libelle}(s) : ${cuisine.Plat.findAll("from Plat as p where p.typeplatid = ?", [it.id]).size()}
                <td>
              </tr>
            </g:each>
          </table>
        </tr>
      </table>
      <table>
        <tr>
          <th>
            Utilisateurs
          </th>
        </tr>
        <tr>
          <td>
            Nombre de membres: ${grailsapplication2.User.count()}
          </td>
        </tr>
        <tr>
          <td>
            Nombre de membres: ${grailsapplication2.User.count()}
          </td>
        </tr>
        <tr>
          <td>
            Nombre de membres: ${grailsapplication2.User.count()}
          </td>
        </tr>
      </table>
    
    </g:if>
  </div>
  <div class="content scaffold-list">
    <h1>Administration</h1>
    <table>
      <th>
        <table>
          <tr>
            <th>
              Gestion des plats
            </th>
          </tr>
          <tr>
            <td>
              <g:link controller="plat">Plats</g:link>
            </td>
          </tr>
          <tr>
            <td>
              <g:link controller="typePlat">Types de plats</g:link>
            </td>
          </tr>
          </tr>
        </table>
      </th>
      <th>
        <table>
          <tr>
            <th
>              Gestion des boissons
            </th>
          </tr>
          <tr>
            <td>
              <g:link controller="boisson">Boissons</g:link>
            </td>
          </tr>
          <tr>
            <td>
              <g:link controller="TypeBoisson">Type de boissons</g:link>
            </td>
          </tr>
        </table>
      </th>
      <th>
        <table>
          <tr>
            <th>
              Gestion des menus
            </th>
          </tr>
          <tr>
            <td>
              <g:link controller="menu">Menus</g:link>
            </td>
          </tr>
        </table>
      </th>
      <th>
        <table>
          <tr>
            <th>
              Gestion des tables
            </th>
          </tr>
          <tr>
            <td>
              <g:link controller="tabl">Tables</g:link>
            </td>
          </tr>
          <tr>
            <td>
              <g:link controller="reservation">Réservations</g:link>
            </td>
          </tr>
        </table>
      </th>
    </table>    
  </div>
</body>
</html>
