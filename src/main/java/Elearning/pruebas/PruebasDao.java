package Elearning.pruebas;

import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Session;

/**
 *
 * @author sergi
 */
public class PruebasDao {

    public static void main(String[] args) {

       //Session session = HibernateUtil.getSessionFactory().openSession();

       UsuarioDaoImpl user = new UsuarioDaoImpl();
       CursoDaoImpl curso = new CursoDaoImpl();
      //  CursoDaoImpl cur = new CursoDaoImpl();
        //Usuario usuario1 = new Usuario("Prueba", "nose", "nose", "Masculino", "karina@gmail.com", "contrasena", "semillero", "sdasd");

        /* int idUs=15;
        Usuario newUser = session.get(Usuario.class, idUs);
        newUser.setNombre("Sergio");
        newUser.setContrasena("12345454");  
        user.update(newUser);*/
 /*
       int idUser = 21;
       Usuario miUsuario = session.get(Usuario.class, idUser);
       miUsuario.setEmail("sergio@hotmail.com");
       miUsuario.setRfc("LAGS9712");
       
       user.update(miUsuario);
        
         */
 /*
      int idUsuario=4;
      Usuario elimUsuario = new Usuario();
      elimUsuario.setIdUsuario(idUsuario);
      user.getUsuario(idUsuario);
        System.out.println(user);
 
       
         */
        //Pruebas LisAll
        /*
      List<Usuario> usuarios = user.findAll();
      
      for(Usuario u : usuarios){
          System.out.println(u);
      }*/
        //Prueba para el query del login 
        /* 
      Usuario admin1 = new Usuario("Administrado0", "nose", "nose", "Masculino", "ricardo@gmail.com", "contrasena", "Administrador", "sdasd");
      Usuario admin2 = new Usuario("Administrado1", "nose", "nose", "Masculino", "ricardo@gmail.com", "contrasena", "Administrador", "sdasd");
      
      user.create(admin1);
      user.create(admin2);
         */
        // List<Usuario> newUser = user.findAll();
        /*int idUs = 31;
        Usuario newUser = session.get(Usuario.class, idUs);
        newUser.getEmail();
        newUser.getContrasena();
        newUser.gettUsuario();
        user.loginUsuario(newUser);
        */
       // System.out.println(user);
/*
        List<Usuario> usuarios = user.findAll();

        for (Usuario u : usuarios) {
            System.out.println(u);
        }
       
       /* 
        String email ="otro@gmail.com";
        String contrasena = "contrasena123";
        
        Usuario user1 = new Usuario();
        user1.setEmail(email);
        user1.setContrasena(contrasena);
        user1 = user.loginUsuario(user1);
 
       if(user1 != null){
           String priv = user1.gettUsuario();
           if(priv.equals("semillero")){
               System.out.println("Semillero de nombre: "+user1.getNombre());
           }else if(priv.equals("Administrador")){
               System.out.println("Es admin de nombre: "+user1.getNombre());
           }
       }else{
           System.out.println("No existe en la BD");
       }
        */
        /* if(user1 != null){
            JOptionPane.showMessageDialog(null, "El usuario diguitado si existe en la BD con el nombre "
                    +user1.getNombre()+ " y con el rol de "+user1.gettUsuario());
            System.out.println("");
        }else{
            JOptionPane.showMessageDialog(null, "El usuario diguitado no existe");
        }
        
        */
        /*
        
        OtrasPruebas otra = new OtrasPruebas();
        String email ="ricardo@gmail.com";
        String contrasena = "contrasena";
        
        String prue=otra.DemoLogin(email, contrasena);
        System.out.println(prue);
   */
        
        int idCurso = 21;
        Curso cur = new Curso();
        cur.setIdCurso(idCurso);
        curso.delete(cur);
        
    }
   
   
}
