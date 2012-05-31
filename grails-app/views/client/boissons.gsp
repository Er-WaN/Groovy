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
      
    </style>
  </head>

  <body>
    <center>
    
    <div class='title'>      
      <h1>Tactil-Restaurant</h1>
    </div>
         
           <table style="margin-top:30px;margin-left:20px;margin-right:20px;">
            <tr>
              <td align="center"><input type="button" value="Apéritifs" class="button" /></td>
            
              <td align="center"><input type="button" value="Vins" class="button" /></td>
            
              <td align="center"><input type="button" value="Softs" class="button" /></td>
            </tr>
           </table>
        
  </center>
 </body>
 <input type="image" src="${resource(dir:'images',file:'flèche_retour.jpg')}" onclick="retour()"> 
</html>

<script language=javascript> 

function retour()
{ 
document.location.href = "../choix_formule/"; 
} 

</script> 
