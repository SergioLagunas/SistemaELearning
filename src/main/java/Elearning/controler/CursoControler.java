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
   
    //Creacion de los Cursos
    @RequestMapping(value="crearCurso.html",method = RequestMethod.POST)
    public String crearCurso(@ModelAttribute CursoModel CursoF){
        return cursoService.createNewCurso(CursoF);
    }
    
    //Listado de los curso de acuerdo a su categoria
     @RequestMapping(value = "Cartas.html", method = RequestMethod.GET)
     public String listadoCursos(@RequestParam("categoria") String categoria,Model model){
         return cursoService.listadoCursos(categoria,model);
     }
   
   //Este es el del crud de cursos para Listar Actualizar y Eliminar  
    @RequestMapping(value = "listadodecursos.html", method = RequestMethod.GET)
    public String listadodecursos2(Model model) {
        return cursoService.listadoAllCursos(model);
    }

}
