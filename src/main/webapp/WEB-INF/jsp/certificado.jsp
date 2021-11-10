<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Imprimir Certificado</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <!--link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" /-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jszip.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>


    </head>
    <body style="margin-bottom: 50px;">
        <header>
            <nav class="navbar">
                <!--<div class="brand-title">Brand Name</div>-->
                <div class="logo">
                    <div>
                        <a href="bienvenida.html"><img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif"></a>
                    </div>
                </div>
                <a href="#" class="toggle-button">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="navbar-links">
                    <ul>
                        <li><a href="perfilsem.html">Mi perfil</a></li>
                        <li><a href="ProgressBar.html">Mis Cursos</a></li>
                        <!--<li><a href="#">Cerrar sesión</a></li>-->
                        <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div id="example">
            <br>
            <center>
                <div class="exportPDF">
                    <button class="export-pdf" onclick="getPDF('.pdf-page')">Obtener PDF</button>
                </div>
            </center>

            <div class="page-container hidden-on-narrow">
                <div class="pdf-page size-a4">
                    <div class="inner-page">
                        <div class="pdf-header">
                            <span class="company-logo">
                                <img src="${pageContext.request.contextPath}/resources/imagenes/logoCertificado.png"  alt="logo"/> 
                            </span>
                        </div>
                        <div class="pdf-footer">
                            <div class="brown"></div>
                            <div class="blue"></div>
                        </div>
                        <div class="addresses" >
                            <img src="${pageContext.request.contextPath}/resources/imagenes/B1sOFT.png"  alt="logo"/>
                            <div class="for">
                                <h1>Certificado de Finalización</h1>
                                <h2>B1 Soft Certifica a :<h2>
                                        <h1><c:out value="${datosUsuario.nombre} ${datosUsuario.aPaterno} ${datosUsuario.aMaterno}"/></h1>
                                        <h2>Por haber concluido exitosamente el curso de: </h2>
                                        <h1><c:out value="${nombreCurso}"/></h1>
                                        </div>
                                        </div>
                                        <div class="pdf-body">
                                            <div class="firmas">
                                                <p class="signature">
                                                    Lic. Nahum A. Guzmán <br /> <br/>
                                                </p>
                                                <p class="signature">
                                                    Lic. Elizabeth Vergara <br /> <br/>
                                                </p>
                                                <p class="signature">
                                                    Ing. Ricardo Lozano <br /> <br/>
                                                </p>
                                                <p class="signature">
                                                    Lic. Jorge de B1 Soft <br /> <br/>
                                                </p>
                                                <p class="signature">
                                                    Ing. Oscar de B1 Soft <br /> <br/>
                                                </p>
                                            </div> 
                                        </div>
                                        </div>
                                        </div>
                                        </div>

                                        <div class="responsive-message"></div>

                                        <style>
                                            /*
                                                    Use the DejaVu Sans font for display and embedding in the PDF file.
                                                    The standard PDF fonts have no support for Unicode characters.
                                            */
                                            .pdf-page {
                                                font-family: "DejaVu Sans", "Arial", sans-serif;
                                            }
                                        </style>

                                        <script>
                                            // Import DejaVu Sans font for embedding

                                            // NOTE: Only required if the Kendo UI stylesheets are loaded
                                            // from a different origin, e.g. cdn.kendostatic.com
                                            kendo.pdf.defineFont({
                                                "DejaVu Sans": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans.ttf",
                                                "DejaVu Sans|Bold": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Bold.ttf",
                                                "DejaVu Sans|Bold|Italic": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
                                                "DejaVu Sans|Italic": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
                                                "WebComponentsIcons": "https://kendo.cdn.telerik.com/2017.1.223/styles/fonts/glyphs/WebComponentsIcons.ttf"
                                            });
                                        </script>

                                        <!-- Load Pako ZLIB library to enable PDF compression -->
                                        <script src="${pageContext.request.contextPath}/resources/js/pako.min.js"></script>

                                        <script>
                                            function getPDF(selector) {
                                                kendo.drawing.drawDOM($(selector)).then(function (group) {
                                                    kendo.drawing.pdf.saveAs(group, "Invoice.pdf");
                                                });
                                            }

                                        </script>
                                        <style>
                                            .exportPDF{
                                                display: inline;
                                            }

                                            .pdf-page {
                                                position: relative;
                                                margin: 0 auto;
                                                /*padding: .4in .3in;*/
                                                color: #333;
                                                background-color: #fff;
                                                box-shadow: 0 5px 10px 0 rgba(0,0,0,.3);
                                                box-sizing: border-box;
                                            }

                                            .pdf-header {
                                                padding-bottom: .2in;
                                                margin-bottom: .3in;
                                                border-bottom: 1px solid #e5e5e5;
                                            }

                                            .invoice-number {
                                                padding-top: .1in;
                                                float: right;
                                            }

                                            .pdf-footer {
                                                position: absolute;
                                                bottom: 0;
                                                left: 0;
                                                right: 0;
                                                padding-top: 0.05in;
                                                border-top: 1px solid #e5e5e5;
                                                font-size: 0.9em;
                                                text-align: left;
                                                color: #787878;
                                            }

                                            .addresses {
                                                /*font-size: 12px;*/
                                                margin-top: 10%;
                                            }

                                            .addresses p, h1, h2, h3{
                                                text-align: center;
                                            }
                                            .addresses h1{
                                                font-size: 25px;
                                            }

                                            .from {
                                                float: right;
                                            }

                                            .addresses p {
                                                color: #787878;
                                                padding: .05in 0;
                                                border-top: 1px solid #e5e5e5;
                                            }

                                            .addresses h2:first-of-type {
                                                font-style: italic;
                                            }

                                            .addresses img{
                                                opacity: 15%;
                                                position: absolute;
                                                margin: 7% 20%;
                                                width: 60%;
                                                z-index: 0;

                                            }

                                            .pdf-body {
                                                margin-top: .15in;
                                                width: 90%;
                                                margin: auto;
                                            }

                                            .company-logo {
                                                font-size: 1.8em;
                                                font-weight: bold;
                                                color: #3aabf0;
                                            }
                                            .company-logo img{
                                                width: 17%;
                                                margin-top: 15px;
                                                margin-left: 15px;
                                                position: absolute;
                                            }
                                            .signature {
                                                padding: 10px;
                                                padding-top: .8in;
                                                text-align: center;
                                            }

                                            /* Dimensions other than px and em should be divided by 1.33 for the proper PDF output */
                                            .size-a4 {
                                                height: 6.2in;
                                                width: 8.7in;
                                                margin-top: 15px;
                                            }

                                            .size-letter {
                                                width: 6.3in;
                                                height: 8.2in;
                                            }

                                            .size-executive {
                                                width: 5.4in;
                                                height: 7.8in;
                                                font-size: 12px;
                                            }

                                            .size-executive .pdf-header {
                                                margin-bottom: .1in;
                                            }
                                            .firmas{
                                                width: 100%;
                                                display: flex;
                                            }
                                            .brown{
                                                width: 100%;
                                                height: 15px;
                                                background-color: #B15D28;
                                                display: flex;
                                            }
                                            .blue{
                                                width: 100%;
                                                height: 75px;
                                                background-color: #203853;
                                                display: flex;
                                            }
                                            .export-pdf{
                                                border-color: #B15D28;
                                                background: #B15D28;
                                                color: white;
                                            }
                                            /*propiedad responsive*/
                                            @media(max-width:820px){
                                                .page-container hidden-on-narrow{
                                                    height: 80%;
                                                }

                                            }
                                        </style>

                                        </div>
                                        </body>
                                        <script>
                                            function cerrarSession() {

                                                $(location).attr('href', "cerrarSession.html")

                                            }
                                        </script>
                                        </html>