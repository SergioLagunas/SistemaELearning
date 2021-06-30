
package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class UsuarioControler {
    
    @Autowired
    private UsuarioService usuarioService;
            
    @RequestMapping(value = "/index")
    public  @ResponseBody String crearUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
    
    @RequestMapping(value="/index")
    public @ResponseBody String updateUsuario(HttpServletRequest request){
        return usuarioService.updateUsuario(request);
    }
  
}
