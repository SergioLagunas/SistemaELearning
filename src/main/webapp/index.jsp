<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/kendo.common.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/kendo.default.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="resources/js/kendo.all.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola</h1>   
        <p>Hello <a href="https://docs.telerik.com/kendo-ui/intro/first-steps">Kendo UI for jQuery</a>!
        This is version <strong id="kendoVersion"></strong>.</p>
        
        <ul id="menu">
            <li>Opción primera</li>
            <li>Opción segunda
               <ul>
                  <li>Opción anidada 1
                     <ul>
                        <li>Podemos anidar n niveles</li>
                     </ul>
                  </li>
                  <li>Otra opción anidada</li>
               </ul>
            </li>
            <li>Tercera opción</li>
        </ul>
        
        <script>
            $(function() {
                $("#kendoVersion").text(kendo.version);
                $("#menu").kendoMenu();
            });
        </script>    
    </body>
</html>
