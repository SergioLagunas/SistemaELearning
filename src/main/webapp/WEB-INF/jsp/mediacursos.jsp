<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dropbox.core.v2.sharing.ListSharedLinksResult"%>
<%@page import="Elearning.util.JavaDropBox"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mediacursos.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
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

            .botoncurso{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }
            .botoncurso{
                padding: 5px 17px;
                background-color: #B15D28;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .botoncurso:hover{
                background-color: #203853;
                color: white;
            }
            .Archivos{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: white;
                text-decoration: none;
                padding: 7px 20px;
                background-color: #203853;
            }
            /*propiedad responsive*/
            @media(max-width:820px){
                h1{
                    text-align: center;
                    display: inline-block;
                    position: relative;
                    font-size: 25px;
                    color: black;
                    font-weight: bold;
                }

                h1::after,h1::before{

                    content: '';
                    position: absolute;
                    width: 100px;
                    height: 3px;
                    background-color: #B15D28;
                    top: 0.6em;

                }

                h1::before{
                    left: -120px;

                }

                h1::after{
                    right: -120px;

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


    <center> <h1><c:out value="${detacurso.nombre}"></c:out></h1></center>



        <center><div id="example">
                <div class="demo-section k-content wide" style="max-width: 1300px;">
                    <div id="mediaplayer" style="height: 500px"></div>
                    <div class="k-list-container playlist">
                        <ul id="listView" class="k-list"></ul>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
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

                <!--Esta es una lista que desplegara los archivos en una lista y cuando le des en el boton de "Obten Documento" 
                te dirijira al enlce ya sea txt o inclusive los pdf te los descargara automaticamente
                Nota: esta lista solo sera visible si el curso contiene archivos
                
                Suerte Amigosss <3-->

                <!--Favor de Darle estilo a la lista y al boton-->
                <tr>
                    <th width="1332" scope="col"><c:out value="${detacurso.descripcion}"></c:out></th>
                        <c:choose>
                            <c:when test="${archivos != null}">
                            <th width="186" scope="col">
                                <form name="formulario2" target="_blank">
                                    <select name="sitios" class="Archivos">
                                        <option> Caja de Archivos </option>
                                        <c:forEach items="${archivos}" var="archivo">
                                            <option value="${archivo.archivo}">${archivo.nombre}</option>
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <input type="button" class="botoncurso" value="Obten Documento" onclick="window.open(formulario2.sitios.value, this.target, 'resizable=1 ,left=80pt,top=80pt,width=1100px,height=800px'); return false;" target="popup">
                                </form>

                            </th>
                        </c:when>
                    </c:choose>
                </tr>

            </table>
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