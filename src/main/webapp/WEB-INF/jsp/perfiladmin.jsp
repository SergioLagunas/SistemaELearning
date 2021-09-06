<%-- 
    Document   : perfiladmin
    Created on : 16-jul-2021, 17:32:16
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
        <title>Perfil Admin</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }

            .form-register {
                width: 450px;
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
        <!-- Navigation-->
        <header>
            <nav class="navbar">
                <!--<div class="brand-title">Brand Name</div>-->
                <div class="logo">
                    <div>
                        <a href="admin.html"><img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif"></a>
                    </div>
                </div>
                <a href="#" class="toggle-button">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="navbar-links">
                    <ul>
                        <li><a href="perfiladmin.html">Mi perfil</a></li>
                        <li><a href="nuevoadmin.html">Administradores</a></li>
                        <li><a href="nuevosemillero.html">Semilleros</a></li>
                        <li><a href="listadodecursos.html">Cursos</a></li>
                        <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                        <!--<li><a href="#">Cerrar sesión</a></li>-->
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
        <div id="container">
            <div id="Titulo">
                <center><h1>Mis datos</h1></center>
            </div>

            <section class="form-register">
                <form id="from3" action="actualizarAdmin.html" method="POST">
                    <center><img  src="${pageContext.request.contextPath}/resources/imagenes/admon.png" width="150px" height="150px"></center>
                    <input class="controls" type="hidden" name="idUsuario" id="idUsuario"value="${usuario.idUsuario}">
                    <input class="controls" type="text" name="nombre" id="nombres" placeholder="Nombre" value="<c:out value="${usuario.nombre}"></c:out>">
                    <input class="controls" type="text" name="aPaterno" id="apellidopat" placeholder="Apellido paterno" value="<c:out value="${usuario.aPaterno}"></c:out>">
                    <input class="controls" type="text" name="aMaterno" id="apellidomat" placeholder="Apellido materno" value="<c:out value="${usuario.aMaterno}"></c:out>">
                    <input class="controls" type="hidden" name="genero" id="genero" value="<c:out value="${usuario.genero}"></c:out>">
                    <input class="controls" type="hidden" name="email" id="email" value="<c:out value="${usuario.email}"></c:out>">
                    <input class="controls" type="password" name="contrasena" id="password" placeholder="Nueva contraseña" value="<c:out value="${usuario.contrasena}"></c:out>">
                    <input class="controls" type="text" name="rfc" id="rfc" placeholder="RFC" value="<c:out value="${usuario.rfc}"></c:out>">
                    <br>
                    <center><input class="btn-guardar" type="submit" onclick="alertActualizar()" value="Guardar"></center>

                    <script>
                        function alertActualizar() {
                            document.querySelector('#from3').addEventListener('submit', function (e) {

                                var form = this;
                                e.preventDefault(); // <--- prevent form from submitting

                                Swal.fire({
                                    title: '¿Quieres Actualizar los datos?',
                                    icon: 'warning',
                                    iconColor: '#B15D28',
                                    showCancelButton: true,
                                    confirmButtonText: 'Actualizar',
                                    confirmButtonColor: '#203853',
                                    cancelButtonColor: '#B15D28',
                                    cancelButtonText: 'Cancelar',
                                    reverseButtons: true
                                })
                                        .then((result) => {
                                            if (result.isConfirmed) {
                                                Swal.fire({
                                                    title: '¡Actualizado!',
                                                    text: 'Se Actualizaron los datos',
                                                    icon: 'success',
                                                    iconColor: '#203853',
                                                    confirmButtonColor: '#B15D28'
                                                })
                                                        .then(function () {
                                                            //document.getElementById("from1").submit(); // <--- submit form programmatically
                                                            form.submit();
                                                            console.log("BIEN");
                                                        });
                                            } else if (result.dismiss === Swal.DismissReason.cancel) {
                                                Swal.fire({
                                                    title: '¡Cancelado!',
                                                    text: 'No se actualizo ningun dato',
                                                    icon: 'error',
                                                    iconColor: '#B15D28',
                                                    confirmButtonColor: '#203853'
                                                })
                                            }
                                        })
                            });
                        }
                    </script>
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
        <br>
        <br>
        <br>
        <br>





        <footer>
            <div class="footer-content">
                <h3>B1 SOFT</h3>

                <ul class="socials">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <p>designed by <span>B1 SOFT</span></p>
            </div>
        </footer>
    </body>
    <script>
        function cerrarSession() {

            $(location).attr('href', "cerrarSession.html")

        }
    </script>
</html>