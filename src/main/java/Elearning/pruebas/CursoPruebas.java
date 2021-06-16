
package Elearning.pruebas;

import Elearning.modelo.Curso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;

/*
public class CursoPruebas {
    
    public static void main(String[] args) {
        
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            
            //******Prueba para Usuarios*******
           // Usuario usuario1 = new Usuario("Prueba", "nose", "nose", "Masculino", "karina@gmail.com", "contrasena", "semillero", "sdasd");
            //Curso curso1 = new Curso("Pesadilla Hibernate","Vas a sufir XD");
           // Curso curso2 = new Curso("Pesadilla Java","Vas a sufir XD");
            //************Insercion de Usuario*****************
            session.beginTransaction();
           // session.save(curso1);
          //  session.save(curso2);
            session.getTransaction().commit();//puede ser con rollback tambien 
            System.out.println("Registro Insertado Correctamente");

            
            //************Lectura de registros*************
            session.beginTransaction();
           // System.out.println("Lectura de registro con Id" + usuario1.getIdUsuario());
            //almacena la infomacion en lecUsuario con toda la informacion insertada 

           // Usuario lecUsuario = session.get(Usuario.class, usuario1.getIdUsuario());
           //Concatenacion con la inforacion de la base de datos 
           // System.out.println("Registro " + lecUsuario);
            session.getTransaction().commit();
            System.out.println("Terminado");
            
          
            //***********Consultas de Actualizacion (Primera forma)************
            int idAcUsuario = 13;   
            session.beginTransaction();
            
            //Creamos un objeto de tipo Uusario el cual almacenara los datos de la clas con el parametro del idAcUsuario
            Usuario miUsuario = session.get(Usuario.class, idAcUsuario);
            //Indicamos el setter para indicar cual sera el campo a cambiar 
            miUsuario.setNombre("Said");
            
            session.getTransaction().commit();//puede ser con rollback tambien 
            System.out.println("Registro Actualizado correctamente");
            
           
            //***********Consultas de Actualizacion (Segunda forma usando HQL)************
            session.beginTransaction();
            session.createQuery("update Usuario set nombre = 'Sergio' where nombre like 'S%'").executeUpdate();
            session.getTransaction().commit();
            System.out.println("Registro Actualizado correctamente");
            
            
            //*********Consultas para eliminar************
            session.beginTransaction();
            session.createQuery("delete Usuario where nombre='Prueba'").executeUpdate();
            session.getTransaction().commit();
            System.out.println("Registro Eliminado Correctamente"); 

         //Cierra la secion 
            session.close();

        } finally {
            session.close();
        }


    }  
    
}
*/