<%-- 
    Document   : semillero
    Created on : 6/07/2021, 10:02:19 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola <%=request.getSession().getAttribute("usuario")%> , Bienvenido</h1>
        
        <h2>Tu rol es de: ${tUsuario} </h2>
        
        
        <button name="cerrarSession.html"> Cerrar Session </button>
        
        
    </body>
</html>
