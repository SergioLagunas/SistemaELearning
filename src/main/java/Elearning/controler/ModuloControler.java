/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sergi
 */
@Controller
public class ModuloControler {
    
    @RequestMapping(value = "agregarmodulos.html", method = RequestMethod.GET)
    public ModelAndView agregarmodulos() {
        ModelAndView mo = new ModelAndView();
        mo.setViewName("agregarmodulos");
        return mo;
    }
    
}
