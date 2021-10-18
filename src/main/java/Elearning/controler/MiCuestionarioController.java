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
    
    //Crear nuevo MiCuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "CrearMiCuestionario.html", method = RequestMethod.GET)
    public String crearMiCuestionario(@RequestParam("Evaluacion") boolean Evaluacion, @RequestParam("IdUsuario") int IdUsuario, @RequestParam("IdCuestionario") int IdCuestionario){
        String Redirect;
        if (miCuestionarioService.createNewMiCuestionario(Evaluacion, IdUsuario, IdCuestionario).equals("MiCuestionario creado")) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Actualizar MiCuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "ActualizarMiCuestionario.html", method = RequestMethod.GET)
    public String actualizarMiCuestionario(@RequestParam("IdMiCuestionario") int IdMiCuestionario, @RequestParam("Evaluacion") boolean Evaluacion){
        String Redirect;
        if (miCuestionarioService.updateMiCuestionario(IdMiCuestionario, Evaluacion).equals("MiCuestionario actualizado")) {
            Redirect = "redirect:/cuestionario.html"; 
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
