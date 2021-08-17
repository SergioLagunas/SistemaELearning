package Elearning.service.impl;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CursoDao;
import Elearning.dao.MiCursoDao;
import Elearning.dao.ModuloDao;
import Elearning.dao.UsuarioDao;
import Elearning.modelo.Modulo;
import Elearning.dto.ModuloDto;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.modelo.formModel.CursoModel;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ModuloService;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.ui.Model;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sergi
 */
@Service("ModuloService")
public class ModuloServiceImpl implements ModuloService {

    @Autowired
    private ModuloDao moduloDao;

    @Autowired
    private CursoDao cursoDao;

    @Autowired
    private UsuarioDao usuarioDao;
    
    @Autowired
    private ArchivoDao archivoDao;

    @Autowired
    private MiCursoDao micursoDao;

    @Override
    public String readModulo(int idCurso, Model model) {
        System.out.println("idCurso: " + idCurso);
        int usuario = UsuarioServiceImpl.elUsuario;
        Curso curso = new Curso();
        curso = cursoDao.getCurso(idCurso);
        if (micursoDao.RelacionSem(usuario, idCurso)) {
            //Si el usuario ya le dio clic para tomar este curso no es necesario que vuleva a relacionar de lo contrario dara error
            System.out.println("No es necesario volver a relacionar");
            model.addAttribute("detacurso", curso);
            model.addAttribute("modulos", moduloDao.findbyCurso(idCurso));
            model.addAttribute("archivos", archivoDao.findbyCurso(idCurso));
            return "mediacursos";
        } else {
            //Si el Usuario va tomar el curso entonces en necesario relacionar 
            System.out.println("Hay que relacionar");
            Usuario user = new Usuario();
            //Obtengo por el id el Semillero que se logeo 
            user = usuarioDao.getUsuario(usuario);
            //Relacion de MuchosaMuchos en este caso relacionara a los semilleros con los cursos que tomaran 
            user.getCursos().add(curso);
            curso.getUsuarios().add(user);
            usuarioDao.update(user);
            model.addAttribute("detacurso", curso);
            model.addAttribute("modulos", moduloDao.findbyCurso(idCurso));
            model.addAttribute("archivos", archivoDao.findbyCurso(idCurso));
        }
        return "mediacursos";
    }

    @Override
    public String readModuloMoment(Model model) {
        int curso = CursoServiceImpl.elcurso;
        System.out.println("Listando int curso = CursoServiceImpl.elcurso;Modulos de Curso: " + curso);
        System.out.println("Añadiendo los modulos: ");
        model.addAttribute("modulos", moduloDao.findbyCurso(curso));
        return "anadirmodulos";
    }

    @Override
    public ModelAndView createNewModulo(ModuloModel moduloM) {
        ModelAndView mo = new ModelAndView("html_utf8");
        //Recibo el parametro del curso que se creo anteriormente 
        int curso = CursoServiceImpl.elcurso;
        Curso cursoentidad = new Curso();
        Modulo entidad = new Modulo();
        //Aca busco por el id el curso que se obtuvo anteriormente
        cursoentidad = cursoDao.getCurso(curso);
        try {
            entidad.setTitulo(moduloM.getTitulo());
            entidad.setDescripcion(moduloM.getDescripcion());
            String enlace = guardarDropBox(moduloM);
            if (!enlace.equals("")) {
                entidad.setUrl(enlace);
                System.out.println("El video se Guardo correctamente y ya esta creada la url de DropBox");
//Aca es donde estoy agregando los modulos a el array de Curso creando la relacion en las tablas y agregando 
//cantidad n de videos al curso 
                cursoentidad.addModulos(entidad);
                entidad = moduloDao.create(entidad);
                mo.setViewName("redirect:/anadirmodulos.html");
            } else {
                mo.setViewName("error.html");
                System.out.println("Error al crear la Url de DropBox");
                return mo;
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            mo.setViewName("error");
        }
        return mo;
    }

    @Override
    public String updateModulo(int idModulo, String titulo, String descripcion, MultipartFile url) {
        ModuloModel updateMultimedia = new ModuloModel();
        Modulo updatemodulo = new Modulo();
        updatemodulo = moduloDao.getModulo(idModulo);
        try {
            if(!url.isEmpty()){
                updateMultimedia.setUrl(url);
                String enlaceNuevo = guardarDropBox(updateMultimedia);
                
                updatemodulo.setTitulo(titulo);
                updatemodulo.setDescripcion(descripcion);
                updatemodulo.setUrl(enlaceNuevo);
                updatemodulo = moduloDao.update(updatemodulo);
                System.out.println("Modulo Actualizado con nueva url");
                return "redirect:/anadirmodulos.html";
                
            }else{
                updatemodulo.setTitulo(titulo);
                updateMultimedia.setDescripcion(descripcion);
                updatemodulo.setUrl(updatemodulo.getUrl());
                updatemodulo = moduloDao.update(updatemodulo);
                System.out.println("Modulo actualizado sin url nueva");
                return "redirect:/anadirmodulos.html";
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "redirect:/error.html";
        }
    }

    @Override
    public boolean deleteModulo(int idModulo) {
        Modulo elimModulo = new Modulo();
        elimModulo.setIdModulo(idModulo);
        boolean flag = moduloDao.delete(elimModulo);
        return flag;
    }

    private String guardarDropBox(ModuloModel moduloM) throws IOException, FileNotFoundException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = moduloM.getUrl() + "_Video" + getExtention(moduloM.getUrl().getOriginalFilename());
        jv.uploadToDropbox(moduloM.getUrl().getBytes(), "/" + caratula);
        String urlVideo = jv.createURL(caratula);
        String sNuevaURL = reemplazar(urlVideo, "www.dropbox.com", "dl.dropboxusercontent.com");
        System.out.println("url modificada: " + sNuevaURL);
        if (!sNuevaURL.equals("")) {
            enlace = sNuevaURL;
        }
        return enlace;
    }

    private String getExtention(String string) {
        return string.substring(string.lastIndexOf("."), string.length());

    }

    public static String reemplazar(String cadena, String busqueda, String reemplazo) {
        return cadena.replaceAll(busqueda, reemplazo);
    }

}
