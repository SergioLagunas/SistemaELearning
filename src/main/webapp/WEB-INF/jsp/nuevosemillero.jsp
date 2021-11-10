<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <title>Semilleros</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                left: -140px;

            }

            h1::after{
                right: -140px;

            }

            .form{
                width: 25%;
                border: 1px dashed #ccc;
                margin: 20px;
                padding: 20px;

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

            thead{
                background-color:  #203853;
                border-bottom: solid 5px #B15D28;
                color: white;
            }

            .Editarr{
                background-color: teal;
            }

            h1 {
                color: black;
                font-weight: bold;
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
            .btnbtn-warning{
                width: 40px;
                height: 40px;
                background: #FFC107;
                text-align: center;
                viewBox: 0 0 16 16;
                cursor: pointer;
                border:none;
                border-radius: 5px;
            }
            .btnbtn-warning:hover {
                background: #E5AB00;
            }
            #DivSsemilleros img{
                width: 50%;
            }
            /*propiedad responsive*/
            @media(max-width:820px){
                table {
                    display: block;
                    overflow-x: auto;
                }
                h1::after,h1::before{

                    content: '';
                    position: absolute;
                    width: 20px;
                    height: 3px;
                    background-color: #B15D28;
                    top: 0.6em;

                }

                h1::before{
                    left: -30px;

                }

                h1::after{
                    right: -30px;

                }
                #DivSsemilleros img{
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
        <!-- Navigation-->
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

    <center><h1>Semilleros</h1></center>
    <form autocomplete="off" method="POST" action="addAdministrador.html">
        <center>
            <div class="tablita" id="tablita">
                <table class="tabla" id="tabla">
                    <tbody>

                    </tbody>
                    <br/>
                    <thead>
                        <tr> 
                            <th>Nombre</th> 
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Correo</th>
                            <th>Genero</th>
                            <th>RFC</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <c:forEach items="${semilleros}" var="semillero">
                        <tr>
                            <td><c:out value="${semillero.nombre}"></c:out></td>
                            <td><c:out value="${semillero.aPaterno}"></c:out></td>
                            <td><c:out value="${semillero.aMaterno}"></c:out></td>
                            <td><c:out value="${semillero.email}"></c:out></td>
                            <td><c:out value="${semillero.genero}"></c:out></td>
                            <td><c:out value="${semillero.rfc}"></c:out></td>
                                <td>
                                    <a onclick="return confirm(${semillero.idUsuario});">
                                    <button type="button" class="btnbtn-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash " viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>
                                    </button>
                                </a>
                                <button type="button" class="btnbtn-warning">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </center>
        <center>
            <div id="DivSsemilleros">
                <img src="${pageContext.request.contextPath}/resources/imagenes/divSsemilleros.png">
            </div>
        </center>
        <br/>
        <script>
            let Data = {};

            <c:forEach items="${semilleros}" var="semillero">
            Data["id"] = "${semillero.idUsuario}";
            </c:forEach>

            if (Data.id != "undefined" && Data.id != null && Data.id != "") {
                document.getElementById('tablita').style.display = 'block';
                document.getElementById('DivSsemilleros').style.display = 'none';
            } else {
                document.getElementById('tablita').style.display = 'none';
                document.getElementById('DivSsemilleros').style.display = 'block';
            }

            function confirm(id) {

                Swal.fire({
                    title: '¿Estas seguro de eliminar el Semillero?',
                    text: "Si se elimina no se podra revertir",
                    icon: 'warning',
                    iconColor: '#B15D28',
                    showCancelButton: true,
                    confirmButtonText: 'Eliminar',
                    confirmButtonColor: '#203853',
                    cancelButtonColor: '#B15D28',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.location.href = "eliminarSemillero.html?idUsuario=" + id;
                        Swal.fire({
                            title: '¡Eliminado!',
                            text: 'Se elimino el Semillero',
                            icon: 'success',
                            iconColor: '#203853',
                            confirmButtonColor: '#B15D28'
                        })
                    } else if (
                            /* Read more about handling dismissals below*/
                            result.dismiss === Swal.DismissReason.cancel
                            ) {
                        Swal.fire({
                            title: '¡Cancelado!',
                            text: 'No se elimino ningun Semillero',
                            icon: 'error',
                            iconColor: '#B15D28',
                            confirmButtonColor: '#203853'
                        })
                    }
                })
            }

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

        $(location).attr('href', "cerrarSession.html")

    }
</script>
</html>
