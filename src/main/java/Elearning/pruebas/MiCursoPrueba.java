
package Elearning.pruebas;
import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;


public class MiCursoPrueba {
    
     public static void main(String[] args) {
         
           Session session = HibernateUtil.getSessionFactory().openSession();
        
          
         try {      
            //Creacion de Usuarios
            Usuario usuario1 = new Usuario("Ricardo", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd");
           
            //Creacion de Cursos
            Curso curso1 = new Curso("Pesadilla Hibernate","Vas a sufir XDdddd");
            Curso curso2 = new Curso("Pesadilla Java","Vas a sufir XDddddd");
            
            //Asignamos los cursos al Usuario
        
            //usuario1.getCursos().add(curso1);
            //usuario1.getCursos().add(curso1);
            
            
            //curso1.getUsuarios().add(usuario1);
            //curso2.getUsuarios().add(usuario1);
            //Guardar los cursos en tabla Curso
           
            session.beginTransaction();
            session.save(usuario1);
            session.save(usuario1);
            
            session.getTransaction().commit();//puede ser con rollback tambien 
            System.out.println("Registros Insertado Correctamente");
            session.close();

        }catch(Exception e){
            
            e.printStackTrace();
            
        }finally {
            session.close();
        }
     }
    
}
