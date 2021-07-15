
package Elearning.service.impl;

import Elearning.service.CursoService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Elearning.dao.CursoDao;
import Elearning.dao.MiCursoDao;
import Elearning.dto.CursoDto;
import Elearning.modelo.Curso;
import Elearning.util.JavaDropBox;
import com.dropbox.core.DbxException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.FileNotFoundException;
import java.io.IOException;
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
        
        List<CursoDto> lista = new ArrayList<CursoDto>();
        List<Curso> lista2 = cursoDao.findAll();
        String data="";
        
        for(int i=0;i<lista2.size();i++){
            CursoDto dto= new CursoDto();
            dto.setIdCurso(lista2.get(i).getIdCurso());
            dto.setNombre(lista2.get(i).getNombre());
            dto.setDescripcion(lista2.get(i).getDescripcion());
           // dto.setCaratula(lista2.get(i).getCaratula());
            dto.setProgreso(lista2.get(i).getProgreso());
            dto.setCategoria(lista2.get(i).getCategoria());
            lista.add(dto);
        }
        
        try {   
            ObjectMapper mapper = new ObjectMapper();
            data=mapper.writeValueAsString(lista);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(CursoServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }
    
    @Override
    public String createNewCurso(HttpServletRequest request) {    
        //Integer idCurso=Integer.parseInt(request.getParameter("idCurso"));
        String nombre=request.getParameter("nombre");
        String descripcion=request.getParameter("descripcion");
        String caratula=request.getParameter("caratula");
        int progreso=0;
        String categoria=request.getParameter("categoria");  
       
        Curso curso = new Curso();
        try {
       // curso.setIdCurso(idCurso);
        curso.setNombre(nombre);
        curso.setDescripcion(descripcion);
        curso.setCaratula(caratula);
        curso.setCategoria(categoria);
        curso.setProgreso(progreso);
        
        String enlace = guardarDropBox(curso);
        if(!enlace.equals("")){
            
        }else{
            
        }
        
        curso = cursoDao.create(curso);
        //String enlace = guardarDropBox(curso);
         } catch (Exception e) {
        }
        
        CursoDto dto = new CursoDto(curso.getNombre(),curso.getDescripcion(),curso.getCaratula(),curso.getProgreso(),curso.getCategoria());
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
         
        //Integer idCurso=Integer.parseInt(request.getParameter("idCurso"));
        String nombre=request.getParameter("nombre");
        String descripcion=request.getParameter("descripcion");
        String caratula=request.getParameter("caratula");
        int progreso=Integer.parseInt(request.getParameter("progreso"));
        String categoria=request.getParameter("categoria");  
       
        Curso editCurso = new Curso(nombre,descripcion,caratula,progreso,categoria);
        editCurso = cursoDao.update(editCurso);
        
        CursoDto dto = new CursoDto(editCurso.getNombre(),editCurso.getDescripcion(),editCurso.getCaratula(),editCurso.getProgreso(),
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
    
    private String guardarDropBox(Curso curso) throws IOException, FileNotFoundException, DbxException{
        JavaDropBox jv = new JavaDropBox();
        String enlace = "";
        String caratula = curso.getCaratula()+"_Imagen"+ getExtention(curso.getCaratula());
        jv.uploadToDropbox(curso.getCaratula().getBytes(),"/"+caratula);
        String urlImagen= jv.createURL(caratula);
        
        if(!urlImagen.equals("")){
            enlace = urlImagen;
        }
   
        return enlace;
    }
    
    private String getExtention(String string){
        return string.substring(string.lastIndexOf("."),string.length());
    
}
    
}
