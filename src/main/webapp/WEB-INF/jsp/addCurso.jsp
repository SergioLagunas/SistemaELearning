<%-- 
    Document   : addCurso
    Created on : 13/07/2021, 06:20:20 PM
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
        
        <h1>Agregar Curso</h1>
        
    <form action="crearCurso.html" method="GET" enctype="multipart/form-data">
       Nombre:
       <input type="text" name="nombre"/> <br/>
        Descripcion
        <input type="text" name="descripcion"/><br/>
        Caratula:
        <input type="file" name="file" class="form-control"/><br/>
        Categoria:
        <input type="text" name="categoria"/><br/>
        <button type="submit">Guardar</button>
    </form>
        
    </body>
</html>
