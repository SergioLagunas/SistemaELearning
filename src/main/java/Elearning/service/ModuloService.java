
package Elearning.service;

import Elearning.modelo.formModel.ModuloModel;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public interface ModuloService {
    
    public String readModulo();
    public ModelAndView createNewModulo(ModuloModel moduloM);
    public String updateModulo(final HttpServletRequest request);
    public String deleteModulo(final Map<String,String> requestParam);
    
}
