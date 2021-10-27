package Elearning.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface CuestionarioService {  
    public String listAllCuestionarios(Model model, int idModulo);
    public String listAllCuestionariosById(Model model, int idCuestionario);
    public String createNewCuestionario(int IdModulo, String nombre);
    public String updateCuestionario(int idCuestionario, String nombre);
    public boolean deleteCuestionario(int idCuestionario);   
}
