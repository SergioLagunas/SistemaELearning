package Elearning.pruebas;

import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Session;

public class MiCursoPrueba {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        
          
         try {
     
            session.beginTransaction();
            //Obtiene el usuario de la tabla usuario de a BD
            
            Usuario usuario2=session.get(Usuario.class,1);
            Usuario usuario3=session.get(Usuario.class,2);
            
          
            
            Curso curso1=session.get(Curso.class, 11);
            Curso curso2=session.get(Curso.class, 12);
            
      
           
            //Agregar los Cursos al Usuario
            
        
            usuario2.agregarMisCurso(curso1);
            usuario3.agregarMisCurso(curso2);

            
            //Guardar los cursos en tabla Curso
           
            
           session.getTransaction().rollback();//puede ser con rollback tambien 
            System.out.println("Registros Insertado Correctamente");

        }catch(Exception e){
            
            e.printStackTrace();
            
        }finally {
            session.close();
        }

        
    }
}
