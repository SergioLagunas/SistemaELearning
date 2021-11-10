<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            h1{
                text-align: center;
                display: inline-block;
                position: relative;
                font-size: 35px;
                color: black;
                font-weight: bold;
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

            contenerdor{
                width: 80%;
            }
            #progressB{
                margin-left: 22%
            }
            .estiloProgressB{
                width: 65%;
            }
            .footer-content h3{
                font-family: "Open Sans";
            }
            #botones{
                display: inline-block;
            }
            button{
                border-color: #B15D28;
                background: #B15D28;
                color: white;
            }
            /*propiedad responsive*/
            @media(max-width:820px){
                h1::after,h1::before{
                    display: none;

                }
                #progressB{
                    margin-left: 10%
                }
                .estiloProgressB{
                    width: 85%;
                }
                h2{
                    font-size: 16px;
                }
                #botones{
                    padding: 10px;
                    display: inline-block;
                }

            }
        </style>
    </head>
    <body class="body1">
        <%
            String tipoUsuario = (String) session.getAttribute("tUsuario");
            if (tipoUsuario != null) {
                if (tipoUsuario.equals("Administrador")) {
                    response.sendRedirect("admin.html");
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
        <br>
    <center><h1>Mis Cursos</h1></center>
    <div id="progressB">
        <c:forEach var="miCurso" items="${progreso}"> 
            <script>
                var ProgressB${miCurso.idCurso} = ${miCurso.progreso};
            </script>
        </c:forEach>
        <c:forEach var="cursos" items="${miscursos}"> 
            <h2 style="margin-left: 35px;">${cursos.nombre}</h2>
            <div class="estiloProgressB" id="progressbar${cursos.idCurso}"></div>
            <div id="botones">
                <button id="BtnContinuar${cursos.idCurso}">Continuar</button>
                <button id="BtnCertificado${cursos.idCurso}">Certificado</button>
            </div>
            <br>
            <br>
            <script>
                $(document).ready(function () {
                    $("#progressbar${cursos.idCurso}").kendoProgressBar({
                        min: 0,
                        max: 100,
                        type: "percent",
                        orientation: "horizontal",
                        complete: Completado,
                        animation: {
                            duration: 2500
                        }
                    });

                    $(function () {
                        var PB = $("#progressbar${cursos.idCurso}").data("kendoProgressBar");
                        PB.value(ProgressB${cursos.idCurso});
                        $("#BtnCertificado${cursos.idCurso}").hide();
                    });

                    function Completado(e) {
                        $("#BtnCertificado${cursos.idCurso}").show("slow");
                    }

                    $("#BtnCertificado${cursos.idCurso}").click(function () {
                        document.location.href = "certificado.html?nombreCurso=${cursos.nombre}";
                    });

                    $("#BtnContinuar${cursos.idCurso}").click(function () {
                        document.location.href = "mediacursos.html?idCurso=${cursos.idCurso}";
                    });
                });
            </script>
        </c:forEach>
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
