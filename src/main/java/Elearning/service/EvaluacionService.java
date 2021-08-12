/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author sergi
 */
public interface EvaluacionService {
    
    public String readEvaluacion();
    public String createNewEvaluacion(final HttpServletRequest request);
    public String updateEvaluacion(final HttpServletRequest request);
    public boolean deleteEvaluacion(int idEvaluacion);
    
}
