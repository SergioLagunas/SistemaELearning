package Elearning.dao.impl;

import Elearning.dao.MiCursoDao;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("MiCursoDao")
public class MiCursoDaoImpl implements MiCursoDao {

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
        List<MiCurso> lista = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            Query query = session.createSQLQuery("Select * from MiCurso mc where mc.idUsuario=:id").addEntity(MiCurso.class)
                    .setParameter("id", idUsuario);
            lista = query.list();
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
    public MiCurso getMiCursoByUsuarioCurso(int idUsuario, int idCurso) {
        //Obtener la sesion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        MiCurso entidad = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Crea la consulta SQLQuery
            Query<MiCurso> query = session.createSQLQuery("Select * from MiCurso mc where mc.idUsuario=:u and mc.idCurso=:cu")
                    .addEntity(MiCurso.class)
                    .setParameter("u", idUsuario)
                    .setParameter("cu", idCurso);
            
            entidad = query.getSingleResult();

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
        return entidad;
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
        boolean flag = true;

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
            flag = false;

        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }

        return flag;
    }

    @Override
    public boolean RelacionSem(int idUsuario, int idCurso) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        List lista = null;
        MiCurso entidades = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();

            Query query = session.createSQLQuery("select * from MiCurso c where c.idUsuario=:u and c.idCurso=:p").addEntity(MiCurso.class)
                    .setParameter("u", idUsuario)
                    .setParameter("p", idCurso);

            lista = query.list();
            lista.size();
            transaccion.commit();

            if (lista == null || lista.isEmpty()) {
                return false;
            } else {
                return true;
            }
        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }

        return true;
    }

    @Override
    public Usuario findbyCurso(int idUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        Usuario entidad = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query<Usuario> query = session.createSQLQuery("select us from Usuario us join fetch us.cursos where us.idUsuario=:u")
                    .addEntity(Usuario.class)
                    .setParameter("u", idUsuario);
            
            entidad = query.getSingleResult();

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
        return entidad;
    }

    @Override
    public MiCurso AsginProgreso(int i, int i1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
