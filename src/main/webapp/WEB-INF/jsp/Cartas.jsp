<%-- 
    Document   : Cartas
    Created on : 16-jul-2021, 17:11:08
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.dropbox.core.v2.sharing.ListSharedLinksResult"%>
<%@page import="Elearning.util.JavaDropBox"%>
<%@page import="Elearning.modelo.Curso"%>
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


        <div class="cards-container">
            <c:forEach items="${cursos}" var="curso"> 
                <div class="k-card">
                    <a href="mediacursos.html?idCurso=${curso.idCurso}"><img class="k-card-image"  src="${curso.caratula}"/></a>
                    <div class="k-card-body">
                        <center> <h3><c:out value="${curso.nombre}"></c:out></h3> </center> 
                    </div>
                </div>
            </c:forEach>
        </div>

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
