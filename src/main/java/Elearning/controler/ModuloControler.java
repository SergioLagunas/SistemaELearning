/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ModuloService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sergi
 */
@Controller
public class ModuloControler {
    
    @Autowired
    private ModuloService moduloService;
    
    /*
    @RequestMapping(value = "anadirmodulos.html", method = RequestMethod.GET)
    public ModelAndView anadirmodulos() {
        ModelAndView mo = new ModelAndView();
        mo.setViewName("anadirmodulos");
        return mo;
    }
    */
    
    @RequestMapping(value = "addModulo.html",method = RequestMethod.POST)
    public ModelAndView addModulo(@ModelAttribute ModuloModel moduloM){
        return moduloService.createNewModulo(moduloM);
    }
    
    @RequestMapping(value = "mediacursos.html", method = RequestMethod.GET)
     public String listadoCursos(@RequestParam("idCurso") int idCurso, Model model){
         return moduloService.readModulo(idCurso,model);
    }
     
     //Para el crud que esta al insertar los modulos
    @RequestMapping(value = "anadirmodulos.html", method = RequestMethod.GET)
    public String listadoModulo(Model model){
        return moduloService.readModuloMoment(model);
    }
  
}
