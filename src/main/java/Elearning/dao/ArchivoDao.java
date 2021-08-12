
package Elearning.dao;
import Elearning.modelo.Archivo;
import java.util.List;

public interface ArchivoDao {
    
    public List<Archivo> findAll();
    public Archivo create(final Archivo elArchivo);
    public Archivo getArchivo(final Integer idArchivo);
    public Archivo update(final Archivo elArchivo);
    public boolean delete(final Archivo elArchivo);
    public List<Archivo> findbyCurso(int idCurso);
}
