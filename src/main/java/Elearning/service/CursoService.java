
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface CursoService {
    
    public String readService();
    public String createNewCurso(final HttpServletRequest request);
    public String updateCurso(final HttpServletRequest request);
    public String deleteCurso(final Map<String,String> requestParam);
    
}
