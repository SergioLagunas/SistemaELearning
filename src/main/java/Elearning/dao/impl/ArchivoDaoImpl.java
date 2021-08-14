
package Elearning.dao.impl;

import Elearning.dao.ArchivoDao;
import Elearning.modelo.Archivo;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("ArchivoDao")
public class ArchivoDaoImpl implements ArchivoDao{

    @Override
    @Transactional
    public List<Archivo> findAll() {
          //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<Archivo> lista = null;
            //crea la consulta Query
            Query<Archivo> miQuery = session.createQuery("from Archivo id order by id.idArchivo");
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = miQuery.list();
 
        return lista;
    }

    @Override
    public Archivo create(Archivo elArchivo) {
         //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            Integer id = (Integer) session.save(elArchivo);
            transaccion.commit();
            elArchivo.setIdArchivo(id);

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return elArchivo;
    }

    @Override
    public Archivo getArchivo(Integer idArchivo) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        Archivo entidad = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Obtener por medio del id llamamos a la Tabla usuario y que haga de parametro el idUsuario
            entidad = session.get(Archivo.class, idArchivo);
            transaccion.commit();

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        //regresamos el objeto por su id 
        return entidad;
    }

    @Override
    public Archivo update(Archivo elArchivo) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.update(elArchivo);
            transaccion.commit();

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }

        return elArchivo;
    }

    @Override
    public boolean delete(Archivo elArchivo) {
         //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        boolean flag = true;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.delete(elArchivo);
            transaccion.commit();

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
            flag = false;

        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }

        return flag;
    }

    @Override
    public List<Archivo> findbyCurso(int idCurso) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
