
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;


public interface ModuloService {
    
    public String readModulo();
    public String createNewModulo(final HttpServletRequest request);
    public String updateModulo(final HttpServletRequest request);
    public String deleteModulo(final Map<String,String> requestParam);
    
}
