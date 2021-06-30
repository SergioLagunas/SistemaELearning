
package Elearning.service.impl;

import Elearning.dao.ModuloDao;
import Elearning.modelo.Modulo;
import Elearning.dto.ModuloDto;
import Elearning.service.ModuloService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
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
            
        List<ModuloDto> lista = new ArrayList<ModuloDto>();
        List<Modulo> lista2 = moduloDao.findAll();
        String data="";
        
        for(int i=0;i<lista2.size();i++){
            ModuloDto dto= new ModuloDto();
            dto.setIdModulo(lista2.get(i).getIdModulo());
            dto.setTitulo(lista2.get(i).getTitulo());
            dto.setDescripcion(lista2.get(i).getDescripcion());
            lista.add(dto);
        }
        
        try {   
            ObjectMapper mapper = new ObjectMapper();
            data=mapper.writeValueAsString(lista);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ModuloServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
       
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
