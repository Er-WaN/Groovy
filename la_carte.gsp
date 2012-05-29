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
    width:150px;height:150px;
    font-size: 9em;
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
  </center>
 
</body>

<input type="image" src="${resource(dir:'images',file:'flèche_retour.jpg')}" onclick="retour()">
</html>

<script language=javascript> 

function retour()
{ 
document.location.href = "client_1.gsp"; 
} 

</script> 
