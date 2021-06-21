<%-- 
    Document   : nuevocurso
    Created on : 14/06/2021, 06:00:28 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Curso</title>
        <link rel="stylesheet" href="css/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendo.black.min.css" />
        <link rel="stylesheet" href="css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="css/nuevocurso.css" />
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
                                        {text: "Mis cursos", link: "cursos.html"},
                                        {text: "Mi perfil", link: "misdatosadm.html"},
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
            <div id="Titulo">
                <h1>Nuevo Curso</h1>
            </div>

            <h1>Añade un nuevo Curso</h1>
            <div id="example">
                <div class="demo-section k-content">
                    <ul class="fieldlist">
                        <li>
                            <input id="simple-input" type="text" placeholder="Nombre" class="k-textbox" style="width: 100%;" />
                        </li>

                        <li>
                            <label for="simple-textarea">Descripcion</label>
                            <textarea id="simple-textarea" class="k-textbox" style="width: 100%;" ></textarea>
                        </li>
                        <li>
                            <input id="simple-input" type="text" placeholder="Categoria" class="k-textbox" style="width: 100%;" />
                        </li>

                        <li>
                            <input id="simple-input" type="text" placeholder="URL Caratula del curso" class="k-textbox" style="width: 100%;" />
                        </li>

                        <li>
                            <button class="k-button">Guardar</button>&nbsp;
                            <a href="tituloyDes.html"> <button class="k-button k-primary">Continuar</button> </a> 
                        </li>
                        <br>
                        <br>
                        <br>

                    </ul>
                    <style>
                        .demo-section  {
                            background-color: #fff;
                        }
                        .fieldlist {
                            margin: 0 0 -2em;
                            padding: 0;
                        }

                        .fieldlist li {
                            list-style: none;
                            padding-bottom: 2em;
                        }

                        .fieldlist label {
                            display: block;
                            padding-bottom: 1em;
                            font-weight: bold;
                            text-transform: uppercase;
                            font-size: 12px;
                            color:black;
                        }

                    </style>
                </div>
            </div>
        </div>

        <script>
            $("#example textarea").kendoEditor({
                tools: [
                    "formatting",
                    "bold", "italic", "underline",
                    "strikethrough", "subscript", "superscript",
                    "justifyLeft", "justifyCenter", "justifyRight", "justifyFull",
                    "insertUnorderedList", "insertOrderedList", "indent", "outdent"
                ]
            });
        </script>
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
    </body>
</html>