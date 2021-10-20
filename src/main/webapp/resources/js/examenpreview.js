/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
      respuestas.sort(function () { return Math.random() - 0.5 })
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
  let promedio= (respuestasCorrectas/preguntas.length) *10;
  console.log(promedio);
  if(promedio> 7){
    resultadoTest.innerHTML =
      "Usted ha acertado " +
      respuestasCorrectas +
      " preguntas de un total de " +
      preguntas.length + ", ¡BIEN HECHO!";
      resultadoTest.style.color="green";
      resultadoTest.style.background="#8AFF8A";
      resultadoTest.style.textAlign="center";
    }
    else{
      resultadoTest.innerHTML =
      "Usted ha acertado " +
      respuestasCorrectas +
      " preguntas de un total de " +
      preguntas.length + ", vuelva a intentarlo";
      resultadoTest.style.color="red";
      resultadoTest.style.background="#FF8A8A";
      resultadoTest.style.textAlign="center";
      resultadoTest.style.borderRadius="10px";
  }
}

botonRes.addEventListener("click", mostrarResultado);


