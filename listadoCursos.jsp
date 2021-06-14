<%-- 
    Document   : listadoCursos
    Created on : 14/06/2021, 05:56:51 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="css/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendo.black.min.css" />
        <link rel="stylesheet" href="css/kendo.default.mobile.min.css" />
        <link href="cssList/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/styleListadoCurso.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">

        <script src="js/jquery.min.js"></script>
        <script src="js/kendo.all.min.js"></script>
        <title>Listado Cursos</title>
    </head>
    <body>

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


        <!--Kendo TOOLBAR-->
        <div id="toolbar"></div>

        <section id="pantallaDiv">

            <div class="derecho">
                <h1>Bienvenido</h1>
                <h2>Curso de.....</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Est ipsum sunt voluptatibus porro voluptate error iste ex
                    ratione placeat eos et repudiandae, itaque repellat dolores,
                    quaerat modi veniam officia deleniti.</p>
            </div>


            <!--Kendo VideoEnlace-->

            <div class="izquierda">
                <p class="video">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/gVu79Sh6Lpg"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                </p>
            </div>

        </section>
        <!--Footer-->
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

        <!--Kendo TOOLBAR-->
        <script>
            $("#toolbar").kendoToolBar({
                items: [
                    {
                        type: "splitButton",
                        text: "Modulo 1",
                        menuButtons: [//define the drop-down options
                            {id: "option1", text: "Leccion 1"},
                            {id: "option2", text: "Leccion 2"},
                            {id: "option3", text: "Leccion 3"},
                            {id: "option4", text: "Leccion 4"}
                        ],
                        click: function (e) {
                            // This click event handler will fire first.
                        }
                    },
                    {
                        type: "splitButton",
                        text: "Modulo 2",
                        menuButtons: [//define the drop-down options
                            {id: "option1", text: "Leccion 1"},
                            {id: "option2", text: "Leccion 2"},
                            {id: "option3", text: "Leccion 3"},
                            {id: "option4", text: "Leccion 4"}
                        ],
                        click: function (e) {
                            // This click event handler will fire first.
                        }
                    },
                    {
                        type: "splitButton",
                        text: "Modulo 3",
                        menuButtons: [//define the drop-down options
                            {id: "option1", text: "Leccion 1"},
                            {id: "option2", text: "Leccion 2"},
                            {id: "option3", text: "Leccion 3"},
                            {id: "option4", text: "Leccion 4"}
                        ],
                        click: function (e) {
                            // This click event handler will fire first.
                        }
                    },
                    {
                        type: "splitButton",
                        text: "Modulo 4",
                        menuButtons: [//define the drop-down options
                            {id: "option1", text: "Leccion 1"},
                            {id: "option2", text: "Leccion 2"},
                            {id: "option3", text: "Leccion 3"},
                            {id: "option4", text: "Leccion 4"}
                        ],
                        click: function (e) {
                            // This click event handler will fire first.
                        }
                    },
                ],
                click: function (e) {
                    // This click event handler will fire second.
                },
                toggle: function (e) {
                    // This toggle event handler will fire second.
                }
            });
        </script>
    </body>
</html>
