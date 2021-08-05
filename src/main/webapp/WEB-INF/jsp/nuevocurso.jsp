<%-- 
    Document   : nuevocurso
    Created on : 16-jul-2021, 17:29:14
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a href="admin.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfiladmin.html">Mi perfil </a></li>
                    <li><a href="nuevoadmin.html">Admin.</a></li>
                    <li><a href="nuevosemillero.html">Semilleros</a></li>
                    <li><a href="listadodecursos.html">Cursos</a></li>
                    <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
        </header>

        <div id="container">
            <div id="Titulo">
                <h3>Nuevo Curso</h3>
            </div>
            <div id="subtitulo">
                <h3>Añade un nuevo Curso</h3>
            </div>
            <br>
            <form:form id="form" action="crearCurso.html" method="POST" enctype="multipart/form-data">   
                <div id="example">
                    <div class="demo-section k-content">
                        <ul class="fieldlist">
                            <li>
                                <input id="simple-input" type="text" placeholder="Nombre" class="k-textbox" style="width: 100%;" name="nombre" />
                            </li>
                            <li>
                                <input id="simple-input" type="text" placeholder="Descripción" class="k-textbox" style="width: 100%;" name="descripcion"  />
                            </li>
                            <li>
                                <input id="simple-input" type="text" placeholder="Categoria" class="k-textbox" style="width: 100%;" name="categoria" />
                            </li>

                            <li>
                                <select  name="categoria" id="simple-input">
                                    <option>Back-End</option>
                                    <option>Front-end</option>
                                    <option>Bases de Datos</option>
                                    <option>Redes</option>
                                    <option>Seguridad en redes</option>   
                                    <option>Otro</option>
                                </select>
                            </li>

                            <li>
                                <span class="btn btn-primary btn-file">Caratula del curso: <input type="file" accept=".jpg,.png,.jpeg,.gif," name="caratula" ></span>
                            </li>

                            <li>
                                <button class="k-button" type="submit">Guardar</button>&nbsp;
                                <a href="añadirmodulos.html"> <button class="k-button k-primary">Continuar</button> </a> 
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
        </form:form>        
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
