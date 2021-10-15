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
             <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                 display: flex;
           justify-content: center;
               flex-wrap: wrap;
                color:#fff;
            }

            /*estilo de card*/
            .container1 .card1{
                background: white;
              width: 350px;
           text-align: center;
                margin: 10px;
              border-radius: 15px;
                background-color: #2C2635;

            }

            /*estilo de card cuando le damos con el mouse*/
            .container1 .card1:hover{
               background-color: #B15D28;
    color: white;
    cursor: pointer;
    transform: scale(1.03);
    transition: all 1s ease;
            }

            /*imagen de la card*/
            .container1 .card1 img{
                 width: 350px;
                height: 170px;
    margin-bottom: 15px;
    background-size: cover;
    border-radius: 15px 15px 0 0;
            }

            /*titulo de card*/
            .container1 .card1 h4{
                font-weight: 500;
                font-size: 24px;
                color: #fff;
                 padding: 10px;
}

            /*responsive*/ 
            @media(max-width:820px){
                h1,h2{
                    font-size: 20px;
                    margin: auto;
                    margin-bottom: 20px;
                    justify-content: center;
                    margin-top: 25px;
                }
                .container1 .card1{
                    background: white;
                    width: 300px;
                    text-align: center;
                    margin: 10px;
                    border-radius: 15px;
                    background-color: #2C2635;

                }
                .container1 .card1 img{
                    width: 300px;
                    height: 150px;
                    margin-bottom: 15px;
                    background-size: cover;
                    border-radius: 15px 15px 0 0;
                }
                .container1 .card1 h4{
                    font-weight: 400;
                    font-size: 20px;
                    color: #fff;
                    padding: 10px;
                }
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

        <div id="container">
            <div id="Scroll">
                <div id="Titulo">
                    <center><h1>Hola <%=request.getSession().getAttribute("usuario")%>, Bienvenid@</h1></center>

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
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-1.png");
                    }
                    .photo2 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-2.png");
                    }

                    .photo3 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-3n.png");
                    }

                    .photo4 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-4.png");
                    }

                    .photo5 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-5.png");
                    }

                    .photo6 {
                        background-image: url("${pageContext.request.contextPath}/resources/imagenes/B-6.png");
                    }

                </style>
            </div>
            <div id="Botones">
                <div id="Subtitulo">
                    <center><h2>Áreas de Interés</h2></center>
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

            $(location).attr('href', "cerrarSession.html")

        }
    </script>
</html>
