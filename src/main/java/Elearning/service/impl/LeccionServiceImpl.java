/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.LeccionDao;
import Elearning.modelo.Leccion;
import Elearning.service.LeccionService;
import java.util.Map;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateLeccion(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
