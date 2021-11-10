<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil semillero</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }
            h1{

                text-align: center;
                display: inline-block;
                position: relative;
                font-size: 35px;
            }

            h1::after,h1::before{

                content: '';
                position: absolute;
                width: 120px;
                height: 3px;
                background-color: #B15D28;
                top: 0.6em;

            }

            h1::before{
                left: -140px;

            }

            h1::after{
                right: -140px;

            }

            .form-register {
                width: 450px;
                background:  #203853;
                padding: 50px;
                margin: auto;
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
            #form{
                width: 550px;
                margin: auto;
                background: #203853;
                padding: 20px 20px;
                box-sizing: border-box;
                margin-top: 20px;
                border-radius: 15px;
                border: none;


            }
            .btn-guardarArc{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }
            .btn-guardarArc{
                padding: 9px 25px;
                background-color: #B15D28;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .btn-guardarArc:hover{
                background-color: white;
            }

            .btn-guardarArc span{

                position: absolute;
                display: block;

            }
            table{
                background-color: #203853;
                width: 50%;
                text-align: center;
                color: white;
                border-collapse: collapse;

            }

            th, td{

                padding: 10px;

            }
            tr {
                border: #B15D28 2px solid;
            }
            .opciones{
                width: 200px;
            }

            thead{
                background-color:  #203853;
                border-bottom: solid 5px #B15D28;
                color: white;
            }
            .btnbtn-danger{
                width: 40px;
                height: 40px;
                background: #DD3545;
                text-align: center;
                viewBox: 0 0 16 16;
                cursor: pointer;
                border:none;
                border-radius: 5px;
                color: white;
            }
            .btnbtn-danger:hover {
                background: #C82333;
            }

            /*propiedad responsive*/
            @media(max-width:600px){
                h1::after,h1::before{

                    content: '';
                    position: absolute;
                    width: 20px;
                    height: 3px;
                    background-color: #B15D28;
                    top: 0.6em;

                }

                h1::before{
                    left: -30px;

                }

                h1::after{
                    right: -30px;

                }
                .form-register{
                    width: 80%;
                    box-shadow: 5px 10px 25px #000;
                }
                #form{
                    width: 90%;
                }
                .opciones{
                    width: 100px;
                }
                table {
                    width: 50%;
                    display: block;
                    overflow-x: auto;
                }
            }


        </style>
    </head>
    <body class="body1">
        <%
            String tipoUsuario = (String) session.getAttribute("tUsuario");
            if (tipoUsuario != null) {
                if (tipoUsuario.equals("Administrador")) {
                    response.sendRedirect("admin.html");
                }
            } else {
                response.sendRedirect("index.html");
            }
        %>
        <header>
            <nav class="navbar">
                <!--<div class="brand-title">Brand Name</div>-->
                <div class="logo">
                    <div>
                        <a href="bienvenida.html"><img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif"></a>
                    </div>
                </div>
                <a href="#" class="toggle-button">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="navbar-links">
                    <ul>
                        <li><a href="perfilsem.html">Mi perfil</a></li>
                        <li><a href="ProgressBar.html">Mis Cursos</a></li>
                        <!--<li><a href="#">Cerrar sesión</a></li>-->
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <br><br>

        <div id="container">
            <div id="Titulo">
                <center><h1>Mis datos</h1></center>
            </div>
            <br>
            <section class="form-register">
                <form id="from2" action="actualizarSemillero.html" method="POST">
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
                        <center><input class="btn-guardar" type="submit" onclick="alertActualizar()" value="Guardar"></center>
                    </form>
                </section>
                <br>
                <br>
                <br>
                <div id="misArchivos">
                <div id="Titulo2">
                    <center><h1>Mis archivos</h1></center>
                </div>
                <br>
                <div id="form">
                    <center>
                        <h3 style="color: white;"> En esta sección puedes subir las evidencias de tus cursos: </h3> 
                        <br>
                        <input id="simple-input" type="file" name="caratula" class="k-textbox" style="width: 100%;" />
                        <br>
                        <br>
                        <center><input class="btn-guardarArc" type="submit" value="Guardar"></center>
                    </center>
                </div>
                <br>
                <center>
                    <div id="Divtablita" class="tablita">
                        <table class="tabla" id="tabla">
                            <thead>
                                <tr> 
                                    <th class="opciones">Archivo</th> 
                                    <th class="opciones">Opciones</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div> 
                <br/>
                </center>
                </div> 
            <script>
                function alertActualizar() {
                    document.querySelector('#from2').addEventListener('submit', function (e) {

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

                function cerrarSession() {

                    $(location).attr('href', "cerrarSession.html")

                }
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
        <footer>
            <div class="footer-content">
                <h3>B1 SOFT LATINOAMERICA</h3>

                <ul class="socials">
                    <li><a href="#"><i class="fab fa-facebook"></i></a>
                    <li><a href="#"><i class="fab fa-twitter"></i></a>
                    <li><a href="#"><i class="fab fa-google"></i></a>
                    <li><a href="#"><i class="fab fa-youtube"></i></a>
                    <li><a href="#"><i class="fab fa-linkedin"></i></a>
                </ul>
            </div>
            <div class="footer-bottom">
                <p>2021. <span>B1 SOFT</span></p>
            </div>
        </footer>
    </body>

</html>
