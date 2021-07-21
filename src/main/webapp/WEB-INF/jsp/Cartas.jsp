<%-- 
    Document   : Cartas
    Created on : 16-jul-2021, 17:11:08
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Estilos.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
    <script src="../content/shared/js/products.js"></script> 
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
        <a href="bienvenida.jsp"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
        <nav>
            <ul class="nav__links">
                <li><a href="perfilsem.html">Mi perfil </a></li>
                <li><a href="ProgressBar.html">Mis cursos</a></li>
            </ul>
        </nav> 
        <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
     </header>
    <!-- Titulo de la Página -->
    <h1>Diseño</h1>
    <!-- Contenedor de las cartas -->
    <div class="cards-container">
        <div class="k-card">
            <a href="mediacursos.html"><img class="k-card-image" src="https://www.bufa.es/wp-content/themes/bufa/images/category/css.png" /></a>
            <div class="k-card-body">
                <h4>Nombre del curso</h4>
                <h5>Nombre del profesor</h5>
                <input id="rating" name="rating" style="width: 100%;" />
            </div>
        </div>
        <!-- Cartas -->
        <div class="k-card">
            <a href="mediacursos.html"><img class="k-card-image" src="https://kmmx.mx/wp-content/uploads/2020/04/Curso-de-Prototipado-y-UX-UI-Design-con-Adobe-XD.png" /></a>
            <div class="k-card-body">
                <h4>Nombre del curso</h4>
                <h5>Nombre del profesor</h5>
                <input id="rating1" name="rating1" style="width: 100%;" />
            </div>
        </div>

        <div class="k-card">
            <a href="mediacursos.html"><img class="k-card-image" src="https://www.hebergementwebs.com/image/5d/5db92c0f548f0b0d064f5e7e7db9e5e0.png/28-tutoriales-de-photoshop-para-crear-un-logotipo-2019-1.png" /></a>
            <div class="k-card-body">
                <h4>Nombre del curso</h4>
                <h5>Nombre del profesor</h5>
                <input id="rating2" name="rating2" style="width: 100%;" />
            </div>

        </div>

        <div class="k-card">
            <a href="mediacursos.html"><img class="k-card-image" src="https://i.servimg.com/u/f11/18/18/55/83/indesi10.jpg" /></a>
            <div class="k-card-body">
                <h4>Nombre del curso</h4>
                <h5>Nombre del profesor</h5>
                <input id="rating3" name="rating3" style="width: 100%;" />
            </div>

        </div>
        <!-- Script de calificacion de las clases, Se tiene que renombrar el id de cada una o el script colapsa-->
        <script>
            $(document).ready(function () {
                $("#rating").kendoRating({
                    min: 1,
                    max: 5,
                    value: 4.3,
                    precision: "half",
                });
                $("#rating1").kendoRating({
                    min: 1,
                    max: 5,
                    value: 4.5,
                    precision: "half",
                });
                $("#rating2").kendoRating(
                    {
                        min: 1,
                        max: 5,
                        value: 3.3,
                        precision: "half",
                    }
                );
                $("#rating3").kendoRating({
                    min: 1,
                    max: 5,
                    value: 4.3,
                    precision: "half",
                });
            });
        </script>
    </div>

    </div>
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
    </div> Todos los derechos reservados | © 2021 B1 SOFT</div>
</body>
</html>
