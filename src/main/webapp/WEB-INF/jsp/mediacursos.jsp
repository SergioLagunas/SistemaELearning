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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link ref="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet"/>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <script type="text/javascript" src="https://www.dropbox.com/static/api/1/dropins.js" id="dropboxjs" data-app-key="tz66wjuay4trlb5"></script>
        <title>Listado Cursos</title>
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
            <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfilsem.html">Mi perfil </a></li>
                    <li><a href="ProgressBar.html">Mis cursos</a></li>
                </ul>
            </nav>
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
        </header>

        <!--Kendo TOOLBAR-->
        <div id="toolbar"></div>


        <section id="pantallaDiv" th:>
            <div class="derecho">
                <h1>Bienvenido</h1>
                <h2>Curso de <c:out value="${detacurso.nombre}"></c:out></h2>
                <p><c:out value="${detacurso.descripcion}"></c:out></p>
                
            </div>
        </section>

        <!--Kendo VideoEnlace-->
        <br />
        <br />

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
                        autoPlay: true,
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
    <!--Footer-->
    <div class="footer-wrapper">
        <div style="padding-top: 15px; padding-bottom: 10px">
            <center>
                <a href="https://twitter.com/?lang=es" target="_blank"
                   ><img
                        hspace="10"
                        src="https://img.icons8.com/android/24/000000/twitter.png"
                        title=""
                        />
                    <a href="https://es-la.facebook.com/" target="_blank"
                       ><img
                            hspace="10"
                            src="https://img.icons8.com/android/24/000000/facebook.png"
                            title=""
                            /></a>
                    <a
                        href="https://www.google.com/intl/es-419/gmail/about/#"
                        target="_blank"
                        ><img
                            hspace="10"
                            src="https://img.icons8.com/ios-filled/24/000000/gmail-login.png"
                            title=""
                            /></a>
                    <a href="https://www.youtube.com/" target="_blank"
                       ><img
                            hspace="10"
                            src=" https://img.icons8.com/metro/26/000000/youtube.png"
                            title=""
                            /></a>
                </a>
            </center>
        </div>
        Todos los derechos reservados | © 2021 B1 SOFT
    </div>
</body>
</html>