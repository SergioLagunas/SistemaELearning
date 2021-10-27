package Elearning.dao.impl;

import Elearning.dao.CuestionarioDao;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.Curso;
import Elearning.modelo.Modulo;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("CuestionarioDao")
public class CuestionarioDaoImpl implements CuestionarioDao {

    @Override
    public List<Cuestionario> findAll(int idModulo) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<Cuestionario> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query miQuery = session.createSQLQuery("select * from Cuestionario c where c.idModulo=:id").addEntity(Cuestionario.class)
                    .setParameter("id",idModulo);
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
    public Integer countByCurso(Integer idCurso) {
        //Obtener la sesion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos el entero donde almacenara el total de cuestionarios
        int count = 0;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Crear la consulta SQLQuery
            Query miQuery;
            miQuery = session.createSQLQuery("SELECT COUNT(Modulo.idModulo) AS 'Cuestionarios' FROM Cuestionario INNER JOIN Modulo ON Cuestionario.idModulo = Modulo.idModulo INNER JOIN Curso ON Modulo.idCurso = Curso.idCurso WHERE Curso.idCurso = " + idCurso + " GROUP BY Curso.nombre");
            //Almacenamos los datos
            count = (Integer)miQuery.uniqueResult();
            //Regresa el commit
            transaccion.commit();
        } catch (HibernateException e) {
            //Si la transaccion esta vacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Datos
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return count;
    }
    
    @Override
    public Cuestionario getCuestionario(Integer idCuestionario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        Cuestionario entidad = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Obtener por medio del id llamamos a la Tabla Cuestionario y que haga de parametro el idCuestionario
            entidad = session.get(Cuestionario.class, idCuestionario);
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
    public Cuestionario create(Cuestionario elCuestionario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            Integer id = (Integer) session.save(elCuestionario);
            transaccion.commit();
            elCuestionario.setIdCuestionario(id);

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return elCuestionario;
    }

    @Override
    public Cuestionario update(Cuestionario elCuestionario) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.update(elCuestionario);
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

        return elCuestionario;
    }

    @Override
    public boolean delete(Cuestionario elCuestionario) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        boolean flag=true;
   
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.delete(elCuestionario);
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

    @Override
    public Integer getIdByModulo(Integer idModulo) {
                //Obtener la sesion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos el entero donde almacenara el total de cuestionarios
        int idCuestionario = 0;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Crear la consulta SQLQuery
            Query miQuery;
            miQuery = session.createSQLQuery("SELECT idCuestionario FROM Cuestionario WHERE idModulo = " + idModulo);
            //Almacenamos los datos
            idCuestionario = (Integer)miQuery.uniqueResult();
            //Regresa el commit
            transaccion.commit();
        } catch (HibernateException e) {
            //Si la transaccion esta vacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Datos
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return idCuestionario;
    }

    @Override
    public List<Cuestionario> findAllByCurso(int idCurso) {
         //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<Cuestionario> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query miQuery = session.createSQLQuery("SELECT Cuestionario.idCuestionario, Cuestionario.nombre, Cuestionario.idModulo FROM Cuestionario INNER JOIN Modulo ON Cuestionario.idModulo = Modulo.idModulo INNER JOIN Curso ON Modulo.idCurso = Curso.idCurso WHERE Curso.idCurso =:id").addEntity(Cuestionario.class)
            .setParameter("id",idCurso);
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

}
