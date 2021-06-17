package Elearning.service.impl;

import Elarning.dao.ArchivoDao;
import Elearning.dto.ArchivoDto;
import Elearning.modelo.Archivo;
import Elearning.service.ArchivoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

public class ArchivoServiceImpl implements ArchivoService {

    @Autowired
    private ArchivoDao archivoDao;

    @Override
    public String readArchivo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewArchivo(HttpServletRequest request) {
        
        Integer idArchivo = Integer.parseInt(request.getParameter("idArchivo"));
        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nombre");
        String[] leccion = request.getParameterValues("leccion[]");
        
        Archivo archivo = new Archivo();
        archivo.setIdArchivo(idArchivo);
        archivo.setNombre(nombre);
        archivo.setTipo(tipo);
        
        archivo = archivoDao.create(archivo);
        
        ArchivoDto dto = new ArchivoDto(archivo.getTipo(),archivo.getNombre());
        String data = "";

        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
        
    }

    @Override
    public String updateArchivo(HttpServletRequest request) {
        
        Integer idArchivo = Integer.parseInt(request.getParameter("idArchivo"));
        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nombre");
        String[] leccion = request.getParameterValues("leccion[]");
        
        Archivo actArchivo = new Archivo(tipo,nombre);
        actArchivo=archivoDao.update(actArchivo);
        
        ArchivoDto dto = new ArchivoDto(actArchivo.getTipo(),actArchivo.getNombre());
        String data="";
        
        try {   
             ObjectMapper mapper = new ObjectMapper();
             data=mapper.writeValueAsString(dto);
            
        } catch (JsonProcessingException ex) {
            Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }

    @Override
    public String deleteArchivo(Map<String, String> requestParam) {
        Integer idArchivo = Integer.parseInt(requestParam.get("IdArchivo"));
        Archivo elimArchivo = new Archivo();
        elimArchivo.setIdArchivo(idArchivo);
        boolean flag = archivoDao.delete(elimArchivo);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }

}
