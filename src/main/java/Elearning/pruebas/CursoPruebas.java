
package Elearning.pruebas;

import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;


public class CursoPruebas {
   

    public static void main(String[] args) {
        
         Session session = HibernateUtil.getSessionFactory().openSession();
         
         try {
     
            session.beginTransaction();
            //Obtiene el usuario de la tabla usuario de a BD
            Usuario usuario2=session.get(Usuario.class,4);
            System.out.println(usuario2);
           
            //Crear Cursos de Usuario
            Curso curso1 = new Curso("Otro Curso","Curso de Hibernate");
            Curso curso2 = new Curso("Spring","Curso de Spring");
            Curso curso3 = new Curso("Java","Curso de Java");
                        
            //Agregar los Cursos al Usuario
            
            usuario2.agregarMisCurso(curso1);
            usuario2.agregarMisCurso(curso2);
            usuario2.agregarMisCurso(curso3);
            
            //Guardar los cursos en tabla Curso
            session.save(curso1);
            session.save(curso2);
            session.save(curso3);
            
            session.getTransaction().commit();//puede ser con rollback tambien 
            System.out.println("Registros Insertado Correctamente");

        }catch(Exception e){
            
            e.printStackTrace();
            
        }finally {
            session.close();
        }

    }
}
