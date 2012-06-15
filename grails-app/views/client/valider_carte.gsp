<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <h1>Sample line</h1>
    <table>
      <tr>
        ${params.entres}
        <th>Entrées</th>
        <th></th>
      <g:each in="${params.entres}">
        </tr>
        <tr>
          <td>${it}</td>
        </tr>
      </g:each>
    </table>
  </body>
</html>
