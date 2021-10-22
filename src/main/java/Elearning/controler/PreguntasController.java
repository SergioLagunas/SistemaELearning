package Elearning.controler;

import Elearning.dao.CuestionarioDao;
import Elearning.dao.PreguntasDao;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.Modulo;
import Elearning.modelo.Preguntas;
import Elearning.service.PreguntasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PreguntasController {
    @Autowired
    private PreguntasService preguntasService;
    
    @Autowired
    private CuestionarioDao cuestionarioDao;
    
    @Autowired
    private PreguntasDao preguntasDao;
    
    public int ObtenerIdModuloByPreguntas(int idPreguntas){
        Modulo modulo = new Modulo();
        Cuestionario cuestionario = new Cuestionario();
        Preguntas preguntas = new Preguntas();
        
        preguntas = preguntasDao.getPregunta(idPreguntas);
        cuestionario = preguntas.getIdCuestionario();
        
        cuestionario = cuestionarioDao.getCuestionario(cuestionario.getIdCuestionario());
        modulo = cuestionario.getIdModulo();
        
        return modulo.getIdModulo();
    }
    
    public int ObtenerIdModuloByCuestionario(int idCuestionario){
        Modulo modulo = new Modulo();
        Cuestionario cuestionario = new Cuestionario();

        cuestionario = cuestionarioDao.getCuestionario(idCuestionario);
        modulo = cuestionario.getIdModulo();
        
        return modulo.getIdModulo();
    }
    
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
            Redirect = "redirect:/cuestionario.html?Modulo=" + ObtenerIdModuloByCuestionario(IdCuestionario); 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
        
    //Actualizar Pregunta  --> "cuestionario.jsp" 
    @RequestMapping(value = "ActualizarPreguntas.html", method = RequestMethod.POST)
    public String actualizarPreguntas
        (
            @RequestParam("IdPreguntaAct") int idPregunta, 
            @RequestParam("InputPreguntaAct") String Pregunta,
            @RequestParam("InputRespuestaAAct") String RespuestaA,
            @RequestParam("InputRespuestaBAct") String RespuestaB,
            @RequestParam("InputRespuestaCAct") String RespuestaC
        ){
        String Redirect;
        if (preguntasService.updatePreguntas(idPregunta, Pregunta, RespuestaA, RespuestaB, RespuestaC).equals("Pregunta actualizada")) {
            System.out.println("IdPregunta: " + idPregunta);
            System.out.println("Pregunta: " + Pregunta);
            System.out.println("RA: " + RespuestaA);
            System.out.println("RB: " + RespuestaB);
            System.out.println("RC: " + RespuestaC);
            Redirect = "redirect:/cuestionario.html?Modulo=" + ObtenerIdModuloByPreguntas(idPregunta); 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
        
    //Eliminar Pregunta  --> "cuestionario.jsp" 
    @RequestMapping(value = "EliminarPreguntas.html", method = RequestMethod.GET)
    public String eliminarPreguntas(@RequestParam("IdPregunta") int idPregunta, @RequestParam("IdCuestionario") int idCuestionario){
        String Redirect;
        if (preguntasService.deletePreguntas(idPregunta)) {
            Redirect = "redirect:/cuestionario.html?Modulo=" + ObtenerIdModuloByCuestionario(idCuestionario); 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
}
