package Elearning.pruebas;

import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import org.hibernate.Session;

public class pruebas {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Usuario usuario = new Usuario("Sergio", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd");
            Usuario usuario1 = new Usuario("Emilio","nose","nose","Femenino","Emilioo@gmail.com","contrasena","semillero","sdasd");      
            //Usuario usuario1 = new Usuario("Sergio", "Lagunas", "Garcia", "Masculino", "sergio@gmail.com", "contrasena", "semillero", "sdasd")
            session.beginTransaction();
            session.save(usuario1);
            session.beginTransaction().rollback();
            System.out.println("Registro Insertado Correctamente");

            session.close();

        } finally {
            session.close();
        }

    }
}
