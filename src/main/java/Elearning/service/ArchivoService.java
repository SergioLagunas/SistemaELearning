
package Elearning.service;

import Elearning.modelo.formModel.ArchivoModel;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface ArchivoService {
    public String readArchivoMoment(Model model,HttpServletRequest request);
    public String readArchivoActualizar(int idCurso,Model model);
    public String createArchivo(ArchivoModel Archivo,HttpServletRequest request);
    public String anadirArchivos(int idCurso,String nombre, MultipartFile archivo);
    public String updateArchivo(int Vista,int idArchivo,String nombre,MultipartFile archivo);
    public boolean deleteArchivo(int idArchivo);
}
