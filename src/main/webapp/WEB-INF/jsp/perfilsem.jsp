<%-- 
    Document   : perfilsem
    Created on : 16-jul-2021, 17:38:05
    Author     : Karina Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common-fiori.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.highcontrast.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">.
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bienvenida.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js'/>"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js'/>"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.es-MX.js'/>"></script>
    <script src="${pageContext.request.contextPath}/resources/js/pooper.min.js'/>"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js'/>"></script>
    <script src="${pageContext.request.contextPath}/resources/js/all.min.js'/>"></script>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil</title>
        <style>
            li,a,button{
                font-family: "roboto",sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: #edf0f1;
                text-decoration: none;

            }

            .contenedor{
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
            .footer-wrapper {
                background:#2F4F4F;
                padding-top: 30px;
                padding-bottom: 40px;
                width: 100%;
                text-align: center;
                font: normal normal 11px Arial;
                color:white;
                text-transform: uppercase;/*Esta línea decódigo es para poner las letras en mayúsculas */
                letter-spacing: 2px;}

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
    <div class="contenedor">
      <a href="bienvenida.html"> <img src="${pageContext.request.contextPath}/resources/imagenes/def1.gif"  width="160px" height="90" > </a> 
        <nav>
            <ul class="nav__links">
              <li><a href="perfilsem.html">Mi perfil </a></li>
              <li><a href="ProgressBar.html">Mis cursos</a></li>
            </ul>
        </nav> 
        <a class="cta" href="index.html"><button>Cerrar sesión</button></a>
     </div>
   
    <br>
    <br>
    <br>   
     <section>
      <h2>Mis datos</h2>
      <h3>Semillero</h3>
      <p>Aqui podras modificar tus datos.</p>
      <div align="center">
        <div id="example">
            <div class="row clearfix">
              <div class="col-lg-4">
                                               
                 <div class="form-horizontal form-widgets ">
                  <table width="207" height="400" border="0">
                            <tr>
                              <td width="289"><input name="Input" id="name"  placeholder="Nombre"/></td>
                            </tr>  
                            <tr>
                         <td width="289"><input name="Input2" id="apellidop"  placeholder="A.Paterno"/></td>
                              </tr>   
                              <tr>
                              <td width="289"><input name="Input3" id="apellidom"  placeholder="A.Materno"/></td>
                              </tr>     
                             <tr>
                            <td><input name="Input5" id="RFC" size="20" placeholder="RFC" /></td>
                            </tr>
                          </table>
                        </div>
                      
                                              </center>
            </div></div>
                        <p></p>
                        
                        <p align="center">
                                        <td height="10">                                  
                      <center>
                                          <table>
                                          </table>
                        <td height="5"><p></p></td>
                      </center>
                    </tr>
                  </table>
                 
                  <button class="k-button k-state-default">Cancelar</button>
                  <button class="k-button k-state-default">Guardar Cambios</button>
                  <br>          
                </div>
                <script>
                    // init page controls
        
                    function path(url) {
                        return /(.*\/)[^\/]*$/gi.exec(url)[1];
                    }
        
                    $("#dimensions").kendoDropDownList({
                        dataTextField: "text",
                        dataValueField: "value",
                        value: "common-bootstrap",
                        dataSource: [
                            { text: "Default", value: "common" },
                            { text: "Bootstrap", value: "common-bootstrap" }
                        ],
                        change: function(e) {
                            window.kendoThemeChooser.changeCommon(this.value(), true);
                        }
                    });
        
                    function changeFontSize(e) {
                        var value = $("#font-size").kendoDropDownList("value");
        
                        $("body").css("font-size", value + "px");
                    }
        
                    changeFontSize();
        
                    $("#theme-list, #dimensions-list, #font-size-list").addClass("ra-list");
        
                    $("#configure").on("click", function(e) {
                        $("#configurator-wrap").toggleClass("hidden-xs");
                        e.preventDefault();
                    });
        
                    // init sample widgets
                    var serviceBaseUrl = "https://demos.telerik.com/kendo-ui/service";
        
                    $("#menu").kendoMenu();
        
                    function resizeTabStripContent() {
                        kendo.resize("#tabstrip");
                    }
        
                    $("#tabstrip").kendoTabStrip({
                        animation: {
                            open: { effects: "fadeIn" }
                        }
                    });
        
                
                    $("#panelbar").kendoPanelBar();
        
                    $("#example .form-widgets")
                        .find("select:not([multiple])").kendoDropDownList().end()
                        .find("select[multiple]").kendoMultiSelect().end()
                        .find("input:not([type])").addClass("k-textbox").end()
                        .find("input[type=date]").kendoDatePicker().end()
                        .find("input[type=number]").kendoNumericTextBox({
                            format: "0 years"
                        });
        
                </script>


      <ul>
        <li><a href="#" class="fa fa-facebook"></a></li>
        <li><a href="#" class="fa fa-twitter"></a></li>
        <li><a href="#" class="fa fa-linkedin"></a></li>
        <li><a href="#" class="fa fa-youtube"></a></li>
      </ul>
    </section>

    
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
