
package Elearning.service;

import Elearning.modelo.formModel.ArchivoModel;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface ArchivoService {
    public String readArchivoMoment(Model model);
    public String createArchivo(ArchivoModel Archivo);
    public String updateArchivo(int idArchivo,String nombre,MultipartFile archivo);
    public boolean deleteArchivo(int idArchivo);
}
