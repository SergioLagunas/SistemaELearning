
package Elearning.service.impl;

import Elarning.dao.ModuloDao;
import Elearning.modelo.Modulo;
import Elearning.dto.ModuloDto;
import Elearning.service.ModuloService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sergi
 */
public class ModuloServiceImpl implements ModuloService {
    
    @Autowired
    private ModuloDao moduloDao;

    @Override
    public String readModulo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewModulo(HttpServletRequest request) {
        Integer idModulo = Integer.parseInt(request.getParameter("idModulo"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String[] curso = request.getParameterValues("curso[]");

        Modulo modulo = new Modulo();
        modulo.setIdModulo(idModulo);
        modulo.setTitulo(titulo);
        modulo.setDescripcion(descripcion);

        modulo = moduloDao.create(modulo);
        
        ModuloDto moduloDto = new ModuloDto(modulo.getTitulo(),modulo.getDescripcion());       
        String data = "";

        try{
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(moduloDto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String updateModulo(HttpServletRequest request) {
        Integer idModulo = Integer.parseInt(request.getParameter("idModulo"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String[] curso = request.getParameterValues("curso[]");

        Modulo modulo = new Modulo(titulo, descripcion);
        modulo = moduloDao.update(modulo);

        ModuloDto moduloDto = new ModuloDto(modulo.getTitulo(),modulo.getDescripcion()); 
        String data = "";

        try{
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(moduloDto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String deleteModulo(Map<String, String> requestParam) {
        Integer idModulo = Integer.parseInt(requestParam.get("IdModulo"));
        Modulo elimModulo = new Modulo();
        elimModulo.setIdModulo(idModulo);
        boolean flag = moduloDao.delete(elimModulo);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }
}
