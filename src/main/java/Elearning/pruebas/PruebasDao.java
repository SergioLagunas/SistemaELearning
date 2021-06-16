
package Elearning.pruebas;

import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;
/**
 *
 * @author sergi
 */
public class PruebasDao {
    
    public static void main(String[] args) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        UsuarioDaoImpl user = new UsuarioDaoImpl();
        //Usuario usuario1 = new Usuario("Prueba", "nose", "nose", "Masculino", "karina@gmail.com", "contrasena", "semillero", "sdasd");
        
        int idUs=4;
        Usuario newUser = session.get(Usuario.class, idUs);
        newUser.setNombre("Sergio");
        newUser.setContrasena("12345454");  
        user.update(newUser);
        
        
      /* int idUser = 21;
       Usuario miUsuario = session.get(Usuario.class, idUser);
       miUsuario.setEmail("sergio@hotmail.com");
       miUsuario.setRfc("LAGS9712");
       
       user.update(miUsuario);
        */
      
      
        
      
        
       
        
    }
    
}
