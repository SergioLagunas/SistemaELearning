package Elearning.service;

import Elearning.modelo.formModel.CursoModel;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface CursoService {
    public String listadoCursos(String categoria,Model model);
    public String listadoAllCursos(Model model);
    public String createNewCurso(CursoModel CursoF,HttpServletRequest request);
    public String updateCurso(int idCurso,String nombre,String descripcion,String categoria,MultipartFile caratula);
    public boolean deleteCurso(int idCur); 
}
