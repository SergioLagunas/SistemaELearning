<%-- 
    Document   : bienvenida
    Created on : 16-jul-2021, 16:11:42
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
        <title>Bienvenida</title>
        <style>
            .btn-neon{
    position: relative;
    display: inline-block;
  
    color: #fff;
   
    font-size: 12px;
    text-decoration: none;
    overflow: hidden;
    transition: 0.2s;
    background: #0F97A9;
   
}

.btn-neon:hover{
    background:#0F97A9 ;
    box-shadow: 0 0 10px #0F97A9, 0 0 40px #0F97A9, 0 0 80px #0F97A9;
    transition-delay: 0s;



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
    width: 350px;
    height: 310px;
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
    width: 350px;
    height: 210px;
}

/*vinculo*/
.container .card a{
    font-weight: 500;
    text-decoration: none;
    color: purple;

}



    </style> 
            
            
            
            
            
       
        
        
       
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleListadoCurso.css" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
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
                    <li><a href="perfilsem.html">Mi perfil </a></li>
                    <li><a href="ProgressBar.html">Mis cursos</a></li>
                </ul>
            </nav> 
            <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
        </header>

        <div id="container">
            <div id="Scroll">
                <div id="Titulo">
                    <h1>Hola <%=request.getSession().getAttribute("usuario")%> , Bienvenido</h1>

                </div>
                <div style="margin:auto; max-width:100%">
                    <div id="scrollView" style="height: 268px; max-width: 100%;">
                        <div class="page1" data-role="page">
                            <div class="photo photo1">
                            </div>
                            <div class="photo photo2">
                            </div>
                            <div class="photo photo3">
                            </div>
                        </div>
                        <div class="page2" data-role="page">
                            <div class="photo photo4">
                            </div>
                            <div class="photo photo5">
                            </div>
                            <div class="photo photo6">
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $("#scrollView").kendoScrollView({
                            enablePager: true,
                            contentHeight: "100%"
                        });
                    });
                </script>
            </div>
            <div id="Botones">
                <div id="Subtitulo">
                    <h2><font color="#000">Dale un vistazo a las Áreas de Interés</font></h2>
                </div>
               <div class="container">
        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/imagenes/end.jpg">
            <br>
            <br>
            <a href="Cartas.html?categoria=Back-End"><button class="btn-neon">Back-End</button></a>
        </div>
       
        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/imagenes/front.jpg">
            <br>
            <br>
            <a href="Cartas.html?categoria=Front-End"><button class="btn-neon">Front-end</button></a>
        </div>

        <div class="card">
             <img src="${pageContext.request.contextPath}/resources/imagenes/bd.jpg">
             <br>
             <br>
            <a href="Cartas.html?categoria=Bases de Datos"><button class="btn-neon">Bases de Datos</button></a>
        </div>
       
        <div class="card">
             <img src="${pageContext.request.contextPath}/resources/imagenes/redes.jpg">
             <br>
             <br>
            <a href="Cartas.html?categoria=Redes"><button class="btn-neon">Redes</button></a>
        </div>
                   
                   <div class="card">
                        <img src="${pageContext.request.contextPath}/resources/imagenes/segu.png">
                        <br>
                        <br>
            <a href="Cartas.html?categoria=Seguridad en redes"><button class="btn-neon">Seguridad en redes</button></a>
        </div>  
                   
                  <div class="card">
                       <img src="${pageContext.request.contextPath}/resources/imagenes/mas1.jpg">
                       <br>
                       <br>
            <a href="Cartas.html?categoria=otros"><button class="btn-neon">Otros Cursos</button></a>
        </div>  
                     
                   
                   
                   
                   
                   
       
    </div>
            </div>
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
