package Elearning.service.impl;

import Elarning.dao.MiCursoDao;
import Elarning.dao.UsuarioDao;
import Elarning.dao.CursoDao;
import Elearning.dto.UsuarioDto;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.service.MiCursoService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MiCursoService")
public class MiCursoServiceImpl implements MiCursoService {

    @Autowired
    private MiCursoDao miCursoDao;
    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private CursoDao cursoDao;

    @Override
    public String readService() {
        /*List<UsuarioDto> lista = new ArrayList();
        List<Usuario> entidadList = new ArrayList();
        String data = "";

        for (int i = 0; i < entidadList.size(); i++) {
            List<MiCurso> listMiCurso = miCursoDao.getMiCurso(entidadList.get(i).getIdUsuario());
            UsuarioDto dto = new UsuarioDto();
            for (int j = 0; j < entidadList.size(); j++) {          
                Curso entidad = cursoDao.getCurso(Integer.valueOf(listMiCurso.get(j).getIdCurso()));
                dto.gettUsuario()

            }
        }
*/   return null;
    }

    @Override
    public String createNewMiCurso(HttpServletRequest request) {
     /*   String nombre = request.getParameter("nombre");
        String[] cursos = request.getParameterValues("cursos[]");
        Usuario entidad = new Usuario();
        
        entidad.setNombre(nombre);
        entidad=*/
        
     return null;
    }

    @Override
    public String updateMiCurso(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteMiCurso(Map<String, String> requestParamMap) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
