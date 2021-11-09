package Elearning.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface UsuarioService {
    public String readAdmin(Model model);
    public String readSem(Model model);
    public String readUser(Model model,HttpServletRequest request);
    public String readUserSem(Model model,HttpServletRequest request);
    public String createNewSemillero(final HttpServletRequest request);
    public String createNewAdminsitrador(final HttpServletRequest request);
    public String loginUser(HttpServletRequest request);
    public String updateUsuario(final HttpServletRequest request);
    public String updateUsuarioAdmin(final HttpServletRequest request);
    public boolean deleteUsusario(int idUsuario);
    public boolean recuperarContraseña(HttpServletRequest request);
    public String barProgress(Model modelo, HttpServletRequest request);
    public String readCertificado (String nombreCurso, Model model);
}
