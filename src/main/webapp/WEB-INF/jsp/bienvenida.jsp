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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            /*Estilo body*/
            .body1 {
                background:  #EAECE8;
            }

            h1,h2{
                font-size: 40px;
                margin: auto;
                margin-bottom: 40px;
                margin-left: 60px;
                margin-top: 50px;
            }

            .container1{
                min-height: calc(100vh );
                width: 100%;
                max-width: 1300px;
                height: 430px;
                display: flex;
                flex-wrap: wrap; /*ajusta el contenido de las card*/
                justify-content: center;
                margin: auto;
                color:#fff;
            }

            /*estilo de card*/
            .container1 .card1{
                width: 350px;
                height: 310px;
                border-radius: 8px;
                box-shadow: 0 2px 2px rgba(0,0,0, 0.2);
                overflow: hidden;
                margin: 20px;
                text-align: center;
                transition: all 0.25s;
                background-color: #2C2635;

            }

            /*estilo de card cuando le damos con el mouse*/
            .container1 .card1:hover{
                transform: translatey(-15px);
                box-shadow: 0 12px 16px rgba(0, 0, 0, 0.884);
            }

            /*imagen de la card*/
            .container1 .card1 img{
                width: 350px;
                height: 210px;
            }

            /*titulo de card*/
            .container1 .card1 h4{
                font-weight: 500;
                font-size: 24px;
                color: #fff;
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

        <div id="container">
            <div id="Scroll">
                <div id="Titulo">
                    <center><h1>Hola <%=request.getSession().getAttribute("usuario")%>, Bienvenido</h1></center>

                </div>
                <div style="margin:auto; max-width:90%">
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
                    $(document).ready(function () {
                        $("#scrollView").kendoScrollView({
                            enablePager: true,
                            contentHeight: "100%"
                        });
                    });
                </script>
                <style>
                    .photo1 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-1.png");
                    }
                    .photo2 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-2.png");
                    }

                    .photo3 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-3.png");
                    }

                    .photo4 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-4.png");
                    }

                    .photo5 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-5.png");
                    }

                    .photo6 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/s-6.png");
                    }

                </style>
            </div>
            <div id="Botones">
                <div id="Subtitulo">
                    <center><h2><font color="#000">Dale un vistazo a las Áreas de Interés</font></h2></center>
                </div>
                <div class="container1">
                    <div class="card1">
                        <a href="Cartas.html?categoria=Back-End"> <img src="${pageContext.request.contextPath}/resources/imagenes/Back.jpg"></a>
                        <br>
                        <br>
                        <h4>Back-End</h4>
                    </div>

                    <div class="card1">
                        <a href="Cartas.html?categoria=Front-End"><img src="${pageContext.request.contextPath}/resources/imagenes/front_1.jpg"></a>
                        <br>
                        <br>
                        <h4>Front-end</h4>
                    </div>

                    <div class="card1">
                        <a href="Cartas.html?categoria=Bases de Datos"><img src="${pageContext.request.contextPath}/resources/imagenes/DB.jpg"></a>
                        <br>
                        <br>
                        <h4>Bases de Datos</h4>
                    </div>

                    <div class="card1">
                        <a href="Cartas.html?categoria=Redes"> <img src="${pageContext.request.contextPath}/resources/imagenes/redes_1.jpg"></a>
                        <br>
                        <br>
                        <h4>Redes</h4>
                    </div>

                    <div class="card1">
                        <a href="Cartas.html?categoria=Seguridad en redes"><img src="${pageContext.request.contextPath}/resources/imagenes/seguridadred.jpg"></a>
                        <br>
                        <br>
                        <h4>Seguridad en redes</h4>
                    </div>  

                    <div class="card1">
                        <a href="Cartas.html?categoria=otro"><img src="${pageContext.request.contextPath}/resources/imagenes/otro.jpg"></a>
                        <br>
                        <br>
                        <h4>Otros Cursos</h4>
                    </div>  







                </div>
            </div>
        </div>
        <!--Footer-->
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
