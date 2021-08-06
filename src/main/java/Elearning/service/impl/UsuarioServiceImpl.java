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
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service("UsuarioService")
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioDao usuarioDao;
    
    static int elUsuario=0;

    @Override
    public String readAdmin(Model model) {
       String tUsuario="Administrador";
       model.addAttribute("administradores",usuarioDao.findbyAdmin(tUsuario));
       return "nuevoadmin";
    }
    
    @Override
    public String readSem(Model model) {
       String tUsuario="Semillero";
       model.addAttribute("semilleros",usuarioDao.findbySemillero(tUsuario));
       return "nuevosemillero";
    }
    
     @Override
    public String readUser(Model model) {
       model.addAttribute("usuario",usuarioDao.getUsuario(elUsuario));
       return "perfilsem";
    }

    @Override
    //@Transactional
    public String createNewSemillero(HttpServletRequest request) {
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Semillero";
        String rfc = request.getParameter("rfc");
        
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
        elUsuario=user.getIdUsuario();
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
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Semillero";
        String rfc = request.getParameter("rfc");

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
    public String updateUsuarioAdmin(HttpServletRequest request) {
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Administrador";
        String rfc = request.getParameter("rfc");

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
              //String mensaje ="Hola <b>" + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + "</b> tu contraseña registrada es la siguiente: <b> <u>" + usu.getContrasena() + "</u> </b>";
                
                BodyPart messageBodyPart = new MimeBodyPart();
               
                String htmlText = "<center><h1 style =\"color:blue;\">RECUPERACION DE CONTRASEÑA</h1>" + "<br>"
                        + "<img src=\"https://img.icons8.com/windows/96/000000/forgot-password.png\"/>" + "<br>" + 
                        "<h2 style =\"color:blue;\"> Hola <b>" + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + "</h2></b> " +
                        "<h3 style =\"color:blue;\"> Tu contraseña registrada es la siguiente: </h3>"+ "<br>" +
                        "<img src=\"https://img.icons8.com/material-outlined/48/000000/password1.png\"/>" + "<br>" +
                        "<h4 style =\"color:blue;\"><b> <u>" + usu.getContrasena() + "</u> </b></h4> </center>";

                // Establecer el contenido de la parte del cuerpo
                messageBodyPart.setContent(htmlText, "text/html");

                // Cree una pieza múltiple relacionada para combinar las piezas
                MimeMultipart multipart = new MimeMultipart();

                // Agregar parte del cuerpo a varias partes
                multipart.addBodyPart(messageBodyPart);
                
                
                /*
                // Crear parte para la imagen
                messageBodyPart = new MimeBodyPart();

                // Obtener la imagen y asociarla a la parte
                DataSource fds = new FileDataSource("file");
                messageBodyPart.setDataHandler(new DataHandler(fds));

                // Agregue un encabezado para conectarse al HTML
                messageBodyPart.setHeader("Content-ID", "<logo.png>");

                // Agregar parte a varias partes
                multipart.addBodyPart(messageBodyPart);
                */
                
                
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(correoRemitente));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoReceptor));
                message.setSubject(asunto);
              //message.setText(mensaje, "ISO-8859-1", "html");
                message.setContent(multipart);
                
                Transport t = session.getTransport("smtp");
                t.connect(correoRemitente, passwordRemitente);
                t.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
                t.close();

                System.out.println("La contraseña del usuario: " + usu.getNombre() + " es " + usu.getContrasena());
                System.out.println("Eviar la contraseña: " + usu.getContrasena());
                System.out.println("Se envio la contraseña a tu correo");

                return true;
                
            } catch (AddressException ex) {
                Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(UsuarioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        

        } else {
            System.out.println("Este correo no ha sido registrado");
            return false;
        }
       return true;
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
