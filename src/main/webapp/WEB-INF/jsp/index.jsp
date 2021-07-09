<%-- 
    Document   : index
    Created on : 8/07/2021, 06:07:20 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estilos1.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <title>Index</title>
    </head>
    <body background="">
        <div id= "video">
            <div id= "logo"> 
                <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif" width="70%" height="70%" style="display:block; margin-top: 0%; margin-left: 15%;" />
            </div>
            <div id="multimedia"> 
                <iframe width="560" height="315" src="https://www.youtube.com/embed/lRQjFCd4dJg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>

        </div>

        <!-- formulario para iniciar sesion -->
        <div class="form">
            <!-- contenedor (fondo en blanco del login) -->
            <div class="contenedor"> </div>
            <form id="login" action=""></form>
            <!-- MODAL CREAR CUENTA -->
            <div id="EditDialog"></div>
            <div id="dialogUsuarios"></div>
            <div id="example"></div>
            <!-- boton crear cuenta y olvidaste tu contraseña -->

            <div id="dialog">
            </div>
            <p>
                <a href=""><button id="BotonIS" class="primary">Iniciar sesión</button></a>

            </p>
            <a class="link" >¿Olvidaste tu contraseña?</a>
            <p>
                <button id="BotonFormulario" class="k-secundary">Crear Cuenta</button>
            </p>
        </div>
    </div>
    <!-- MODAL OLVIDASTE LA CONTRASEÑA -->
    <div></div>
    <div id="EditDialog1"></div>
    <div id="dialogUsuarios1"></div>
    <div id="example1"></div>
</div>
<script>
    //formulario index
    $(document).ready(function () {

        $("#login").kendoForm({
            orientation: "vertical",
            items: [
                {
                    field: "correo",
                    label: "Correo:",
                    validation: {required: true}
                },
                {
                    field: "password",
                    label: "Contraseña:",
                    validation: {required: true},
                    editor: function (container, options) {
                        container.append($("<input type='password' class='k-textbox k-valid' id='Password' name='Password' title='Password' required='required' autocomplete='off' aria-labelledby='Password-form-label' data-bind='value:Password' aria-describedby='Password-form-hint' >"));
                    }
                }
            ],
            // "evita que aparezcan los botones de kendo"
            buttonsTemplate: "",
        });
    });
// formulario crear cuenta
    function onOpenformulario() {
        var dialog = $('#EditDialog');
        dialog.empty();
        dialog.append("<form id='exampleform'</form>");
        var form = $('#exampleform')
        form.kendoForm({
            layout: "grid",
            grid: {
                cols: 2,
                gutter: 20
            },
            items: [
                {
                    type: "group",
                    label: "",
                    layout: "grid",
                    grid: {cols: 1, gutter: 10},
                    items: [
                        {
                            field: "Nombre",
                            label: "Nombre:",
                            validation: {required: true}
                        },
                        {
                            field: "aMaterno",
                            label: "Apellido materno:",
                            validation: {required: true}
                        },
                        {
                            field: "Correo",
                            label: "Correo:",
                            validation: {required: true}
                        },
                        {
                            field: "conpassword",
                            label: "Confirmar contraseña:",
                            validation: {required: true},
                            editor: function (container, options) {
                                container.append($("<input type='password' class='k-textbox k-valid' id='Password' name='Password' title='Password' required='required' autocomplete='off' aria-labelledby='Password-form-label' data-bind='value:Password' aria-describedby='Password-form-hint'>"));
                            }
                        },
                    ]
                },
                {
                    type: "group",
                    label: "",
                    layout: "grid",
                    grid: {cols: 2, gutter: 10},
                    items: [
                        {
                            field: "aPaterno",
                            label: "Apellido paterno:",
                            colSpan: 2,
                            validation: {required: true}
                        },
                        {
                            field: "Genero",
                            editor: "DropDownList",
                            label: "Genero",
                            validation: {required: true},
                            colSpan: 2,
                            editorOptions: {
                                optionLabel: "Seleccionar",
                                dataSource: [
                                    {Name: "Femenino", Id: 1},
                                    {Name: "Masculino", Id: 2}
                                ],
                                dataTextField: "Name",
                                dataValueField: "Id"
                            }
                        },
                        {
                            field: "password",
                            label: "Contraseña:",
                            colSpan: 2,
                            validation: {required: true},
                            editor: function (container, options) {
                                container.append($("<input type='password' class='k-textbox k-valid' id='Password1' name='Password' title='Password' required='required' autocomplete='off' aria-labelledby='Password-form-label' data-bind='value:Password' aria-describedby='Password-form-hint'>"));
                            }
                        },
                        {
                            field: "RFC",
                            label: "RFC:",
                            colSpan: 2,
                            validation: {
                                required: true,
                                email: true
                            }
                        }
                    ]
                }
            ],
            buttonsTemplate: "",
        });


        dialog.kendoDialog({
            width: "500px",
            title: "CREAR CUENTA",
            modal: true,
            animation: {
                open: {
                    effects: "fade:in"
                },
                close: {
                    effects: "fade:out"
                }
            },
            actions: [

                {text: 'Ingresar'}]
        });
        dialog.data("kendoDialog").open();
    }

    function onOpenAdministrador() {
        $("#dialogUsuarios").html("<div><form id='form' novalidate></form></div>" +
                "<div id='gridUsuarios'></div>");
        $("#form").kendoForm({
            orientation: "vertical",
            layout: "grid",
            grid: {cols: 1, gutter: 10},
            buttonsTemplate: ""
        });
    }
    $(document).ready(function () {

        $('#BotonFormulario').click(function () {
            onOpenformulario();
        });

        $('#dialogformulario').kendoDialog({
            title: "Grid de ejemplo",
            width: "1300px",
            height: "600px",
            modal: true,
            open: onOpenformulario,
            visible: false,
            closable: true
        });
    });
    // MODAL ¿olvidaste tu contraseña?
    function onOpenformulario1() {
        var dialog = $('#EditDialog1');
        dialog.empty();
        dialog.append("<form id='exampleform1'</form>");
        var form = $('#exampleform1')
        form.kendoForm({
            layout: "grid",
            grid: {
                cols: 1,
                gutter: 20
            },
            buttonsTemplate: "",
            items: [
                {
                    type: "group",
                    label: "Ingresa tu correo electrónico con el cual te registraste: ",
                    layout: "grid",
                    grid: {cols: 1, gutter: 10},

                    items: [
                        {
                            field: "correo",
                            label: "Correo:",
                            validation: {required: true}
                        },
                    ],
                },
            ],
        });

        dialog.kendoDialog({
            width: "450px",
            title: "RECUPERAR CUENTA",
            modal: true,
            animation: {
                open: {
                    effects: "fade:in"
                },
                close: {
                    effects: "fade:out"
                }
            },
            actions: [

                {text: 'Continuar'}]
        });
        dialog.data("kendoDialog").open();
    }

    function onOpenAdministrador() {
        $("#dialogUsuarios1").html("<div><form id='form1' novalidate></form></div>" +
                "<div id='gridUsuarios1'></div>");
        $("#form1").kendoForm({
            orientation: "vertical",
            layout: "grid",
            grid: {cols: 2, gutter: 10},
            buttonsTemplate: ""
        });
    }
    $(document).ready(function () {

        $('.link').click(function () {
            onOpenformulario1();
        });

        $('#dialogformulario1').kendoDialog({
            title: "Grid de ejemplo",
            width: "1300px",
            height: "600px",
            modal: true,
            open: onOpenformulario1,
            visible: false,
            closable: true
        });
    });
</script>

</body>
</html>
