<%-- 
    Document   : index
    Created on : 6/07/2021, 11:13:55 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Prueba de Login</h2>
        <br/>
        <br/>

        <form action="validador.html" method="GET">
            Correo Usuario: <input type="text" name="email"> <br/><br/>
            password: <input type="text" name="contrasena"> <br/>
            <input type="submit" value="emviar">

        </form>
        
        <h2>Registro de Usuarios</h2>
        <br/>
        <br/>

        <form action="semilleroRegistro.html" method="GET">
            Nombre: <input type="text" name="nombre"> <br/><br/>
            Apellido Paterno: <input type="text" name="aPaterno"> <br/>
            Apellido Materno: <input type="text" name="aMaterno"> <br/>
            Apellido Genero: <input type="text" name="genero"> <br/>
            Correo Electronico: <input type="text" name="email"> <br/>
            Contraseña: <input type="text" name="contrasena"> <br/>
            RFC: <input type="text" name="rfc"> <br/>
            <input type="submit" value="emviar">

        </form>
    </body>
</html>
