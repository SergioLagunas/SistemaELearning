/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.service.impl;

import Elarning.dao.CertificadoDao;
import Elearning.modelo.Certificado;
import Elearning.service.CertificadoService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sergi
 */
public class CertificadoServiceImpl implements CertificadoService {

    @Autowired
    private CertificadoDao certificadoDao;

    @Override
    public String readCertificado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createNewCertificado(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateCertificado(HttpServletRequest request) {
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
