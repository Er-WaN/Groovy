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
        <tr><h2>Les Plats:</h2></tr>
        <tr><h2>Les Desserts:</h2></tr>
      </table>
   </center>
  
  <input type="image" src="${resource(dir:'images',file:'flèche_retour.jpg')}" onclick="retour()"> 
  </body>
</html>

<script language=javascript> 

function retour()
{ 
document.location.href = "client_1.gsp"; 
} 

</script> 
