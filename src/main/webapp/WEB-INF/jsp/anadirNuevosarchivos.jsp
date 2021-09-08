<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>Mas Archivos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }

            .form{
                width: 25%;
                border: 1px solid #ccc;
                margin: 20px;
                padding: 20px;
            }
            label{
                font-size: 16px;

            }
            input, textarea{
                margin-bottom: 20px;
                width: 50%;
                padding: 5px;


            }
            input[type="file"]{
                width: 50%;
                margin-bottom: 0;
                background: #1668c4;
            }

            input[type="submit"]{
                width: 10%;
                margin-bottom: 0;
                background: #B15D28;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
            .btnCR{
                padding: 7px 25px;
                background-color: #B15D28;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            table{
                background-color: #203853;
                width: 80%;
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
            thead{
                background-color:  #203853;
                border-bottom: solid 5px #B15D28;
                color: white;
            }

            .Editarr{
                background-color: teal;
            }
            #nom, #des, #arch{
                background-color: #272727;
                color: white;
            }
            .NArchivo{
                padding: 5px 10px;
                background-color: white;
                color: black;
                border-radius: 5px;
                border: #B15D28 2px solid;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            .NArchivo:hover{
                background-color: #B15D28;
                border: white 2px solid;
            }

        </style>
    </head>
    <body class="body1">
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

        <h1><center>Añadir nuevos archivos</center></h1>
        <br>
        <br>
    <center>
        <div id="DivAgregar" class="caja">
            <form id="form" action="anadirArchivos.html" method="POST" enctype="multipart/form-data">
                <label for="nom"></label> <input type="text" name="nombre" id="nom" placeholder="Nombre" required>
                <br>
                <label for="arch"></label> <input type="file" id="arch" name="archivo" required accept=".pdf,.txt,.docx,.xlsx,.pptx">
                <br>
                <br>
                <input class="submit" type="submit" onclick="alertAgregar()" value="Agregar">
                <a class="btnCR" href="actualizarmodulos.html?CursoE=${idCurso}">Regresar</a>
            </form>
        </div>
        <div id="DivActualizar" class="caja">
            <form id="formActualizar" action="updateArchivo.html?VistaA=2" method="POST" enctype="multipart/form-data">
                <label for="nom"></label> <input type="text" name="nombre" id="nomAc" placeholder="Nombre" required>
                <br>
                <label for="arc"></label> <input type="file" id="archAc" name="archivo" accept=".pdf,.txt,.docx,.xlsx,.pptx">
                <div id="Divid" style="display:none;">
                    <!--<div id="Divid">-->
                    <label for="moduid"></label> <input type="text" id="moduid" placeholder="Id" name="archid">
                </div>
                <br>
                <br>
                <input class="submit" type="submit" onclick="alertActualizar()" value="Actualizar">
                <input class="btnCR" type="button" onclick="cancelActualizar()" value="Cancelar">
            </form>
        </div>
        <br>
        <div id="Divtablita" class="tablita">
            <table class="tabla" id="tabla">
                <thead>
                    <tr> 
                        <th>Nombre</th> 
                        <th>Archivo</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </center>
    <br/>
    <br/>
    <script>
        var Fila = null;
        let DataForm = {};

        $(function () {
            document.getElementById('DivActualizar').style.display = 'none';

            <c:forEach var="arch" items="${archivos}">
                DataForm["id"] = "${arch.idArchivo}";
                DataForm["nom"] = "${arch.nombre}";
                DataForm["url"] = "${arch.archivo}";
                InsertarDatos(DataForm);
            </c:forEach>
            
            if(DataForm.id != "undefined" && DataForm.id != null)
                document.getElementById('Divtablita').style.display = 'block';
            else
                document.getElementById('Divtablita').style.display = 'none';

            console.log("ID: ", DataForm.id);
            console.log("Nombre: ", DataForm.nom);
        });

        function alertArchivo(url) {
            swal.fire({
                width: '80%',
                heightAuto: false,
                scrollbarPadding: false,
                background: '#00000000',
                showConfirmButton: false,
                html: '<iframe src="https://docs.google.com/viewerng/viewer?url='+url+'&embedded=true" frameborder="0" height="600px" width="100%"></iframe>'
            }); 
        }

        function cancelActualizar() {
            document.getElementById('DivActualizar').style.display = 'none';
            document.getElementById('DivAgregar').style.display = 'block';
        }

        function alertActualizar() {
            document.querySelector('#formActualizar').addEventListener('submit', function (e) {

                var form = this;
                e.preventDefault();

                swal.fire({
                    title: "¿Desea Actualizar el Archivo?",
                    text: "",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, Actualizar",
                    cancelButtonText: "Cancelar"
                })
                        .then(function (isConfirm) {
                            if (isConfirm.value) {
                                swal.fire({
                                    title: "El Archivo se actualizo correctamente",
                                    text: "",
                                    icon: 'success'
                                })
                                        .then(function () {
                                            form.submit();
                                        });
                            } else {
                                swal.fire({
                                    title: "No se actualizo el Archivo",
                                    text: "",
                                    icon: 'error'
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
                    title: "¿Desea Agregar el Archivo?",
                    text: "",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, Agregar",
                    cancelButtonText: "Cancelar"
                })
                        .then(function (isConfirm) {
                            if (isConfirm.value) {
                                swal.fire({
                                    title: "El Archivo se agrego correctamente",
                                    text: "",
                                    icon: "success"
                                })
                                        .then(function () {
                                            form.submit();
                                        });
                            } else {
                                swal.fire({
                                    title: "No se agrego ningun Archivo",
                                    text: "",
                                    icon: "error"
                                });
                            }
                        });
            });
        }

        function Leer() {
            let DataForm = {};
            DataForm["nom"] = document.getElementById("nom").value;
            DataForm["arch"] = document.getElementById("arch").value;
            return DataForm;
        }

        function InsertarDatos(data) {
            let table = document.getElementById("tabla").getElementsByTagName('tbody')[0];
            let Fila = table.insertRow(table.length);
            columna1 = Fila.insertCell(0).innerHTML = data.nom;
            columna2 = Fila.insertCell(1).innerHTML = `<button class="NArchivo" onClick="alertArchivo('` + data.url + `')">📁</button>`;
            columna3 = Fila.insertCell(2).innerHTML = `
                                                            <button type="button" class="btn btn-danger" onClick="Borrarr(this,` + data.id + `)">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash " viewBox="0 0 16 16">
                                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                </svg>
                                                            </button>
                    
                                                            <button type="button" class="btn btn-success" onClick="Editarr(this,` + data.id + `)" >
                                                                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                                                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                                    <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                                                  </svg>
                                                            </button>
                                                            `;
            //document.getElementById("nom").focus();
            //Vaciar();
        }

        function Vaciar() {
            document.getElementById("nom").value = "";
            document.getElementById("arch").value = "";
            Fila = null;
        }

        function Editarr(td, id) {
            document.getElementById('DivActualizar').style.display = 'block';
            document.getElementById('DivAgregar').style.display = 'none';

            Fila = td.parentElement.parentElement;
            document.getElementById("nomAc").value = Fila.cells[0].innerHTML;
            document.getElementById("moduid").value = id;
            document.getElementById("nomAc").focus();
        }

        function Actualizar(DataForm) {
            Fila.cells[0].innerHTML = DataForm.nom;
            Fila.cells[1].innerHTML = DataForm.arch;
            document.getElementById("nom").focus();
        }

        function Borrarr(td, id) {
            swal.fire({
                title: "¿Desea eliminar el Archivo?",
                text: "Al realizar esta operacion no se podra revertir",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar"
            })
                    .then((willDelete) => {
                        if (willDelete.value) {
                            swal.fire({
                                title: "El Archivo se elimino correctamente",
                                text: "",
                                icon: "success"
                            }).then(function () {
                                row = td.parentElement.parentElement;
                                document.getElementById("tabla").deleteRow(row.rowIndex);
                                document.location.href = "deleteArchivo.html?ArchivoE=" + id + "&VistaB=2";
                            });
                        } else {
                            swal.fire({
                                title: "No se elimino ningun Archivo",
                                text: "",
                                icon: "error"
                            });
                        }
                    });
        }

    </script>
    <br/>
    <br/>
    <!--Footer-->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

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