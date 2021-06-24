
package Elearning.pruebas;

import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
/**
 *
 * @author sergi
 */
public class PruebasDao {
    
    public static void main(String[] args) {
        
      Session session = HibernateUtil.getSessionFactory().openSession();
        
        UsuarioDaoImpl user = new UsuarioDaoImpl();
        CursoDaoImpl cur = new CursoDaoImpl();
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
      
      List<Usuario> usuarios = user.findAll();
      
      for(Usuario u : usuarios){
          System.out.println(u);
      }
      
    }
    
}
