<%-- 
    Document   : administradores
    Created on : 16-jul-2021, 16:39:41
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>nuevo usuario</title>
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
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
            <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfiladmin.html">Mi perfil </a></li>
                    <li><a href="administradores.html">Admin.</a></li>
                    <li><a href="semilleros.html">Semilleros</a></li>
                    <li><a href="Cursos.html">Cursos</a></li>
                    <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                    
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
         </header>

        <div class="container">
        <h1><center><font color="#fff">Administradores</font></h1></center>
        <br>
            <div class="row">
                <div class="col-md-12 col-lg-12" >
                    <table cellspacing="100" class="table table-dark" id="myTable" style="border-radius:20px;"></table>
                </div>
                
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="  crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.dynamicTable-1.0.0.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $("#myTable").dynamicTable({
                    columns: [
                    {
                            text: "Nombre",
                            key: "name"
                        },
                        {
                            text: "A.Paterno",
                            key: "paterno"
                        },
                        {
                            text: "A.Materno",
                            key: "materno"
                        },
                        {
                            text: "Correo",
                            key: "correo"
                        },
                        {
                            text: "Contraseña",
                            key: "contraseña"
                        },
                        {
                            text: "genero",
                            key: "genero"
                        },
                        {
                            text: "Tusuario",
                            key: "tusuario"
                        },
                        {
                            text: "RFC",
                            key: "rfc"
                        },
                        
                       
                    ],
                    data: [{
                            name: 'Aqui aparecerá el nombre',
                          paterno: 'ingresa tu apellido paterno ',
                            materno: 'ingresa tu apellido materno ',
                            correo:'ingresa tu e-mail',
                            contraseña:'ingresa tu contraseña',
                            genero:'indica tu genero',
                            tusuario:'indica ',
                            rfc:'indica el rfc',
                        },
                       
                    ],
                    getControl: function (columnKey) {
                        if (columnKey == "paterno") {
                            return '<input type="text" class="form-control" />';
                        }

                        if (columnKey == "materno") {
                            return '<input type="text" class="form-control" />';
                        }

                        
                        if (columnKey == "correo") {
                            return '<input type="text" class="form-control" />';
                        }
                       
                        if (columnKey == "contraseña") {
                            return '<input type="password" class="form-control" />';
                        }
                        if (columnKey == "genero") {
                            return '<input type="text" class="form-control" />';
                        }
                        if (columnKey == "tusuario") {
                            return '<input type="text" class="form-control" />';
                        }
                        if (columnKey == "rfc") {
                            return '<input type="text" class="form-control" />';
                        }


                        return '<input type="text" class="form-control" />';
                    },
                });

                $('#btnGetData').click(function () {
                    var data = $("#myTable").getTableData();
                    console.log(data);
                });
            });
        </script>
        <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
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
