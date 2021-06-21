package Elearning.service.impl;

import Elarning.dao.CursoDao;
import Elarning.dao.MiCursoDao;
import Elarning.dao.UsuarioDao;
import Elearning.dto.CursoDto;
import Elearning.dto.UsuarioDto;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
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
    @Autowired
    private CursoDao cursoDao;

    @Override
    public String readUsuario() {

        List<UsuarioDto> lista = new ArrayList<UsuarioDto>();
        List<Usuario> lista2 = usuarioDao.findAll();
        String data = "";

        for (int i = 0; i < lista2.size(); i++) {
            List<MiCurso> misCursos = miCursoDao.getMiCurso(lista2.get(i).getIdUsuario());
            UsuarioDto dto = new UsuarioDto();
            
            for(int j=0;j<misCursos.size();j++){
                Curso entidad =cursoDao.getCurso(Integer.valueOf(misCursos.get(j).getIdCurso()));
                //dto.get
            }
            dto.setIdUsuario(lista2.get(i).getIdUsuario());
            dto.setNombre(lista2.get(i).getNombre());
           // lista2.add(dto);
                    
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
        String[] cursos = request.getParameterValues("curso[]");

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
       
        // Relacion de muchos a muchos 
        MiCurso entidad_relacional=new MiCurso();
        List<CursoDto> lista=new ArrayList<CursoDto>();
        for(int i=0;i<cursos.length;i++){
            entidad_relacional.setIdUsuario(usuario.getIdUsuario());
            entidad_relacional.setIdCurso(Integer.parseInt(cursos[i]));
            Curso curso = cursoDao.getCurso(Integer.valueOf(cursos[i]));
//            CursoDto dto = new CursoDto(curso.getNombre(),curso.getDescripcion());
     //       lista.add(dto);
            miCursoDao.create(entidad_relacional);
        }

        //Checar el contructor 
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
        String[] cursos = request.getParameterValues("curso[]");
        
        
        //Relacion de tablas 
        List<MiCurso> auxMiCurso = new ArrayList<MiCurso>(); 
        List<MiCurso> MiCurso = miCursoDao.getMiCurso(idUsuario);
        MiCurso miCurso =new MiCurso();
        List<CursoDto> lista=new ArrayList<CursoDto>();
        
         for(int i=0;i<cursos.length;i++){
             boolean flag=true;
             for(int j=0;j<MiCurso.size();j++){
                 if(Integer.parseInt(cursos[i])== MiCurso.get(j).getIdCurso()){
                     flag=false;
                     break;
                 }
             }
             if(flag){
                miCurso.setIdCurso(Integer.parseInt(cursos[i]));
                miCurso.setIdUsuario(idUsuario);
                miCursoDao.create(miCurso);           
             }
       
         }
         
         for(int i=0;i<cursos.length;i++){
             boolean flag=true;
             for(int j=0;j<MiCurso.size();j++){
                 if(Integer.parseInt(cursos[j])== MiCurso.get(i).getIdCurso()){
                     flag=false;
                     break;
                 }
             }
             if(flag){
               miCursoDao.delete(MiCurso.get(i));
             }
       
         }
        //aca todavia no 
         
        Usuario editUsuario = new Usuario(nombre,aPaterno,aMaterno,genero,email,contrasena,tUsuario,rfc);
        editUsuario = usuarioDao.update(editUsuario);
       
        
        //comparacion de relacion de tablas 
        for(int i=0;i<cursos.length;i++){
            miCurso.setIdUsuario(editUsuario.getIdUsuario());
            miCurso.setIdCurso(Integer.parseInt(cursos[i]));
            
            Curso curso = cursoDao.getCurso(Integer.valueOf(cursos[i]));
            //CursoDto dto = new CursoDto(curso.getNombre(),curso.getDescripcion());
            //lista.add(dto);
        }
        
        //Checar El contructor 
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
