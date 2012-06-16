<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Client</title>
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
  <g:form name="commande[]" url="[action:'valider_carte',controller:'client']">
      
    
    <center>
      <div class='title'>      
        <h1>Tactil-Restaurant</h1>
      </div>
    </div
      
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


