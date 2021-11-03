
package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class HomeController {
    
    
    @Autowired
    private UsuarioService usuarioService;
    
    //Este contrlador para nada debe cambiar de Metodo DEVER SER SI O SI GET
    @RequestMapping(value = "index.html", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("index");
        return mo;   
    }
    
    
    @RequestMapping(value="semilleroRegistro.html",method = RequestMethod.POST)
    public ModelAndView semilleroRegistro(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
        switch (usuarioService.createNewSemillero(request)) {
            case "existente":
                mo.setViewName("error");
                break;
            default:
                mo.setViewName("exito");
                break;
        }
         return mo;
        
    }
    
    @RequestMapping(name = "validador.html",method = RequestMethod.POST)
    public ModelAndView validador(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
         switch (usuarioService.loginUser(request)) {
            case "Semillero":
                mo.setViewName("bienvenida");
                break;
            case "Administrador":
                mo.setViewName("admin");
                break;
            default:
                mo.setViewName("error");
                break;
        }
         return mo;
    }
   
   
    @RequestMapping(name = "enviarCorreo.html",method = RequestMethod.GET)
    public ModelAndView enviarCorreo(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
        if(usuarioService.recuperarContraseña(request)){
            mo.setViewName("index");
            System.out.println("Correo Emviado");
        } else {
            mo.setViewName("error");
            System.out.println("Correo no Emviado");
        }       
        return mo;
    } 
    
     //Controlador para cerrar session
    @RequestMapping(name = "cerrarSession.html", method = RequestMethod.GET)
     public ModelAndView cerrarSession(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mo = new ModelAndView();
        HttpSession session = request.getSession(false);
        session.removeAttribute("usuario");
        session.removeAttribute("tUsuario");
        session.removeAttribute("UsuarioID");
        session.removeAttribute("CursoID");
        session.invalidate();
        System.out.println("SESION CERRADA");
        mo.setViewName("redirect:/index.html");
        return mo;
    }
    
    @RequestMapping("error.html")
    public ModelAndView error(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("error");
        return mo;
    }
    
    @RequestMapping("exito.html")
    public ModelAndView exito(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("exito");
        return mo;
    }
    
    @RequestMapping("admin.html")
    public ModelAndView admin(){
         ModelAndView mo = new ModelAndView();
        mo.setViewName("admin");
        return mo;
    }
    
     @RequestMapping("bienvenida.html")
     public ModelAndView semillero(){
         ModelAndView mo = new ModelAndView();
        mo.setViewName("bienvenida");
        return mo;
    }
}
