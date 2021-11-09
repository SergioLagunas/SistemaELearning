package Elearning.service;

import Elearning.modelo.formModel.ModuloModel;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public interface ModuloService {
    public String readModulo(int idCurso, Model model, HttpServletRequest request);
    public String readModuloMoment(Model model, HttpServletRequest request);
    public String readModuloActualizar(int idCurso, Model model, HttpServletRequest request);
    public ModelAndView createNewModulo(ModuloModel moduloM, HttpServletRequest request);
    public String anadirModulos(String titulo, String descripcion, MultipartFile url, String youtubeUrl, HttpServletRequest request);
    public String updateModulo(int Vista, int idModulo, String titulo, String descripcion, MultipartFile url, String youtubeUrl);
    public boolean deleteModulo(int idModulo);
}