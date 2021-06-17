
package Elearning.service.impl;

import Elearning.service.CursoService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Elarning.dao.CursoDao;
import Elarning.dao.MiCursoDao;
import Elearning.dto.CursoDto;
import Elearning.modelo.Curso;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;



@Service("CursoService")
public class CursoServiceImpl implements CursoService{
    
    @Autowired
    private CursoDao cursoDao;    
    @Autowired
    private MiCursoDao miCursoDao;

    @Override
    public String readService() {
        /*
        List<CursoDto> lista = new ArrayList<CursoDto>();
        List<Curso> lista2 = cursoDao.findAll();
        String data="";
        
        for(int i=0;i<lista2.size();i++){
            CursoDto dto= new CursoDto();
            dto.setIdCurso(lista2.get(i).getIdCurso());
            dto.setNombre(lista2.get(i).getNombre());
            dto.setDescripcion(lista2.get(i).getDescripcion());
            lista.add(dto);
        }
        
        try {   
            ObjectMapper mapper = new ObjectMapper();
            data=mapper.writeValueAsString(lista);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
*/
        return null;
    }
    
    @Override
    public String createNewCurso(HttpServletRequest request) {    
       
        Integer idCurso=Integer.parseInt(request.getParameter("idCurso"));
        String nombre=request.getParameter("nombre");
        String descripcion=request.getParameter("descripcion");
        String caratula=request.getParameter("caratula");
        String categoria=request.getParameter("categoria");  
       
        Curso curso = new Curso();
        curso.setIdCurso(idCurso);
        curso.setNombre(nombre);
        curso.setDescripcion(descripcion);
        curso.setCaratula(caratula);
        curso.setCategoria(categoria);
        curso = cursoDao.create(curso);
        
        CursoDto dto = new CursoDto(curso.getNombre(),curso.getDescripcion(),curso.getCaratula(),curso.getCategoria());
        String data="";
        
        try {   
             ObjectMapper mapper = new ObjectMapper();
             data=mapper.writeValueAsString(dto);            
        } catch (JsonProcessingException ex) {         
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }

    @Override
    public String updateCurso(HttpServletRequest request) {
         
        Integer idCurso=Integer.parseInt(request.getParameter("idCurso"));
        String nombre=request.getParameter("nombre");
        String descripcion=request.getParameter("descripcion");
        String caratula=request.getParameter("caratula");
        String categoria=request.getParameter("categoria");  
       
        Curso editCurso = new Curso(nombre,descripcion,caratula,categoria);
        editCurso = cursoDao.update(editCurso);
        
        CursoDto dto = new CursoDto(editCurso.getNombre(),editCurso.getDescripcion(),editCurso.getCaratula(),
        editCurso.getCategoria());
        String data="";
        
        try {   
             ObjectMapper mapper = new ObjectMapper();
             data=mapper.writeValueAsString(dto);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
        
    }

    @Override
    public String deleteCurso(Map<String, String> requestParam) {   
          Integer idCurso=Integer.parseInt(requestParam.get("IdCurso"));
          Curso elimCurso = new Curso();
          elimCurso.setIdCurso(idCurso);
          boolean flag=cursoDao.delete(elimCurso);
         if(flag){
             return  "{\"valid\"}";
         }
         return "{\"valid\"}";
        
    }
}
