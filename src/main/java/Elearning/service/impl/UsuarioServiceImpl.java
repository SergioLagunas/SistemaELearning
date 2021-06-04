package Elearning.service.impl;

import Elarning.dao.MiCursoDao;
import Elarning.dao.UsuarioDao;
import Elearning.dto.UsuarioDto;
import Elearning.modelo.Usuario;
import Elearning.service.UsuarioService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UsuarioService")
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private MiCursoDao miCursoDao;

    @Override
    public String readUsuario() {

        List<UsuarioDto> lista = new ArrayList<UsuarioDto>();
        List<Usuario> lista2 = usuarioDao.findAll();
        String data = "";

        for (int i = 0; i < lista2.size(); i++) {
            UsuarioDto dto = new UsuarioDto();
            dto.setIdUsuario(lista2.get(i).getIdUsuario());
            dto.setNombre(lista2.get(i).getNombre());
            dto.setaPaterno(lista2.get(i).getaPaterno());
            dto.setaMaterno(lista2.get(i).getaMaterno());
            dto.setGenero(lista2.get(i).getGenero());
            dto.setEmail(lista2.get(i).getEmail());
            dto.setContrasena(lista2.get(i).getContrasena());
            dto.settUsuario(lista2.get(i).gettUsuario());
            dto.setRfc(lista2.get(i).getRfc());
            lista.add(dto);
        }

        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(lista);

        } catch (JsonProcessingException ex) {
            Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return data;
    }

    @Override
    public String createNewUsuario(HttpServletRequest request) {

        Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = request.getParameter("tUsuario");
        String rfc = request.getParameter("rfc");

        Usuario usuario = new Usuario();
        usuario.setIdUsuario(idUsuario);
        usuario.setNombre(nombre);
        usuario.setaPaterno(aPaterno);
        usuario.setaMaterno(aMaterno);
        usuario.setGenero(genero);
        usuario.setEmail(email);
        usuario.setContrasena(contrasena);
        usuario.settUsuario(tUsuario);
        usuario.setRfc(rfc);
        usuario = usuarioDao.create(usuario);

        UsuarioDto dto = new UsuarioDto(usuario.getNombre(), usuario.getaPaterno(), usuario.getaMaterno(),
                usuario.getGenero(), usuario.getEmail(), usuario.getContrasena(), usuario.gettUsuario(),
                usuario.getRfc());
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
    public String updateUsuario(HttpServletRequest request) {
        
        Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = request.getParameter("tUsuario");
        String rfc = request.getParameter("rfc");
        
        Usuario editUsuario = new Usuario(nombre,aPaterno,aMaterno,genero,email,contrasena,tUsuario,rfc);
        editUsuario = usuarioDao.update(editUsuario);
  
        UsuarioDto dto = new UsuarioDto(editUsuario.getNombre(),editUsuario.getaPaterno(),editUsuario.getaMaterno(),
                editUsuario.getGenero(),editUsuario.getEmail(),editUsuario.getContrasena(),editUsuario.gettUsuario(),editUsuario.getRfc());
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
    public String deleteUsusario(Map<String, String> requestParam) {
          Integer idUsuario=Integer.parseInt(requestParam.get("IdUsuario"));
          Usuario elimUsuario = new Usuario();
          elimUsuario.setIdUsuario(idUsuario);
          boolean flag=usuarioDao.delete(elimUsuario);
         if(flag){
             return  "{\"valid\"}";
         }
         return "{\"valid\"}";
    }

}
