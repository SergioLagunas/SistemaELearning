<%-- 
    Document   : perfilsem
    Created on : 16-jul-2021, 17:38:05
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nuevo Curso</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nuevocurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
       
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <style>
            li,a,button{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: black;
                text-decoration: none;

            }
                 .form-register {
  width: 550px;
  background:  #2C2635;
  padding: 50px;
  margin: auto;
  margin-top: 60px;
  border-radius: 10px;
  font-family: 'calibri';
  color: rgb(42, 35, 49);
  box-shadow: 7px 13px 37px #000;
}


/*estilo de card cuando le damos con el mouse*/
.form-register:hover{
  transform: translatey(-30px);
 
  box-shadow: 0 12px 16px rgba(0, 0, 0, 0.884);
}


 

.controls {
  width: 103%;
  background: #24303c;
  padding: 10px;
  align-items: center;
  border-radius: 5px;
  margin-bottom: 16px;
  border: none;
  font-family: sans-serif;
  font-size: 18px;
  color: white;
  outline: none;
}
.btn-neon1{
  position: relative;
  display: inline-block;
  padding: 15px 18px;
  color: #fff;
  letter-spacing: 4px;
  font-size: 18px;
  text-decoration: none;
  overflow: hidden;
  transition: 0.2s;
  background: #0F97A9;
  align-items: center;
  border-radius: 20px;
  outline: none;
  margin-top: 10px;
}

.btn-neon1:hover{
  background:#0F97A9 ;
  box-shadow: 0 0 10px #0F97A9, 0 0 40px #0F97A9, 0 0 80px #0F97A9;
  transition-delay: 0s;



}

.btn-neon1 span{

  position: absolute;
  display: block;

}



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

            <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfilsem.html">Mi perfil </a></li>
                    <li><a href="ProgressBar.html">Mis cursos</a></li>
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>


        </header>

        <div id="container">
            <div id="Titulo">
                <h3>Mis datos</h3>
            </div>
            
              <section class="form-register">
   <center><img  src="${pageContext.request.contextPath}/resources/imagenes/user.png" width="150px" height="150px"></center>
    <input class="controls" type="text" name="nombres" id="nombres" placeholder=" Nombre">
    <input class="controls" type="text" name="apellidopat" id="apellidopat" placeholder=" Apellido Paterno">
    <input class="controls" type="text" name="apellidomat" id="apellidomat" placeholder="Apellido Materno">
    <input class="controls" type="text" name="rfc" id="rfc" placeholder=" RFC">
    <input class="controls" type="password" name="contraseña" id="contraseña" placeholder="aqui puedes modificar tu contraseña">
   <!-- <p>Estoy de acuerdo con <a href="#">Terminos y Condiciones</a></p>-->
   <br>
    <center><input class="btn-neon1" type="submit" value="Guardar"></center>
  
  </section>
            
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
