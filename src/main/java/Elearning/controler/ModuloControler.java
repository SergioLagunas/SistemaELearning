/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import Elearning.dao.ModuloDao;
import Elearning.dao.impl.ModuloDaoImpl;
import Elearning.modelo.Curso;
import Elearning.modelo.Modulo;
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
    
    @Autowired
    private ModuloDao moduloDao;

     int IDCurso = 0;

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

    //este es la pagina para agregar mas modulos si se desea una vez acabando de crear el curso
    @RequestMapping(value = "actualizarmodulos.html", method = RequestMethod.GET)
    public String actualizarModulos(@RequestParam("CursoE")int idCurso, Model model) {
        IDCurso = idCurso;
        return moduloService.readModuloActualizar(idCurso, model);
    }

    //Para el crud que esta al insertar los modulos boton actualizar 
    @RequestMapping(value = "ActualizarModulo.html", method = RequestMethod.POST)
    public String actualizarModulo(
            @RequestParam("VistaA") int VistaA,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url,
            @RequestParam("moduid") int idModulo) {
        System.out.println("VistaA: " + VistaA);
        return moduloService.updateModulo(VistaA, idModulo, titulo, descripcion, url);
    }

    //Este es del Crud para insertar mas modulos una ves que el curso ya fue creado
    @RequestMapping(value = "anadirModulos.html", method = RequestMethod.POST)
    public String anadirModulos(
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("url") MultipartFile url) {
        return moduloService.anadirModulos(IDCurso, titulo, descripcion, url);
    }

    @RequestMapping(value = "borrarModulo.html", method = RequestMethod.GET)
    public ModelAndView listadodecursos(@RequestParam("ModuloE") int ModuloE, @RequestParam("VistaB") int VistaB ,Model model) {
        ModelAndView mo = new ModelAndView();
        Curso curso = new Curso();
        Modulo mod = new Modulo();
        
        mod = moduloDao.getModulo(ModuloE);
        curso = mod.getIdCurso();
     
        if (moduloService.deleteModulo(ModuloE)) {
            System.out.println("Se elimino el modulo con ID: " + ModuloE);
            if(VistaB == 1){
                    mo.setViewName("redirect:/anadirmodulos.html");
                } else {
                    mo.setViewName("redirect:/actualizarmodulos.html?CursoE="+curso.getIdCurso());
                }
        } else {
            System.out.println("No se ha borrado el modulo...");
            //checar si si redirecciona bien a esta paguina 
            mo.setViewName("redirect:/actualizarmodulos.html?CursoE="+curso.getIdCurso());
        }

        return mo;
    }
    
     //Vistas de error Modulo
    @RequestMapping(value = "primerosmodulos.html")
    public String errorMo(){
        return "primerosmodulos";
    }


}
