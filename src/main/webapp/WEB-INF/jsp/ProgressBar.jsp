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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Estilos.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="../content/shared/js/products.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
            li,a,button{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;

            }
        </style>
    </head>
    <body>
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
            <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfilsem.html">Mi perfil </a></li>
                    <li><a href="ProgressBar.html">Mis cursos</a></li>
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
        </header>

        <h1>Mis Cursos</h1>
        <div class="bar">
            <h3 style="margin-left: 35px;">Nombre del curso</h3>
            <div class="barraProgreso k-content">
                <div id="profileCompleteness"></div>
            </div>
            <h5 style="margin-left: 20px;"><span id="completed">100%</span> Completado</h5>
            <div style="display: flex;">


            </div>
            <br/>
            <h3 style="margin-left: 35px;">Nombre del curso</h3>
            <div class="barraProgreso k-content" >
                <div id="profileCompleteness1" style="width: 100%;"></div>
            </div>
            <h5 style="margin-left: 20px;"><span id="completed">40%</span> Completado</h5>
            <div style="display: flex;">

            </div>
            <script>
                $(document).ready(function () {
                    var pb = $("#profileCompleteness").kendoProgressBar({
                        type: "chunk",
                        chunkCount: 100,
                        min: 0,
                        max: 100,
                        value: 100
                    }).data("kendoProgressBar");
                    var pb = $("#profileCompleteness1").kendoProgressBar({
                        type: "chunk",
                        chunkCount: 100,
                        min: 0,
                        max: 100,
                        value: 40
                    }).data("kendoProgressBar");

                    pb.value(completeness);
                    $("#completed").text((completeness * 20) + "%");
                    pb.value(completeness);
                    $("#completed").text((completeness * 20) + "%");
                });
            </script>
        </div>
        <!--Footer-->
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
