
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public interface ModuloService {
    
    public String readModulo(int idCurso, Model model);
    public String readModuloMoment(Model model);
    public String readModuloActualizar(int idCurso, Model model);
    public ModelAndView createNewModulo(ModuloModel moduloM);
    public String updateModulo(int idModulo,String titulo,String descripcion, MultipartFile url);
    public boolean deleteModulo(int idModulo);
    
}
