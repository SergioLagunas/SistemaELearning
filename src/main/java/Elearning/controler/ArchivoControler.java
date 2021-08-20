/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import Elearning.modelo.formModel.ArchivoModel;
import Elearning.service.ArchivoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author sergi
 */
@Controller
public class ArchivoControler {
    
    @Autowired
    private ArchivoService archivoService;
    
    @RequestMapping(value = "anadirarchivos.html", method = RequestMethod.GET)
    public String vistaArchivos (Model model) {
        return archivoService.readArchivoMoment(model);
    }
    
    @RequestMapping(value = "addArchivos.html",method = RequestMethod.POST)
    public String agregarArchivo(@ModelAttribute ArchivoModel Archivo){
        return archivoService.createArchivo(Archivo);
    }
}