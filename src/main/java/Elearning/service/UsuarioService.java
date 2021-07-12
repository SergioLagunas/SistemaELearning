
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface UsuarioService {
    public String readUsuario();
    public String createNewSemillero(final HttpServletRequest request);
    public String createNewAdminsitrador(final HttpServletRequest request);
    public String loginUser(HttpServletRequest request);
    public String updateUsuario(final HttpServletRequest request);
    public String deleteUsusario(final Map<String,String> requestParam);
    public boolean recuperarContraseña(HttpServletRequest request);
}
