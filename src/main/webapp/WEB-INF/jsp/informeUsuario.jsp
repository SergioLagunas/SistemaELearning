<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>Informe del usuario</title>
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
            #editar{
                display: inline;
            }
            #eliminar{
                display: inline;
            }
            /*propiedad responsive*/
            @media(max-width:820px){
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
                <!--<div class="brand-title">Brand Name</div>-->
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
                        <!--<li><a href="#">Cerrar sesión</a></li>-->
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
        <div class="titedit">
            <center> 
                <h1>Nombre del usuario</h1>
            </center>    
        </div>    
        <br>
        <div id="portafolio">
            <center> 
                <h2>Portafolio de archivos</h2>
                <br>
                <a class="NArchivo" ><img src="${pageContext.request.contextPath}/resources/imagenes/archivo-negro.png"></a>
            </center> 
        </div>
        <br>
        <div id="informe">
            <center> 
                <h2>Cursos que el usuario esta tomando</h2>
            </center> 
            <center>
                <div id="Divtablita" class="tablita">
                    <table class="tabla" id="tabla">
                        <thead>
                            <tr> 
                                <th>Curso</th> 
                                <th>Progreso</th>
                                <th class="opciones">Opciones</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </center>
        </div>
        <script>
            var Fila = null;
            let DataForm = {};

            $(function () {
                <c:forEach var="modu" items="${modulosAc}">
        DataForm["id"] = "${modu.idModulo}";
        DataForm["curso"] = "${modu.titulo}";
        DataForm["progreso"] = "${modu.descripcion}";
        InsertarDatos(DataForm);
        </c:forEach>

                if (DataForm.id != "undefined" && DataForm.id != null)
                    document.getElementById('informe').style.display = 'block';
                else
                    document.getElementById('informe').style.display = 'none';
            });

            function alertActualizar() {
                document.querySelector('#formActualizar').addEventListener('submit', function (e) {

                    var form = this;
                    e.preventDefault();

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
                });
            }
            function alertAgregar() {
                document.querySelector('#form').addEventListener('submit', function (e) {

                    var form = this;
                    e.preventDefault();

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
                });
            }
            function Leer() {
                let DataForm = {};
                DataForm["curso"] = document.getElementById("curso").value;
                DataForm["progreso"] = document.getElementById("progreso").value;
                return DataForm;
            }

            function InsertarDatos(data) {
                let table = document.getElementById("tabla").getElementsByTagName('tbody')[0];
                let Fila = table.insertRow(table.length);
                columna1 = Fila.insertCell(0).innerHTML = data.preg;
                columna2 = Fila.insertCell(1).innerHTML = data.resA;
                columna3 = Fila.insertCell(2).innerHTML = data.resB;
                columna4 = Fila.insertCell(3).innerHTML = data.resC;
                columna5 = Fila.insertCell(4).innerHTML = `
                                                                <button type="button" class="btn btn-danger" onClick="Borrarr(this,` + data.id + `)">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash " viewBox="0 0 16 16">
                                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                    </svg>
                                                                </button>    
                                                                `;
            }

            function Vaciar() {
                document.getElementById("curso").value = "";
                document.getElementById("progreso").value = "";
                Fila = null;
            }

            function Actualizar(DataForm) {
                Fila.cells[0].innerHTML = DataForm.curso;
                Fila.cells[1].innerHTML = DataForm.progreso;
                document.getElementById("preg").focus();
            }

            function Borrarr(td, id) {
                swal.fire({
                    title: "¿Desea eliminar el progreso del usuario?",
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
                                    title: "Se elimino correctamente",
                                    text: "",
                                    icon: "success",
                                    iconColor: '#203853',
                                    confirmButtonColor: '#B15D28'
                                }).then(function () {
                                    row = td.parentElement.parentElement;
                                    document.getElementById("tabla").deleteRow(row.rowIndex);
                                    document.location.href = "borrarModulo.html?ModuloE=" + id + "&VistaB=2";
                                });
                            } else {
                                swal.fire({
                                    title: "No se elimino ningun progreso",
                                    text: "",
                                    icon: "error",
                                    iconColor: '#B15D28',
                                    confirmButtonColor: '#203853'
                                });
                            }
                        });
            }
    </script>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
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
</html>