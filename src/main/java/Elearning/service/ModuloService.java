
package Elearning.service;

import Elearning.modelo.Curso;
import Elearning.modelo.Modulo;
import Elearning.modelo.formModel.ModuloModel;
import java.util.List;
import java.util.Map;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;


public interface ModuloService {
    
    public String readModulo(int idCurso, Model model);
    public String readModuloMoment(Model model);
    public ModelAndView createNewModulo(ModuloModel moduloM);
    public String updateModulo(final HttpServletRequest request);
    public String deleteModulo(final Map<String,String> requestParam);
    
}
