package Elearning.pruebas;

import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;

public class pruebas {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {

           // Usuario usuario = new Usuario("Sergio", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd");
            Usuario usuario1 = new Usuario("Ricardo", "nose", "nose", "Masculino", "karina@gmail.com", "contrasena", "semillero", "sdasd");
            //Usuario usuario1 = new Usuario("Sergio", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd")
            session.beginTransaction();
            session.save(usuario1);
            session.beginTransaction().commit(); //puede ser con rollback tambien 
            System.out.println("Registro Insertado Correctamente");

            //Lectura de registros
            session.beginTransaction();
            System.out.println("Lectura de registro con Id" + usuario1.getIdUsuario());
            //almacena la infomacion en lecUsuario con toda la informacion insertada 
            
            Usuario lecUsuario = session.get(Usuario.class, usuario1.getIdUsuario());
            System.out.println("Registro " + lecUsuario);
            session.beginTransaction().commit();
            System.out.println("Terminado");

            //Cierra la secion 
            session.close();

        } finally {
            session.close();
        }

    }
}
