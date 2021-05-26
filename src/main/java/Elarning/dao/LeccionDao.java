
package Elarning.dao;

import Elearning.modelo.Leccion;
import java.util.List;

public interface LeccionDao {
    
    public List<Leccion> findAll();
    public Leccion create(final Leccion laLeccion);
    public Leccion getLeccion(final Integer idLeccion);
    public Leccion update(final Leccion laLeccion);
    public boolean delete(final Leccion laLeccion);

}
