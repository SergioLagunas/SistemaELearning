/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.LeccionDao;
import Elearning.dto.LeccionDto;
import Elearning.modelo.Leccion;
import Elearning.service.LeccionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sergi
 */
public class LeccionServiceImpl implements LeccionService{
    
    @Autowired
    private LeccionDao leccionDao;

    @Override
    public String readLeccion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewLeccion(HttpServletRequest request) {
        Integer idLeccion = Integer.parseInt(request.getParameter("idLeccion"));
        String titulo = request.getParameter("titulo");
        String objetivo = request.getParameter("objetivo");
        String [] modulo = request.getParameterValues("modulo []");
        
        Leccion leccion = new Leccion();
        leccion.setIdLeccion(idLeccion);
        leccion.setTitulo(titulo);
        leccion.setObjetivo(objetivo);
        
        leccion = leccionDao.create(leccion);
        
        LeccionDto dto = new LeccionDto (leccion.getTitulo(), leccion.getObjetivo());
        String data = "";

        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(LeccionServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
      
    }

    @Override
    public String updateLeccion(HttpServletRequest request) {
        Integer idLeccion = Integer.parseInt("idLeccion");
        String titulo = request.getParameter("titulo");
        String objetivo = request.getParameter("objetivo");
        String [] modulo = request.getParameterValues("modulo[]");
        
        Leccion actLeccion = new Leccion (titulo, objetivo);
        actLeccion = leccionDao.update(actLeccion);
        
        LeccionDto dto = new LeccionDto (actLeccion.getTitulo(), actLeccion.getObjetivo());
        String data="";
        
        try {   
             ObjectMapper mapper = new ObjectMapper();
             data=mapper.writeValueAsString(dto);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(LeccionServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
        
    }

    @Override
    public String deleteLeccion(Map<String, String> requestParam) {       
        Integer idLeccion = Integer.parseInt(requestParam.get("IdLeccion"));
        Leccion elimLeccion = new Leccion();
        elimLeccion.setIdLeccion(idLeccion);
        boolean flag = leccionDao.delete(elimLeccion);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }

}
