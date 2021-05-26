
package Elearning.dao.impl;

import Elarning.dao.UsuarioDao;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDaoImpl implements UsuarioDao{

    @Override
    public List<Usuario> getUsuarios() {
        
        //Obtener la secion 
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
        //crea la consulta Query
        Query<Usuario> miQuery = session.createQuery("from Usuario",Usuario.class);
      //  List<Usuario> 
      
      return null;
    }
    
   
}
