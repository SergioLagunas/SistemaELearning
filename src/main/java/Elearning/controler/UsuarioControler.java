
package Elearning.controler;

import Elearning.service.UsuarioService;
import com.sun.net.httpserver.HttpServer;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioControler {
    
    @Autowired
    private UsuarioService usuarioService;
            
    @RequestMapping(value = "index.html", method = RequestMethod.GET)
    public  @ResponseBody String crearUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
    /*
    @RequestMapping(value="misdatos.html", method = RequestMethod.GET)
    public String updateUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
  */
}
