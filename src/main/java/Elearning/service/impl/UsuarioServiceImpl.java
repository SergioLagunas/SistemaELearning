package Elearning.service.impl;

import Elearning.dao.CursoDao;
import Elearning.dao.MiCursoDao;
import Elearning.dao.UsuarioDao;
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
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
    public String createNewSemillero(HttpServletRequest request) {
        
        // Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Semillero";
        String rfc = request.getParameter("rfc");
       // String[] cursos = request.getParameterValues("curso[]");
        
        Usuario usuarioC = new Usuario();
        usuarioC.setEmail(email);
        usuarioC = usuarioDao.getEmail(email);
        if(usuarioC != null){
            return "existente";
        }

        Usuario usuario = new Usuario();
       // usuario.setIdUsuario(idUsuario);
        usuario.setNombre(nombre);
        usuario.setaPaterno(aPaterno);
        usuario.setaMaterno(aMaterno);
        usuario.setGenero(genero);
        usuario.setEmail(email);
        usuario.setContrasena(contrasena);
        usuario.settUsuario(tUsuario);
        usuario.setRfc(rfc);
        usuario = usuarioDao.create(usuario);
       
        //Checar el contructor con la lista de cursos
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
    public String createNewAdminsitrador(HttpServletRequest request) {
        
          // Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Administrador";
        String rfc = request.getParameter("rfc");
       // String[] cursos = request.getParameterValues("curso[]");
       
        Usuario usuarioC = new Usuario();
        usuarioC.setEmail(email);
        usuarioC = usuarioDao.getEmail(email);
        if(usuarioC != null){
            return "existente";
        }

        Usuario usuario = new Usuario();
       // usuario.setIdUsuario(idUsuario);
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
    
    //Service Implmet del login Identificando roles automaticamente 
    @Override
    public String loginUser(HttpServletRequest request) {
        String correo = request.getParameter("email");
        String contraseña = request.getParameter("contrasena");
        
        Usuario user = new Usuario();
        String rol ="";
        user.setEmail(correo);
        user.setContrasena(contraseña);
        user = usuarioDao.loginUsuario(user);
         
        HttpSession session = request.getSession();
        if(user != null){
            rol = user.gettUsuario();
            if(rol.equals("Administrador")){
                session.setAttribute("usuario", user.getNombre());
                session.setAttribute("tUsuario", rol);
                return rol;
 
            }else if(rol.equals("Semillero")){
                session.setAttribute("usuario", user.getNombre());
                session.setAttribute("tUsuario", rol); 
                return rol;
            }else {
                return "error";
            }
        }
        
        return "error";
    }


    @Override
    public String updateUsuario(HttpServletRequest request) {
        
        //Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = request.getParameter("tUsuario");
        String rfc = request.getParameter("rfc");
        //String[] cursos = request.getParameterValues("curso[]");
        
        
      
         
        Usuario editUsuario = new Usuario(nombre,aPaterno,aMaterno,genero,email,contrasena,tUsuario,rfc);
        editUsuario = usuarioDao.update(editUsuario);
      
        
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

    @Override
    public boolean recuperarContraseña(HttpServletRequest request) {
        ModelAndView mo = new ModelAndView ();
        
        String correo = request.getParameter("email");
        Usuario usu = new Usuario();
        usu = usuarioDao.getEmail(correo);
        if (usu != null) {
            try {
                Properties props = new Properties();
                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.starttls.enable", "true");
                props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.auth", "true");

                Session session = Session.getDefaultInstance(props);

                String correoRemitente = "chefoherbri@gmail.com";
                String passwordRemitente = "031098libra";
                String correoReceptor = correo;
                String asunto = "Recuperacion de Contraseña";
                String mensaje ="Hola <b>" + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + "</b> tu contraseña registrada es la siguiente: <b> <u>" + usu.getContrasena() + "</u> </b>";
                
                /* Parte del mensaje en texto plano 
                BodyPart texto = new MimeBodyPart();
                texto.setText("Hola " + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + " Su contraseña resgistrada en la plataforma es: " + usu.getContrasena());
                
                Parte del mensaje imagen 
                BodyPart adjunto = new MimeBodyPart();
                adjunto.setDataHandler(new DataHandler(new FileDataSource("C:/UsersJose/Desktop/NuevoEquipo/SistemaELearning/imagenes/B1sOFT.png")));
                
                Union de la imagen y el texto 
                
                MimeMultipart multiParte = new MimeMultipart();

                multiParte.addBodyPart(texto);
                multiParte.addBodyPart(adjunto);
                */
                
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(correoRemitente));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoReceptor));
                message.setSubject(asunto);
                message.setText(mensaje, "ISO-8859-1", "html");
                
                
                Transport t = session.getTransport("smtp");
                t.connect(correoRemitente, passwordRemitente);
                t.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
                t.close();

                System.out.println("La contraseña del usuario: " + usu.getNombre() + " es " + usu.getContrasena());
                System.out.println("Eviar la contraseña: " + usu.getContrasena());
                System.out.println("Se envio la contraseña a tu correo");
                
                
                
            } catch (AddressException ex) {
                Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        

        } else {
            System.out.println("Este correo no ha sido registrado");
        }
        return true;
    }
    
    

   
}
