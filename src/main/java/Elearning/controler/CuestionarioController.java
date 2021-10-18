package Elearning.controler;

import org.springframework.stereotype.Controller;
import Elearning.service.CuestionarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CuestionarioController {
    @Autowired
    private CuestionarioService cuestionarioService;
    
    //Al entrar a la vista --> "cuestionario.jsp"
    @RequestMapping(value = "cuestionario.html", method = RequestMethod.GET)
    public String listCuestionario(Model model) {
        System.out.println("LISTANDO CUESTIONARIOS...");
        return cuestionarioService.listAllCuestionarios(model);
    }
    
    //Crear nuevo Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "CrearCuestionario.html", method = RequestMethod.GET)
    public String crearCuestionario(@RequestParam("IdModulo") int IdModulo, @RequestParam("InputNombre") String Nombre){
        String Redirect;
        if (cuestionarioService.createNewCuestionario(IdModulo, Nombre).equals("Cuestionario creado")) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Actualizar Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "ActualizarCuestionario.html", method = RequestMethod.GET)
    public String actualizarCuestionario(@RequestParam("IdCuestionario") int IdCuestionario, @RequestParam("InputNombre") String Nombre){
        String Redirect;
        if (cuestionarioService.updateCuestionario(IdCuestionario, Nombre).equals("Cuestionario actualizado")) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Eliminar Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "EliminarCuestionario.html", method = RequestMethod.GET)
    public String eliminarCuestionario(@RequestParam("IdCuestionario") int IdCuestionario){
        String Redirect;
        if (cuestionarioService.deleteCuestionario(IdCuestionario)) {
            Redirect = "redirect:/cuestionario.html"; 
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
}
