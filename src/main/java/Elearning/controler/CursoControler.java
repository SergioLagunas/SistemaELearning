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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    @RequestMapping(value = "addCurso.html", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mo = new ModelAndView();
        mo.setViewName("addCurso");
        return mo;
    }
    
    @RequestMapping(value="crearCurso.html",method = RequestMethod.POST)
    public ModelAndView crearCurso(@ModelAttribute CursoModel CursoF){     
        return cursoService.createNewCurso(CursoF);
    }

    

}
