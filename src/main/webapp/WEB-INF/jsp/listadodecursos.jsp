<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/listadodecursos.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="CRUD dinamico con HTMLS, CSS and JS">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <title>Curso</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
        <style>
            /*Estilo header*/

            li,a,button{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;
            }

            body {
                font-family: 'Varela Round', sans-serif;
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
                color: #000;
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
                width: 50%;
                padding: 5px;
                border:1px solid #d3d6e4;
                border-radius: 5px;

                outline: none; 

            }

            ::placeholder{
                font-family: "Font Awesome 5 Free"; 
                font-weight: 900;
            }

            input[type="submit"]{
                width: 10%;
                margin-bottom: 0;
                background: #0065CC;
                color: #fff;
                border-radius: 50px;
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

            #nom, #des, #cat, #cara {
                background-color: #272727;
                color: white;
            }

            /*.Editarr{
                background-color: teal;
            }*/

        </style>
    </head>
    <body>
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
            <a href="admin.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif" width="160" > </a>
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
                                                                Eliminar</button>
                    
                                                                <button type="button" class="btn btn-success" onClick="Editarr(this,`+data.id+`)" >
                                                                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                                                        <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                                        <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                                                      </svg>
                                                                Editar</button>
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