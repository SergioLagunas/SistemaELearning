package Elearning.service.impl;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CuestionarioDao;
import Elearning.dao.CursoDao;
import Elearning.dao.MiCursoDao;
import Elearning.dao.ModuloDao;
import Elearning.dao.UsuarioDao;
import Elearning.modelo.Modulo;
import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ModuloService;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
    
    @Autowired
    private CuestionarioDao cuestionarioDao;

    @Override
    public String readModulo(int idCurso, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("CursoID", idCurso);
        int usuario = (int) session.getAttribute("UsuarioID");
        Curso curso = new Curso();
        curso = cursoDao.getCurso(idCurso);
        if (micursoDao.RelacionSem(usuario, idCurso)) {
            //Si el usuario ya le dio clic para tomar este curso no es necesario que vuelva a relacionar, de lo contrario dara error
            System.out.println("No es necesario volver a relacionar");
            model.addAttribute("detacurso", curso);
            model.addAttribute("modulos", moduloDao.findbyCurso(idCurso));
            model.addAttribute("archivos", archivoDao.findbyCurso(idCurso));
            model.addAttribute("cuestionarios", cuestionarioDao.findAllByCurso(idCurso));
            return "mediacursos";
        } else {
            //Si el Usuario va tomar el curso entonces en necesario relacionar 
            System.out.println("Hay que relacionar");
            Usuario user = new Usuario();
            //Obtener por el id el Semillero que se inicio sesion
            user = usuarioDao.getUsuario(usuario);
            //Relacion de MuchosaMuchos, en este caso relacionara a los semilleros con los cursos que tomaran 
            user.getCursos().add(curso);
            curso.getUsuarios().add(user);
            usuarioDao.update(user);
            model.addAttribute("detacurso", curso);
            model.addAttribute("modulos", moduloDao.findbyCurso(idCurso));
            model.addAttribute("archivos", archivoDao.findbyCurso(idCurso));
            model.addAttribute("cuestionarios", cuestionarioDao.findAllByCurso(idCurso));
        }
        return "mediacursos";
    }

    @Override
    public String readModuloMoment(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println("Listando Modulos de Curso: " + session.getAttribute("CursoID"));
        System.out.println("Añadiendo los modulos: ");
        model.addAttribute("modulos", moduloDao.findbyCurso((int) session.getAttribute("CursoID")));
        return "anadirmodulos";
    }

    //Se usara para hacer el listado de los modulos una ves que el curso ya haya sido creado y se desee agregar mas 
    // solo lista los videos del curso 
    @Override
    public String readModuloActualizar(int idCurso, Model model, HttpServletRequest request) {
        System.out.println("ID Curso: " + idCurso);
        HttpSession session = request.getSession();
        session.setAttribute("CursoID", idCurso);
        Curso curso = new Curso();
        curso = cursoDao.getCurso(idCurso);
        model.addAttribute("modulosAc", moduloDao.findbyCurso(idCurso));
        model.addAttribute("idCurso", curso.getIdCurso());
        return "actualizarmodulos";
    }

    @Override
    public ModelAndView createNewModulo(ModuloModel moduloM, HttpServletRequest request) {
        ModelAndView mo = new ModelAndView("html_utf8");
        //Recibo el parametro del curso que se creo anteriormente 
        Curso cursoentidad = new Curso();
        Modulo entidad = new Modulo();
        HttpSession session = request.getSession();
        //Aca busco por el id el curso que se obtuvo anteriormente
        cursoentidad = cursoDao.getCurso((int) session.getAttribute("CursoID"));
        try {
            if (!moduloM.getUrl().isEmpty()) {
                System.out.println("El video es Local");
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
                    mo.setViewName("primerosmodulos.html");
                    System.out.println("Error al crear la Url de DropBox");
                    return mo;
                }
            } else {
                System.out.println("El video es de Youtube");
                entidad.setTitulo(moduloM.getTitulo());
                entidad.setDescripcion(moduloM.getDescripcion());
                entidad.setUrl(moduloM.getYoutubeUrl());
                System.out.println("La URL es de youtube y ya esta almacenada en la Base de datos");
                cursoentidad.addModulos(entidad);
                entidad = moduloDao.create(entidad);
                mo.setViewName("redirect:/anadirmodulos.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            mo.setViewName("primerosmodulos.html");
        }
        return mo;
    }

    //Este es para añadir mas modulos si se desea 
    @Override
    public String anadirModulos(String titulo, String descripcion, MultipartFile url, String youtubeUrl, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Curso cursoentidad = new Curso();
        Modulo entidad = new Modulo();
        ModuloModel updateMultimedia = new ModuloModel();
        cursoentidad = cursoDao.getCurso((int)session.getAttribute("CursoID"));
        System.out.println("video de youtube: "+youtubeUrl);
        try {      
            if (!url.isEmpty()) {
                System.out.println("El video es Local: agregando nuevo video de drop box");
                updateMultimedia.setUrl(url);
                String enlace = guardarDropBox(updateMultimedia);

                entidad.setTitulo(titulo);
                entidad.setDescripcion(descripcion);
                entidad.setUrl(enlace);

                cursoentidad.addModulos(entidad);
                entidad = moduloDao.create(entidad);
                System.out.println("El video se Guardo correctamente y ya esta creada la url de DropBox");
                return "redirect:/actualizarmodulos.html?CursoE=" + cursoentidad.getIdCurso();
            } else {
                System.out.println("El video es de Youtube agregando otro video es de youtube");
                entidad.setTitulo(titulo);
                entidad.setDescripcion(descripcion);
                entidad.setUrl(youtubeUrl);
                
                cursoentidad.addModulos(entidad);
                entidad = moduloDao.create(entidad);
                System.out.println("La URL es de youtube y ya esta almacenada en la Base de datos");
                return "redirect:/actualizarmodulos.html?CursoE=" + cursoentidad.getIdCurso();
          }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "error";
        }
    }

    @Override
    public String updateModulo(int Vista, int idModulo, String titulo, String descripcion, MultipartFile url, String youtubeUrl) {
        ModuloModel updateMultimedia = new ModuloModel();
        Modulo updatemodulo = new Modulo();
        updatemodulo = moduloDao.getModulo(idModulo);
        Curso curso = new Curso();
        curso = updatemodulo.getIdCurso();
        System.out.println(youtubeUrl);
        try {
            if (!url.isEmpty()) {
                System.out.println("Detectando Nuevo video para drop box");
                updateMultimedia.setUrl(url);
                String enlaceNuevo = guardarDropBox(updateMultimedia);

                updatemodulo.setTitulo(titulo);
                updatemodulo.setDescripcion(descripcion);
                updatemodulo.setUrl(enlaceNuevo);
                updatemodulo = moduloDao.update(updatemodulo);
                System.out.println("Modulo Actualizado con nueva url");
                if (Vista == 1) {
                    return "redirect:/anadirmodulos.html";
                } else {
                    return "redirect:/actualizarmodulos.html?CursoE=" + curso.getIdCurso();
                }       
            } else if (!youtubeUrl.equals("")) {
                System.out.println("Detectado Nueva URL de youtube");
                updatemodulo.setTitulo(titulo);
                updatemodulo.setDescripcion(descripcion);
                updatemodulo.setUrl(youtubeUrl);
                updatemodulo = moduloDao.update(updatemodulo);
                System.out.println("Modulo Actualizado con nueva Url de Youtube");
                if (Vista == 1) {
                    return "redirect:/anadirmodulos.html";
                } else {
                    return "redirect:/actualizarmodulos.html?CursoE=" + curso.getIdCurso();
                }
            } else {
                updatemodulo.setTitulo(titulo);
                updatemodulo.setDescripcion(descripcion);
                updatemodulo.setUrl(updatemodulo.getUrl());
                updatemodulo = moduloDao.update(updatemodulo);
                System.out.println("Modulo actualizado sin url nueva");
                if (Vista == 1) {
                    return "redirect:/anadirmodulos.html";
                } else {
                    return "redirect:/actualizarmodulos.html?CursoE=" + curso.getIdCurso();
                }
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