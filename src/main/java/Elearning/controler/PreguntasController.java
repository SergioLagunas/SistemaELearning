package Elearning.controler;

import Elearning.service.PreguntasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PreguntasController {
    @Autowired
    private PreguntasService preguntasService;
    
    //Al entrar a la vista --> "cuestionario.jsp"
//    @RequestMapping(value = "cuestionario.html", method = RequestMethod.GET)
//    public String listPreguntas(Model model) {
//        System.out.println("LISTANDO PREGUNTAS...");
//        return preguntasService.listAllPreguntas(model);
//    }
    
    //Crear nueva Pregunta  --> "cuestionario.jsp" 
    @RequestMapping(value = "CrearPreguntas.html", method = RequestMethod.POST)
    public String crearPreguntas
        (
            @RequestParam("IdCuestionario") int IdCuestionario, 
            @RequestParam("InputPregunta") String Pregunta,
            @RequestParam("InputRespuestaA") String RespuestaA,
            @RequestParam("InputRespuestaB") String RespuestaB,
            @RequestParam("InputRespuestaC") String RespuestaC
        ){
        String Redirect;
        if (preguntasService.createNewPreguntas(IdCuestionario, Pregunta, RespuestaA, RespuestaB, RespuestaC).equals("Pregunta creada")) {
            Redirect = "redirect:/cuestionario.html?Modulo="+77; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
        
    //Actualizar Pregunta  --> "cuestionario.jsp" 
    @RequestMapping(value = "ActualizarPreguntas.html", method = RequestMethod.GET)
    public String actualizarPreguntas
        (
            @RequestParam("IdPregunta") int idPregunta, 
            @RequestParam("InputPregunta") String Pregunta,
            @RequestParam("InputRespuestaA") String RespuestaA,
            @RequestParam("InputRespuestaB") String RespuestaB,
            @RequestParam("InputRespuestaC") String RespuestaC
        ){
        String Redirect;
        if (preguntasService.updatePreguntas(idPregunta, Pregunta, RespuestaA, RespuestaB, RespuestaC).equals("Pregunta actualizada")) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
        
    //Eliminar Pregunta  --> "cuestionario.jsp" 
    @RequestMapping(value = "EliminarPreguntas.html", method = RequestMethod.GET)
    public String eliminarPreguntas(@RequestParam("IdPregunta") int idPregunta){
        String Redirect;
        if (preguntasService.deletePreguntas(idPregunta)) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
}
