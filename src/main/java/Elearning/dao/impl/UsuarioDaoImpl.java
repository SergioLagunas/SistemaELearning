    package Elearning.dao.impl;

import Elearning.dao.UsuarioDao;
import Elearning.modelo.Modulo;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("UsuarioDao")
public class UsuarioDaoImpl implements UsuarioDao {

    @Override
    public List<Usuario> findAll() {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        //Declaramos la lista donde almacenara el conjunto de datos de la tabla 
        List<Usuario> lista = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query<Usuario> miQuery = session.createQuery("from Usuario id order by id.idUsuario");
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

    @Override
    public Usuario create(Usuario elUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Guardamos la transaccion
            Integer id = (Integer) session.save(elUsuario);
            transaccion.commit();
            elUsuario.setIdUsuario(id);

        } catch (HibernateException e) {
            //Si la transaccion esta bacia y ademas esta activa que regrese el estado en el que se encontraba la Base de Dato
            if (transaccion != null && transaccion.isActive()) {
                transaccion.rollback();
            }
        } finally {
            //Finalmente cerramos la sesion 
            session.close();
        }
        return elUsuario;
    }

    @Override
    public Usuario getUsuario(Integer idUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();
        Usuario entidad = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Obtener por medio del id llamamos a la Tabla usuario y que haga de parametro el idUsuario
            entidad = session.get(Usuario.class, idUsuario);
           // entidad.getSe
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
    public Usuario update(Usuario elUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.update(elUsuario);
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

        return elUsuario;
    }

    @Override
    public boolean delete(Usuario elUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        boolean flag = false;
        try {

            //Iniciamos Transaccion
            transaccion.begin();
            //Actualizamos los datos 
            session.delete(elUsuario);
            transaccion.commit();
            flag = true;

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
    public Usuario loginUsuario(Usuario elUsuario) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        List lista = null;
        Usuario entidades = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();

            Query query = session.createSQLQuery("select * from Usuario c where c.email=:u and c.contrasena=:p").addEntity(Usuario.class)
                    .setParameter("u", elUsuario.getEmail())
                    .setParameter("p", elUsuario.getContrasena());
  
            lista = query.list();
            lista.size();
            transaccion.commit();
            
            if(lista.size()>0){
                entidades = (Usuario)lista.get(0);
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

        return entidades;

    }

    @Override
    public Usuario getEmail(String email) {
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        List lista = null;
        Usuario entidades = null;

        try {
            //Iniciamos Transaccion
            transaccion.begin();

            Query query = session.createSQLQuery("select * from Usuario c where c.email=:u").addEntity(Usuario.class)
                    .setParameter("u", email);
  
            lista = query.list();
            lista.size();
            transaccion.commit();
            
            if(lista.size()>0){
                entidades = (Usuario)lista.get(0);
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

        return entidades;

      
    }

    @Override
    public List<Usuario> findbyAdmin(String tUsuario) {
       //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        List<Usuario> lista = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query <Usuario> query = session.createSQLQuery("select * from Usuario mo where mo.tUsuario=:c")
                    .addEntity(Usuario.class)
                    .setParameter("c", tUsuario);
                    
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = query.list();
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
    public List<Usuario> findbySemillero(String tUsuario) {
       //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //Ocupamos la transaccion en caso de error la base de datos se restaura a como estaba
        Transaction transaccion = session.getTransaction();

        List<Usuario> lista = null;
        try {
            //Iniciamos Transaccion
            transaccion.begin();
            //crea la consulta Query
            Query <Usuario> query = session.createSQLQuery("select * from Usuario mo where mo.tUsuario=:c")
                    .addEntity(Usuario.class)
                    .setParameter("c", tUsuario);
                    
            //Amacenamos los datos en la lista declarada anteriormente 
            lista = query.list();
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