<%-- 
    Document   : ProgressBar
    Created on : 14/06/2021, 06:01:34 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendo.black.min.css" />
        <link rel="stylesheet" href="css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="css/Estilos.css" />
        <link rel="stylesheet" href="css/styleListadoCurso.css" />
        <script src="js/jquery.min.js"></script>
        <script src="js/kendo.all.min.js"></script>
        <script src="../content/shared/js/products.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav style="background:  #84b6f4 ">
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

        <h1>Mis Cursos</h1>

        <h3 style="margin-left: 35px;">Nombre del curso</h3>
        <div class="barraProgreso k-content">
            <div id="profileCompleteness"></div>
        </div>
        <h5 style="margin-left: 20px;"><span id="completed">100%</span> Completado</h5>
        <h6 style="margin-left: 20px; margin-top: 5px;">Calificación</h6>
        <div style="display: flex;">
            <input id="rating" name="rating" style="width: 20%;" />
            <script>
                $(document).ready(function () {
                    $("#rating").kendoRating({
                        min: 0,
                        max: 5,
                        value: 4.5,
                        precision: "half",
                    });
                    $("#rating1").kendoRating({
                        min: 0,
                        max: 5,
                        value: 4,
                        precision: "half",
                    });
                });
            </script>
        </div>
        <br/>
        <h3 style="margin-left: 35px;">Nombre del curso</h3>
        <div class="barraProgreso k-content" >
            <div id="profileCompleteness1" style="width: 100%;"></div>
        </div>
        <h5 style="margin-left: 20px;"><span id="completed">40%</span> Completado</h5>
        <h6 style="margin-left: 20px; margin-top: 5px;">Calificación</h6>
        <div style="display: flex;">
            <input id="rating1" name="rating" style="width: 20%;" />
        </div>
        <script>
            $(document).ready(function () {
                var pb = $("#profileCompleteness").kendoProgressBar({
                    type: "chunk",
                    chunkCount: 100,
                    min: 0,
                    max: 100,
                    value: 100
                }).data("kendoProgressBar");
                var pb = $("#profileCompleteness1").kendoProgressBar({
                    type: "chunk",
                    chunkCount: 100,
                    min: 0,
                    max: 100,
                    value: 40
                }).data("kendoProgressBar");

                pb.value(completeness);
                $("#completed").text((completeness * 20) + "%");
                pb.value(completeness);
                $("#completed").text((completeness * 20) + "%");
            });
        </script>
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
