
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface LeccionService {
    
    public String readLeccion();
    public String createNewLeccion(final HttpServletRequest request);
    public String updateLeccion(final HttpServletRequest request);
    public String deleteLeccion(final Map<String,String> requestParam);
    
}
