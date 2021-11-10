package Elearning.controler;

import Elearning.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioControler {

    @Autowired
    private UsuarioService usuarioService;

    //Crear un Administrador 
    @RequestMapping(value = "addAdministrador.html", method = RequestMethod.POST)
    public ModelAndView addAdministrador(HttpServletRequest request, HttpServletResponse response) {
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

    @RequestMapping(value = "actualizarSemillero.html", method = RequestMethod.POST)
    public String actualizar(HttpServletRequest request) {
        return usuarioService.updateUsuario(request);
    }

    @RequestMapping(value = "actualizarAdmin.html", method = RequestMethod.POST)
    public String actualizarAdmin(HttpServletRequest request) {
        return usuarioService.updateUsuarioAdmin(request);
    }

    //Listado de los Adminisradores 
    @RequestMapping(value = "nuevoadmin.html", method = RequestMethod.GET)
    public String listarAdmin(Model model) {
        return usuarioService.readAdmin(model);
    }

    //Listado de Semilleros 
    @RequestMapping(value = "nuevosemillero.html", method = RequestMethod.GET)
    public String listarSemilleros(Model model) {
        return usuarioService.readSem(model);
    }

    //Mostrar los datos en la pantalla de actualizar datos 
    @RequestMapping(value = "perfilsem.html", method = RequestMethod.GET)
    public String listarDatosUser(Model model, HttpServletRequest request) {
        return usuarioService.readUserSem(model, request);
    }

    //Mostrar los datos en la pantalla de actualizar datos Administrador 
    @RequestMapping(value = "perfiladmin.html", method = RequestMethod.GET)
    public String listarDatosAdmin(Model model, HttpServletRequest request) {
        return usuarioService.readUser(model, request);
    }

    @RequestMapping(value = "ProgressBar.html", method = RequestMethod.GET)
    public String ProgressBar(Model modelo, HttpServletRequest request) {
        return usuarioService.barProgress(modelo, request);
    }

    @RequestMapping(value = "eliminarAdmin.html", method = RequestMethod.GET)
    public ModelAndView eliminarAdmin(@RequestParam("idUsuario") int idUsuario, Model model) {
        ModelAndView mo = new ModelAndView();
        if (usuarioService.deleteUsusario(idUsuario)) {
            mo.setViewName("redirect:/nuevoadmin.html");
        } else {
            mo.setViewName("redirect:/error.html");
        }
        return mo;
    }

    @RequestMapping(value = "eliminarSemillero.html", method = RequestMethod.GET)
    public ModelAndView eliminarSemillero(@RequestParam("idUsuario") int idUsuario, Model model) {
        ModelAndView mo = new ModelAndView();
        if (usuarioService.deleteUsusario(idUsuario)) {
            mo.setViewName("redirect:/nuevosemillero.html");
        } else {
            mo.setViewName("redirect:/error.html");
        }
        return mo;
    }

    @RequestMapping(value = "certificado.html", method = RequestMethod.GET)
    public String certificado(@RequestParam("nombreCurso") String nombreCurso, Model model) {
        return usuarioService.readCertificado(nombreCurso, model);
    }
    
    //Informe del usuario 
    @RequestMapping(value = "informeUsuario.html", method = RequestMethod.GET)
    public String informeUsuario() {
        return "informeUsuario";
    }
}
