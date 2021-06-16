
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;


public interface CertificadoService {
    
    public String readCertificado();
    public String createNewCertificado(final HttpServletRequest request);
    public String updateCertificado(final HttpServletRequest request);
    public String deleteCertificado(final Map<String,String> requestParam);
    
}
