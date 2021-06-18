/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.CertificadoDao;
import Elearning.modelo.Certificado;
import Elearning.service.CertificadoService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author sergio
 */
@Service ("CertificadoService")
public class CertificadoServiceImpl implements CertificadoService {

    @Autowired
    private CertificadoDao certificadoDao;

    @Override
    public String readCertificado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewCertificado(HttpServletRequest request) {

        Integer idCertificado = Integer.parseInt(request.getParameter("idCertificado"));
        String fEntrega = request.getParameter("fEntrega");
        String descripcion = request.getParameter("descripcion");
        String [] Evaluacion = request.getParameterValues("Evaluacion[]");
        
        Certificado certificado = new Certificado();
        certificado.setIdCertificado(idCertificado);
        certificado.setfEntrega(fEntrega);
        certificado.setDescripcion(descripcion);
        certificado = certificadoDao.create (certificado);
        
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateCertificado(HttpServletRequest request) {
        Integer idCertificacion = Integer.parseInt(request.getParameter("idCertificacion"));
       // String fEntrega = request.getParameter("fEntrega");
        String descripcion = request.getParameter("descripcion");
        String [] Evaluacion = request.getParameterValues("Evaluacion []");
        
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteCertificado(Map<String, String> requestParam) {
        Integer idCertificado = Integer.parseInt(requestParam.get("IdCertificado"));
        Certificado elimCertificado = new Certificado();
        elimCertificado.setIdCertificado(idCertificado);
        boolean flag = certificadoDao.delete(elimCertificado);
        if (flag) {
            return "{\"valid\"}";
        }
        return "{\"valid\"}";

    }
}
