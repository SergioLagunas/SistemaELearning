package Elearning.service.impl;

import Elearning.dao.CursoDao;
import Elearning.dao.ModuloDao;
import Elearning.modelo.Modulo;
import Elearning.dto.ModuloDto;
import Elearning.modelo.Curso;
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

    @Override
    public String readModulo(int idCurso, Model model) {
        System.out.println("idCurso: "+idCurso);
        model.addAttribute("modulos",moduloDao.findbyCurso(idCurso));     
        return "mediacursos";
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
    public String updateModulo(HttpServletRequest request) {
        // Integer idModulo = Integer.parseInt(request.getParameter("idModulo"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String url = request.getParameter("url");
        //String[] curso = request.getParameterValues("curso[]");

        Modulo modulo = new Modulo(titulo, descripcion, url);
        modulo = moduloDao.update(modulo);

        ModuloDto moduloDto = new ModuloDto(modulo.getTitulo(), modulo.getDescripcion(), modulo.getUrl());
        String data = "";

        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(moduloDto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String deleteModulo(Map<String, String> requestParam) {
        Integer idModulo = Integer.parseInt(requestParam.get("IdModulo"));
        Modulo elimModulo = new Modulo();
        elimModulo.setIdModulo(idModulo);
        boolean flag = moduloDao.delete(elimModulo);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }

    private String guardarDropBox(ModuloModel moduloM) throws IOException, FileNotFoundException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = moduloM.getUrl() + "_Video" + getExtention(moduloM.getUrl().getOriginalFilename());
        jv.uploadToDropbox(moduloM.getUrl().getBytes(), "/" + caratula);
        String urlVideo = jv.createURL(caratula);

        if (!urlVideo.equals("")) {
            enlace = urlVideo;
        }

        return enlace;
    }

    private String getExtention(String string) {
        return string.substring(string.lastIndexOf("."), string.length());

    }

}
