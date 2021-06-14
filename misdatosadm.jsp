<%-- 
    Document   : misdatosadm
    Created on : 14/06/2021, 05:59:25 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis datos</title>
        <link rel="stylesheet" href="css/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendo.black.min.css" />
        <link rel="stylesheet" href="css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/styleListadoCurso.css" />
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/angular.js"></script>
        <script src="js/kendo.all.min.js"></script>
        <script src="js/kendo.timezones.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">


        <script src="theme-chooser.js"></script>

        <link rel="stylesheet" href="css/styles.css" />
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


        <div id="example" class="container">



            <section class="well">
                <h2 class="ra-well-title">Mis datos</h2>

                <div class="form-horizontal form-widgets col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="name">Nombre</label>
                        <div class="col-sm-8 col-md-6">
                            <input id="name" value="Johnatan Dodsworth" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4" for="birthday">Fecha de nacimiento</label>
                        <div class="col-sm-8 col-md-6">
                            <input type="date" value="10/09/1979" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4" for="gender">Genero</label>
                        <div class="col-sm-8 col-md-6">
                            <select id="gender">
                                <option selected>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </div>
                    </div>

                </div>

                <div class="form-horizontal form-widgets col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="occupation">RFC</label>
                        <div class="col-sm-8 col-md-6">
                            <input id="occupation" placeholder="e.g. RO***********" />
                        </div>
                    </div>

                </div>

                <div class="form-horizontal form-widgets col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="occupation">Correo</label>
                        <div class="col-sm-8 col-md-6">
                            <input id="email" placeholder="e.g. *****@****.com" />
                        </div>
                    </div>

                </div>

                <div class="clearfix"></div>


                <div class="buttons-wrap">
                    <button class="k-button k-state-default">CANCELAR</button>
                    <button class="k-button k-state-default">GUARDAR</button>
                </div>
            </section>

        </div>

        <script>
            // init page controls

            function path(url) {
                return /(.*\/)[^\/]*$/gi.exec(url)[1];
            }

            $("#dimensions").kendoDropDownList({
                dataTextField: "text",
                dataValueField: "value",
                value: "common-bootstrap",
                dataSource: [
                    {text: "Default", value: "common"},
                    {text: "Bootstrap", value: "common-bootstrap"}
                ],
                change: function (e) {
                    window.kendoThemeChooser.changeCommon(this.value(), true);
                }
            });

            function changeFontSize(e) {
                var value = $("#font-size").kendoDropDownList("value");

                $("body").css("font-size", value + "px");
            }

            changeFontSize();

            $("#theme-list, #dimensions-list, #font-size-list").addClass("ra-list");

            $("#configure").on("click", function (e) {
                $("#configurator-wrap").toggleClass("hidden-xs");
                e.preventDefault();
            });

            // init sample widgets
            var serviceBaseUrl = "https://demos.telerik.com/kendo-ui/service";

            $("#menu").kendoMenu();

            function resizeTabStripContent() {
                kendo.resize("#tabstrip");
            }

            $("#tabstrip").kendoTabStrip({
                animation: {
                    open: {effects: "fadeIn"}
                }
            });


            $("#panelbar").kendoPanelBar();

            $("#example .form-widgets")
                    .find("select:not([multiple])").kendoDropDownList().end()
                    .find("select[multiple]").kendoMultiSelect().end()
                    .find("input:not([type])").addClass("k-textbox").end()
                    .find("input[type=date]").kendoDatePicker().end()
                    .find("input[type=number]").kendoNumericTextBox({
                format: "0 years"
            });

        </script>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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
