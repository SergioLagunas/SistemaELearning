/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.ModuloDao;
import Elearning.modelo.Modulo;
import Elearning.service.ModuloService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateModulo(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
