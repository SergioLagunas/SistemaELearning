<%-- 
    Document   : anadirarchivos
    Created on : 12-ago-2021, 18:32:14
    Author     : Karina Romero
--%>

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
        <title>Actualizar modulos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
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
                    <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    <!--</ul>-->
                </nav>
                <!--<a class="cta" href="index.html"><button>Cerrar sesión</button></a>-->
            </div>
        </header>
        <br><br>

        <h1><center>Añadir Archivos</center></h1>
        <br>
        <br>

        <form autocomplete="off" id="form" action="addArchivos.html" method="POST" enctype="multipart/form-data">
            <center>
                <div class="tablita">
                    <table class="tabla" id="tabla">
                        <tbody>
                        <div class="caja">
                            <label for="nom"></label> <input type="text" name="nombre" id="nom" placeholder="Nombre" required>
                            <br>
                            <label for="arch"></label> <input type="file" id="arch" required name="archivo" accept=".txt,.pdf">
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
                                <th>Archivos</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </center>
        </form>
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
            function Leer() {
                let DataForm = {}
                DataForm["nom"] = document.getElementById("nom").value
                DataForm["arch"] = document.getElementById("arch").value
                return DataForm
            }
            function InsertarDatos(data) {
                let table = document.getElementById("tabla").getElementsByTagName('tbody')[0]
                let Fila = table.insertRow(table.length)
                columna1 = Fila.insertCell(0).innerHTML = data.nom
                columna2 = Fila.insertCell(1).innerHTML = data.arch
                columna2 = Fila.insertCell(2).innerHTML = `<input class="submit" type="button" onClick="Editarr(this)" value="Editar" >
                                        <input class="submit" type="button" onClick="Borrarr(this)" value="Borrar" >`
                document.getElementById("nom").focus()
                Vaciar()
            }
            function Vaciar() {
                document.getElementById("nom").value = ""
                document.getElementById("arch").value = ""
                Fila = null
            }
            function Editarr(td) {
                Fila = td.parentElement.parentElement
                document.getElementById("nom").value = Fila.cells[0].innerHTML
                document.getElementById("arch").value = Fila.cells[1].innerHTML
            }
            function Actualizar(DataForm) {
                Fila.cells[0].innerHTML = DataForm.nom
                Fila.cells[1].innerHTML = DataForm.arch
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
 <script>
        function cerrarSession() {
            
            $(location).attr('href',"cerrarSession.html")
    
         }
    </script>
</html>