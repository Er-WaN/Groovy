<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Serveur</title>
    <style type='text/css' media='screen'>
    
    .title{
    border-color: black;
    border-style:solid;
    border-width:2px;
    background:#CD853F;
    }
    
    .button{
    width:120px;height:120px;
    font-size: 5em;
    background:#CD853F;
    cursor: pointer;
    }
    
      
    </style>
  </head>
 
  <body>
    
  <center>
    <div class='title'>      
      <h1>Bienvenue chez Tactil-Restaurant</h1>
    </div>
               
  <table style="width:1100px">
    <tr>
      <th><h2>Serveur :  ${session.SPRING_SECURITY_CONTEXT.authentication.principal.username}</h2></th>  
    </tr>
    <tr>
      <th style="text-align: right"><g:link controller="logout"><g:message code="Déconnection" /></g:link></th>
    </tr>
  </table>
  
    <table>
      <tr>
        <td>
           <table style="margin-top:30px;margin-left:20px;margin-right:20px;" class="a">
            <tr>
              <td align="center"><input type="button" value="1" class="button" onclick="nb(1)"/></td>
              <td align="center"><input type="button" value="2" class="button" onclick="nb(2)"/></td>
              <td align="center"><input type="button" value="3" class="button" onclick="nb(3)"/></td>
              <td align="center"><input type="button" value="4" class="button" onclick="nb(4)"/></td>
              <td align="center"><input type="button" value="5" class="button" onclick="nb(5)"/></td>
           </tr>
           <tr>
              <td align="center"><input type="button" value="6" class="button" onclick="nb(6)"/></td>
              <td align="center"><input type="button" value="7" class="button" onclick="nb(7)"/></td>
              <td align="center"><input type="button" value="8" class="button" onclick="nb(8)"/></td>
              <td align="center"><input type="button" value="9" class="button" onclick="nb(9)"/></td>
              <td align="center"><input type="button" value="10" class="button" onclick="nb(10)"/></td>
           </tr>
           <tr>
              <td align="center"><input type="button" value="11" class="button" onclick="nb(11)"/></td>
              <td align="center"><input type="button" value="12" class="button" onclick="nb(12)"/></td>
              <td align="center"><input type="button" value="13" class="button" onclick="nb(13)"/></td>
              <td align="center"><input type="button" value="14" class="button" onclick="nb(14)"/></td>
              <td align="center"><input type="button" value="15" class="button" onclick="nb(15)"/></td>
           </tr>
          </table>
        </td>
      </tr>
    </table>
  </center>

</body> 
</html>

<script language=javascript> 

function nb(nombre)
{ 
document.location.href = "serveur_2/"+nombre; 
}


</script> 
