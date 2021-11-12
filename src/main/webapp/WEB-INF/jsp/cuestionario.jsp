<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>Cuestionario</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <style>
            /*Estilo header*/
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
            h4{
                font-size: 15px;
                color: white;
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
                left: -180px;

            }

            h1::after{
                right: -180px;

            }

            form{
                width: 500px;
                margin: auto;
                background: #203853;
                padding: 25px 20px;
                box-sizing: border-box;
                border-radius: 15px;
                border: none;


            }

            label{
                font-size: 16px;
                color:black;
            }

            option1{
                margin-bottom: 20px;
                width: 50%;
                padding: 5px;
            }

            input, textarea{
                width: 90%;
                margin-bottom: 20px;
                padding: 7px;
                text-decoration: none;
                border-radius: 5px;
                box-sizing: border-box;
                font-family: 'Varela Round', sans-serif;
                font-size: 18px;
                border: none;
                background: #181716;
                color: white;
                outline: none;

            }


            input[type="submit"]{

                width: 20%;
                height: 8%;
                font-size: 18px;     
                margin-bottom: 0;
                background: #B15D28;
                color: rgb(36, 33, 33);
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover{
                cursor: pointer;
                background-color: #f8f9fc;
            }

            .btnCR{

                width: 25%;
                height: 8%;
                background-color: #B15D28;
                font-size: 18px;
                color: rgb(36, 33, 33);
                border-radius: 5px;
                border: none;
                cursor: pointer;
                text-decoration: none;
                transition: all 0.3s ease 0s;
            }
            .btnCR:hover{
                cursor: pointer;
                background-color: #f8f9fc;
            }

            table{
                background-color: #203853;
                width: 90%;
                text-align: center;
                color: white;
                border-collapse: collapse;

            }

            th, td{

                padding: 10px;

            }
            tr {
                border: #B15D28 2px solid;
            }
            .opciones{
                width: 200px;
            }

            thead{
                background-color:  #203853;
                border-bottom: solid 5px #B15D28;
                color: white;
            }
            #titulo{
                font-family: 'Varela Round', sans-serif;
                background-color: #EAECE8;
                font-size: 28px;
                color: black;
                font-weight: bold;
            }


            #nom, #des, #cat, #cara {
                background-color: #272727;
                color: white;
            }

            .btncancelar{
                width: 20%;
                margin-bottom: 0;
                background: white;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                margin-left: 8%;
                font-size: 10px;
            }
            .titedit img {
                cursor: pointer;
            }
            #DivSpreguntas img{
                width: 50%;
            }
            #DivScuestionario img{
                width: 50%;
            }
            .btnbtn-danger{
                width: 40px;
                height: 40px;
                background: #DD3545;
                text-align: center;
                viewBox: 0 0 16 16;
                cursor: pointer;
                border:none;
                border-radius: 5px;
                color: white;
            }
            .btnbtn-danger:hover {
                background: #C82333;
            }

            .btnbtn-success{
                width: 40px;
                height: 40px;
                background: #28A845;
                text-align: center;
                viewBox: 0 0 16 16;
                cursor: pointer;
                border:none;
                border-radius: 5px;
                color: white;
            }
            .btnbtn-success:hover {
                background: #218837;
            }
            /*propiedad responsive*/
            @media(max-width:820px){
                form{
                    width: 90%;
                }
                .opciones{
                    width: 100px;
                }
                table {
                    display: block;
                    overflow-x: auto;
                }
                h1::after,h1::before{
                    display:none;
                }
                #titulo{
                    background-color: #EAECE8;
                    font-size: 18px;
                    color: black;
                    font-weight: bold;
                }
                .btncancelar{
                    width: 20%;
                    margin-bottom: 0;
                    background: white;
                    color: black;
                    border-radius: 5px;
                    border: none;
                    cursor: pointer;
                    margin-left: 8%;
                    font-size: 9px;
                }
                #DivSpreguntas img{
                    width: 80%;
                }
                #DivScuestionario img{
                    width: 80%;
                }
            }
        </style>
    </head>
    <body class="body1">
        <%
            String tipoUsuario = (String) session.getAttribute("tUsuario");
            if (tipoUsuario != null) {
                if (tipoUsuario.equals("Semillero")) {
                    response.sendRedirect("bienvenida.html");
                }
            } else {
                response.sendRedirect("index.html");
            }
        %>
        <header>
            <nav class="navbar">
                <div class="logo">
                    <div>
                        <a href="admin.html"><img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif"></a>
                    </div>
                </div>
                <a href="#" class="toggle-button">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="navbar-links">
                    <ul>
                        <li><a href="perfiladmin.html">Mi perfil</a></li>
                        <li><a href="nuevoadmin.html">Administradores</a></li>
                        <li><a href="nuevosemillero.html">Semilleros</a></li>
                        <li><a href="listadodecursos.html">Cursos</a></li>
                        <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
        <div class="titedit">
            <center> 
                <div id="btnCrearCues"><a onclick="CrearCuestionario()"><img src="${pageContext.request.contextPath}/resources/imagenes/add.png"></a></div>
                <div id="btnEBCues">
                    <a onclick="alertEditarCuestionario()"><img src="${pageContext.request.contextPath}/resources/imagenes/editar.png"></a>
                    <a onclick="alertBorrarCuestionario()"><img src="${pageContext.request.contextPath}/resources/imagenes/delete.png"></a>
                </div>
                <br>
                <h1><input type="text" id="titulo" style ="text-align: center;"  placeholder="Título del formulario"></h1>
            </center>
        </div>    
        <div class="DivAgregar" id="DivAgregar">
            <form id="form" action="CrearPreguntas.html" method="POST" enctype="multipart/form-data">
                <center>
                    <h4>Instrucciones: Es importante que en la "opción A" siempre coloque la respuesta correcta.</h4>
                    <br>
                    <label for="preg"></label> <input type="text" id="preg" placeholder="Pregunta" name="InputPregunta" required>
                    <br>
                    <label for="resA"></label> <input type="text" id="resA" placeholder="Opción A" name="InputRespuestaA" required>
                    <br>
                    <label for="resB"></label> <input type="text" id="resB" placeholder="Opción B" name="InputRespuestaB" required>
                    <br>
                    <label for="resC"></label> <input type="text" id="resC" placeholder="Opción C" name="InputRespuestaC" required>
                    <br>     
                    <input type="text" id="idCues" name="IdCuestionario">
                    <input class="submit" type="submit" onclick="alertAgregar()" value="Guardar">

                    <input class="btnCR" type="button" onclick="enviarVistaPreview()" value="Vista previa">
                </center>
            </form>
        </div>
        <div class="DivActualizar" id="DivActualizar">
            <form id="formActualizar" action="ActualizarPreguntas.html" method="POST" enctype="multipart/form-data">
                <center>
                    <h4>Instrucciones: Es importante que en la "opción A" siempre coloque la respuesta correcta.</h4>
                    <br>
                    <label for="preg"></label> <input type="text" id="pregAct" placeholder="Pregunta" name="InputPreguntaAct" required>
                    <br>
                    <label for="resA"></label> <input type="text" id="resAAct" placeholder="Opción A" name="InputRespuestaAAct" required>
                    <br>
                    <label for="resB"></label> <input type="text" id="resBAct" placeholder="Opción B" name="InputRespuestaBAct" required>
                    <br>
                    <label for="resC"></label> <input type="text" id="resCAct" placeholder="Opción C" name="InputRespuestaCAct" required>
                    <br>   
                    <input type="text" id="idPregAct" name="IdPreguntaAct">
                    <input class="submit" type="submit" onclick="alertActualizar()" value="Actualizar">

                    <input class="btnCR" type="button" onclick="cancelActualizar()" value="Cancelar">
                </center>
            </form>
        </div>
        <br>
    <center>
        <div id="Divtablita" class="tablita">
            <table class="tabla" id="tabla">
                <thead>
                    <tr> 
                        <th>Pregunta</th> 
                        <th>Respuesta A</th>
                        <th>Respuesta B</th>
                        <th>Respuesta C</th>
                        <th class="opciones">Opciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <br>
        <div id="DivScuestionario">
            <img src="${pageContext.request.contextPath}/resources/imagenes/divScuestionario.png">
        </div>

        <div id="DivSpreguntas">
            <img src="${pageContext.request.contextPath}/resources/imagenes/divSpreguntas.png">
        </div>
    </center>
    <br>
    <script>
        var Fila = null;
        var nombre = `${cuestionario.nombre}`;
        var id = `${cuestionario.idCuestionario}`;
        let DataForm = {};

        document.getElementById('idCues').value = id;

        document.getElementById('DivActualizar').style.display = 'none';
        document.getElementById('idPregAct').style.display = 'none';
        document.getElementById('idCues').style.display = 'none';
        document.getElementById('DivSpreguntas').style.display = 'none';

        <c:forEach var="preg" items="${preguntas}">
        DataForm["id"] = `${preg.idPregunta}`;
        DataForm["pregu"] = `${preg.pregunta}`;
        DataForm["resA"] = `${preg.respuestaA}`;
        DataForm["resB"] = `${preg.respuestaB}`;
        DataForm["resC"] = `${preg.respuestaC}`;
        InsertarDatos(DataForm);
        </c:forEach>

        //validar si ya hay datos en la tabla cuestionario
        if (id != "undefined" && id != null && id != "") {
            document.getElementById('titulo').value = nombre;
            document.getElementById('btnEBCues').style.display = 'block';
            document.getElementById('btnCrearCues').style.display = 'none';
            document.getElementById('DivAgregar').style.display = 'block';
            document.getElementById('DivScuestionario').style.display = 'none';
            document.getElementById('DivSpreguntas').style.display = 'block';
        } else {
            document.getElementById('btnEBCues').style.display = 'none';
            document.getElementById('btnCrearCues').style.display = 'block';
            document.getElementById('DivAgregar').style.display = 'none';
            document.getElementById('DivScuestionario').style.display = 'block';
        }

        //validar si ya hay datos en la tabla preguntas
        if (DataForm.id != "undefined" && DataForm.id != null) {
            document.getElementById('Divtablita').style.display = 'block';
            document.getElementById('DivSpreguntas').style.display = 'none';
        } else {
            document.getElementById('Divtablita').style.display = 'none';
        }

        function cancelActualizar() {
            $("#DivActualizar").hide("normal");
            $("#DivAgregar").show("normal");
        }

        function alertActualizar() {
            document.querySelector('#formActualizar').addEventListener('submit', function (e) {

                var form = this;
                e.preventDefault();

                var valorPreg = parseInt(document.querySelector('#pregAct').value);
                var valorResA = parseInt(document.querySelector('#resAct').value);
                var valorResB = parseInt(document.querySelector('#resBAct').value);
                var valorResC = parseInt(document.querySelector('#resCAct').value);
                if (!isNaN(valorPreg) || !isNaN(valorResA) || !isNaN(valorResB) || !isNaN(valorResC)) {
                    swal.fire({
                        title: "¡Dato invalido!",
                        text: "El titulo o la descripción que ha intentado añadir, no son validas, inténtelo de nuevo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                } else if (isNaN(valorPreg)) {
                    swal.fire({
                    title: "¿Desea Actualizar la pregunta?",
                    text: "",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, Actualizar",
                    confirmButtonColor: '#203853',
                    cancelButtonColor: '#B15D28',
                    cancelButtonText: "Cancelar"
                    })
                    .then(function (isConfirm) {
                        if (isConfirm.value) {
                            swal.fire({
                                title: "La pregunta se actualizo correctamente",
                                text: "",
                                icon: 'success',
                                iconColor: '#203853',
                                confirmButtonColor: '#B15D28'
                            })
                            .then(function () {
                                form.submit();
                            });
                        } else {
                            swal.fire({
                                title: "No se actualizo ninguna pregunta",
                                text: "",
                                icon: 'error',
                                iconColor: '#B15D28',
                                confirmButtonColor: '#203853'
                            })
                            .then(function () {
                                document.getElementById('DivActualizar').style.display = 'none';
                                document.getElementById('DivAgregar').style.display = 'block';
                            });
                        }
                    });
                }
            });
        }
        function alertAgregar() {
            document.querySelector('#form').addEventListener('submit', function (e) {

                var form = this;
                e.preventDefault();

                var valorPreg = parseInt(document.querySelector('#preg').value);
                var valorResA = parseInt(document.querySelector('#resA').value);
                var valorResB = parseInt(document.querySelector('#resB').value);
                var valorResC = parseInt(document.querySelector('#resC').value);
                if (!isNaN(valorPreg) || !isNaN(valorResA) || !isNaN(valorResB) || !isNaN(valorResC)) {
                    swal.fire({
                        title: "¡Dato invalido!",
                        text: "El titulo o la descripción que ha intentado añadir, no son validas, inténtelo de nuevo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                } else if (isNaN(valorPreg)) {
                    swal.fire({
                    title: "¿Desea Agregar una nueva pregunta?",
                    text: "",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, Agregar",
                    confirmButtonColor: '#203853',
                    cancelButtonColor: '#B15D28',
                    cancelButtonText: "Cancelar"
                    })
                    .then(function (isConfirm) {
                        if (isConfirm.value) {
                            swal.fire({
                                title: "La pregunta se agrego correctamente",
                                text: "",
                                icon: "success",
                                iconColor: '#203853',
                                confirmButtonColor: '#B15D28'
                            })
                            .then(function () {
                                form.submit();
                            });
                        } else {
                            swal.fire({
                                title: "No se agrego ninguna pregunta",
                                text: "",
                                icon: "error",
                                iconColor: '#B15D28',
                                confirmButtonColor: '#203853'
                            });
                        }
                    });
                }
            });
        }
        
        function Leer() {
            let DataForm = {};
            DataForm["preg"] = document.getElementById("preg").value;
            DataForm["resA"] = document.getElementById("resA").value;
            DataForm["resB"] = document.getElementById("resB").value;
            DataForm["resC"] = document.getElementById("resC").value;
            return DataForm;
        }

        function InsertarDatos(data) {
            let table = document.getElementById("tabla").getElementsByTagName('tbody')[0];
            let Fila = table.insertRow(table.length);
            columna1 = Fila.insertCell(0).innerHTML = data.pregu;
            columna2 = Fila.insertCell(1).innerHTML = data.resA;
            columna3 = Fila.insertCell(2).innerHTML = data.resB;
            columna4 = Fila.insertCell(3).innerHTML = data.resC;
            columna5 = Fila.insertCell(4).innerHTML = `
                                                            <button type="button" class="btnbtn-danger" onClick="Borrarr(this,` + data.id + `)">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash " viewBox="0 0 16 16">
                                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                </svg>
                                                            </button>
                    
                                                            <button type="button" class="btnbtn-success" onClick="Editarr(this,` + data.id + `)" >
                                                                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                                                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                                    <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                                                  </svg>
                                                            </button>      
                                                            `;
        }

        function Vaciar() {
            document.getElementById("preg").value = "";
            document.getElementById("resA").value = "";
            document.getElementById("resB").value = "";
            document.getElementById("resC").value = "";
            Fila = null;
        }

        function Editarr(td, idP) {
            $("#DivActualizar").show("normal");
            $("#DivAgregar").hide("normal");

            Fila = td.parentElement.parentElement;
            document.getElementById("idPregAct").value = idP;
            document.getElementById("pregAct").value = Fila.cells[0].innerHTML;
            document.getElementById("resAAct").value = Fila.cells[1].innerHTML;
            document.getElementById("resBAct").value = Fila.cells[2].innerHTML;
            document.getElementById("resCAct").value = Fila.cells[3].innerHTML;
            document.getElementById("pregAct").focus();
        }

        function Actualizar(DataForm) {
            Fila.cells[0].innerHTML = DataForm.preg;
            Fila.cells[1].innerHTML = DataForm.resA;
            Fila.cells[2].innerHTML = DataForm.resB;
            Fila.cells[3].innerHTML = DataForm.resC;
            document.getElementById("preg").focus();
        }

        function Borrarr(td, idP) {
            swal.fire({
                title: "¿Desea eliminar la pregunta?",
                text: "Al realizar esta operacion no se podra revertir",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                confirmButtonColor: '#203853',
                cancelButtonColor: '#B15D28',
                cancelButtonText: "Cancelar"
            })
            .then((willDelete) => {
                if (willDelete.value) {
                    swal.fire({
                        title: "La pregunta se elimino correctamente",
                        text: "",
                        icon: "success",
                        iconColor: '#203853',
                        confirmButtonColor: '#B15D28'
                    }).then(function () {
                        row = td.parentElement.parentElement;
                        document.getElementById("tabla").deleteRow(row.rowIndex);
                        document.location.href = "EliminarPreguntas.html?IdPregunta=" + idP + "&IdCuestionario=" + id;
                    });
                } else {
                    swal.fire({
                        title: "No se elimino ninguna pregunta",
                        text: "",
                        icon: "error",
                        iconColor: '#B15D28',
                        confirmButtonColor: '#203853'
                    });
                }
            });
        }


        function alertEditarCuestionario() {
            var valorTitulo = parseInt(document.querySelector('#titulo').value);
            if (!isNaN(valorTitulo)) {
                swal.fire({
                    title: "¡Dato invalido!",
                    text: "El titulo o la descripción que ha intentado añadir, no son validas, inténtelo de nuevo",
                    icon: 'warning',
                    confirmButtonText: "OK",
                    confirmButtonColor: '#203853'
                });
            } else if (isNaN(valorTitulo)) {
                swal.fire({
                    title: "¿Desea editar el cuestionario?",
                    text: "Al realizar esta operacion no se podra revertir",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, editar",
                    confirmButtonColor: '#203853',
                    cancelButtonColor: '#B15D28',
                    cancelButtonText: "Cancelar"
                })
                .then((willDelete) => {
                    if (willDelete.value) {
                        swal.fire({
                            title: "El nombre del cuestionario se edito correctamente",
                            text: "",
                            icon: "success",
                            iconColor: '#203853',
                            confirmButtonColor: '#B15D28'
                        }).then(function () {
                            document.location.href = "ActualizarCuestionario.html?IdCuestionario=" + id + "&InputNombre=" + document.getElementById('titulo').value;
                        });
                    } else {
                        swal.fire({
                            title: "No se edito ningun cuestionario",
                            text: "",
                            icon: "error",
                            iconColor: '#B15D28',
                            confirmButtonColor: '#203853'
                        });
                    }
                });
            }
        }

        function alertBorrarCuestionario() {
            swal.fire({
                title: "¿Desea eliminar el cuestionario?",
                text: "Al realizar esta operacion se eliminaran todas las evaluaciones ya realizadas y las preguntas",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                confirmButtonColor: '#203853',
                cancelButtonColor: '#B15D28',
                cancelButtonText: "Cancelar"
            })
            .then((willDelete) => {
                if (willDelete.value) {
                    swal.fire({
                        title: "El cuestionario se elimino correctamente",
                        text: "",
                        icon: "success",
                        iconColor: '#203853',
                        confirmButtonColor: '#B15D28'
                    }).then(function () {
                        document.location.href = "EliminarCuestionario.html?IdCuestionario=" + id;
                    });
                } else {
                    swal.fire({
                        title: "No se elimino ningun cuestionario",
                        text: "",
                        icon: "error",
                        iconColor: '#B15D28',
                        confirmButtonColor: '#203853'
                    });
                }
            });
        }

        function CrearCuestionario() {
            var valorTitulo = parseInt(document.querySelector('#titulo').value);
            if (!isNaN(valorTitulo)) {
                swal.fire({
                    title: "¡Dato invalido!",
                    text: "El titulo o la descripción que ha intentado añadir, no son validas, inténtelo de nuevo",
                    icon: 'warning',
                    confirmButtonText: "OK",
                    confirmButtonColor: '#203853'
                });
            } else if (isNaN(valorTitulo)) {
                if (id == "undefined" || id == null || id == "")
                    if (document.getElementById("titulo").value != "" && document.getElementById("titulo").value != null)
                        document.location.href = "CrearCuestionario.html?InputNombre=" + document.getElementById("titulo").value;
                    else {
                        swal.fire({
                            title: "¡Campo vacio!",
                            text: "Ingresa un nombre para el cuestionario.",
                            icon: 'warning',
                            confirmButtonText: "OK",
                            confirmButtonColor: '#203853'
                        });
                    }
                else {
                    swal.fire({
                        title: "¡Ya se ha creado un cuestionario!",
                        text: "Ya existe un cuestionario para este modulo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                }
            }
        }

        function enviarVistaPreview() {
            document.location.href = "previewexamadmin.html?idCuestionario=" + id;
        }
    </script>
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
            <p>2021. <span>B1 SOFT</span></p>
        </div>
    </footer>    
</body>
<script>
    function cerrarSession() {
        $(location).attr('href', "cerrarSession.html");
    }
</script>
</html>