<%-- 
    Document   : previewexamadmin
    Created on : 19-oct-2021, 15:16:18
    Author     : Karina Romero
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quizz</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/examen.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        .body1 {
            font-family: "Varela Round", sans-serif;
            justify-content: center;
            background: #eaece8;
        }
        h1 {
            text-align: center;
            display: inline-block;
            position: relative;
            font-size: 35px;
            color: black;
            font-weight: bold;
        }
        h1::after,h1::before {
            content: "";
            position: absolute;
            width: 120px;
            height: 3px;
            background-color: #b15d28;
            top: 0.6em;
        }

        h1::before {
            left: -140px;
        }

        h1::after {
            right: -140px;
        }
        /*propiedad responsive*/
        @media(max-width:820px){
            h1::after,h1::before{
                display:none;
            }
            .formulario{
                width: 80%;
                margin: auto;
                padding: 20px;
                border-radius: 10px;
                border:5px outset gray;
            }
            #botonresultado {
                width: 20%;
                height: 8%;
                background-color: #b15d28;
                font-size: 10px;
            }
        }
    </style>
    <body class="body1">
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
    <center>
        <h1 id="nombreCuestionario">Titulo del cuestionario</h1>
    </center>
    <br>
    <div class="formulario">
        <div id="resultado"></div>
        <div id="test"></div>
        <br>
        <center> <button id="botonresultado">Regresar</button> </center>
    </div>
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
    <script>
        var nombre;
        var id;
        let DataForm = {};

        <c:forEach var="cues" items="${cuestionarios}">
        id = "${cues.idCuestionario}";
        nombre = "${cues.nombre}";
        </c:forEach>

        <c:forEach var="preg" items="${preguntas}">
        DataForm["id"] = "${preg.idPregunta}";
        DataForm["pregu"] = "${preg.pregunta}";
        DataForm["resA"] = "${preg.respuestaA}";
        DataForm["resB"] = "${preg.respuestaB}";
        DataForm["resC"] = "${preg.respuestaC}";
        </c:forEach>

        console.log("id: " + id);
        console.log("nombre: " + nombre);
        console.log("--id Pregunta: " + DataForm.id);

        document.getElementById("nombreCuestionario").innerHTML = nombre;

        const contenedor = document.getElementById("test");
        const botonRes = document.getElementById("botonresultado");
        const resultadoTest = document.getElementById("resultado");

        const preguntas = [
            {
                pregunta: "¿Qué significa css?",
                respuestas: {
                    a: "Cascade Style Sheet",
                    b: "Diseño para html",
                    c: "No sé bruh",
                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Para qué sirve css?",
                respuestas: {
                    a: "Sirve para dar estilo a html",
                    b: "Es un framework de html",
                    c: "No se usa"
                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Cómo se usa css?",
                respuestas: {
                    a: "Se importa en el header del html",
                    b: "No tiene utilidad",
                    c: "Se escribe '.css' al final de cada etiqueta"

                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Qué es spring?",
                respuestas: {
                    a: "Es un framework de java",
                    b: "Obviamente primavera en inglés",
                    c: "Una epoca del año :3"

                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Qué es hibernate?",
                respuestas: {
                    a: "Un framework de Java",
                    b: "No lo sé",
                    c: "Hibernar"

                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Qué es hibernate?",
                respuestas: {
                    a: "Un framework de Java",
                    b: "No lo sé",
                    c: "Hibernar"

                },
                respuestaCorrecta: "a"
            },
            {
                pregunta: "¿Qué es hibernate?",
                respuestas: {
                    a: "Un framework de Java",
                    b: "No lo sé",
                    c: "Hibernar"

                },
                respuestaCorrecta: "a"
            },
        ];

        function mostrarTest() {
            const preguntasYrespuestas = [];

            preguntas.forEach((preguntaActual, numeroDePregunta) => {
                const respuestas = [];

                for (letraRespuesta in preguntaActual.respuestas) {
                    respuestas.push(
                            `<label>
        <input type="radio" name="${numeroDePregunta}" value="${letraRespuesta}" />
        ${preguntaActual.respuestas[letraRespuesta]}
    </label>`
                            );
                    respuestas.sort(function () {
                        return Math.random() - 0.5
                    })
                }

                preguntasYrespuestas.push(
                        `<div class="cuestion">${preguntaActual.pregunta}</div>
        <div class="respuestas"> ${respuestas.join("")} </div>
`
                        );
            });

            contenedor.innerHTML = preguntasYrespuestas.join("");
        }

        mostrarTest();

        function mostrarResultado() {
            const respuestas = contenedor.querySelectorAll(".respuestas");
            let respuestasCorrectas = 0;

            preguntas.forEach((preguntaActual, numeroDePregunta) => {
                const todasLasRespuestas = respuestas[numeroDePregunta];
                const checkboxRespuestas = `input[name='${numeroDePregunta}']:checked`;
                const respuestaElegida = (
                        todasLasRespuestas.querySelector(checkboxRespuestas) || {}
                ).value;

                if (respuestaElegida === preguntaActual.respuestaCorrecta) {
                    respuestasCorrectas++;

                    respuestas[numeroDePregunta].style.color = "blue";
                } else {
                    respuestas[numeroDePregunta].style.color = "red";
                }
            });
            let promedio = (respuestasCorrectas / preguntas.length) * 10;
            console.log(promedio);
            if (promedio > 7) {
                resultadoTest.innerHTML =
                        "Usted ha acertado " +
                        respuestasCorrectas +
                        " preguntas de un total de " +
                        preguntas.length + ", ¡BIEN HECHO!";
                resultadoTest.style.color = "green";
                resultadoTest.style.background = "#8AFF8A";
                resultadoTest.style.textAlign = "center";
            } else {
                resultadoTest.innerHTML =
                        "Usted ha acertado " +
                        respuestasCorrectas +
                        " preguntas de un total de " +
                        preguntas.length + ", vuelva a intentarlo";
                resultadoTest.style.color = "red";
                resultadoTest.style.background = "#FF8A8A";
                resultadoTest.style.textAlign = "center";
                resultadoTest.style.borderRadius = "10px";
            }
        }

        botonRes.addEventListener("click", mostrarResultado);

    </script>
</body>
<script>
    function cerrarSession() {

        $(location).attr('href', "cerrarSession.html")

    }
</script>
</html>

