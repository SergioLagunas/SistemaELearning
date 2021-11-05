
package Elearning.dao.impl;

import Elearning.dao.ArchivoUsuarioDao;
import Elearning.modelo.ArchivoUsuario;
import java.util.List;
import Elearning.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("ArchivoUsuarioDao")
public class ArchivoUsuarioDaoImpl implements ArchivoUsuarioDao{
    @Override
    public ArchivoUsuario create(ArchivoUsuario archivoUsuario) {
         //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            Integer id = (Integer) session.save(archivoUsuario);
            transaccion.commit();
            archivoUsuario.setIdArchivoUsuario(id);

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return archivoUsuario;
    }

    @Override
    public List<ArchivoUsuario> findAll() {
         //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<ArchivoUsuario> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query<ArchivoUsuario> miQuery = session.createQuery("from ArchivoUsuario id order by id.idArchivoUsuario");
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = miQuery.list();
            //regresa el commit
            lista.size();
            transaccion.commit();
        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Datos
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return lista;
    }
    
}
