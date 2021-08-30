<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>modulos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            /*Estilo header*/
            .body1 {
                font-family: 'Varela Round', sans-serif;
                justify-content: center;
                background:  #EAECE8;
            }

            /*Estilo footer*/

            .footer-wrapper {
                background:#203853;/*Color de fondo del pie de página*/
                padding-top: 30px;/*Altura del pie de página*/
                padding-bottom: 40px;/*Altura del pie de página*/
                width: 100%;
                text-align: center;
                font: normal normal 11px Arial;/*Tipografía y Tamaño*/
                color:white;/*Color del texto del pie de página*/
                text-transform: uppercase;/*Esta línea decódigo es para poner las letras en mayúsculas */
                letter-spacing: 2px;/*Espacio entre letras*/
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
            ::placeholder{
                font-family: "Font Awesome 5 Free"; 
                font-weight: 900;
            }
            input[type="file"]{
                width: 50%;
                margin-bottom: 0;
                background: #1668c4;
            }

            input[type="submit"]{
                padding: 7px 25px;
                width: 10%;
                margin-bottom: 0;
                background: #B15D28;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
            .btnCS{
                padding: 9px 25px;
                background-color: #B15D28;
                color: black;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease 0s;
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

            #nomAc, #desAc, #archAc {
                background-color: #272727;
                color: white;
            }
        </style>
    </head>
    <body class="body1">
        <!-- Navigation-->
        <header>
            <div class="encabezado">
                <div class="logo">
                    <div>
                        <a href="admin.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif"> </a>
                    </div>
                </div>

                <nav>
                    <!--<ul class="nav__links">-->
                    <li><span><a href="perfiladmin.html">Mi perfil </a></span></li>
                    <li><span><a href="nuevoadmin.html">Administradores </a></span></li>
                    <li><span><a href="nuevosemillero.html">Semilleros </a></span></li>
                    <li><span><a href="listadodecursos.html">Cursos </a></span></li>
                    <li><span><a href="nuevocurso.html">Agregar nuevo curso </a></span></li>
                    <li><span><a href="index.html" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

        <h1><center>Crear Modulos</center></h1>
        <br>
        <br>
        <center>
            <div id="DivAgregar" class="caja">
                <form id="form" action="addModulo.html" method="POST" enctype="multipart/form-data">
                    <label for="nom"></label> <input type="text" name="titulo" id="nom" placeholder=" Nombre"  required>
                    <br>
                    <label for="des"></label> <input type="text" name="descripcion" id="des" placeholder=" Descripción" required>
                    <br>
                    <label for="arch"></label> <input type="file" id="arch" name="url" accept=".mp4,.avi,.wmv" required>
                    <br>
                    <br>
                    <input class="submit" type="submit" onclick="alertAgregar()" value="Agregar">
                    <a class="btnCS" href="anadirarchivos.html">Sube Archivos a tu Curso</a>
                </form>
            </div>
            <div id="DivActualizar" class="caja">
                <form id="formActualizar" action="ActualizarModulo.html?VistaA=1" method="POST" enctype="multipart/form-data">
                    <label for="nom"></label> <input type="text" name="titulo" id="nomAc" placeholder=" Nombre"  required>
                    <br> 
                    <label for="des"></label> <input type="text" name="descripcion" id="desAc" placeholder=" Descripción"  required>
                    <br>
                    <label for="arc"></label> <input type="file" id="archAc" name="url" accept=".mp4,.avi,.wmv">
                    <div id="Divid" style="display:none;">
                    <!--<div id="Divid">-->
                        <label for="moduid"></label> <input type="text" id="moduid" placeholder="Id" name="moduid">
                    </div>
                    <br>
                    <br>
                    <input class="submit" type="submit" onclick="alertActualizar()" value="Actualizar">
                    <a class="btnCR" href="anadirmodulos.html">Cancelar</a>
                </form>
            </div>
            <br>
            <div class="tablita">
                <table class="tabla" id="tabla">
                    <thead>
                        <tr> 
                            <th>Nombre</th> 
                            <th>Descripción</th>
                            <th>Archivos</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </center>
        <br/>
        <script>
            var Fila = null;          
            let DataForm = {};
                
            $(function(){
                document.getElementById('DivActualizar').style.display = 'none';
                
                <c:forEach var="modu" items="${modulos}">     
                    DataForm["id"] = "${modu.idModulo}";  
                    DataForm["nom"] = "${modu.titulo}";  
                    DataForm["des"] = "${modu.descripcion}";
                    DataForm["url"] = "${modu.url}";
                    InsertarDatos(DataForm); 
                </c:forEach>
                    
                    console.log("ID: ", DataForm.id);
                    console.log("Nombre: ", DataForm.nom);
            });
            
            function alertVideo(url){
                //https://dl.dropboxusercontent.com/s/8c69iw8s5bppw07/org.springframework.web.multipart.commons.CommonsMultipartFile%4019663056_Video.mp4?dl=0
                //console.log("URL: ",url);
                swal.fire({
                    width: '80%',
                    background: '#00000000',
                    showConfirmButton: false,
                    html: '<video controls src="'+url+'" width="100%" height="98%"></video>'
                });
            }
            
            function alertActualizar(){  
                document.querySelector('#formActualizar').addEventListener('submit', function(e) {
                    
                    var form = this;
                    e.preventDefault();

                    swal.fire({
                        title: "¿Desea Actualizar el Modulo?",
                        text: "",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: "Sí, Actualizar",
                        cancelButtonText: "Cancelar"
                    })
                    .then(function(isConfirm) {
                        if(isConfirm.value) {
                            swal.fire({
                                title: "El Modulo se actualizo correctamente",
                                text: "",
                                icon: 'success'
                            })
                            .then(function() {
                                form.submit();
                            });
                        } else {
                            swal.fire({
                                title: "No se actualizo ningun Modulo",
                                text: "",
                                icon: 'error'
                            })
                            .then(function() {
                                document.getElementById('DivActualizar').style.display = 'none';
                                document.getElementById('DivAgregar').style.display = 'block';
                            });
                        }
                    });
                });
            }
            
            function alertAgregar(){  
                document.querySelector('#form').addEventListener('submit', function(e) {
                    
                    var form = this;
                    e.preventDefault();

                    swal.fire({
                        title: "¿Desea Agregar el Modulo?",
                        text: "",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: "Sí, Agregar",
                        cancelButtonText: "Cancelar"
                    })
                    .then(function(isConfirm) {
                        if(isConfirm.value) {
                            swal.fire({
                                title: "El Modulo se agrego correctamente",
                                text: "",
                                icon: "success"
                            })
                            .then(function() {
                                form.submit();
                            });
                        } else {
                            swal.fire({
                                title: "No se agrego ningun Modulo",
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
                DataForm["des"] = document.getElementById("des").value;
                DataForm["arch"] = document.getElementById("arch").value;
                return DataForm;
            }
            
            function InsertarDatos(data) {
                let table = document.getElementById("tabla").getElementsByTagName('tbody')[0];
                let Fila = table.insertRow(table.length);
                columna1 = Fila.insertCell(0).innerHTML = data.nom;
                columna2 = Fila.insertCell(1).innerHTML = data.des;
                columna3 = Fila.insertCell(2).innerHTML = `<button onClick="alertVideo('`+data.url+`')"><video src="`+data.url+`" width="240" height="140"></video></button>`;
                columna3 = Fila.insertCell(3).innerHTML = `
                                                                <button type="button" class="btn btn-danger" onClick="Borrarr(this,`+data.id+`)">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash " viewBox="0 0 16 16">
                                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                    </svg>
                                                                </button>
                    
                                                                <button type="button" class="btn btn-success" onClick="Editarr(this,`+data.id+`)" >
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
                document.getElementById("des").value = "";
                document.getElementById("arch").value = "";
                Fila = null;
            }
            
            function Editarr(td, id) {
                document.getElementById('DivActualizar').style.display = 'block';
                document.getElementById('DivAgregar').style.display = 'none';
                
                Fila = td.parentElement.parentElement;
                document.getElementById("nomAc").value = Fila.cells[0].innerHTML;
                document.getElementById("desAc").value = Fila.cells[1].innerHTML;
                document.getElementById("moduid").value = id;
                document.getElementById("nomAc").focus();
            }
            
            function Actualizar(DataForm) {
                Fila.cells[0].innerHTML = DataForm.nom;
                Fila.cells[1].innerHTML = DataForm.des;
                Fila.cells[2].innerHTML = DataForm.arch;
                document.getElementById("nom").focus();
            }
            
            function Borrarr(td, id) {
                swal.fire({
                    title: "¿Desea eliminar el Modulo?",
                    text: "Al realizar esta operacion no se podra revertir",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar"
                })
                .then((willDelete) => {
                    if (willDelete.value) {
                        swal.fire({
                            title: "El Modulo se elimino correctamente",
                            text: "",
                            icon: "success"
                        }).then(function() {
                            row = td.parentElement.parentElement;
                            document.getElementById("tabla").deleteRow(row.rowIndex);
                            document.location.href = "borrarModulo.html?ModuloE=" + id + "&VistaB=1";
                        });
                    } else {
                        swal.fire({
                            title: "No se elimino ningun Modulo",
                            text: "",
                            icon: "error" 
                        });
                    }
                });
            }

        </script>


        <br/>
        <br/>
    </div>

    <!--Footer-->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <div class='footer-wrapper'>
        <div style='padding-top:15px;padding-bottom:10px; '>
            <center>

                <a href='https://twitter.com/?lang=es' target='_blank'><img HSPACE='10'
                                                                            src='https://img.icons8.com/android/24/000000/twitter.png' title='' />
                    <a href='https://es-la.facebook.com/' target='_blank'><img HSPACE='10'
                                                                               src='https://img.icons8.com/android/24/000000/facebook.png' title='' /></a>
                    <a href='https://www.google.com/intl/es-419/gmail/about/#' target='_blank'><img HSPACE='10'
                                                                                                    src='https://img.icons8.com/ios-filled/24/000000/gmail-login.png' title='' /></a>
                    <a href='https://www.youtube.com/' target='_blank'><img HSPACE='10'
                                                                            src=' https://img.icons8.com/metro/26/000000/youtube.png' title='' /></a>
                </a>

            </center>
        </div> Todos los derechos reservados | © 2021 B1 SOFT
    </div>
</body>
</html>