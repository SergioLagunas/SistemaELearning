<%-- 
    Document   : ProgressBar
    Created on : 16-jul-2021, 17:41:43
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ProgressBar.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="../content/shared/js/products.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>

            h1 {
                text-align:center;
                text-transform:uppercase;
                letter-spacing:-2px;
                font-size:2.5em;
                margin:20px 0;
                color: black;
            }
            h2,h3,h4,h5, h6{
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
            }
            /*Estilo footer*/

            .footer-wrapper {
                background:#203853;/*Color de fondo del pie de página*/
                padding-top: 30px;/*Altura del pie de página*/
                padding-bottom: 40px;/*Altura del pie de página*/
                width: 100%;
                text-align: center;
                font: normal normal 11px Arial;/*Tipografía y Tamaño*/
                color:white;/*Color del texto del pie de página*/
                text-transform: uppercase;/*Esta línea decódigo es para poner las letras en mayúsculas */
                letter-spacing: 2px;/*Espacio entre letras*/
            }
        </style>
    </head>
    <body class="body1">
        <header>
            <div class="encabezado">
                <div class="logo">
                    <div>
                        <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif"> </a>
                    </div>
                </div>

                <nav>
                    <!--<ul class="nav__links">-->
                    <li><span><a href="perfilsem.html">Mi perfil </a></span></li>
                    <li><span><a href="ProgressBar.html">Mis cursos </a></span></li>
                    <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

        <h1>Mis Cursos</h1>
        <c:forEach var="cursos" items="${miscursos}">  
            <div>      
                <div class="bar">
                    <h3 style="margin-left: 35px;">${cursos.nombre}</h3>
                    <div class="barraProgreso k-content">
                        <div id="profileCompleteness${cursos.idCurso}"></div>
                    </div>
                    <center><a href="mediacursos.html?idCurso=${cursos.idCurso}"><button>Continuar Curso</button></a></center>
                    <br/>
                </div>   
            </c:forEach>
            <c:forEach var="progress" items="${progreso}">   
                <h5 style="margin-left: 20px;"><span id="completed">${progress.progreso} %</span> Completado</h5>
                <div style="display: flex;"></div>
            </c:forEach>
            <script>
                $(document).ready(function () {
                <c:forEach var="cursos" items="${miscursos}">
                    var pb = $("#profileCompleteness${cursos.idCurso}").kendoProgressBar({
                        type: "chunk",
                        chunkCount: 100,
                        min: 0,
                        max: 100,
                        value: ${cursos.progreso}
                    }).data("kendoProgressBar");
                </c:forEach>
                <c:forEach var="cursos" items="${miscursos}">
                    pb.value(completeness);
                    $("#completed").text((completeness * 20) + "%");
                </c:forEach>
                });
            </script>
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
    <script>
        function cerrarSession() {

            $(location).attr('href', "cerrarSession.html")

        }
    </script>
</html>
