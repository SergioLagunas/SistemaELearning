<%-- 
    Document   : admin
    Created on : 16-jul-2021, 16:28:25
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <title>admin</title>
        <style>
            .botoncurso{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }
            .botoncurso{
                padding: 9px 25px;
                background-color: #B15D28;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .botoncurso:hover{
                background-color: white;
            }
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
                    <li><span><a href="index.html" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

    <center><h1><font color="black">Bienvenido <%=request.getSession().getAttribute("usuario")%></font></h1></center>
    <div class="seccion">
        <table>
            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/Adminsemillero.png">
                <br>
                <h4>Administradores</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <p><center> En este apartado podrás dar de alta a futuros administradores o si lo deseas también puedes editar su información o eliminarla.</center></p>
                <br>
                <a href="nuevoadmin.html"><button class="botoncurso">Conoce más</button></a>
            </div>

            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/semillero.png">
                <br>
                <h4>Semilleros</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <p><center> En esta parte podrás consultar la información de los integrantes que conforman los semilleros de talento y si lo requiere el administrador eliminar esos datos o actualizarlos.</center></p>
                <br>
                <a href="nuevosemillero.html"><button class="botoncurso">Conoce más</button></a>
            </div>

            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/cursos.png">
                <br>
                <h4>Cursos</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <p><center>Aqui podrás iniciar un nuevo curso, indicar su nombre, dar una breve descripción y agregar una imagen de portada, click en guardar y luego en continuar; ahi agregarás modulos a tu curso donde subirás videos imagenes o documentos.</center></p>
                <br> 
                <a href="nuevocurso.html"><button class="botoncurso">Conoce más</button></a>
            </div>

        </table>

    </div>         





    <!--<div id="multimedia"> 
        <iframe width="560" height="315" src="https://www.youtube.com/embed/lRQjFCd4dJg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div> -->

    <br>
    <br>
    <br>
    <br>

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
