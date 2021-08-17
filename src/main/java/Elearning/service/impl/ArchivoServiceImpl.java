package Elearning.service.impl;

import Elearning.dao.ArchivoDao;
import Elearning.dao.CursoDao;
import Elearning.modelo.Archivo;
import Elearning.modelo.Curso;
import Elearning.modelo.formModel.ArchivoModel;
import Elearning.modelo.formModel.ModuloModel;
import Elearning.service.ArchivoService;
import static Elearning.service.impl.ModuloServiceImpl.reemplazar;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("ArchivoService")
public class ArchivoServiceImpl implements ArchivoService {

    @Autowired
    private CursoDao cursoDao;

    @Autowired
    private ArchivoDao archivoDao;

    @Override
    public String createArchivo(ArchivoModel Archivo) {
        int curso = CursoServiceImpl.elcurso;
        Curso cursoentidad = new Curso();
        Archivo entidad = new Archivo();
        cursoentidad = cursoDao.getCurso(curso);
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

    @Override
    public String updateArchivo(int idArchivo, String nombre, MultipartFile archivo) {
        ArchivoModel updateMultimedia = new ArchivoModel();
        Archivo updateArchivo = new Archivo();
        updateArchivo = archivoDao.getArchivo(idArchivo);
        try {
            if (!archivo.isEmpty()) {
                updateMultimedia.setArchivo(archivo);
                String enlaceNuevo = guardarDropBox(updateMultimedia);

                updateArchivo.setNombre(nombre);
                updateArchivo.setArchivo(enlaceNuevo);
                updateArchivo = archivoDao.update(updateArchivo);
                System.out.println("Archivo Actualizado con URL nueva");
                return "redirect:/.html";
            } else {
                updateArchivo.setNombre(nombre);
                updateArchivo.setArchivo(updateArchivo.getArchivo());
                updateArchivo = archivoDao.update(updateArchivo);
                System.out.println("Archivo Actualizado sin url nueva");
                return "redirect:/.html";
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
        String caratula = Archivo.getArchivo() + "_Video" + getExtention(Archivo.getArchivo().getOriginalFilename());
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
