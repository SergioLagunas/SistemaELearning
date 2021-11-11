<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Curso</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nuevocurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
                overflow-x: hidden;
            }
            #Titulo {
                color: black;
                text-align: center;
                font-size: 30px;
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
            @media(max-width:820px){
                h1{
                    text-align: center;
                    display: inline-block;
                    position: relative;
                    font-size: 30px;
                }
                h1::after,h1::before{
                    display: none;

                }


            }

        </style>
    </head>
    <body class="body1">
        <%
            String tipoUsuario = (String) session.getAttribute("tUsuario");
            if (tipoUsuario != null) {
                if (tipoUsuario.equals("Semillero")) {
                    response.sendRedirect("bienvenida.html");
                }
            } else {
                response.sendRedirect("index.html");
            }
        %>
        <!-- Navigation-->
        <header>
            <nav class="navbar">
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
                <center><h1>Agregar nuevo curso</h1></center>
            </div>
            <br>
            <form:form id="form" action="crearCurso.html" method="POST" enctype="multipart/form-data">   
                <div id="example">
                    <div class="demo-section k-content">
                        <ul class="fieldlist">
                            <center>
                                <center><img  src="${pageContext.request.contextPath}/resources/imagenes/curso.png" width="220px" height="160px" ></center>


                                <input id="simple-input" type="text" placeholder="Nombre" class="k-textbox" style="width: 100%;" name="nombre" />
                                <br>
                                <br>
                                <input id="simple-input" type="text" placeholder="Descripción" class="k-textbox" style="width: 100%;" name="descripcion"  />
                                <br>
                                <br>
                                <select  name="categoria" id="simple-input" class="k-textbox" style="width: 100%;">
                                    <option disabled selected value="c">Selecciona una categoria</option>
                                    <option>Back-End</option>
                                    <option>Front-End</option>
                                    <option>Bases de Datos</option>
                                    <option>Marketing Digital</option>
                                </select>
                                <br>
                                <br>
                                <h3 style="color: white;"> Selecciona la caratula del curso: </h3> 
                                <input id="simple-input" type="file" accept=".jpg,.png" name="caratula" class="k-textbox" style="width: 100%;" />
                                <br>
                                <br>
                                <center><button class="k-button" type="submit">Guardar curso</button>&nbsp;</center> 
                                <br>
                                <br>
                                <br>
                            </center>
                        </ul>
                        <style>
                            .demo-section  {
                                background-color: rgba(255, 255, 255, 0);

                            }

                            .fieldlist {

                                width: 500px;
                                margin: auto;
                                background: #203853;
                                padding: 10px 20px;
                                box-sizing: border-box;
                                margin-top: 20px;
                                border-radius: 15px;
                                border: none;

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

                            /*propiedad responsive*/
                            @media(max-width:600px){
                                .fieldlist{
                                    width: 80%;

                                }
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
    <script>
        function cerrarSession() {
            $(location).attr('href', "cerrarSession.html");
        }
    </script>
</html>
