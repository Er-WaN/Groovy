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
    
       
    .button{
    width:300px;height:150px;
    font-size: 3em;
    background:#CD853F;
    cursor: pointer;
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
                      <th style="text-align:right">${entres.prix}€</th>
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
                      <th style="text-align:right">${plats.prix}€</th>
                      <th><input type="range"  name="myRange"  title="Curseur" value="0"  min="0" max="10" oninput="document.getElementById('rangeOutput').textContent=value"><span id="rangeOutput">0</span></th>
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
                      <th style="text-align:right">${desserts.prix}€</th>
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
  
  <input type="image" src="${resource(dir:'images',file:'flèche_retour.jpg')}" onclick="retour()"> 
  </body>
</html>

<script language=javascript> 

function retour()
{ 
document.location.href = "../choix_formule/"} 

</script> 
