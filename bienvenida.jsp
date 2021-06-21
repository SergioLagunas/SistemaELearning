<%-- 
    Document   : bienvenida
    Created on : 14/06/2021, 05:50:21 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bienvenida</title>
        <link rel="stylesheet" href="css/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendo.black.min.css" />
        <link rel="stylesheet" href="css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="css/bienvenida.css" />
        <link rel="stylesheet" href="css/footerheader.css" />
        <link rel="stylesheet" href="css/styleListadoCurso.css" />
        <script src="js/jquery.min.js"></script>
        <script src="js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav>
                <img src="imagenes\logo_transparent1.png" height="100%" style="margin-left: 5%;" />
                <div class="box">
                    <input type="text" name="search" placeholder="Buscar cursos" class="src" autocomplete="off">
                </div>
                <div id="perfil">
                    <div class="demo-section k-content">
                        <ul id="panelbar-images"></ul>
                    </div>
                    <script>
                        $("#panelbar-images").kendoPanelBar({
                            dataUrlField: "link",
                            dataSource: [
                                {
                                    text: "USUARIO", imageUrl: "../content/shared/icons/sports/baseball.png",
                                    items: [
                                        {text: "Mis cursos", link: "ProgressBar.html"},
                                        {text: "Mi perfil", link: "misdatos.html"},
                                        {text: "Salir", link: "index.html"},
                                    ]
                                },
                            ]
                        });
                    </script>
                </div>
            </nav>
        </header>
        <div id="container">
            <div id="Scroll">
                <div id="Titulo">
                    <h1>Bienvenido a Capacitate</h1>
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
                    $(document).ready(function () {
                        $("#scrollView").kendoScrollView({
                            enablePager: true,
                            contentHeight: "100%"
                        });
                    });
                </script>
            </div>
            <div id="Botones">
                <div id="Subtitulo">
                    <h2>Áreas de Interés</h2>
                </div>
                <p id="Fila1">
                    <a href="Cartas.html"><button id="Button1">Diseño</button></a>
                    <a href="Cartas.html"><button id="Button2">Button</button></a>
                    <a href="Cartas.html"><button id="Button3">Button</button></a>
                    <a href="Cartas.html"><button id="Button4">Button</button></a>
                    <a href="Cartas.html"><button id="Button5">Button</button></a>
                    <a href="Cartas.html"><button id="Button6">Button</button></a>
                </p>
                <p id="Fila2">
                    <button id="Button7">Button</button>
                    <button id="Button8">Button</button>
                    <button id="Button9">Button</button>
                    <button id="Button10">Button</button>
                    <button id="Button11">Button</button>
                    <button id="Button12">Button</button>
                </p>

                <script>
                    $(document).ready(function () {
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

                    <a href='https://www.google.com.mx/' target='_blank'><img HSPACE='10'
                                                                              src='https://img.icons8.com/android/24/000000/facebook.png' title='' />
                        <a href='https://www.google.com.mx/' target='_blank'><img HSPACE='10'
                                                                                  src='https://img.icons8.com/android/24/000000/facebook.png' title='' /></a>
                        <a href='https://www.google.com.mx/' target='_blank'><img HSPACE='10'
                                                                                  src='https://img.icons8.com/android/24/000000/facebook.png' title='' /></a>
                        <a href='https://www.google.com.mx/' target='_blank'><img HSPACE='10'
                                                                                  src=' https://img.icons8.com/metro/26/000000/youtube.png' title='' /></a>
                    </a>
                </center>
            </div> Nombre de tu Blog&#169;2017 Todos los derechos reservados
        </div>
    </body>
</html>