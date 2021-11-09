<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/card.css" />
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
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }
            .botoncurso{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }
            /*imagen de la card*/
            .container .card2 img{
                width: 310px;
                height: 210px;
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
            /*propiedad responsive*/
            @media(max-width:820px){
                h1{
                    justify-content: center;
                    display: inline-block;
                    position: relative;
                    font-size: 25px;
                    color: black;
                    font-weight: bold;
                }
                h1::after,h1::before{
                    display: none;
                }
                .card2{
                    background-color: #2C2635;
                    color: white;
                    width: 260px;

                    box-shadow: 0 2px 2px rgba(0,0,0, 0.2);
                    text-align: center;
                    margin: 10px;
                    border-radius: 15px;
                }

                /*imagen de la card*/
                .container .card2 img{
                    width: 260px;
                    height: 160px;
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
    <center><h1><font color="black">Bienvenid@ <%=request.getSession().getAttribute("usuario")%></font></h1></center>
    <br>

    <section class="container">
        <div class="card2">
            <div class="card2-image img1">
                <img src="${pageContext.request.contextPath}/resources/imagenes/Adminsemillero.png">
            </div>
            <h4>ADMINISTRADORES</h4>
            <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>

            <p><center>Aqui puedes Agregar nuevos administradores a esta plataforma. </center></p>
            <br>
            <a href="nuevoadmin.html"><button class="botoncurso">Conoce más</button></a>
            <br>
            <br>
        </div>
        <div class="card2">
            <div class="card2-image img2">
                <img src="${pageContext.request.contextPath}/resources/imagenes/semillero.png">
            </div>
            <h4>SEMILLEROS</h4>
            <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
            <p><center> Consulta o elimina la lista de semilleros que tienen acceso. </center></p>
            <br>
            <a href="nuevosemillero.html"><button class="botoncurso">Conoce más</button></a>
            <br>
            <br>
        </div>
        <div class="card2">
            <div class="card2-image img3">
                <img src="${pageContext.request.contextPath}/resources/imagenes/cursos.png">
            </div>
            <h4>AGREGAR CURSO</h4>
            <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
            <p><center>Crea y da de alta nuevos cursos donde podrás subir videos y archivos. </center></p>
            <br>
            <a href="nuevocurso.html"><button class="botoncurso">Conoce más</button></a>
            <br>
            <br>
        </div>
    </section>

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
