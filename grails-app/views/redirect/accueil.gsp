<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="Accueil"/></title>
	<style type='text/css' media='screen'>
	</style>
</head>

<body>
  <p>Vous êtes connecté en tant que <b>${session.SPRING_SECURITY_CONTEXT.authentication.principal.username}</b>
  <span><g:link controller="logout" style="float:right; margin-right: 10px;text-decoration:none">Déconnection</g:link></span></p>
</body>
</html>
