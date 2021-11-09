<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro exitoso</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estiloErroExito.css">
</head>
<body background="">
    <header class="bg_animate">
        <div id= "logo"> 
            <center><img src="${pageContext.request.contextPath}/resources/imagenes/logoindex.gif" width="8%"/></center>
        </div>
    
    </header>

    <section class="banner contenedor">
        <secrion class="banner_title">
            <h2>¡ERROR! <br> Valla al parecer ocurrio un error :(</h2>
            <a href="anadirmodulos.html" class="llamanos">Regresar</a>
        </secrion>
        <div class="banner_imge">
            <img src="${pageContext.request.contextPath}/resources/imagenes/error_1.png" alt="">
        </div>
    </section>
</body>
</html>