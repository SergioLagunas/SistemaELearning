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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ProgressBar.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <script src="../content/shared/js/products.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            h1 {
                text-align:center;
                text-transform:uppercase;
                letter-spacing:-2px;
                font-size:2.5em;
                margin:20px 0;
                color: black;
            }
            h2,h3,h4,h5, h6{
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
            }
        </style>
    </head>
    <body class="body1">
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
        <h1>Mis Cursos</h1>
        <c:forEach var="cursos" items="${miscursos}">  
            <div>      
                <div class="bar">
                    <h3 style="margin-left: 35px;">${cursos.nombre}</h3>
                    <div class="barraProgreso k-content">
                        <div id="profileCompleteness${cursos.idCurso}"></div>
                    </div>
                    <center><a href="mediacursos.html?idCurso=${cursos.idCurso}"><button>Continuar Curso</button></a></center>
                    <br/>
                </div>   
            </c:forEach>
            <c:forEach var="progress" items="${progreso}">   
                <h5 style="margin-left: 20px;"><span id="completed">${progress.progreso} %</span> Completado</h5>
                <div style="display: flex;"></div>
            </c:forEach>
            <script>
                $(document).ready(function () {
                <c:forEach var="cursos" items="${miscursos}">
                    var pb = $("#profileCompleteness${cursos.idCurso}").kendoProgressBar({
                        type: "chunk",
                        chunkCount: 100,
                        min: 0,
                        max: 100,
                        value: ${cursos.progreso}
                    }).data("kendoProgressBar");
                </c:forEach>
                <c:forEach var="cursos" items="${miscursos}">
                    pb.value(completeness);
                    $("#completed").text((completeness * 20) + "%");
                </c:forEach>
                });
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
