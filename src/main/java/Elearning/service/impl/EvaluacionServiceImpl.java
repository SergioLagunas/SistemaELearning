/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.EvaluacionDao;
import Elearning.dto.EvaluacionDto;
import Elearning.modelo.Evaluacion;
import Elearning.service.EvaluacionService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.logging.Logger;
import java.util.logging.Level;

public class EvaluacionServiceImpl implements EvaluacionService {

    @Autowired
    private EvaluacionDao evaluacionDao;

    @Override
    public String readEvaluacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewEvaluacion(HttpServletRequest request) {
        Integer idEvaluacion = Integer.parseInt(request.getParameter("idEvaluacion"));
        String tipo = request.getParameter("tipo");
        float calificacion = Float.parseFloat(tipo);
        //String calificacion = request.getParameter("calificacion");
        String aprobacion = request.getParameter("aprobacion");
        String[] leccion = request.getParameterValues("leccion []");

        Evaluacion evaluacion = new Evaluacion();
        evaluacion.setIdEvaluacion(idEvaluacion);
        evaluacion.setTipo(tipo);
        evaluacion.setCalificacion(calificacion);
        evaluacion.setAprobacion(aprobacion);
        evaluacion = evaluacionDao.create(evaluacion);

        EvaluacionDto dto = new EvaluacionDto(evaluacion.getTipo(), evaluacion.getCalificacion(), evaluacion.getAprobacion());
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
    public String updateEvaluacion(HttpServletRequest request) {
        Integer idEvaluacion = Integer.parseInt(request.getParameter("idEvaluacion"));
        String tipo = request.getParameter("tipo");
        float calificacion = Float.parseFloat(request.getParameter("califcaion"));
        //String calificacion = request.getParameter("calificacion");
        String aprobacion = request.getParameter("aprobacion");
        String[] leccion = request.getParameterValues("leccion []");

        Evaluacion actEvaluacion = new Evaluacion(tipo, calificacion, aprobacion);
        actEvaluacion = evaluacionDao.update(actEvaluacion);

        EvaluacionDto dto = new EvaluacionDto(actEvaluacion.getTipo(), actEvaluacion.getCalificacion(), actEvaluacion.getAprobacion());
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
    public String deleteEvaluacion(Map<String, String> requestParam) {
        Integer idEvaluacion = Integer.parseInt(requestParam.get("IdEvaluacion"));
        Evaluacion elimEvaluacion = new Evaluacion();
        elimEvaluacion.setIdEvaluacion(idEvaluacion);
        boolean flag = evaluacionDao.delete(elimEvaluacion);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";
    }

}
