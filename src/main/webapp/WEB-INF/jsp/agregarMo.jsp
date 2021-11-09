<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Agregar Modulos</h1>
       
        <form:form id="form" action="addModulo.html" method="POST" enctype="multipart/form-data">
            Titulo:
            <input type="text" name="titulo"/><br>
            Descripcion
            <input type="text" name="descripcion"/><br>
            Video
            <input type="file" name="url" accept=".mp4,.avi,.wmv"/><br>
            
            <input type="submit" value="Enviar datos"/>
            
        </form:form>
    </body>
</html>
