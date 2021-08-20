<%-- 
    Document   : perfilsem
    Created on : 16-jul-2021, 17:38:05
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
        <title>Perfil semillero</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
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
        .form-register {
                width: 350px;
                background:  #203853;
                padding: 50px;
                margin: auto;
                margin-top: 60px;
                border-radius: 10px;
                font-family: 'calibri';
                color: rgb(42, 35, 49);
                box-shadow: 7px 13px 37px #000;
            }

            .controls {
                width: 90%;
                background: #272727;
                padding: 10px;
                align-items: center;
                border-radius: 5px;
                margin-bottom: 16px;
                border: none;
                font-family: sans-serif;
                font-size: 18px;
                color: white;
                outline: none;
            }
            .btn-guardar{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }
            .btn-guardar{
                padding: 9px 25px;
                background-color: #B15D28;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .btn-guardar:hover{
                background-color: white;
            }

            .btn-guardar span{

                position: absolute;
                display: block;

            }



        </style>
    </head>
    <body class="body1">
        <header>
            <div class="encabezado">
                <div class="logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif">
                    </div>
                </div>

                <nav>
                    <!--<ul class="nav__links">-->
                    <li><span><a href="perfilsem.html">Mi perfil </a></span></li>
                    <li><span><a href="ProgressBar.html">Mis cursos </a></span></li>
                    <li><span><a href="index.html" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

        <div id="container">
            <div id="Titulo">
                <center><h1>Mis datos</h1></center>
            </div>

            <section class="form-register">
                <form action="actualizarSemillero.html" method="POST">
                    <center><img  src="${pageContext.request.contextPath}/resources/imagenes/user.png" width="150px" height="150px"></center>
                    <input class="controls" type="hidden" name="idUsuario" id="idUsuario"value="${usuario.idUsuario}">
                    <input class="controls" type="text" name="nombre" id="nombres" placeholder="Nombre" value="<c:out value="${usuario.nombre}"></c:out>">
                    <input class="controls" type="text" name="aPaterno" id="apellidopat" placeholder="Apellido paterno" value="<c:out value="${usuario.aPaterno}"></c:out>">
                    <input class="controls" type="text" name="aMaterno" id="apellidomat" placeholder="Apellido materno" value="<c:out value="${usuario.aMaterno}"></c:out>">
                    <input class="controls" type="hidden" name="genero" id="genero" value="<c:out value="${usuario.genero}"></c:out>">
                    <input class="controls" type="hidden" name="email" id="email" value="<c:out value="${usuario.email}"></c:out>">
                    <input class="controls" type="password" name="contrasena" id="password" placeholder="Nueva contraseña" value="<c:out value="${usuario.contrasena}"></c:out>">
                    <input class="controls" type="text" name="rfc" id="rfc" placeholder="RFC" value="<c:out value="${usuario.rfc}"></c:out>">
                    <br>
                    <center><input class="btn-guardar" type="submit" value="Guardar"></center>
                </form>
            </section>

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
