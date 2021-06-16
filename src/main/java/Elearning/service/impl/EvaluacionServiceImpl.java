/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.EvaluacionDao;
import Elearning.modelo.Evaluacion;
import Elearning.service.EvaluacionService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sergi
 */
public class EvaluacionServiceImpl implements EvaluacionService{
    
    @Autowired
    private EvaluacionDao evalucionDao;

    @Override
    public String readEvaluacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewEvaluacion(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateEvaluacion(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteEvaluacion(Map<String, String> requestParam) {
        Integer idEvaluacion = Integer.parseInt(requestParam.get("IdEvaluacion"));
        Evaluacion elimEvaluacion = new Evaluacion();
        elimEvaluacion.setIdEvaluacion(idEvaluacion);
        boolean flag = evalucionDao.delete(elimEvaluacion);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }
    
}
