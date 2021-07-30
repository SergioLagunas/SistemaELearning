<%-- 
    Document   : nuevoadmin
    Created on : 23-jul-2021, 16:45:04
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>Nuevos admin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <style>
            /*Estilo header*/
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');

            li,a,button{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: #edf0f1;
                text-decoration: none;

            }

            header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 30px 10%;

            }

            .nav__links{
                list-style: none;
            }

            .nav__links li{
                display: inline-block;
                padding: 0px 20px;
            }

            .nav__links li a{
                transition: all 0.3s ease 0s;
            }

            .nav__links li a:hover{
                color: #0088a9;
            }

            button{
                padding: 9px 25px;
                background-color: rgba(0,136,169,1);
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }
            button:hover{
                background-color: rgba(169, 0, 0, 0.8);
            }
            .body1{
                background: rgb(0,79,82);
                background: linear-gradient(0deg, rgba(0,79,82,1) 55%, rgba(16,166,101,1) 100%);
                margin: 0%;
                padding: 0%;
                font-variant: normal;
                font-size: 18px;
                color: rgb(255, 255, 255);
                font-family: 'Varela Round', sans-serif;
            }

            /*Estilo footer*/

            .footer-wrapper {
                background:#2F4F4F;/*Color de fondo del pie de página*/
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
                text-align: center;
            }
            option1{
                margin-bottom: 20px;
                width: 50%;
                padding: 5px;
            }
            input, textarea{
                margin-bottom: 20px;
                width: 50%;
                padding: 5px;
            }
            select{
                margin-bottom: 20px;
                width: 50%;
                padding: 5px;
                display: flex;
            }

            input[type="file"]{
                width: 50%;
                margin-bottom: 0;
                background: #1668c4;
            }

            input[type="submit"]{
                width: 10%;
                margin-bottom: 0;
                background: #6603c2b6;
                color: #fff;
                border: none;
            }
            table{
                background-color: white;
                width: 80%;
                text-align: center;
                color: black;
                border-collapse: collapse;
            }
            th, td{

                padding: 10px;

            }
            thead{
                background-color:  #246355;
                border-bottom: solid 5px #0f362d;
                color: white;

            }

            .Editarr{
                background-color: teal;
            }


        </style>
    </head>
    <body class="body1">
        <div class="burbujas">
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
        </div>
        <!-- Navigation-->
        <header>
            <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif" width="160px" height="90" >
            <nav>
                <ul class="nav__links">
                    <li><a href="perfiladmin.html">Mi perfil </a></li>
                    <li><a href="nuevoadmin.html">Admin.</a></li>
                    <li><a href="nuevosemillero.html">Semilleros</a></li>
                    <li><a href="listadodecursos.html">Cursos</a></li>
                    <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
        </header>

        <br>
        <br>

        <h1><center>Administradores</center></h1>
        <br>
        <br>

        <form autocomplete="off" method="POST" action="addAdministrador.html">
            <center>
                <div class="tablita">
                    <table class="tabla" id="tabla">
                        <tbody>
                        <div class="caja">
                            <label for="nom"></label> <input type="text" id="nom" placeholder="Nombre" required name="nombre">
                            <br>
                            <label for="apeP"></label> <input type="text" id="apeP" placeholder="Apellido paterno" required name="aPaterno">
                            <br>
                            <label for="apeM"></label> <input type="text" id="apeM" placeholder="Apellido materno" required name="aMaterno">
                            <br>
                            <select  name="genero">
                                <option disabled selected value="g">Genero</option>
                                <option disabled="">Selecciona una opción:</option>
                                <option value="Femenino">Femenino</option>
                                <option value="Masculino">Masculino</option>
                            </select>

                            <label for="email"></label> <input type="text" id="cont" placeholder="Correo" required name="email">
                            <br>
                            <label for="contrasena"></label> <input type="password" id="cont" placeholder="Contraseña" required name="contrasena">
                            <br>
                            <label for="RFC"></label> <input type="text" id="RFC" placeholder="RFC" required name="rfc">
                            <br>
                            <br>
                            <input class="submit" type="submit" value="Guardar">
                        </div>
                        <br/>
                        </tbody>
                        <br/>
                        <thead>
                            <tr > 
                                <th>Nombre</th> 
                                <th>Apellido paterno</th>
                                <th>Apellido materno</th>
                                <th>Correo</th>
                                <th>Contraseña</th>
                                <th>Genero</th>
                                <th>RFC</th>
                                <th>Opciones</th>
                            </tr>
                            <c:forEach items="${administradores}" var="admin">
                                <tr>
                                    <td><c:out value="${admin.nombre}"></c:out></td>
                                    <td><c:out value="${admin.aPaterno}"></c:out></td>
                                    <td><c:out value="${admin.aMaterno}"></c:out></td>
                                    <td><c:out value="${admin.email}"></c:out></td>
                                    <td><c:out value="${admin.genero}"></c:out></td>
                                    <td><c:out value="${admin.rfc}"></c:out></td>
                                 </tr>
                            </c:forEach>
                        </thead>
                    </table>
                </div>
            </center>
            <br/>
            <script>
                var Fila = null
                function onSubmit() {
                    let DataForm = Leer()
                    if (Fila == null) {
                        InsertarDatos(DataForm)
                    } else {
                        Actualizar(DataForm)
                        Vaciar()
                    }
                }
                function InsertarDatos(data) {
                    let table = document.getElementById("tabla").getElementsByTagName('tbody')[0]
                    let Fila = table.insertRow(table.length)
                    columna1 = Fila.insertCell(0).innerHTML = data.nom
                    columna2 = Fila.insertCell(1).innerHTML = data.apeP
                    columna3 = Fila.insertCell(2).innerHTML = data.apeM
                    columna4 = Fila.insertCell(3).innerHTML = data.correo
                    columna5 = Fila.insertCell(4).innerHTML = data.cont
                    columna6 = Fila.insertCell(5).innerHTML = data.gen
                    columna7 = Fila.insertCell(6).innerHTML = data.RFC
                    columna8 = Fila.insertCell(7).innerHTML = `<input class="submit" type="button" onClick="Editarr(this)" value="Editar" >
                                            <input class="submit" type="button" onClick="Borrarr(this)" value="Borrar" >`
                    document.getElementById("nom").focus()
                    Vaciar()
                }
                function Vaciar() {
                    document.getElementById("nom").value = ""
                    document.getElementById("apeP").value = ""
                    document.getElementById("apeM").value = ""
                    document.getElementById("correo").value = ""
                    document.getElementById("cont").value = ""
                    document.getElementById("gen").value = ""
                    document.getElementById("RFC").value = ""
                    Fila = null
                }
                function Editarr(td) {
                    Fila = td.parentElement.parentElement
                    document.getElementById("nom").value = Fila.cells[0].innerHTML
                    document.getElementById("apeP").value = Fila.cells[1].innerHTML
                    document.getElementById("apeM").value = Fila.cells[2].innerHTML
                    document.getElementById("correo").value = Fila.cells[3].innerHTML
                    document.getElementById("cont").value = Fila.cells[4].innerHTML
                    document.getElementById("gen").value = Fila.cells[5].innerHTML
                    document.getElementById("RFC").value = Fila.cells[6].innerHTML
                }
                function Actualizar(DataForm) {
                    Fila.cells[0].innerHTML = DataForm.nom
                    Fila.cells[1].innerHTML = DataForm.apeP
                    Fila.cells[2].innerHTML = DataForm.apeM
                    Fila.cells[3].innerHTML = DataForm.correo
                    Fila.cells[4].innerHTML = DataForm.cont
                    Fila.cells[5].innerHTML = DataForm.gen
                    Fila.cells[6].innerHTML = DataForm.RFC
                    document.getElementById("nom").focus()
                }
                function Borrarr(td) {
                    if (confirm('¿Estás Seguro de borrar este módulo?')) {
                        row = td.parentElement.parentElement
                        document.getElementById("tabla").deleteRow(row.rowIndex)
                        Vaciar()
                    }
                }

            </script>

        </form>
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
