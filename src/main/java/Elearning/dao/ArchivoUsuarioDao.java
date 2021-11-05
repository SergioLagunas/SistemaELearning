
package Elearning.dao;

import Elearning.modelo.ArchivoUsuario;
import java.util.List;

public interface ArchivoUsuarioDao {
    
    public List<ArchivoUsuario> findAll();
    public ArchivoUsuario create(final ArchivoUsuario archivoUsuario);
    
}
