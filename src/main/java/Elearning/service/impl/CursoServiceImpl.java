package Elearning.service.impl;

import Elearning.service.CursoService;
import java.util.Map;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Elearning.dao.CursoDao;
import Elearning.dao.UsuarioDao;
import Elearning.dto.CursoDto;
import Elearning.modelo.Curso;
import Elearning.modelo.Modulo;
import Elearning.modelo.Usuario;
import Elearning.modelo.formModel.CursoModel;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service("CursoService")
public class CursoServiceImpl implements CursoService {

    //Aca almacenaremos el id del curso para que se puede hacer la relacion con la otra tabla 
    static int elcurso = 0;

    @Autowired
    private CursoDao cursoDao;

    @Autowired
    private UsuarioDao usuarioDao;

    //Listado de cursos por su categoria 
    @Override
    public String listadoCursos(String categoria,Model model) {
        model.addAttribute("categoria",categoria);
        model.addAttribute("cursos",cursoDao.findbyCategory(categoria));
        return "Cartas";
    }
    
    //listado de Todos los cursos
    @Override
    public String listadoAllCursos(Model model){
        model.addAttribute("cursos",cursoDao.findAll());
        return "listadodecursos";
    }

    @Override
    public String createNewCurso(CursoModel CursoF) {
        //Obtengo el id del Usuario que se logeo en este caso sera solo de administradores ya que solo ellos 
        //Pueden crear cursos
        int usuario = UsuarioServiceImpl.elUsuario;
        Usuario user = new Usuario();

        //Obtengo por el id el Administrador que se logeo 
        user = usuarioDao.getUsuario(usuario);

        try {
            Curso entidad = new Curso();
            entidad.setNombre(CursoF.getNombre());
            entidad.setDescripcion(CursoF.getDescripcion());
            entidad.setProgreso(0);
            entidad.setCategoria(CursoF.getCategoria());
            
            //String enlacel = guardarImagen(CursoF.getCaratula(),request);
            String enlace = guardarDropBox(CursoF);
            if (!enlace.equals("")) {
                entidad.setCaratula(enlace);

                //Creamos el Curso 
                entidad = cursoDao.create(entidad);

                //Relacion MuchosAMuchos en este caso solo relaciona los Adminitradores con el Curso que crearon
                user.getCursos().add(entidad);
                entidad.getUsuarios().add(user);
                usuarioDao.update(user);

                //Almaceno en un variable global el id del curso que se creo en ese momento 
                elcurso = entidad.getIdCurso();
                System.out.println("La Imagen se Guardo correctamente");
                return "redirect:/anadirmodulos.html";
            } else {
                System.out.println("Error al crear la imagen");
                return "redirect:/error.html";

            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "redirect:/error.html";
        }
    }

    @Override
    public String updateCurso(HttpServletRequest request) {

        //Integer idCurso=Integer.parseInt(request.getParameter("idCurso"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String caratula = request.getParameter("caratula");
        int progreso = 0;
        String categoria = request.getParameter("categoria");

        Curso editCurso = new Curso(nombre, descripcion, caratula, progreso, categoria);
        editCurso = cursoDao.update(editCurso);

        CursoDto dto = new CursoDto(editCurso.getNombre(), editCurso.getDescripcion(), editCurso.getCaratula(), editCurso.getProgreso(),
                editCurso.getCategoria());
        String data = "";

        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);

        } catch (JsonProcessingException ex) {
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;

    }

    @Override
    public String deleteCurso(Map<String, String> requestParam) {
        Integer idCurso = Integer.parseInt(requestParam.get("IdCurso"));
        Curso elimCurso = new Curso();
        elimCurso.setIdCurso(idCurso);
        boolean flag = cursoDao.delete(elimCurso);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";

    }

    private String guardarDropBox(CursoModel CursoF) throws IOException, FileNotFoundException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = CursoF.getCaratula() + "_Imagen" + getExtention(CursoF.getCaratula().getOriginalFilename());
        jv.uploadToDropbox(CursoF.getCaratula().getBytes(), "/" + caratula);
        String urlImagen = jv.createURL(caratula);
        String sNuevaURL = reemplazar(urlImagen,"www.dropbox.com","dl.dropboxusercontent.com");
        System.out.println("url modificada: "+sNuevaURL);
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
