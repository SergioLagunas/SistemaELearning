const contenedor = document.getElementById("test");
const botonRes = document.getElementById("botonresultado");
const resultadoTest = document.getElementById("resultado");

var preguntas = [];
let promedio = 0;

function pasarVariables(dato) {
    preguntas = dato.slice();
    console.log("arreglo copiado: " + dato[0].pregunta);
}

function returnCalificacion(){
    console.log("Promedio: " + promedio);
    return promedio;
}

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

//mostrarTest();

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
            respuestas[numeroDePregunta].style.pointerEvents = "none";
        } else {
            respuestas[numeroDePregunta].style.pointerEvents = "none";
        }
    });
    promedio = (respuestasCorrectas / preguntas.length) * 10;
    
    if (promedio > 8) {
        resultadoTest.innerHTML =
                "Usted ha acertado " +
                respuestasCorrectas +
                " preguntas de un total de " +
                preguntas.length + ", ¡Excelente!";
        resultadoTest.style.color = "green";
        resultadoTest.style.background = "#8AFF8A";
        resultadoTest.style.textAlign = "center";
    } else if (promedio > 6 && promedio < 9) {
        resultadoTest.innerHTML =
                "Usted ha acertado " +
                respuestasCorrectas +
                " preguntas de un total de " +
                preguntas.length + ", ¡Deberías estudiar un poco más!";
        resultadoTest.style.color = "#F9A602";
        resultadoTest.style.background = "#FEFEBE";
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
        resultadoTest.style.transitionDuration = ".5s";
    }
    return promedio;
}

//botonRes.addEventListener("click", mostrarResultado);