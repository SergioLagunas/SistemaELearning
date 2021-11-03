package Elearning.controler;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CursoDao;
import Elearning.modelo.Archivo;
import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ArchivoModel;
import Elearning.service.ArchivoService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ArchivoControler {

    @Autowired
    private ArchivoService archivoService;

    @Autowired
    private ArchivoDao archivoDao;

    static int IDArchivo = 0;

    //Al entrar a la vista --> "anadirarchivos.jsp"
    @RequestMapping(value = "anadirarchivos.html", method = RequestMethod.GET)
    public String vistaArchivos(Model model,HttpServletRequest request) {
        return archivoService.readArchivoMoment(model,request);
    }

    //Agregar nuevos archivos  --> "anadirarchivos.jsp" 
    @RequestMapping(value = "addArchivos.html", method = RequestMethod.POST)
    public String agregarArchivo(@ModelAttribute ArchivoModel Archivo,HttpServletRequest request) {
        return archivoService.createArchivo(Archivo,request);
    }

    //Al entrar a la vista, con Id del curso que se actualizará --> "anadirNuevosarchivos.jsp"
    @RequestMapping(value = "anadirNuevosarchivos.html", method = RequestMethod.GET)
    public String actualizarArchivos(@RequestParam("CursoE")int idCurso, Model model){
        IDArchivo = idCurso;
        return archivoService.readArchivoActualizar(idCurso, model);
    }
    
    //Agregar mas archivos, una vez que ya este creado el curso --> "anadirNuevosarchivos.jsp"
    @RequestMapping(value = "anadirArchivos.html", method = RequestMethod.POST)
    public String anadirArchivos(
            @RequestParam("nombre") String nombre,
            @RequestParam("archivo") MultipartFile archivo
    ) {
        return archivoService.anadirArchivos(IDArchivo, nombre, archivo);
    }

    //Actualizar archivos --> "anadirNuevosarchivos.jsp", "anadirarchivos.jsp"
    @RequestMapping(value = "updateArchivo.html", method = RequestMethod.POST)
    public String actualizarArchivo(
            @RequestParam("VistaA") int VistaA,
            @RequestParam("nombre") String nombre,
            @RequestParam("archivo") MultipartFile archivo,
            @RequestParam("archid") int idArchivo) {
        return archivoService.updateArchivo(VistaA, idArchivo, nombre, archivo);
    }

    //Eliminar archivos --> "anadirNuevosarchivos.jsp", "anadirarchivos.jsp"
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
