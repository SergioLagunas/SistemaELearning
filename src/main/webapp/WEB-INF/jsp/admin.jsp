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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
        </style>
    </head>
    <body class="body1">
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
                        <li><a href="listadodecursos.html">Cursos</a></li>
                        <!--<li><a href="#">Cerrar sesión</a></li>-->
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
                    <br>
    <center><h1><font color="black">Bienvenido <%=request.getSession().getAttribute("usuario")%></font></h1></center>
    <br>

    <div class="seccion">
        <table>
            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/Adminsemillero.png">
                <br>
                <h4>Administradores</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <br>
                <p><center>Aqui puedes Agregar nuevos administradores a esta plataforma. </center></p>
                <br>
                <br>
                <a href="nuevoadmin.html"><button class="botoncurso">Conoce más</button></a>
            </div>

            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/semillero.png">
                <br>
                <h4>Semilleros</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <br>
                <p><center> Consulta o elimina la lista  </center></p>
                <p><center>de semilleros que hacen uso de esta plataforma. </center></p>
                <br>

                <a href="nuevosemillero.html"><button class="botoncurso">Conoce más</button></a>
            </div>

            <div class="card1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/cursos.png">
                <br>
                <h4>Agregar Curso</h4>
                <br>
                <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
                <br>

                <p><center>Crea y da de alta nuevos cursos </center></p>
                <p><center> donde podrás subir videos y archivos. </center></p>
                <br>
                <br>
                <a href="nuevocurso.html"><button class="botoncurso">Conoce más</button></a>
            </div>

        </table>

    </div>         

    <br>
    <br>
    <br>
    <br>

    <!--Footer-->
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
