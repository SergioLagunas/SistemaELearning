package Elearning.controler;

import Elearning.service.MiCuestionarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MiCuestionarioController {
    @Autowired
    private MiCuestionarioService miCuestionarioService;
    
    //Crear nuevo MiCuestionario  --> "mediacursos.jsp" 
    @RequestMapping(value = "CrearMiCuestionario.html", method = RequestMethod.GET)
    public String crearMiCuestionario(@RequestParam("Evaluacion") boolean Evaluacion, @RequestParam("IdUsuario") int IdUsuario, @RequestParam("IdCuestionario") int IdCuestionario){
        String Redirect;
        if (miCuestionarioService.validateMiCuestionario(IdUsuario, IdCuestionario))
            Redirect = "redirect:/examenuser.html?idUsuario="+IdUsuario+"&idCuestionario=" +IdCuestionario;
        else {
            if (miCuestionarioService.createNewMiCuestionario(Evaluacion, IdUsuario, IdCuestionario).equals("MiCuestionario creado")) {
                Redirect = "redirect:/examenuser.html?idUsuario="+IdUsuario+"&idCuestionario=" +IdCuestionario; 
            } else
                Redirect = "redirect:/error.html"; 
        }
        return Redirect;
    }
    
    //Actualizar MiCuestionario  --> "examenuser.jsp" 
    @RequestMapping(value = "ActualizarMiCuestionario.html", method = RequestMethod.GET)
    public String actualizarMiCuestionario(@RequestParam("idCurso") int idCurso, @RequestParam("idUsuario") int idUsuario, @RequestParam("idCuestionario") int idCuestionario, @RequestParam("Evaluacion") boolean Evaluacion){
        String Redirect;
        if (miCuestionarioService.updateMiCuestionario(miCuestionarioService.getIdMiCuestionario(idUsuario, idCuestionario), Evaluacion).equals("MiCuestionario actualizado")) {  
            if(miCuestionarioService.defineProgress(idCurso, idUsuario).equals("Progreso establecido"))
                Redirect = "redirect:/mediacursos.html?idCurso=" + idCurso; 
            else
                Redirect = "redirect:/error.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Eliminar MiCuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "EliminarMiCuestionario.html", method = RequestMethod.GET)
    public String eliminarMiCuestionario(@RequestParam("IdMiCuestionario") int IdMiCuestionario){
        String Redirect;
        if (miCuestionarioService.deleteMiCuestionario(IdMiCuestionario)) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
}
