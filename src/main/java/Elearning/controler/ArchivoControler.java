/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.controler;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CursoDao;
import Elearning.modelo.Archivo;
import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ArchivoModel;
import Elearning.service.ArchivoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author sergi
 */
@Controller
public class ArchivoControler {

    @Autowired
    private ArchivoService archivoService;

    @Autowired
    private ArchivoDao archivoDao;

    static int IDArchivo = 0;

    @RequestMapping(value = "anadirarchivos.html", method = RequestMethod.GET)
    public String vistaArchivos(Model model) {
        return archivoService.readArchivoMoment(model);
    }

    @RequestMapping(value = "addArchivos.html", method = RequestMethod.POST)
    public String agregarArchivo(@ModelAttribute ArchivoModel Archivo) {
        return archivoService.createArchivo(Archivo);
    }

    
    //Vista para agregar mas Archivos 
    @RequestMapping(value = "anadirNuevosarchivos.html", method = RequestMethod.GET)
    public String actualizarArchivos(@RequestParam("CursoE")int idCurso, Model model){
        IDArchivo = idCurso;
        return archivoService.readArchivoActualizar(idCurso, model);
    }
    
    //Crud para añadir mas Archivos una ves que ya este creado el curso
    @RequestMapping(value = "anadirArchivos.html", method = RequestMethod.POST)
    public String anadirArchivos(
            @RequestParam("nombre") String nombre,
            @RequestParam("archivo") MultipartFile archivo
    ) {
        return archivoService.anadirArchivos(IDArchivo, nombre, archivo);
    }

    //Este se debe agregar para que funcione en ambas paguinas tanto de agregar archivos por primera ves como agregar despues de agregar mas archivos 
    @RequestMapping(value = "updateArchivo.html", method = RequestMethod.POST)
    public String actualizarArchivo(
            @RequestParam("VistaA") int VistaA,
            @RequestParam("nombre") String nombre,
            @RequestParam("archivo") MultipartFile archivo,
            @RequestParam("archid") int idArchivo) {
        return archivoService.updateArchivo(VistaA, idArchivo, nombre, archivo);
    }

    //Este igual que el anterior 
    @RequestMapping(value = "deleteArchivo.html", method = RequestMethod.GET)
    public String eliminarArchivo(
            @RequestParam("ArchivoE") int Archivo,
            @RequestParam("VistaB") int VistaB) {
        Archivo archivo = new Archivo();
        Curso curso = new Curso();
        archivo = archivoDao.getArchivo(Archivo);
        curso = archivo.getIdCurso();

        if (archivoService.deleteArchivo(Archivo)) {
            System.out.println("Se elimino el archivo con id: " + Archivo);
            if (VistaB == 1) {
                return "redirect:/anadirarchivos.html";
            } else {
                return "redirect:/anadirNuevosarchivos.html?CursoE=" + curso.getIdCurso();
            }
        } else {
            System.out.println("Error al eliminar el Archivo con id: " + Archivo);
        }
        return "redirect:/error.html";
    }
}
