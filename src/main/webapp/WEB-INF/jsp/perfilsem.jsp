<%-- 
    Document   : perfilsem
    Created on : 16-jul-2021, 17:38:05
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
        <title>Nuevo Curso</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nuevocurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
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

                <a href="admin.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
                <nav>
                    <ul class="nav__links">
                        <li><a href="perfilsem.html">Mi perfil </a></li>
                        <li><a href="ProgressBar.html">Mis cursos</a></li>
                    </ul>
                </nav> 
                <a class="cta" href="index.html"><button>Cerrar sesión</button></a>


        </header>

        <div id="container">
            <div id="Titulo">
                <h3>Mis datos</h3>
            </div>
            <br>
            <div id="example">
                <div class="demo-section k-content">
                    <ul class="fieldlist">
                        <li>
                            <input id="simple-input" type="text" placeholder="Nombre" class="k-textbox" style="width: 100%;" />
                        </li>
                        <li>
                            <input id="simple-input" type="text" placeholder="Apellido paterno" class="k-textbox" style="width: 100%;" />
                        </li>
                        <li>
                            <input id="simple-input" type="text" placeholder="Apellido materno" class="k-textbox" style="width: 100%;" />
                        </li>
                        <li>
                            <input id="simple-input" type="text" placeholder="RFC" class="k-textbox" style="width: 100%;" />
                        </li>


                        <li>
                        <center><button class="k-button">Guardar</button>&nbsp;</center> 
                        </li>
                        <br>
                        <br>
                        <br>        
                    </ul>
                    <style>
                        .demo-section  {
                            background-color: rgba(255, 255, 255, 0);
                        }
                        .fieldlist {
                            margin: 0 0 -2em;
                            padding: 0;
                        }

                        .fieldlist li {
                            list-style: none;
                            padding-bottom: 2em;
                        }

                        .fieldlist label {
                            display: block;
                            padding-bottom: 1em;
                            font-weight: bold;
                            text-transform: uppercase;
                            font-size: 12px;
                            color:black;
                        }

                    </style>
                </div>
            </div>
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
</html>
