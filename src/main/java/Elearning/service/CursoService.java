package Elearning.service;

import Elearning.modelo.formModel.CursoModel;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface CursoService {
    public String listadoCursos(String categoria,Model model);
    public String listadoAllCursos(Model model);
    public String createNewCurso(CursoModel CursoF);
    public String updateCurso(HttpServletRequest request);
    public boolean deleteCurso(int idCur); 
}
