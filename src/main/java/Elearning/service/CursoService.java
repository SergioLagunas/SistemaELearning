
package Elearning.service;

import Elearning.modelo.Curso;
import Elearning.modelo.formModel.CursoModel;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface CursoService {
    
    public List<Curso> listadoCursos();
    public String createNewCurso(CursoModel CursoF,HttpServletRequest request);
    public String updateCurso(final HttpServletRequest request);
    public String deleteCurso(final Map<String,String> requestParam);
    
    
}
