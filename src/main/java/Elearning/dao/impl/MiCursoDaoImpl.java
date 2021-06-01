
package Elearning.dao.impl;

import Elarning.dao.MiCursoDao;
import Elearning.modelo.MiCurso;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("MiCursoDao")
public class MiCursoDaoImpl implements MiCursoDao{

    @Override
    public List<MiCurso> findAll() {
      //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<MiCurso> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query<MiCurso> miQuery = session.createQuery("from MiCurso id order by id.idUsuario");
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = miQuery.list();
            //regresa el commit
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
        return null;
    }

    @Override
    public MiCurso create(MiCurso entidad) {
       //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
             //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            session.save(entidad);
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
        return entidad;
    }

    @Override
    public List<MiCurso> getMiCurso(Integer idUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //ya que es una tabla intermedia mandaremos a llamar todas las relaciones en una lista
        List<MiCurso> lista=null; 
        try {
           //Iniciamos Transaccion
            transaccion.begin();
            Query query = session.createSQLQuery("Select * from MiCurso mc where mc.MiCurso =: id").addEntity(MiCurso.class).setParameter("id",idUsuario);
            lista=query.list();
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
        return lista;
    }

    @Override
    public MiCurso update(MiCurso entidad) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.update(entidad);
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

        return entidad;
    }

    @Override
    public boolean delete(MiCurso entidad) {
       //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        boolean flag=true;
   
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.delete(entidad);
            transaccion.commit();

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
            flag=false;
            
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }

        return flag;
    }
    
}
