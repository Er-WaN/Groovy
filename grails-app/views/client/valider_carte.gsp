<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script>
      $(document).ready(function() {
        $("button").button();
      });
      </script>
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
    width:50%;
    }
      
    </style>
  </head>
  
  <body>
    <center>
      <div class='title'>      
          <h1>Tactil-Restaurant</h1>
      </div>
      <h1>Votre commande</h1>
      <table>
        <tr>
          <th style="width:300px; text-align: left">Plat</th>
          <th style="width:100px">Quantité</th>
          <th style="width:200px">Prix unitaire</th>
          <th style="width:100px">Prix</th>
        </tr>
        <g:each in="${commande}">
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

        <tr> 
          <td style="font-weight: bold; padding-top: 10px">Total:</td>
          <td></td>
          <td></td>
          <td style="text-align: center; font-weight: bold; padding-top: 10px">${total}€</td>
        </tr>
      </table>
      <g:form>
       <g:submitButton name="carte" value="Retour" />
       <g:submitButton name="update" value="Valider" />
      </g:form>
    </center>
  </body>
</html>
