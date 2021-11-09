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

    @Autowired
    private MiCursoDao micursoDao;

    @Autowired
    private CursoDao cursoDao;

    @Override
    public String readAdmin(Model model) {
        String tUsuario = "Administrador";
        model.addAttribute("administradores", usuarioDao.findbyAdmin(tUsuario));
        return "nuevoadmin";
    }

    @Override
    public String readSem(Model model) {
        String tUsuario = "Semillero";
        model.addAttribute("semilleros", usuarioDao.findbySemillero(tUsuario));
        return "nuevosemillero";
    }

    @Override
    public String readUser(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        model.addAttribute("usuario", usuarioDao.getUsuario((int) session.getAttribute("UsuarioID")));
        return "perfiladmin";
    }

    @Override
    public String readUserSem(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        model.addAttribute("usuario", usuarioDao.getUsuario((int) session.getAttribute("UsuarioID")));
        return "perfilsem";
    }

    @Override
    public String barProgress(Model modelo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int idUsuario = (int) session.getAttribute("UsuarioID");
        Usuario user = new Usuario();
        MiCurso micurso = new MiCurso();
        user = usuarioDao.getUsuario(idUsuario);
        List<Curso> cursos = new ArrayList<>(user.getCursos());
        List<Curso> losCursos = new ArrayList<>();
        //Pruebas 
        List<MiCurso> mcur = micursoDao.getMiCurso(idUsuario);
        System.out.println("Imprecion de MiCurso");
        //En esta parte lo que hago es comparar los id de los cursos del usuario con los idCurso de la tabla intermedia
        //ya que cuando relacionas las tablas el progreso es null y aqui es donde le asigno el valor de 0 y se quite el valor null
        for (int i = 0; i < mcur.size(); i++) {
            if (mcur.get(i).getIdCurso() == cursos.get(i).getIdCurso() && mcur.get(i).getProgreso() == null) {
                mcur.get(i).setProgreso(0);
                micursoDao.update(mcur.get(i));

            } else if (mcur.get(i).getProgreso() != null) {
                //en esta parte traspaso los cursos a otra lista ya que en ocaciones hibernate cambia el orden de la lista de los cursos
                //lo realizo asi con el objetivo que que coinsida el progreso con el curso relacionado por el usuario
                //ya que si lo hacia directo los cursos cambiaban de orden 
                losCursos.add(cursoDao.getCurso(mcur.get(i).getIdCurso()));
            }
        }
        //emvio los la lista de cursos a la vista ProgressBar 
        //y la lista de MiCurso para obtener el progreso
        modelo.addAttribute("miscursos", losCursos);
        modelo.addAttribute("progreso", mcur);

        return "ProgressBar";
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
        if (usuarioC != null) {
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
        if (usuarioC != null) {
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

        try {
            Usuario user = new Usuario();
            String rol = "";
            user.setEmail(correo);
            user.setContrasena(contraseña);
            user = usuarioDao.loginUsuario(user);
            HttpSession session = request.getSession();
            session.setAttribute("UsuarioID", user.getIdUsuario());
            if (user != null) {
                rol = user.gettUsuario();
                if (rol.equals("Administrador")) {
                    session.setAttribute("usuario", user.getNombre());
                    session.setAttribute("tUsuario", rol);
                    return rol;
                } else if (rol.equals("Semillero")) {
                    session.setAttribute("usuario", user.getNombre());
                    session.setAttribute("tUsuario", rol);
                    session.setAttribute("datosUsuario", user);
                    return rol;
                } else {
                    return "errorL";
                }
            } else {
                return "errorL";
            }
        } catch (Exception e) {
            return "error";
        }
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
        String tUsuario = "Semillero";
        String rfc = request.getParameter("rfc");

        Usuario editUsuario = new Usuario();
        editUsuario = usuarioDao.getUsuario(idUsuario);
        editUsuario.setNombre(nombre);
        editUsuario.setaPaterno(aPaterno);
        editUsuario.setaMaterno(aMaterno);
        editUsuario.setGenero(genero);
        editUsuario.setEmail(email);
        editUsuario.setContrasena(contrasena);
        editUsuario.settUsuario(tUsuario);
        editUsuario.setRfc(rfc);

        usuarioDao.update(editUsuario);
        return "bienvenida";
    }

    @Override
    public String updateUsuarioAdmin(HttpServletRequest request) {
        Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nombre = request.getParameter("nombre");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String tUsuario = "Administrador";
        String rfc = request.getParameter("rfc");

        Usuario editUsuario = new Usuario();
        editUsuario = usuarioDao.getUsuario(idUsuario);
        editUsuario.setNombre(nombre);
        editUsuario.setaPaterno(aPaterno);
        editUsuario.setaMaterno(aMaterno);
        editUsuario.setGenero(genero);
        editUsuario.setEmail(email);
        editUsuario.settUsuario(tUsuario);
        editUsuario.setContrasena(contrasena);
        editUsuario.setRfc(rfc);

        editUsuario = usuarioDao.update(editUsuario);

        return "admin";
    }

    @Override
    public boolean recuperarContraseña(HttpServletRequest request) {
        ModelAndView mo = new ModelAndView();
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

                String correoRemitente = "b1soft.semilleros@gmail.com";
                String passwordRemitente = "b1soft2021";
                String correoReceptor = correo;
                String asunto = "Recuperacion de Contraseña";
                //String mensaje ="Hola <b>" + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + "</b> tu contraseña registrada es la siguiente: <b> <u>" + usu.getContrasena() + "</u> </b>";

                BodyPart messageBodyPart = new MimeBodyPart();

                String htmlText = "<center><h1 style =\"color:blue;\">RECUPERACION DE CONTRASEÑA</h1>" + "<br>"
                        + "<img src=\"https://img.icons8.com/windows/96/000000/forgot-password.png\"/>" + "<br>"
                        + "<h2 style =\"color:blue;\"> Hola <b>" + usu.getNombre() + " " + usu.getaPaterno() + " " + usu.getaMaterno() + "</h2></b> "
                        + "<h3 style =\"color:blue;\"> Tu contraseña registrada es la siguiente: </h3>" + "<br>"
                        + "<img src=\"https://img.icons8.com/material-outlined/48/000000/password1.png\"/>" + "<br>"
                        + "<h4 style =\"color:blue;\"><b> <u>" + usu.getContrasena() + "</u> </b></h4> </center>";

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
    public boolean deleteUsusario(int idUsuario) {
        Usuario elimUsuario = new Usuario();
        elimUsuario.setIdUsuario(idUsuario);
        boolean flag = usuarioDao.delete(elimUsuario);
        return flag;
    }

    @Override
    public String readCertificado(String nombreCurso, Model model) {
       model.addAttribute("nombreCurso", nombreCurso);
       return "certificado";
    }
}
