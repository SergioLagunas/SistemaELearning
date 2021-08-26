/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ModuloService;
import java.lang.reflect.Method;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sergi
 */
@Controller
public class ModuloControler {

    @Autowired
    private ModuloService moduloService;

    @RequestMapping(value = "addModulo.html", method = RequestMethod.POST)
    public ModelAndView addModulo(@ModelAttribute ModuloModel moduloM) {
        return moduloService.createNewModulo(moduloM);
    }

    @RequestMapping(value = "mediacursos.html", method = RequestMethod.GET)
    public String listadoCursos(@RequestParam("idCurso") int idCurso, Model model) {
        return moduloService.readModulo(idCurso, model);
    }

    //Para el crud que esta al insertar los modulos
    @RequestMapping(value = "anadirmodulos.html", method = RequestMethod.GET)
    public String listadoModulo(Model model) {
        return moduloService.readModuloMoment(model);
    }

    //este es la paguina para agregar mas modulos si se desea una ves acabando de crear el curso
    @RequestMapping(value = "actualizarmodulos.html", method = RequestMethod.GET)
    public String actualizarModulos(@RequestParam("CursoE") int Curso, Model model) {
        return moduloService.readModuloActualizar(Curso, model);
    }

    //Para el crud que esta al insertar los modulos boton actualizar 
    @RequestMapping(value = "ActualizarModulo.html", method = RequestMethod.POST)
    public String actualizarModulo(
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url,
            @RequestParam("moduid") int idModulo) {
        return moduloService.updateModulo(idModulo, titulo, descripcion, url);
    }

    //Este es del Crud para insertar mas modulos una ves que el curso ya fue creado
    @RequestMapping(value = "anadirModulos.html", method = RequestMethod.POST)
    public String anadirModulos(
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url,
            @RequestParam("curid") int idCurso) {
        return moduloService.anadirModulos(idCurso, titulo, descripcion, url);
    }

    @RequestMapping(value = "borrarModulo.html", method = RequestMethod.GET)
    public ModelAndView listadodecursos(@RequestParam("ModuloE") int ModuloE, Model model) {
        ModelAndView mo = new ModelAndView();

        if (moduloService.deleteModulo(ModuloE)) {
            System.out.println("Se elimino el modulo con ID: " + ModuloE);
            mo.setViewName("redirect:/anadirmodulos.html");
        } else {
            System.out.println("No se ha borrado el modulo...");
            mo.setViewName("redirect:/error.html");
        }

        return mo;
    }
    
    //Vistas de error Modulo
    @RequestMapping(value = "primerosmodulos.html")
    public String errorMo(){
        return "primerosmodulos";
    }

}
