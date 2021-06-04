
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;


public interface MiCursoService {
    
    public String readService();
    public String createNewMiCurso(final HttpServletRequest request);
    public String updateMiCurso(final HttpServletRequest request);
    public String deleteMiCurso(final Map<String,String> requestParamMap);
    
}
