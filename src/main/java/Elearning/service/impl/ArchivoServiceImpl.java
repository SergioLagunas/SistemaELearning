package Elearning.service.impl;

import Elarning.dao.ArchivoDao;
import Elearning.modelo.Archivo;
import Elearning.service.ArchivoService;
import java.util.Map;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateArchivo(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
