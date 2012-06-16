<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Récapitulatif plats</title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
    <g:javascript library="jquery.mobile.stepper" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.mobile.stepper.css')}" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
    <style type='text/css' media='screen'>
    
    .title{
    border-color: black;
    border-style:solid;
    border-width:2px;
    background:#CD853F;
    }
    
    h2{
      border-color: black;
    border-style:solid;
    border-width:2px;
    background:#CD853F;
    width:55%;
    }
      
    </style>
  </head>
  <body>
    <center>
      <div class='title'>      
          <h1>Tactil-Restaurant</h1>
      </div>
      <h2>Votre commande</h2>
      <table>
        <tr>
          <th style="width:300px; text-align: left">Plat</th>
          <th style="width:100px">Quantité</th>
          <th style="width:200px">Prix unitaire</th>
          <th style="width:100px">Prix</th>
        </tr>
        <g:each in="${session.plats}">
          <g:if test="${it.value != "0"}">
            <tr>
              <g:set var="plat" value="${cuisine.Plat.get(it.key)}" />
              <td>${plat.libelle}</td>
              <td style="text-align: center; padding-bottom: 20px">${it.value}</td>
              <td style="text-align: center">${plat.prix}€</td>
              <g:set var="prix" value="${plat.prix * it.value.toInteger()}" />
              <td style="text-align: center">${prix}€</td>
              <% total = total + prix %>
            </tr>
          </g:if>
        </g:each> 
        <g:each in="${session.boissons}">
          <g:if test="${it.value != "0"}">
            <tr>
              <g:set var="plat" value="${cuisine.Boisson.get(it.key)}" />
              <td>${plat.libelle}</td>
              <td style="text-align: center; padding-bottom: 20px">${it.value}</td>
              <td style="text-align: center">${plat.prix}€</td>
              <g:set var="prix" value="${plat.prix * it.value.toInteger()}" />
              <td style="text-align: center">${prix}€</td>
              <% total = total + prix %>
            </tr>
          </g:if>
        </g:each>
        <%  session.prix_commande = total %>
        <tr> 
          <td style="font-weight: bold; padding-top: 10px">Total:</td>
          <td></td>
          <td></td>
          <td style="text-align: center; font-weight: bold; padding-top: 10px">${total}€</td>
        </tr>
      </table>
      
      <table style="padding-top: 20px">
          <tr>
            <td>
              <g:submitButton value="Retour aux formules" name="retour" onClick="window.location.href='../client/choix_formule'"/>
            <td>
              <g:submitButton value="Valider la commande" name="valider" onClick="window.location.href='../client/validation_commande'"/>
            </td>
          </tr>
        </table>
    </center>
  </body>
</html>
