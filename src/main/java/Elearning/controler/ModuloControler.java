package Elearning.controler;

import Elearning.dao.ModuloDao;
import Elearning.modelo.Curso;
import Elearning.modelo.Modulo;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ModuloService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ModuloControler {

    @Autowired
    private ModuloService moduloService;
    
    @Autowired
    private ModuloDao moduloDao;

    @RequestMapping(value = "addModulo.html", method = RequestMethod.POST)
    public ModelAndView addModulo(@ModelAttribute ModuloModel moduloM, HttpServletRequest request) {
        return moduloService.createNewModulo(moduloM, request);
    }

    @RequestMapping(value = "mediacursos.html", method = RequestMethod.GET)
    public String listadoCursos(@RequestParam("idCurso") int idCurso, Model model, HttpServletRequest request) {
        return moduloService.readModulo(idCurso, model, request);
    }

    //Para el crud que esta al insertar los modulos
    @RequestMapping(value = "anadirmodulos.html", method = RequestMethod.GET)
    public String listadoModulo(Model model, HttpServletRequest request) {
        return moduloService.readModuloMoment(model, request);
    }

    //Este es la pagina para agregar mas modulos si se desea una vez acabando de crear el curso
    @RequestMapping(value = "actualizarmodulos.html", method = RequestMethod.GET)
    public String actualizarModulos(@RequestParam("CursoE")int idCurso, Model model, HttpServletRequest request) {
        return moduloService.readModuloActualizar(idCurso, model, request);
    }

    //Para el crud que esta al insertar los modulos boton actualizar 
    @RequestMapping(value = "ActualizarModulo.html", method = RequestMethod.POST)
    public String actualizarModulo(
            @RequestParam("VistaA") int VistaA,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url,
            @RequestParam("youtubeUrl") String youtubeUrl,
            @RequestParam("moduid") int idModulo) {
        return moduloService.updateModulo(VistaA, idModulo, titulo, descripcion, url, youtubeUrl);
    }

    //Este es del Crud para insertar mas modulos una ves que el curso ya fue creado
    @RequestMapping(value = "anadirModulos.html", method = RequestMethod.POST)
    public String anadirModulos(
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url,
            @RequestParam("youtubeUrl") String youtubeUrl,
            HttpServletRequest request) {
        return moduloService.anadirModulos(titulo, descripcion, url, youtubeUrl, request);
    }

    @RequestMapping(value = "borrarModulo.html", method = RequestMethod.GET)
    public ModelAndView listadodecursos(@RequestParam("ModuloE") int ModuloE, @RequestParam("VistaB") int VistaB, Model model) {
        ModelAndView mo = new ModelAndView();
        Curso curso = new Curso();
        Modulo mod = new Modulo();
        
        mod = moduloDao.getModulo(ModuloE);
        curso = mod.getIdCurso();
     
        if (moduloService.deleteModulo(ModuloE)) {
            System.out.println("Se elimino el modulo con ID: " + ModuloE);
            if (VistaB == 1) {
                    mo.setViewName("redirect:/anadirmodulos.html");
                } else {
                mo.setViewName("redirect:/actualizarmodulos.html?CursoE=" + curso.getIdCurso());
                }
        } else {
            System.out.println("No se ha borrado el modulo...");
            mo.setViewName("redirect:/actualizarmodulos.html?CursoE=" + curso.getIdCurso());
        }

        return mo;
    }
    
    //Vistas de error Modulo
    @RequestMapping(value = "primerosmodulos.html")
    public String errorMo() {
        return "primerosmodulos";
    }
}