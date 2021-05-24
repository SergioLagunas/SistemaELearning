
package Elearning.pruebas;

import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class pruebas {
    public static void main(String[] args) {

        Usuario usuario = new Usuario("Sergio","Lagunas","Garcia","Masculino","sergio@gmail.com","contrasena","semillero","sdasd");
        Usuario usuario1 = new Usuario("Emilio","nose","nose","Femenino","Emilioo@gmail.com","contrasena","semillero","sdasd");
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student objects
            session.save(usuario);
            session.save(usuario1);
            //commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            List < Usuario > usuarios = session.createQuery("from Usuario",Usuario.class).list();
           // usuarios.forEach(s -> System.out.println(s.));
            //usuarios.forEach(s - > System.out.println(s.getNombre()));
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
