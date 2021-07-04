
package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioControler {
     
    @Autowired
    private UsuarioService usuarioService;
       
    @RequestMapping(value = "index.html",method = RequestMethod.GET)
    public  ModelAndView CrearUsuario(HttpServletRequest request){
        usuarioService.createNewUsuario(request);
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        return mo;   
    }
  
    /*
    @RequestMapping(value="/index")
    public @ResponseBody String updateUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
    */
}
