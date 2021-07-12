/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.pruebas;

import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Usuario;
import Elearning.service.impl.UsuarioServiceImpl;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author sergi
 */
public class PruebaRecuperacionContra {
/*
    public static void main(String[] args) {
        //Aca te puedes crear un usuario para que este en la base de datos y si exista un correo electronico que introduscas en el string 
        //Usuario usuario1 = new Usuario("Emilio", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd");

        UsuarioDaoImpl user = new UsuarioDaoImpl();
        //Este inserta el usuario con los datos que pongas arriba    
        //user.create(usuario1);

        String correo = "sergiolags96@gmail.com";
        Usuario usu = new Usuario();
        usu = user.getEmail(correo);

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
                String mensaje = "Hola " + usu.getNombre() + " Su contraseña es: " + usu.getContrasena();

                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(correoRemitente));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoReceptor));
                message.setSubject(asunto);
                message.setText(mensaje);

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

    }
*/
}
