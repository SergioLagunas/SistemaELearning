
package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioControler {
    
    @Autowired
    private UsuarioService usuarioService;
    
    //Aqui inician las ventanas que se enlazan con la venta de bienvenida sem
    //Crear un Administrador 
     @RequestMapping(value = "addAdministrador.html", method = RequestMethod.POST)
      public ModelAndView addAdministrador(HttpServletRequest request, HttpServletResponse response){
         ModelAndView mo = new ModelAndView();
        switch (usuarioService.createNewAdminsitrador(request)) {
            case "existente":
                mo.setViewName("error");
                break;
            default:
                mo.setViewName("redirect:/nuevoadmin.html");
                break;
        }
         return mo;
     }
    
      //Listado de los Adminisradores 
    @RequestMapping(value = "nuevoadmin.html", method = RequestMethod.GET)
    public String listarAdmin(Model model){
         return usuarioService.readAdmin(model);
    }
    
     @RequestMapping(value = "nuevosemillero.html", method = RequestMethod.GET)
    public String listarSemilleros(Model model){
         return usuarioService.readSem(model);
    }
    
    @RequestMapping(value = "perfilsem.html", method = RequestMethod.GET)
    public ModelAndView perfilsem(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("perfilsem");
        return mo;   
    }
    
    @RequestMapping(value = "ProgressBar.html", method = RequestMethod.GET)
    public ModelAndView ProgressBar(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("ProgressBar");
        return mo;   
    }
    
    //Aqui inician las ventanas que se enlazan con la venta de bienvenida admiN
     @RequestMapping(value = "perfiladmin.html", method = RequestMethod.GET)
    public ModelAndView perfiladmin(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("perfiladmin");
        return mo;   
    }
    
   
   
    
}
