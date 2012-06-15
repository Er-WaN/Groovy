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
        <tr><h2>Les Entrées:</h2></tr>
        <table style="width:600px">
          <g:if test="${cuisine.Plat.findByTypeplatid(1)}" >
            <g:each var="entres" in="${cuisine.Plat.findByTypeplatid(1).list(sort:"libelle")}">
              <g:if test="${entres.typeplatid == 1}" >
                <tr>
                  <table>
                    <tr>
                      <th style="width:600px; text-align:left">${entres.libelle}</th>
                      <th style="text-align:right; width:46px">${entres.prix}€</th>
                      <th style="text-align:right; padding-left:10px; padding-top:5px">
                        <div data-role="stepper" data-theme="c">
                          <input type="text" name="entres.${entres.id}" id="stepper1" class="quantity" value="0" min="0" max="20" size="2" data-role="none" />
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <th style="font-size: 12; color: grey; font-style: italic; width:600px; padding-left:30px; text-align:left">${entres.description}</th>
                    </tr>
                  </table>
                </tr>
              </g:if>
            </g:each>
          </g:if>
        </table>
        <tr><h2>Les Plats:</h2></tr>
        <table style="width:600px">
          <g:if test="${cuisine.Plat.findByTypeplatid(2)}" >
            <g:each var="plats" in="${cuisine.Plat.findByTypeplatid(2).list(sort:"libelle")}">
              <g:if test="${plats.typeplatid == 2}" >
                <tr>
                  <table>
                    <tr>
                      <th style="width:600px; text-align:left">${plats.libelle}</th>
                      <th style="text-align:right; width:46px">${plats.prix}€</th>
                      <th style="text-align:right; padding-left:10px; padding-top:5px">
                        <div data-role="stepper" data-theme="c">
                          <input type="text" name="plats.${plats.id}" id="stepper1" class="quantity" value="0" min="0" max="20" size="2" data-role="none" />
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <th style="font-size: 12; color: grey; font-style: italic; width:600px; padding-left:30px; text-align:left">${plats.description}</th>
                    </tr>
                    
                  </table>
                </tr>
              </g:if>
            </g:each>
          </g:if>
        </table>
        <tr><h2>Les Desserts:</h2></tr>
          <table style="width:600px">
            <g:if test="${cuisine.Plat.findByTypeplatid(3)}" >
              <g:each var="desserts" in="${cuisine.Plat.findByTypeplatid(3).list(sort:"libelle")}">
                <g:if test="${desserts.typeplatid == 3}" >
                  <tr>
                  <table>
                    <tr>
                      <th style="width:600px; text-align:left">${desserts.libelle}</th>
                      <th style="text-align:right; width:46px">${desserts.prix}€</th>
                      <th style="text-align:right; padding-left:10px; padding-top:5px">
                        <div data-role="stepper" data-theme="c">
                          <input type="text" name="desserts.${desserts.id}" id="stepper1" class="quantity" value="0" min="0" max="20" size="2" data-role="none" />
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <th style="font-size: 12; color: grey; font-style: italic; width:600px; padding-left:30px; text-align:left">${desserts.description}</th>
                    </tr>
                  </table>
                </tr>
                </g:if>
              </g:each>
            </g:if>
          </table>
        </table>
      </table>
   </center>
    <input type="submit" value="Valider">
  </g:form>
  </body>
</html>


