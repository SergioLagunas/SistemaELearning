
package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class UsuarioControler {
     
    @Autowired
    private UsuarioService usuarioService;
       
    @RequestMapping(value = "crearSemillero.html",method = RequestMethod.GET)
    public  String CrearUsuario(HttpServletRequest request){
        return usuarioService.createNewSemillero(request);
    }
  
    /*
    @RequestMapping(value="/index")
    public @ResponseBody String updateUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
    */
    
    //Controller del login para identificar a los administradores y a lso semilleros 
    //Cuidado con Mayusculas y minusculas
     @RequestMapping(value = "/index", method = RequestMethod.GET)
     public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
         ModelAndView mo = new ModelAndView();     
        switch (usuarioService.loginUser(request)) {
            case "Semillero":
                mo.setViewName("redirect:/");
                break;
            case "Administrador":
                mo.setViewName("redirect:/");
                break;
            default:
                mo.addObject("error", "Contraseña o Usuario Incorrecto");
                mo.setViewName("index");
                break;
        }
         return mo;
     }
}
