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
        <title>Curso</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
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

            input, textarea{
                margin-bottom: 20px;
                width: 40%;
                padding: 5px;
                border:1px solid #d3d6e4;
                border-radius: 5px;

                outline: none; 

            }
            #cat{
                width: 40%;
                padding: 5px;
            }

            ::placeholder{
                font-family: "Font Awesome 5 Free"; 
                font-weight: 900;
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

            #nom, #des, #cat, #cara {
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
                        <img src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif">
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
        <h1><center>Cursos</center></h1>
        <br>
        <br>
        <form id="from1" action="ActualizarCurso.html" method="POST" enctype="multipart/form-data">
            <center>
                <div class="tablita">
                    <table class="tabla" id="tabla">
                        <tbody>
                        <div class="caja" id="formActualizar">
                            <label for="nom"></label> <input type="text" id="nom" placeholder=" Nombre" name="nombre" required>
                            <br>
                            <label for="des"></label> <input type="text" id="des" placeholder=" Descripción" name="descripcion" required>
                            <br>
                            <!--<label for="cat"></label> <input type="text" id="cat" placeholder=" Categoria" name="categoria" required>
                            <br>-->
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
                            <br>
                            <label for="cara"></label> <input id="cara" type="file" name="caratula"/>
                            <div id="Caratula" style="display:none;">
                           <!-- <div id="Caratula">-->
                                <label for="curid"></label> <input type="text" id="curid" placeholder="Id" name="curid">
                            </div>
                            <br>
                            <br>
                            <input class="submit" type="submit" onclick="alertActualizar()" value="Guardar">
                            
                            <!--<input class="submit" type="submit" value="Guardar"/>-->
                        </div>
                        <br/>
                        </tbody>
                        <br/>
                        <thead>
                            <tr> 
                                <th>Nombre</th> 
                                <th>Descripción</th>
                                <th>Categoria</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </center>
            <br/>
            <script>
                
                
                function alertActualizar(){  
                    document.querySelector('#from1').addEventListener('submit', function(e) {
                    
                        var form = this;
                        e.preventDefault(); // <--- prevent form from submitting

                        swal({
                            title: "¿Desea Actualizar el Curso?",
                            text: "",
                            icon: "warning",
                            buttons:{
                                cancel: "Cancelar",
                                dangerMode: "Actualizar",
                            },
                        })
                        .then(function(isConfirm) {
                            if(isConfirm) {
                                swal("El Curso se actualizo correctamente", {
                                    icon: "success",
                                })
                                .then(function() {
                                    //document.getElementById("from1").submit(); // <--- submit form programmatically
                                    Actualizar(Leer());
                                    form.submit();
                                    console.log("BIEN");
                                });
                            } else {
                                swal("No se actualizo ningun Curso", {
                                    icon: "error" 
                                })
                            }
                        })                
                    });
                }
                
                var Fila = null;
                let DataForm = {};
                
                $(function(){
                    document.getElementById('formActualizar').style.display = 'none';
                    
                    <c:forEach var="cur" items="${cursos}">     
                        DataForm["id"] = "${cur.idCurso}";  
                        DataForm["nom"] = "${cur.nombre}";  
                        DataForm["des"] = "${cur.descripcion}";
                        DataForm["cat"] = "${cur.categoria}";
                        InsertarDatos(DataForm); 
                    </c:forEach>
                });
                
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
        
                                                                <button type="button" class="btn btn-warning" onClick="agregarModulo(`+data.id+`)">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                                                    </svg>
                                                                </button>
                                                                `;
                    Vaciar();
                }
                
                function Vaciar() {
                    document.getElementById("nom").value = "";
                    document.getElementById("des").value = "";
                    document.getElementById("cat").value = "";
                    Fila = null;
                }
                
                function Editarr(td, id) {
                    
                    document.getElementById('formActualizar').style.display = 'block';
                    
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
                    //document.getElementById("nom").focus();
                    //Vaciar();
                }
                
                    
                
                function Borrarr(td, id) {
                    //document.getElementById('enlace').setAttribute('href', "index.html");
                    swal({
                    title: "¿Desea eliminar el Curso?",
                    text: "Al realizar esta operacion no se podra revertir",
                    icon: "warning",
                    buttons: {
                       cancel: "Cancelar",
                       dangerMode: "Eliminar",
                    },
                  })
                  .then((willDelete) => {
                    if (willDelete) {
                        row = td.parentElement.parentElement;
                        document.getElementById("tabla").deleteRow(row.rowIndex);
                        document.location.href = "borrarCursos.html?CursoE=" + id;

                      swal("El Curso se elimino correctamente", {
                        icon: "success",
                      });
                    } else {
                      swal("No se elimino ningun Curso", {
                         icon: "error" 
                      });
                    }
                  });
                  
                  /*
                    if (confirm('¿Estás Seguro de borrar este módulo?')) {
                        row = td.parentElement.parentElement;
                        document.getElementById("tabla").deleteRow(row.rowIndex);
                        
                        document.location.href = "borrarCursos.html?CursoE=" + id;
                        //alert(" Valor a Eliminar => " + row.cells[0].innerHTML);
                        
                        Vaciar();
                    }
         
                   */
                }      
                
                function agregarModulo(id){
                    document.location.href = "borrarCursos.html?CursoE=" + id;
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
 <script>
        function cerrarSession() {
            
            $(location).attr('href',"cerrarSession.html")
    
         }
    </script>
</html>