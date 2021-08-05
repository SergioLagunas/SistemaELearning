<%-- 
    Document   : admin
    Created on : 16-jul-2021, 16:28:25
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <title>admin</title>
    <style>
       .btn-neon{
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
}

.btn-neon:hover{
    background:#0F97A9 ;
    box-shadow: 0 0 10px #069229, 0 0 40px #0F97A9, 0 0 80px #0F97A9;
    transition-delay: 0s;



}

.btn-neon span{

    position: absolute;
    display: block;

}
        .container{
    min-height: calc(100vh );
    width: 100%;
    max-width: 1300px;
    height: 430px;
    display: flex;
    flex-wrap: wrap; /*ajusta el contenido de las card*/
    justify-content: center;
    margin: auto;
    color:#fff;
}

/*estilo de card*/
.container .card{
    width: 330px;
    height: 490px;
    border-radius: 8px;
    box-shadow: 0 2px 2px rgba(0,0,0, 0.2);
    overflow: hidden;
    margin: 20px;
    text-align: center;
    transition: all 0.25s;
   background-color: #2C2635;

}

/*estilo de card cuando le damos con el mouse*/
.container .card:hover{
    transform: translatey(-15px);
    box-shadow: 0 12px 16px rgba(0, 0, 0, 0.884);
}

/*imagen de la card*/
.container .card img{
    width: 330px;
    height: 210px;
}

/*titulo de card*/
.container .card h4{
    font-weight: 500;
    font-size: 20px;
    color: #fff;
}
/*parrafo de la card*/
.container .card p{
    padding: 0 1rem;
    font-size: 12px;
    font-weight: 200;
   text-align: center;
   color: #fff;
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
        <a href="#"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
            <nav>
                <ul class="nav__links">
                    <li><a href="perfiladmin.html">Mi perfil </a></li>
                   
                   
                    <li><a href="listadodecursos.html">Cursos</a></li>
                   
                </ul>
            </nav> 
        <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
     </header>
        <center><h1><font color="black">Bienvenido <%=request.getSession().getAttribute("usuario")%></font></h1></center>
         <div class="container">
        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/imagenes/admin.jpeg">
            <br>
            <h4>Administradores</h4>
            <br>
            <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
        <p><center> En este apartado podrás dar de alta a futuros administradores o si lo deseas también puedes editar su información o eliminarla.</center></p>
            <br>
            <a href="nuevoadmin.html"><button class="btn-neon">Conoce más</button></a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/imagenes/estudiantes.jpg">
            <br>
            <h4>Semilleros</h4>
            <br>
            <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
        <p><center> En esta parte podrás consultar la información de los integrantes que conforman los semilleros de talento y si lo requiere el administrador eliminar esos datos o actualizarlos.</center></p>
        <br>
        <a href="nuevosemillero.html"><button class="btn-neon">Conoce más</button></a>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/imagenes/curso.jpg">
            <br>
            <h4>Cursos</h4>
            <br>
           <p><center><strong>Bienvenido administrador de B1 SOFT.</strong></center></p>
        <p><center>Aqui podrás iniciar un nuevo curso, indicar su nombre, dar una breve descripción y agregar una imagen de portada, click en guardar y luego en continuar; ahi agregarás modulos a tu curso donde subirás videos imagenes o documentos.</center></p>
            <br> 
            <a href="nuevocurso.html"><button class="btn-neon">Conoce más</button></a>
        </div>
       
       
       
    </div>         
            
        <!--<div id="multimedia"> 
            <iframe width="560" height="315" src="https://www.youtube.com/embed/lRQjFCd4dJg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div> -->

        <br>
        <br>
        <br>
        <br>
    
       <!--Footer-->
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
