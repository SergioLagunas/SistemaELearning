<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quizz</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/examen.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        .body1 {
            font-family: "Varela Round", sans-serif;
            justify-content: center;
            background: #eaece8;
        }
        h1 {
            text-align: center;
            display: inline-block;
            position: relative;
            font-size: 35px;
            color: black;
            font-weight: bold;
        }
        h1::after,h1::before {
            content: "";
            position: absolute;
            width: 120px;
            height: 3px;
            background-color: #b15d28;
            top: 0.6em;
        }

        h1::before {
            left: -140px;
        }

        h1::after {
            right: -140px;
        }
        .btnresultado {
            width: 35%;
            height: 8%;
            background-color: #b15d28;
            font-size: 25px;
            color: black;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease 0s;
        }

        .btnresultado:hover {
            background-color: #203853;
            color: white;
        }
        #DivSpreguntas img{
            width: 50%;
        }
        /*propiedad responsive*/
        @media(max-width:820px){
            h1::after,h1::before{
                display:none;
            }
            .formulario{
                width: 80%;
                margin: auto;
                padding: 20px;
                border-radius: 10px;
                border:5px outset gray;
            }
            .btnresultado {
                width: 20%;
                height: 8%;
                background-color: #b15d28;
                font-size: 10px;
            }
            #DivSpreguntas img{
                width: 80%;
            }
        }
    </style>
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
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
    <center>
        <h1>${cuestionario.nombre}</h1>
    </center>
    <br>
    <div id="formu">
        <div class="formulario">
            <div id="test"></div>
            <br>
            <center> <button class="btnresultado" onclick="RegresarCuestionario()">Regresar</button> </center>
            <script src="${pageContext.request.contextPath}/resources/js/examenpreview.js"></script>
        </div>
    </div>
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
    <script>
        var Quizz = [];
        <c:forEach var="preg" items="${preguntas}">
            Quizz.push({
                pregunta: "${preg.pregunta}",
                respuestas: {
                    a: "${preg.respuestaA}",
                    b: "${preg.respuestaB}",
                    c: "${preg.respuestaC}"
                },
                respuestaCorrecta: "a"
            });
        </c:forEach>
    
        pasarVariables(Quizz);
        mostrarTest();

        function RegresarCuestionario() {
            document.location.href = "cuestionario.html?Modulo=" + ${IdModulo};
        }
    </script>
</body>
<script>
    function cerrarSession() {
        document.location.href = "cerrarSession.html";;
    }
</script>
</html>

