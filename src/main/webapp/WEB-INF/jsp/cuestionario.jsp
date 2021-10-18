<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuestionario</title>
    </head>
    <body>
        <!--<div id="Formulario">
            <form id="form" action="CreateCuestionario.html" method="POST">
                <label for="idM">IdModulo:</label> <input type="text" id="idM" name="IdModulo">
                <br>
                <label for="nom">Nombre del Cuestionario:</label> <input type="text" id="nom" name="InputNombre">
                <br>
                <br>
                <input type="submit" value="Crear">
            </form>
        </div>-->
        <div>
            <h1>CREAR CUESTIONARIO</h1>
            <label for="idC">IdCuestionario:</label> <input type="text" id="idC">
            <br>
            <label for="nom">Nombre del Cuestionario:</label> <input type="text" id="nom">
            <br>
            <label for="idM">IdModulo:</label> <input type="text" id="idM">
            <br>
            <br>
            <button onclick="Crear()">CREAR</button>
            <button onclick="Actualizar()">ACTUALIZAR</button>
            <button onclick="Eliminar()">ELIMINAR</button>
        </div>
        <div>
            <h1>CREAR PREGUNTA</h1>
            <label for="idP">IdPregunta:</label> <input type="text" id="idP">
            <br>
            <label for="pre">Pregunta:</label> <input type="text" id="pre">
            <br>
            <label for="resA">RespuestaA:</label> <input type="text" id="resA">
            <br>
            <label for="resB">RespuestaB:</label> <input type="text" id="resB">
            <br>
            <label for="resC">RespuestaC:</label> <input type="text" id="resC">
            <br>
            <label for="idCP">IdCuestionario:</label> <input type="text" id="idCP">
            <br>
            <br>
            <button onclick="CrearP()">CREAR</button>
            <button onclick="ActualizarP()">ACTUALIZAR</button>
            <button onclick="EliminarP()">ELIMINAR</button>
        </div>
        <div>
            <h1>CREAR MICUESTIONARIO</h1>
            <label for="idMi">IdMiCuestionario:</label> <input type="text" id="idMiCuest">
            <br>
            <label for="eva">Evaluacion:</label> <input type="text" id="eva">
            <br>
            <label for="idU">IdUsuario:</label> <input type="text" id="idU">
            <br>
            <label for="idCuest">IdCuestionario:</label> <input type="text" id="idCuest">
            <br>
            <br>
            <button onclick="TomarCuestionario()">TOMAR CUESTIONARIO</button>
            <button onclick="Evaluar()">EVALUAR CUESTIONARIO</button>
            <button onclick="ActualizarEvaluacion()">ACTUALIZAR EVALUACION</button>
            <button onclick="EliminarEvaluacion()">ELIMINAR EVALUACION</button>
        </div>
        <script>
            function Crear(){
                var IdModulo = document.getElementById("idM").value;
                var Nombre = document.getElementById("nom").value;
                document.location.href = "CrearCuestionario.html?IdModulo=" + IdModulo + "&InputNombre=" + Nombre;
            }
            
            function Actualizar(){
                var IdCuestionario = document.getElementById("idC").value;
                var Nombre = document.getElementById("nom").value;
                document.location.href = "ActualizarCuestionario.html?IdCuestionario=" + IdCuestionario + "&InputNombre=" + Nombre;
            }
            
            function Eliminar(){
                var IdCuestionario = document.getElementById("idC").value;
                document.location.href = "EliminarCuestionario.html?IdCuestionario=" + IdCuestionario;
            }
            
            function CrearP(){
                var IdCuestionario = document.getElementById("idCP").value;
                var Pregunta = document.getElementById("pre").value;
                var RespuestaA = document.getElementById("resA").value;
                var RespuestaB = document.getElementById("resB").value;
                var RespuestaC = document.getElementById("resC").value; 
                document.location.href = "CrearPreguntas.html?IdCuestionario=" + IdCuestionario + "&InputPregunta=" + Pregunta + "&InputRespuestaA=" + RespuestaA + "&InputRespuestaB=" + RespuestaB + "&InputRespuestaC=" + RespuestaC;
            }
            
            function ActualizarP(){
                var IdPregunta = document.getElementById("idP").value;
                var Pregunta = document.getElementById("pre").value;
                var RespuestaA = document.getElementById("resA").value;
                var RespuestaB = document.getElementById("resB").value;
                var RespuestaC = document.getElementById("resC").value; 
                document.location.href = "ActualizarPreguntas.html?IdPregunta=" + IdPregunta + "&InputPregunta=" + Pregunta + "&InputRespuestaA=" + RespuestaA + "&InputRespuestaB=" + RespuestaB + "&InputRespuestaC=" + RespuestaC;
            }
            
            function EliminarP(){
                var IdPregunta = document.getElementById("idP").value;
                document.location.href = "EliminarPreguntas.html?IdPregunta=" + IdPregunta;
            }
            
            function TomarCuestionario(){
                var Evaluacion = false;
                var IdUsuario = document.getElementById("idU").value;
                var IdCuestionario = document.getElementById("idCuest").value;
                document.location.href = "CrearMiCuestionario.html?Evaluacion=" + Evaluacion + "&IdUsuario=" + IdUsuario + "&IdCuestionario=" + IdCuestionario;
            }
            
            function Evaluar(){
                var NumPreguntas = 10;
                var Aciertos = 8;
                var CalificacionAprobatoria = 7;
                var Calificacion = (Aciertos * 10) / NumPreguntas;
                
                var Evaluacion;
                if(Calificacion >= CalificacionAprobatoria)
                    Evaluacion = true;
                else
                    Evaluacion = false;
                
                var IdMiCuestionario = document.getElementById("idMiCuest").value;
                document.location.href = "ActualizarMiCuestionario.html?IdMiCuestionario=" + IdMiCuestionario + "&Evaluacion=" + Evaluacion;
            }
            
            function ActualizarEvaluacion(){
                var IdMiCuestionario = document.getElementById("idMiCuest").value;
                var Evaluacion = document.getElementById("eva").value;
                document.location.href = "ActualizarMiCuestionario.html?IdMiCuestionario=" + IdMiCuestionario + "&Evaluacion=" + Evaluacion;
            }
            
            function EliminarEvaluacion(){
                var IdMiCuestionario = document.getElementById("idMiCuest").value;
                document.location.href = "EliminarMiCuestionario.html?IdMiCuestionario=" + IdMiCuestionario;
            }
        </script>
    </body>
</html>
