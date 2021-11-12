<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <title>Cursos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

            form{
                width: 700px;
                margin: auto;
                background: #203853;
                padding: 25px 20px;
                box-sizing: border-box;
                margin-top: 20px;
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

            #cat{
                margin-bottom: 20px;
                border-radius: 5px;
                width: 90%;
                padding: 7px;

                display: auto;
                outline: none;

                font-size: 18px;
                background: #181716;
                color:white;
                border: none;
            }

            ::placeholder{

            }
            input[type="file"]{
                width: 90%;
                height: 45px;
                margin-bottom: 0;

                background: #181716;
                color: white;
            }

            input[type="submit"]{
                padding: 7px 25px;
                width: 40%;
                height: 20%;
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
                padding: 7px 25px;
                width: 40%;
                height: 20%;
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

            #nom, #des, #cat, #cara {
                background-color: #272727;
                color: white;
            }

            #progress_bar{
                margin-left: 8%;
                margin-bottom: 10px;
                padding: 3px;
                border: 1px solid #000;
                font-size: 12px;
                clear: both;
                opacity: 0;
                -moz-transition: opacity 1s linear;
                -o-transition: opacity 1s linear;
                -webkit-transition: opacity 1s linear;
            }
            #progress_bar.loading{
                opacity: 1.0;
            }
            #progress_bar .percent {
                /*background-color: #99ccff;*/
                border: 1px solid #000;
                height: auto;
                width: 0;
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
                font-size: 14px;
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
            #DivSCursos img{
                width: 50%;
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
                #progress_bar{
                    width:60%
                }
                #DivSCursos img{
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
    <center> <h1>Cursos</h1> </center>    
    <div class="caja" id="formActualizar">
        <form id="from1" action="ActualizarCurso.html" method="POST" enctype="multipart/form-data">
            <center>
                <label for="nom"></label> <input type="text" id="nom" placeholder="Nombre" name="nombre" required>
                <br>
                <label for="des"></label> <input type="text" id="des" placeholder="Descripción" name="descripcion" required>

                <label for="cat"></label>
                <select name="categoria" id="cat" class="k-textbox">
                    <option disabled select>Selecciona una categoria</option>
                    <option value="Back-End">Back-End</option>
                    <option value="Front-End">Front-End</option>
                    <option value="Bases de Datos">Bases de Datos</option>
                    <option value="Redes">Redes</option>
                    <option value="Seguridad en redes">Seguridad en redes</option>   
                    <option value="Otro">Otro</option>
                </select>
                <br>
                <label for="cara"></label> <input id="cara" type="file" name="caratula"/>
            </center>
            <br>
            <div id="CargaProgress">
                <div id="progress_bar" style="background-color:white;width:80%;border-radius: 3px;">
                    <div class="percent" style="background-color:#B15D28;height:15px;">0%</div>
                </div>
                <input type="button" class="btncancelar" onclick="abortRead();" value="Cancelar">
            </div>
            <center>
                <div id="Caratula" style="display:none;">
                    <label for="curid"></label> <input type="text" id="curid" placeholder="Id" name="curid">
                </div>
                <br>

                <input class="submit" type="submit" onclick="alertActualizar()" value="Guardar">

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
                        <th>Nombre</th> 
                        <th>Descripción</th>
                        <th>Categoria</th>
                        <th class="opciones">Opciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div> 
        <center>
            <div id="DivSCursos">
                <img src="${pageContext.request.contextPath}/resources/imagenes/divScursos.png">
            </div>
        </center>
        <br/>
    </center>
    <script>
        var Fila = null;
        let DataForm = {};
        //Variables a utilizar en ProgressBar
        var reader;
        var progress = document.querySelector('.percent');
        //Escucha la entrada de archivos del Input File
        document.getElementById('cara').addEventListener('change', handleFileSelect, false);
        $(function () {
            document.getElementById('formActualizar').style.display = 'none';
            document.getElementById('CargaProgress').style.display = 'none';
        <c:forEach var="cur" items="${cursos}">
            DataForm["id"] = `${cur.idCurso}`;
            DataForm["nom"] = `${cur.nombre}`;
            DataForm["des"] = `${cur.descripcion}`;
            DataForm["cat"] = `${cur.categoria}`;
            InsertarDatos(DataForm);
        </c:forEach>

            if (DataForm.id != "undefined" && DataForm.id != null) {
                document.getElementById('Divtablita').style.display = 'block';
                document.getElementById('DivSCursos').style.display = 'none';
            } else {
                document.getElementById('Divtablita').style.display = 'none';
                document.getElementById('DivSCursos').style.display = 'block';
            }
        });
        
        function handleFileSelect(evt) {
            document.getElementById('CargaProgress').style.display = 'block';
            progress.style.width = '0%';
            progress.textContent = '0%';
            reader = new FileReader();
            reader.onerror = errorHandler;
            reader.onprogress = updateProgress;
            reader.onabort = function (e) {
                Swal.fire({
                    title: '¡Cancelado!',
                    text: 'Carga de archivo cancelada',
                    icon: 'warning',
                    iconColor: '#B15D28',
                    confirmButtonColor: '#203853'
                });
                document.getElementById("cara").value = null;
                document.getElementById('CargaProgress').style.display = 'none';
            };
            reader.onloadstart = function (e) {
                document.getElementById('progress_bar').className = 'loading';
            };
            reader.onload = function (e) {
                progress.style.width = '100%';
                progress.textContent = '100%';
                setTimeout("document.getElementById('progress_bar').className='';document.getElementById('CargaProgress').style.display = 'none';", 2000);
            };
            reader.readAsBinaryString(evt.target.files[0]);
        }

        function updateProgress(evt) {
            if (evt.lengthComputable) {
                var percentLoaded = Math.round((evt.loaded / evt.total) * 100);
                if (percentLoaded < 100) {
                    progress.style.width = percentLoaded + '%';
                    progress.textContent = percentLoaded + '%';
                }
            }
        }

        function abortRead() {
            reader.abort();
        }

        function errorHandler(evt) {
            switch (evt.target.error.code) {
                case evt.target.error.NOT_FOUND_ERR:
                    swal.fire({
                        title: "¡Error!",
                        text: "Archivo no encontrado",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                    break;
                case evt.target.error.NOT_READABLE_ERR:
                    swal.fire({
                        title: "¡Error!",
                        text: "No se puede leer el archivo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                    break;
                case evt.target.error.ABORT_ERR:
                    break;
                default:
                    swal.fire({
                        title: "¡Error!",
                        text: "Ha ocurrido un error al leer el archivo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
            }
            ;
        }

        function agregarModulo(id) {
            document.location.href = "actualizarmodulos.html?CursoE=" + id;
        }

        function cancelActualizar() {
            $("#formActualizar").hide("normal");
        }

        function alertActualizar() {
            document.querySelector('#from1').addEventListener('submit', function (e) {

                var form = this;
                e.preventDefault();

                var valorNom = parseInt(document.querySelector('#nom').value);
                var valorDesc = parseInt(document.querySelector('#des').value);
                if (!isNaN(valorNom) || !isNaN(valorDesc)) {
                    swal.fire({
                        title: "¡Dato invalido!",
                        text: "El titulo o la descripción que ha intentado añadir, no son validas, inténtelo de nuevo",
                        icon: 'warning',
                        confirmButtonText: "OK",
                        confirmButtonColor: '#203853'
                    });
                } else if (isNaN(valorNom)) {
                    Swal.fire({
                        title: '¿Quieres Actualizar los datos?',
                        icon: 'warning',
                        iconColor: '#B15D28',
                        showCancelButton: true,
                        confirmButtonText: 'Actualizar',
                        confirmButtonColor: '#203853',
                        cancelButtonColor: '#B15D28',
                        cancelButtonText: 'Cancelar',
                        reverseButtons: true
                    })
                    .then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: '¡Actualizado!',
                                text: 'Se Actualizaron los datos',
                                icon: 'success',
                                iconColor: '#203853',
                                confirmButtonColor: '#B15D28'
                            })
                            .then(function () {
                                Actualizar(Leer());
                                form.submit();
                            });
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            Swal.fire({
                                title: '¡Cancelado!',
                                text: 'No se actualizo ningun dato',
                                icon: 'error',
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
            DataForm["nom"] = document.getElementById("nom").value;
            DataForm["des"] = document.getElementById("des").value;
            DataForm["cat"] = document.getElementById("cat").value;
            return DataForm;
        }

        function InsertarDatos(data) {
            let table = document.getElementById("tabla").getElementsByTagName('tbody')[0];
            let Fila = table.insertRow(table.length);
            columna1 = Fila.insertCell(0).innerHTML = data.nom;
            columna2 = Fila.insertCell(1).innerHTML = data.des;
            columna3 = Fila.insertCell(2).innerHTML = data.cat;
            columna4 = Fila.insertCell(3).innerHTML = `
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
        
                                                        <button type="button" class="btnbtn-warning" onClick="agregarModulo(` + data.id + `)">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                                            </svg>
                                                        </button>
                                                        `;
        }

        function Vaciar() {
            document.getElementById("nom").value = "";
            document.getElementById("des").value = "";
            document.getElementById("cat").value = "";
            Fila = null;
        }

        function Editarr(td, id) {
            $("#formActualizar").show("normal");
            Fila = td.parentElement.parentElement;
            document.getElementById("nom").value = Fila.cells[0].innerHTML;
            document.getElementById("des").value = Fila.cells[1].innerHTML;
            document.getElementById("cat").value = Fila.cells[2].innerHTML;
            document.getElementById("curid").value = id;
            document.getElementById("nom").focus();
        }

        function Actualizar(DataForm) {
            Fila.cells[0].innerHTML = DataForm.nom;
            Fila.cells[1].innerHTML = DataForm.des;
            Fila.cells[2].innerHTML = DataForm.cat;
            document.getElementById('formActualizar').style.display = 'none';
        }

        function Borrarr(td, id) {
            Swal.fire({
                title: '¿Estas seguro de eliminar el Curso?',
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
                    row = td.parentElement.parentElement;
                    document.getElementById("tabla").deleteRow(row.rowIndex);
                    document.location.href = "borrarCursos.html?CursoE=" + id;
                    Swal.fire({
                        title: '¡Eliminado!',
                        text: 'Se elimino el Curso',
                        icon: 'success',
                        iconColor: '#203853',
                        confirmButtonColor: '#B15D28'
                    });
                } else if (
                        result.dismiss === Swal.DismissReason.cancel
                        ) {
                    Swal.fire({
                        title: '¡Cancelado!',
                        text: 'No se elimino ningun Curso',
                        icon: 'error',
                        iconColor: '#B15D28',
                        confirmButtonColor: '#203853'
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
        $(location).attr('href', "cerrarSession.html");
    }
</script>
</html>