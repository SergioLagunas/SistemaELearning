<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exito</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exitoerror.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
            .contenedor {
                width: 30%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.301);
                margin-left: 35%;
                margin-top: 8%;
                border-radius: 15px;
            }
            .img{
                margin-left: 40%;
                margin-top: 2%;
            }
        </style>
    </head>
    <body class="body1">
        <div class="burbujas">
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
        </div>
        <!-- Navigation-->
        <header>
            <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"   width="160" style="margin-left: 5%; margin-top: 2%;" >
        </header>
        <div class="contenedor">
            <div class="img">
                <img src="${pageContext.request.contextPath}/resources/imagenes/check.png" width="25%" height="25%" >
            </div>
            <p><b>¡MUY BIEN!</b></p>            
            <p><c:out value="${Message}"></c:out></p>
            <br>
            <br>
            <button onclick="location.href='${Dirigir}'" id="BotonIS" class="primary">REGRESAR</button>
        </div>
        <!--Footer-->
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class='footer-wrapper'>
            <div style='padding-top:15px;padding-bottom:10px; '>
                <center>

                    <a href='https://twitter.com/?lang=es' target='_blank'><img HSPACE='10'
                                                                                src='https://img.icons8.com/android/24/000000/twitter.png' title='' />
                        <a href='https://es-la.facebook.com/' target='_blank'><img HSPACE='10'
                                                                                   src='https://img.icons8.com/android/24/000000/facebook.png' title='' /></a>
                        <a href='https://www.google.com/intl/es-419/gmail/about/#' target='_blank'><img HSPACE='10'
                                                                                                        src='https://img.icons8.com/ios-filled/24/000000/gmail-login.png' title='' /></a>
                        <a href='https://www.youtube.com/' target='_blank'><img HSPACE='10'
                                                                                src=' https://img.icons8.com/metro/26/000000/youtube.png' title='' /></a>
                    </a>

                </center>
            </div> Todos los derechos reservados | © 2021 B1 SOFT
        </div>
    </body>
</html>
