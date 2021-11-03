package Elearning.service;

import Elearning.modelo.formModel.ModuloModel;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public interface ModuloService {
    public String readModulo(int idCurso, Model model, HttpServletRequest request);
    public String readModuloMoment(Model model);
    public String readModuloActualizar(int idCurso, Model model);
    public ModelAndView createNewModulo(ModuloModel moduloM);
    public String anadirModulos(int idCurso, String titulo,String descripcion, MultipartFile url);
    public String updateModulo(int Vista,int idModulo,String titulo,String descripcion, MultipartFile url);
    public boolean deleteModulo(int idModulo);
}
