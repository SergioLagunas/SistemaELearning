package Elearning.service;

import org.springframework.ui.Model;

public interface MiCuestionarioService {
    public String listAllMiCuestionario(Model model);
    public String createNewMiCuestionario(boolean evaluacion, int idUsuario, int idCuestionario);
    public String updateMiCuestionario(int idMiCuestionario, boolean evaluacion);
    public boolean deleteMiCuestionario(int idMiCuestionario);   
    //public String defineProgress(int idModulo, int idUsuario);
}
