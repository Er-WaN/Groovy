<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <h1>Sample line</h1>
    <table>
      <tr>
        <th>Plat</th>
        <th>Quantité</th>
        <th>Prix unitaire</th>
        <th>Prix</th>
      </tr>
      <g:each in="${commande}">
        <g:if test="${it.value != "0"}">
          <tr>
            <g:set var="plat" value="${cuisine.Plat.get(it.key)}" />
            <td>${plat.libelle}</td>
            <td>${it.value}</td>
            <td>${plat.prix}€</td>
            <g:set var="prix" value="${plat.prix * it.value.toInteger()}" />
            <td>${prix}€</td>
            <% total = total + prix %>
          </tr>
        </g:if>
      </g:each> 
      <tr 
        <td>Total:</td>
        <td></td>
        <td></td>
        <td>${total}</td>
      </tr>
    </table>
  </body>
</html>
