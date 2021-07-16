<%-- 
    Document   : bienvenida
    Created on : 16-jul-2021, 16:11:42
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
    <title>Bienvenida</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
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
                <li><a href="perfilsem.jsp">Mi perfil </a></li>
                <li><a href="ProgressBar.jsp">Mis cursos</a></li>
            </ul>
        </nav> 
        <a class="cta" href="index.jsp"><button>Cerrar sesión</button></a>
     </header>

    <div id="container">
        <div id="Scroll">
            <div id="Titulo">
                <h1><font color="#fff">Bienvenido usuario a Capacitate</font></h1>
                
            </div>
            <div style="margin:auto; max-width:100%">
                <div id="scrollView" style="height: 268px; max-width: 100%;">
                    <div class="page1" data-role="page">
                        <div class="photo photo1">
                        </div>
                        <div class="photo photo2">
                        </div>
                        <div class="photo photo3">
                        </div>
                    </div>
                    <div class="page2" data-role="page">
                        <div class="photo photo4">
                        </div>
                        <div class="photo photo5">
                        </div>
                        <div class="photo photo6">
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function() {
                    $("#scrollView").kendoScrollView({
                        enablePager: true,
                        contentHeight: "100%"
                    });
                });
            </script>
        </div>
        <div id="Botones">
            <div id="Subtitulo">
                <h2><font color="#fff">Áreas de Interés</font></h2>
            </div>
            <p id="Fila1">
              <center>  <a href="Cartas.jsp" class="btn-neon">
                   
                     Marketing
                 </a>
                

                 <a href="Cartas.jsp" class="btn-neon">
                   
                      Bases de datos 
                 </a>
                 <a href="Cartas.jsp" class="btn-neon">
                   
                     Diseño Web html
                 </a>
            </p></center>
            <p id="Fila2">
               <center>
               <a href="Cartas.jsp" class="btn-neon">
                 
                    Javascript
               </a>
                 

               <a href="Cartas.jsp" class="btn-neon">
               
                  Redes
             </a>
             <a href="Cartas.jsp" class="btn-neon">
               
               Introduccion a seguridad informática
           </a>


            </p></center>

            <script>
                $(document).ready(function() {
                    $("#Button1").kendoButton();
                    $("#Button2").kendoButton();
                    $("#Button3").kendoButton();
                    $("#Button4").kendoButton();
                    $("#Button5").kendoButton();
                    $("#Button6").kendoButton();
                    $("#Button7").kendoButton();
                    $("#Button8").kendoButton();
                    $("#Button9").kendoButton();
                    $("#Button10").kendoButton();
                    $("#Button11").kendoButton();
                    $("#Button12").kendoButton();
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
    </div> Todos los derechos reservados | © 2021 B1 SOFT
</div>
</body>
</html>
