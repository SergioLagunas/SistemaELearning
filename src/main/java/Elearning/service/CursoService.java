
package Elearning.service;

import Elearning.modelo.Curso;
import Elearning.modelo.formModel.CursoModel;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface CursoService {
    
    public String listadoCursos(String categoria,Model model);
    public String listadoAllCursos(Model model);
    public String createNewCurso(CursoModel CursoF);
    public String updateCurso(final HttpServletRequest request);
    public String deleteCurso(final Map<String,String> requestParam);
    
    
}
