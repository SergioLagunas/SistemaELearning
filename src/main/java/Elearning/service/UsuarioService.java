
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface UsuarioService {
    public String readUsuario();
    public String createNewUsuario(final HttpServletRequest request);
    public String updateUsuario(final HttpServletRequest request);
    public String deleteUsusario(final Map<String,String> requestParam);
}
