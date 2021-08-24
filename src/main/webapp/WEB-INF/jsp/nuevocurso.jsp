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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <style>
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }
            #Titulo {
                color: black;
                text-align: center;
                font-size: 30px;
            }

            .k-button{
                width: 40%;
                margin-bottom: 0;
                background: #B15D28;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
            .k-button:hover{
                background-color: white;
                color: black;
                filter: brightness(1.05);
            }
            #simple-input{
                padding: 5px;
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
        <!-- Navigation-->
        <header>
            <div class="encabezado">
                <div class="logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif">
                    </div>
                </div>

                <nav>
                    <!--<ul class="nav__links">-->
                    <li><span><a href="perfiladmin.html">Mi perfil </a></span></li>
                    <li><span><a href="nuevoadmin.html">Administradores </a></span></li>
                    <li><span><a href="nuevosemillero.html">Semilleros </a></span></li>
                    <li><span><a href="listadodecursos.html">Cursos </a></span></li>
                    <li><span><a href="nuevocurso.html">Agregar nuevo curso </a></span></li>
                    <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

        <div id="container">
            <div id="Titulo">
                <h3>Agregar nuevo curso</h3>
            </div>
            <br>
            <form:form id="form" action="crearCurso.html" method="POST" enctype="multipart/form-data">   
                <div id="example">
                    <div class="demo-section k-content">
                        <ul class="fieldlist">
                            <center><img  src="${pageContext.request.contextPath}/resources/imagenes/curso.png" width="220px" height="160px" ></center>
                            <br>
                            <li>
                                <input id="simple-input" type="text" placeholder="Nombre" class="k-textbox" style="width: 100%;" name="nombre" />
                            </li>
                            <li>
                                <input id="simple-input" type="text" placeholder="Descripción" class="k-textbox" style="width: 100%;" name="descripcion"  />
                            </li>
                            <li>
                                <select  name="categoria" id="simple-input" class="k-textbox" style="width: 100%;">
                                    <option disabled selected value="c">Selecciona una categoria</option>
                                    <option>Back-End</option>
                                    <option>Front-End</option>
                                    <option>Bases de Datos</option>
                                    <option>Redes</option>
                                    <option>Seguridad en redes</option>   
                                    <option>Otro</option>
                                </select>
                            </li>
                            <li>
                                <h3 style="color: white;"> Selecciona la caratula del curso: </h3> 
                                <input id="simple-input" type="file" name="caratula" class="k-textbox" style="width: 100%;" />

                            </li>
                            <li>
                            <center><button class="k-button" type="submit">Guardar curso</button>&nbsp;</center> 
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

                                width: 90%;
                                height: 560px;
                                background:  #203853;
                                padding: 50px;
                                margin: auto;
                                margin-top: 30px;
                                border-radius: 10px;

                                color: rgb(42, 35, 49);
                                box-shadow: 7px 13px 37px #000;

                            }

                            .fieldlist li {
                                list-style: none;
                                padding-bottom: 3em;

                            }

                            .fieldlist label {
                                display: block;
                                padding-bottom: 1em;
                                font-weight: bold;
                                text-transform: uppercase;
                                font-size: 20px;
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
    <script>
        function cerrarSession() {

            $(location).attr('href', "cerrarSession.html")

        }
    </script>
</html>
