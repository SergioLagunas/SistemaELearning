package Elearning.service.impl;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CursoDao;
import Elearning.modelo.Archivo;
import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ArchivoModel;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ArchivoService;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service("ArchivoService")
public class ArchivoServiceImpl implements ArchivoService {

    @Autowired
    private CursoDao cursoDao;

    @Autowired
    private ArchivoDao archivoDao;

    @Override
    public String readArchivoMoment(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println("Listando Archivos de Curso: " + session.getAttribute("CursoID"));
        model.addAttribute("archivos", archivoDao.findbyCurso((int) session.getAttribute("CursoID")));
        return "anadirarchivos";
    }

    @Override
    public String readArchivoActualizar(int idCurso, Model model) {
        System.out.println("idCurso: " + idCurso);
        model.addAttribute("archivos", archivoDao.findbyCurso(idCurso));
        model.addAttribute("idCurso", idCurso);
        return "anadirNuevosarchivos";
    }

    //Agregar Archivos al crar un curso por primera ves 
    @Override
    public String createArchivo(ArchivoModel Archivo,HttpServletRequest request) {
        Curso cursoentidad = new Curso();
        Archivo entidad = new Archivo();
        HttpSession session = request.getSession();
        cursoentidad = cursoDao.getCurso((int) session.getAttribute("CursoID"));
        try {
            entidad.setNombre(Archivo.getNombre());
            String enlace = guardarDropBox(Archivo);
            if (!enlace.equals("")) {
                entidad.setArchivo(enlace);

                cursoentidad.addArchivos(entidad);
                entidad = archivoDao.create(entidad);
                System.out.println("URL creada con exito");
                return "redirect:/anadirarchivos.html";
            } else {
                System.out.println("Error al crear la Url de DropBox");
                return "redirect:/error.html";
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ArchivoServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "redirect:/error.html";
        }

    }

    //Agregar mas Archivos despues de crear el Curso
    @Override
    public String anadirArchivos(int idCurso, String nombre, MultipartFile archivo) {
        Curso cursoentidad = new Curso();
        Archivo masArchivos = new Archivo();
        ArchivoModel am = new ArchivoModel();
        cursoentidad = cursoDao.getCurso(idCurso);
        try {
            if (!archivo.isEmpty()) {
                am.setArchivo(archivo);
                String enlace = guardarDropBox(am);
                masArchivos.setNombre(nombre);
                masArchivos.setArchivo(enlace);

                cursoentidad.addArchivos(masArchivos);
                masArchivos = archivoDao.create(masArchivos);
                System.out.println("El Archivo se Guardo correctamente y ya esta creada la url de DropBox");
                return "redirect:/anadirNuevosarchivos.html?CursoE=" + cursoentidad.getIdCurso();
            } else {
                System.out.println("Error al crear la Url de DropBox");
                return "error";
            }

        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ArchivoServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "error";
        }
    }

    @Override
    public String updateArchivo(int Vista, int idArchivo, String nombre, MultipartFile archivo) {
        ArchivoModel updateMultimedia = new ArchivoModel();
        Archivo updateArchivo = new Archivo();
        updateArchivo = archivoDao.getArchivo(idArchivo);
        Curso curso = new Curso();
        curso = updateArchivo.getIdCurso();
        try {
            if (!archivo.isEmpty()) {
                updateMultimedia.setArchivo(archivo);
                String enlaceNuevo = guardarDropBox(updateMultimedia);

                updateArchivo.setNombre(nombre);
                updateArchivo.setArchivo(enlaceNuevo);
                updateArchivo = archivoDao.update(updateArchivo);
                System.out.println("Archivo Actualizado con URL nueva");
                if (Vista == 1) {
                    return "redirect:/anadirarchivos.html";
                } else {
                    return "redirect:/anadirNuevosarchivos.html?CursoE=" + curso.getIdCurso();
                }
            } else {
                updateArchivo.setNombre(nombre);
                updateArchivo.setArchivo(updateArchivo.getArchivo());
                updateArchivo = archivoDao.update(updateArchivo);
                System.out.println("Archivo Actualizado sin url nueva");
                if (Vista == 1) {
                    return "redirect:/anadirarchivos.html";
                } else {
                    return "redirect:/anadirNuevosarchivos.html?CursoE=" + curso.getIdCurso();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            Logger.getLogger(ArchivoServiceImpl.class.getName()).log(Level.SEVERE, null, e);
            return "redirect:/error.html";
        }
    }

    @Override
    public boolean deleteArchivo(int idArchivo) {
        Archivo elimArchivo = new Archivo();
        elimArchivo.setIdArchivo(idArchivo);
        boolean flag = archivoDao.delete(elimArchivo);
        return flag;
    }

    private String guardarDropBox(ArchivoModel Archivo) throws IOException, FileNotFoundException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = Archivo.getArchivo() + "_Archivo" + getExtention(Archivo.getArchivo().getOriginalFilename());
        jv.uploadToDropbox(Archivo.getArchivo().getBytes(), "/" + caratula);
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
