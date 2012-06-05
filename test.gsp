<html>
  <head>
    <title>Simple GSP page</title>
    <g:javascript library="jquery" />
    <jqui:resources theme="darkness" />
    <script type="text/javascript">
        $(document).ready(function()
        {
          $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
        })
    </script>

  </head>
  <body>
    <div>
      <p> Between <input type="text" id="datepicker"> </p>        
    </div>

  </body>
</html>