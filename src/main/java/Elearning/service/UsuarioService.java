
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface UsuarioService {
    public String readAdmin(Model model);
    public String readSem(Model model);
    public String createNewSemillero(final HttpServletRequest request);
    public String createNewAdminsitrador(final HttpServletRequest request);
    public String loginUser(HttpServletRequest request);
//    public String LogOut(HttpServletRequest request);
    public String updateUsuario(final HttpServletRequest request);
    public String deleteUsusario(final Map<String,String> requestParam);
    public boolean recuperarContraseña(HttpServletRequest request);
}
