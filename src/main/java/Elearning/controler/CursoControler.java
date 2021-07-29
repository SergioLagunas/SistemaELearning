package Elearning.controler;

import Elearning.modelo.formModel.CursoModel;
import Elearning.service.CursoService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CursoControler {

    @Autowired
    private CursoService cursoService;

    @RequestMapping(value = "nuevocurso.html", method = RequestMethod.GET)
    public ModelAndView nuevocurso() {
        ModelAndView mo = new ModelAndView();
        mo.setViewName("nuevocurso");
        return mo;
    }
   
    
    @RequestMapping(value="crearCurso.html",method = RequestMethod.POST)
    public String crearCurso(@ModelAttribute CursoModel CursoF){
        return cursoService.createNewCurso(CursoF);
    }
    
     @RequestMapping(value = "Cartas.html", method = RequestMethod.GET)
     public String listadoCursos(Model model){
         model.addAttribute("cursos",cursoService.listadoCursos());
         return "Cartas";
     }
    
     /*
    @RequestMapping(value = "Cartas.html", method = RequestMethod.GET)
    public ModelAndView Cartas(){
        ModelAndView mo = new ModelAndView();
        mo.setViewName("Cartas");
        return mo;   
    }*/
    
    @RequestMapping(value = "listadodecursos.html", method = RequestMethod.GET)
    public ModelAndView listadodecursos() {
        ModelAndView mo = new ModelAndView();
        mo.setViewName("listadodecursos");
        return mo;
    }

}
