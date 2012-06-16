<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Client</title>
    <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
    <g:javascript library="jquery.mobile.stepper" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.mobile.stepper.css')}" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
    <script language=javascript> 
        function retour()
        { 
        document.location.href = "../choix_formule"; 
        } 
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
    width:60%;
    }
      
    </style>
  </head>

  <body>   
    <center>
      <div class='title'>      
        <h1>Tactil-Restaurant</h1>
      </div>
      <g:form name="commande[]" url="[action:'valider_carte',controller:'client']">
        <g:each in="${cuisine.TypePlat.list()}" var="t">
          <table>
            <tr><h2>${t.libelle}s</h2></tr>
              <g:each in="${cuisine.Plat.findAllByTypeplatid(t.id)}">
                <table>
                  <tr>
                    <th style="width:500px; text-align:left">${it.libelle}</th>
                    <th style="text-align:right; width:46px">${it.prix}€</th>
                    <th style="text-align:right; padding-left:10px; padding-top:5px">
                        <div data-role="stepper" data-theme="c">
                          <input type="text" name="commande.plats.${it.id}" id="stepper1" class="quantity" value="0" min="0" max="20" size="2" data-role="none" />
                        </div>
                    </th>
                  </tr>
                  <tr>
                    <th style="font-size: 12; color: grey; font-style: italic; width:600px; padding-left:30px; text-align:left">${it.description}</th>
                  </tr>
                </table>
              </g:each>
          </table>
        </g:each>
        
        <table style="padding-top: 20px">
          <tr>
            <td>
              <g:submitButton value="Retour" name="valider" onClick="window.location.href='../choix_formule'"/>
            <td>
              <g:submitButton value="Valider" name="valider" />
            </td>
          </tr>
        </table>
      </g:form>
    </center>
    </body>
    </html>
        
        
        
        
        


