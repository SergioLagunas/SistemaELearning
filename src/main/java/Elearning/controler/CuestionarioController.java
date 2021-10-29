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
    
    int moduloRecuperado = 0;
    
    //Al entrar a la vista --> "cuestionario.jsp"
    @RequestMapping(value = "cuestionario.html", method = RequestMethod.GET)
    public String listCuestionario(@RequestParam("Modulo") int IdModulo, Model model) {
        moduloRecuperado = IdModulo;
        System.out.println("LISTANDO CUESTIONARIOS...");
        return cuestionarioService.listAllCuestionarios(model, moduloRecuperado);
    }
    
        //Al entrar a la vista --> "previewexamenadmin.jsp"
    @RequestMapping(value = "previewexamadmin.html", method = RequestMethod.GET)
    public String previewCuestionario(@RequestParam("idCuestionario") int idCuestionario, Model model) {
        String Redirect;
        if (cuestionarioService.listAllCuestionarios(model, moduloRecuperado).equals("cuestionario")) {
            //Redirect = "redirect:/previewexamadmin.html?Cuestionario=" + idCuestionario;
            Redirect = "previewexamadmin";
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
            //Al entrar a la vista --> "examenuser.jsp"
    @RequestMapping(value = "examenuser.html", method = RequestMethod.GET)
    public String tomarCuestionario(@RequestParam("idUsuario") int idUsuario, @RequestParam("idCuestionario") int idCuestionario, Model model) {
        return cuestionarioService.listAllCuestionariosById(model, idCuestionario); 
    }
    
    //Crear nuevo Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "CrearCuestionario.html", method = RequestMethod.GET)
    public String crearCuestionario(@RequestParam("InputNombre") String Nombre){
        String Redirect;
        if (cuestionarioService.createNewCuestionario(moduloRecuperado, Nombre).equals("Cuestionario creado")) {
            Redirect = "redirect:/cuestionario.html?Modulo=" + moduloRecuperado;
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Actualizar Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "ActualizarCuestionario.html", method = RequestMethod.GET)
    public String actualizarCuestionario(@RequestParam("IdCuestionario") int IdCuestionario, @RequestParam("InputNombre") String Nombre){
        String Redirect;
        if (cuestionarioService.updateCuestionario(IdCuestionario, Nombre).equals("Cuestionario actualizado")) {
            Redirect = "redirect:/cuestionario.html?Modulo=" + moduloRecuperado;
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
    //Eliminar Cuestionario  --> "cuestionario.jsp" 
    @RequestMapping(value = "EliminarCuestionario.html", method = RequestMethod.GET)
    public String eliminarCuestionario(@RequestParam("IdCuestionario") int IdCuestionario){
        String Redirect;
        if (cuestionarioService.deleteCuestionario(IdCuestionario)) {
            Redirect = "redirect:/cuestionario.html?Modulo=" + moduloRecuperado;
        } else
            Redirect = "redirect:/error.html"; 
        return Redirect;
    }
    
//            //Evaluar cuestionario --> "examenuser.jsp"
//    @RequestMapping(value = "examenuser.html", method = RequestMethod.GET)
//    public String evaluarCuestionario(@RequestParam("idCuestionario") int idCuestionario, Model model) {
//        String Redirect;
//        if (cuestionarioService.listAllCuestionarios(model, moduloRecuperado).equals("cuestionario")) {
//            //Redirect = "redirect:/previewexamadmin.html?Cuestionario=" + idCuestionario;
//            Redirect = "previewexamadmin";
//        } else
//            Redirect = "redirect:/error.html"; 
//        return Redirect;
//    }
}
