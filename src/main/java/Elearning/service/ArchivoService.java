
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface ArchivoService {
    
    public String readArchivo();
    public String createNewArchivo(final HttpServletRequest request);
    public String updateArchivo(final HttpServletRequest request);
    public String deleteArchivo(final Map<String,String> requestParam);
    
}
