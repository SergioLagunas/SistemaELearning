package Elearning.dao.impl;

import Elearning.dao.PreguntasDao;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.Preguntas;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("PreguntasDao")
public class PreguntasDaoImpl implements PreguntasDao{

    @Override
    public List<Preguntas> findAll(int idCuestionario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<Preguntas> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query miQuery = session.createSQLQuery("select * from Preguntas c where c.idCuestionario=:id").addEntity(Preguntas.class)
                    .setParameter("id",idCuestionario);
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = miQuery.list();
            lista.size();
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
        return lista;
    }
    
    @Override
    public Preguntas getPregunta(Integer idPregunta) {
        //Obtener la sesion
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        Preguntas entidad = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Obtener por medio del id llamamos a la Tabla Preguntas y que haga de parametro el idPreguntas
            entidad = session.get(Preguntas.class, idPregunta);
            transaccion.commit();

        } catch (HibernateException e) {
            //Si la transaccion esta vacia y ademas esta activa, que regrese el estado en el que se encontraba la BD
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
    public Preguntas create(Preguntas laPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            Integer id = (Integer) session.save(laPregunta);
            transaccion.commit();
            laPregunta.setIdPregunta(id);

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return laPregunta;
    }

    @Override
    public Preguntas update(Preguntas laPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.update(laPregunta);
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

        return laPregunta;
    }

    @Override
    public boolean delete(Preguntas laPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        boolean flag=true;
   
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.delete(laPregunta);
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
