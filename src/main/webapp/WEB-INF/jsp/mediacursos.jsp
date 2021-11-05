<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dropbox.core.v2.sharing.ListSharedLinksResult"%>
<%@page import="Elearning.util.JavaDropBox"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mediacursos.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testyarchivos.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link ref="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <script type="text/javascript" src="https://www.dropbox.com/static/api/1/dropins.js" id="dropboxjs" data-app-key="tz66wjuay4trlb5"></script>
        <title>Listado Cursos</title>
        <style>
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }


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

            table{
                text-align:justify-all;
                padding: 30px;
                margin: auto;
                font-family: 'Varela Round', sans-serif;
                font-size: 30px;
            }
            th{
                padding: 10px;
                text-align: left;
            }

            .cards-container{
                cursor: pointer;
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

                    content: '';
                    position: absolute;
                    width: 10px;
                    height: 3px;
                    background-color: #B15D28;
                    top: 0.6em;

                }

                h1::before{
                    left: -20px;

                }

                h1::after{
                    right: -20px;

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


    <center> <h1><c:out value="${detacurso.nombre}"></c:out></h1></center>



        <center><div id="example">
                <div class="demo-section k-content wide" style="max-width: 1300px;">
                    <div id="mediaplayer" style="height: 500px"></div>
                    <div class="k-list-container playlist">
                        <ul id="listView" class="k-list"></ul>
                    </div>
                </div>
                <script type="text/javascript">
                    let DataForm = {};
                    let cues = {};
                    $(document).ready(function () {

                <c:forEach items="${cuestionarios}" var="cuestionario">
                    cues["id"] = "${cuestionario.idCuestionario}";
                </c:forEach>
                
                <c:forEach var="arch" items="${archivos}">
                    DataForm["id"] = "${arch.idArchivo}";
                </c:forEach>

                if (DataForm.id != "undefined" && DataForm.id != null) {
                document.getElementById('mostrararchivos').style.display = 'block';
                } else {
                document.getElementById('mostrararchivos').style.display = 'none';
                }

                if (cues.id != "undefined" && cues.id != null && cues.id != "") {
                document.getElementById('mostrarexamenes').style.display = 'block';
                } else {
                document.getElementById('mostrarexamenes').style.display = 'none';
                }

                $("#mediaplayer").kendoMediaPlayer({
                autoPlay: false,
                });

                var videos = new kendo.data.DataSource({
                data: [
                <c:forEach items="${modulos}" var="modulo">
                    {
                    title: "${modulo.titulo}",
                    poster: "${detacurso.caratula}",
                    source: "${modulo.url}",
                    },
                </c:forEach>
                ],
                });

                var listView = $("#listView").kendoListView({
                dataSource: videos,
                selectable: true,
                scrollable: false,
                template: kendo.template($("#template").html()),
                change: onChange,
                dataBound: onDataBound,
                });

                function onChange() {
                var index = this.select().index();
                var dataItem = this.dataSource.view()[index];
                $("#mediaplayer").data("kendoMediaPlayer").media(dataItem);
                }

                function onDataBound(e) {
                this.select(this.content.children().first());
                }
                });

                function enviarVistaExamenUser(idCuestionario) {
                document.location.href = "CrearMiCuestionario.html?Evaluacion=0&IdUsuario=${UsuarioID}&IdCuestionario=" + idCuestionario;
                }
                </script>

                <script type="text/x-kendo-template" id="template">
                    <li class="k-item k-state-default" onmouseover="$(this).addClass('k-state-hover')"
                    onmouseout="$(this).removeClass('k-state-hover')">
                    <span>
                    <img src="#:poster#" />
                    <h5>#:title#</h5>
                    </span>
                    </li>
                </script>
                <br/>
                <br/>
                <br/>



                <table>
                    <tr>
                        <th width="1400" scope="col">Descripción del curso</th>
                    </tr>
                    <tr>
                        <th width="1332" scope="col"><c:out value="${detacurso.descripcion}"></c:out></th>
                        </tr>

                        <!--Esta es una lista que desplegara los archivos en una lista y cuando le des en el boton de "Obten Documento" 
                        te dirijira al enlce ya sea txt o inclusive los pdf te los descargara automaticamente
                        Nota: esta lista solo sera visible si el curso contiene archivos
                        
                        Suerte Amigosss <3-->

                    </table>
                    <!--Ya esta la parte de listar los archivos el archivo lo abre en otra pestaña-->
                    <div id="mostrararchivos">
                        <h1>Archivos</h1>
                        <div class="cards-container">
                            <!-- Cartas -->
                        <c:if test = "${archivos != null}">
                            <c:forEach items="${archivos}" var="archivo">
                                <div class="k-card">
                                    <a href="${archivo.archivo}" target="_blank"><img class="k-card-image" src="${pageContext.request.contextPath}/resources/imagenes/ARCHIVOS.png" /></a>
                                    <div class="k-card-body">
                                        <center><h4>${archivo.nombre}</h4></center>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <!--En este caso lista los mismos archivos devido a que todavia no hay un diferenciador de los archivos normales a los que son examen-->
                <div id="mostrarexamenes">
                    <h1>Examenes</h1>
                    <div class="cards-container">
                        <!-- Cartas -->
                        <c:if test = "${cuestionarios != null}">
                            <c:forEach items="${cuestionarios}" var="cuestionario">
                                <script> cues["id"] = "${cuestionario.idCuestionario}";</script>
                                <div class="k-card">
                                    <a onClick="enviarVistaExamenUser(${cuestionario.idCuestionario})" target="_blank"><img class="k-card-image" src="${pageContext.request.contextPath}/resources/imagenes/EXAMEN.png" /></a>
                                    <div class="k-card-body">
                                        <center><h4>${cuestionario.nombre}</h4></center>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <style>
                    .k-mediaplayer {
                        float: left;
                        box-sizing: border-box;
                        width: 70%;
                    }

                    .playlist {
                        float: left;
                        height: 500px;
                        overflow: auto;
                        width: 30%;

                    }
                    @media (max-width: 500px) {
                        .playlist,
                        .k-mediaplayer {
                            width: 100%;

                        }
                    }

                    .playlist ul,
                    .playlist li {
                        list-style-type: none;
                        margin: 0;
                        padding: 0;

                    }

                    .playlist .k-item {
                        border-bottom-style: solid;
                        border-bottom-width: 1px;
                        padding: 14px 15px;

                    }

                    .playlist .k-item:last-child {
                        border-bottom-width: 0;

                    }

                    .playlist span {
                        cursor: pointer;
                        display: block;
                        overflow: hidden;
                        text-decoration: none;
                    }

                    .playlist span img {
                        border: 0 none;
                        display: block;
                        height: 56px;
                        object-fit: cover;
                        width: 100px;
                        float: left;
                    }

                    .playlist h5 {
                        display: block;
                        font-weight: normal;
                        margin: 0;
                        overflow: hidden;
                        padding-left: 10px;
                        text-align: left;
                    }
                </style>
            </div></center>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <center><footer>
                <div class="footer-content">
                    <h3>B1 SOFT LATINOAMERICA</h3>

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
            </footer> </center>
    </body>
<script>
    function cerrarSession() {

        $(location).attr('href', "cerrarSession.html")

    }
</script>
</html>